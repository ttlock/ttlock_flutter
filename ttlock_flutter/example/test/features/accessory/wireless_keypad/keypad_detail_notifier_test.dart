import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockKeypadDomain extends Mock implements WirelessKeypadDomain {}

/// class 型 Notifier 的 override 必须用可构造子类，且逐一 override 被测方法。
class _FakeKeypadDomain extends WirelessKeypadDomain {
  _FakeKeypadDomain(this._mock);
  final _MockKeypadDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId) =>
      _mock.listSlots(wirelessKeypadId);

  @override
  TaskEither<AppException, Unit> clearKeypadSlot({
    required String keypadMac,
    required int slotNumber,
  }) => _mock.clearKeypadSlot(keypadMac: keypadMac, slotNumber: slotNumber);

  @override
  TaskEither<AppException, Unit> unbindFromCloud({
    required int wirelessKeypadId,
    int? slotNumber,
  }) => _mock.unbindFromCloud(
    wirelessKeypadId: wirelessKeypadId,
    slotNumber: slotNumber,
  );

  @override
  TaskEither<AppException, Unit> rename(
    int wirelessKeypadId,
    String name, {
    int? slotNumber,
  }) => _mock.rename(wirelessKeypadId, name, slotNumber: slotNumber);

  @override
  TaskEither<AppException, WirelessKeypadUpgradeCheck> checkUpgrade({
    required int wirelessKeypadId,
    required int slotNumber,
  }) => _mock.checkUpgrade(
    wirelessKeypadId: wirelessKeypadId,
    slotNumber: slotNumber,
  );
}

const _lock = LockEntity(lockId: 1, lockData: 'ld');
const _multi = WirelessKeypadEntity(
  wirelessKeypadId: 4242,
  wirelessKeypadMac: 'KP',
  isMultifunctionalKeypad: true,
  slotNumber: 2,
  slotLimit: 3,
);
const _normal = WirelessKeypadEntity(
  wirelessKeypadId: 7,
  wirelessKeypadMac: 'KP2',
);

/// 多功能键盘但云端**没给槽位**（`slotNumber == 0`）——见
/// `wireless_keypad_test.dart` 的「hasSlot=1 但 slotNumber 缺失」。
const _multiNoSlot = WirelessKeypadEntity(
  wirelessKeypadId: 4242,
  wirelessKeypadMac: 'KP',
  isMultifunctionalKeypad: true,
);

const _args = WirelessKeypadDetailArgs(lock: _lock, item: _multi);
const _normalArgs = WirelessKeypadDetailArgs(lock: _lock, item: _normal);
const _noSlotArgs = WirelessKeypadDetailArgs(lock: _lock, item: _multiNoSlot);

void main() {
  late _MockKeypadDomain domain;
  late ProviderContainer container;

  setUpAll(registerTtLockFallbacks);
  tearDown(resetTtLockTestHooks);

  ProviderContainer containerOf() => ProviderContainer(
    overrides: [
      wirelessKeypadDomainProvider.overrideWith(
        () => _FakeKeypadDomain(domain),
      ),
    ],
  );

  setUp(() {
    domain = _MockKeypadDomain();
    when(() => domain.listSlots(any())).thenAnswer(
      (_) =>
          TaskEither.right(const [KeypadSlot(slotNumber: 1, lockAlias: 'A')]),
    );
    container = containerOf();
    addTearDown(container.dispose);
  });

  test('build 时多功能键盘拉取槽位', () async {
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final s = await container.read(keypadDetailProvider(_args).future);
    expect(s.slots.single.lockAlias, 'A');
    expect(s.slotsError, isNull);
  });

  test('普通键盘不拉取槽位', () async {
    container.listen(keypadDetailProvider(_normalArgs), (_, _) {});
    await container.read(keypadDetailProvider(_normalArgs).future);
    verifyNever(() => domain.listSlots(any()));
  });

  test('拉取槽位失败置 slotsError', () async {
    when(() => domain.listSlots(any())).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'boom')),
    );
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final s = await container.read(keypadDetailProvider(_args).future);
    expect(s.slotsError, isNotNull);
    expect(s.slots, isEmpty);
  });

  test('多功能解绑：BLE 成功 + 云成功 → pendingCloudSync 为 false', () async {
    when(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    final ok = await n.unbind();

    expect(ok, isTrue);
    verify(
      () => domain.clearKeypadSlot(keypadMac: 'KP', slotNumber: 2),
    ).called(1);
    verify(
      () => domain.unbindFromCloud(wirelessKeypadId: 4242, slotNumber: 2),
    ).called(1);
    expect(n.state.value!.pendingCloudSync, isFalse);
  });

  test('多功能解绑：BLE 失败 → 云端调用次数为 0，pendingCloudSync 为 false', () async {
    when(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.firmware(message: 'ble fail')),
    );
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    final ok = await n.unbind();

    expect(ok, isFalse);
    expect(n.state.value!.actionError, isNotNull);
    expect(n.state.value!.pendingCloudSync, isFalse);
    verifyNever(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
  });

  test('多功能解绑：BLE 成功 + 云失败 → pendingCloudSync 为 true', () async {
    when(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'down')),
    );
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    final ok = await n.unbind();

    expect(ok, isFalse);
    expect(n.state.value!.pendingCloudSync, isTrue);
    expect(n.state.value!.actionError, isNotNull);
  });

  test('多功能解绑：槽位未知（slotNumber 0）→ 两步都不执行且置错误', () async {
    // 两个下游都 stub 成**成功**：守卫若失效，测试会因**断言**失败而红，
    // 而不是因为 mock 抛「方法未 stub」——后者会让断言本身失去区分力。
    when(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    container.listen(keypadDetailProvider(_noSlotArgs), (_, _) {});
    final n = container.read(keypadDetailProvider(_noSlotArgs).notifier);
    await container.read(keypadDetailProvider(_noSlotArgs).future);

    expect(await n.unbind(), isFalse);
    // 前置条件：槽位未知的守卫**不能**顺手把 unbinding 留在 true。
    expect(n.state.value!.unbinding, isFalse);
    expect(n.state.value!.pendingCloudSync, isFalse);
    // 不只是「有错误」——必须是那一个错误，否则守卫设错错误也能通过。
    expect(
      n.state.value!.actionError,
      isA<AppFirmwareException>().having(
        (e) => e.message,
        'message',
        'keypad_slot_unknown',
      ),
    );
    verifyNever(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
    verifyNever(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
  });

  test('retryCloudSync 只重发云端，不重复调 clearKeypadSlot', () async {
    var attempt = 0;
    when(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) {
      attempt++;
      return attempt == 1
          ? TaskEither.left(AppException.business(code: 500, message: 'down'))
          : TaskEither.right(unit);
    });
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    await n.unbind();
    // 前置条件：第一次云端失败确实留下了错误，下面才有「陈旧错误」可复现。
    expect(n.state.value!.actionError, isNotNull);

    final ok = await n.retryCloudSync();

    expect(ok, isTrue);
    expect(n.state.value!.pendingCloudSync, isFalse);
    // 成功路径必须显式清掉上一次的失败，否则页面会在**成功**时弹失败提示。
    expect(n.state.value!.actionError, isNull);
    verify(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).called(1);
    verify(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).called(2);
  });

  test('retryCloudSync 在无待同步时直接返回 false，不调云端', () async {
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    expect(await n.retryCloudSync(), isFalse);
    verifyNever(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
  });

  test('普通键盘解绑不调 BLE，云端不带 slot', () async {
    when(
      () => domain.unbindFromCloud(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    container.listen(keypadDetailProvider(_normalArgs), (_, _) {});
    final n = container.read(keypadDetailProvider(_normalArgs).notifier);
    await container.read(keypadDetailProvider(_normalArgs).future);

    expect(await n.unbind(), isTrue);
    verifyNever(
      () => domain.clearKeypadSlot(
        keypadMac: any(named: 'keypadMac'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
    verify(
      () => domain.unbindFromCloud(wirelessKeypadId: 7, slotNumber: null),
    ).called(1);
  });

  test('rename 多功能键盘带 slot，普通键盘不带', () async {
    when(
      () => domain.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer((_) => TaskEither.right(unit));
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    expect(await n.rename('新名'), isTrue);
    verify(() => domain.rename(4242, '新名', slotNumber: 2)).called(1);
    expect(n.state.value!.keypad.wirelessKeypadName, '新名');
  });

  test('rename 失败返回 false 且不改实体', () async {
    when(
      () => domain.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'x')),
    );
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    expect(await n.rename('新名'), isFalse);
    expect(n.state.value!.keypad.wirelessKeypadName, '');
    expect(n.state.value!.actionError, isNotNull);
    expect(n.state.value!.pendingCloudSync, isFalse);
  });

  test('rename 在多功能键盘槽位未知时不下发且置错误', () async {
    // 下游 stub 成成功：守卫若失效，红来自断言而不是「未 stub」异常。
    when(
      () => domain.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer((_) => TaskEither.right(unit));
    container.listen(keypadDetailProvider(_noSlotArgs), (_, _) {});
    final n = container.read(keypadDetailProvider(_noSlotArgs).notifier);
    await container.read(keypadDetailProvider(_noSlotArgs).future);

    expect(await n.rename('新名'), isFalse);
    expect(n.state.value!.keypad.wirelessKeypadName, '');
    expect(
      n.state.value!.actionError,
      isA<AppFirmwareException>().having(
        (e) => e.message,
        'message',
        'keypad_slot_unknown',
      ),
    );
    verifyNever(
      () => domain.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    );
  });

  test('rename 成功时清空上一次失败的错误', () async {
    var attempt = 0;
    when(
      () => domain.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer((_) {
      attempt++;
      return attempt == 1
          ? TaskEither.left(AppException.business(code: 500, message: 'down'))
          : TaskEither.right(unit);
    });
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    expect(await n.rename('新名'), isFalse);
    expect(n.state.value!.actionError, isNotNull);

    expect(await n.rename('新名'), isTrue);
    expect(n.state.value!.actionError, isNull);
  });

  test('reloadSlots 成功后清空 slotsError 并写入新列表', () async {
    var attempt = 0;
    when(() => domain.listSlots(any())).thenAnswer((_) {
      attempt++;
      return attempt == 1
          ? TaskEither.left(AppException.business(code: 500, message: 'boom'))
          : TaskEither.right(const [KeypadSlot(slotNumber: 1, lockAlias: 'A')]);
    });
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);
    expect(n.state.value!.slotsError, isNotNull);

    await n.reloadSlots();

    expect(n.state.value!.slotsError, isNull);
    expect(n.state.value!.slots.single.lockAlias, 'A');
    expect(n.state.value!.slotsLoading, isFalse);
  });

  test('checkUpgrade 在 slotNumber<1 时不发请求', () async {
    container.listen(keypadDetailProvider(_normalArgs), (_, _) {});
    final n = container.read(keypadDetailProvider(_normalArgs).notifier);
    await container.read(keypadDetailProvider(_normalArgs).future);

    expect(await n.checkUpgrade(), isNull);
    verifyNever(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
  });

  test('checkUpgrade 在多功能键盘槽位未知时不下发且置错误', () async {
    // 下游 stub 成成功：守卫若失效，红来自断言而不是「未 stub」异常。
    when(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const WirelessKeypadUpgradeCheck(needUpgrade: true, version: '7.0.03'),
      ),
    );
    container.listen(keypadDetailProvider(_noSlotArgs), (_, _) {});
    final n = container.read(keypadDetailProvider(_noSlotArgs).notifier);
    await container.read(keypadDetailProvider(_noSlotArgs).future);

    expect(await n.checkUpgrade(), isNull);
    expect(
      n.state.value!.actionError,
      isA<AppFirmwareException>().having(
        (e) => e.message,
        'message',
        'keypad_slot_unknown',
      ),
    );
    verifyNever(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    );
  });

  test('checkUpgrade 返回结果；失败返回 null 且置错误', () async {
    when(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const WirelessKeypadUpgradeCheck(needUpgrade: true, version: '7.0.03'),
      ),
    );
    container.listen(keypadDetailProvider(_args), (_, _) {});
    final n = container.read(keypadDetailProvider(_args).notifier);
    await container.read(keypadDetailProvider(_args).future);

    final up = await n.checkUpgrade();
    expect(up!.needUpgrade, isTrue);
    expect(n.state.value!.checkingUpgrade, isFalse);

    // 失败半边：云端返回 Left → 返回 null、置 actionError、标志位复位。
    when(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(AppException.business(code: 500, message: 'down')),
    );

    expect(await n.checkUpgrade(), isNull);
    expect(n.state.value!.actionError, isNotNull);
    expect(n.state.value!.checkingUpgrade, isFalse);

    // 恢复半边：再次成功必须清掉上一次失败留下的错误。
    when(
      () => domain.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const WirelessKeypadUpgradeCheck(needUpgrade: true, version: '7.0.03'),
      ),
    );

    expect((await n.checkUpgrade())?.needUpgrade, isTrue);
    expect(n.state.value!.actionError, isNull);
    expect(n.state.value!.checkingUpgrade, isFalse);
  });
}
