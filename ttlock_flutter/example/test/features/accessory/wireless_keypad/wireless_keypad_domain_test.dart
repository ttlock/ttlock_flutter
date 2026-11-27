import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/repository/wireless_keypad_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockRepo extends Mock implements WirelessKeypadRepository {}

/// class 型 Provider 的 override 必须用可构造子类，且**逐一 override 被测方法**
/// ——漏掉的方法会跑真实实现（本文件里是真实 Repository，会打真实网络）。
class _FakeRepo extends WirelessKeypadRepository {
  _FakeRepo(this._mock);
  final _MockRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<WirelessKeypadEntity>> listByLock(
    int lockId, {
    int? hasSlot,
  }) => _mock.listByLock(lockId, hasSlot: hasSlot);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    required String wirelessKeypadName,
    required String wirelessKeypadNumber,
    required String wirelessKeypadFeatureValue,
    int? electricQuantity,
    int? hasSlot,
    int? slotNumber,
    int? slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  }) => _mock.add(
    lockId,
    mac,
    wirelessKeypadName: wirelessKeypadName,
    wirelessKeypadNumber: wirelessKeypadNumber,
    wirelessKeypadFeatureValue: wirelessKeypadFeatureValue,
    electricQuantity: electricQuantity,
    hasSlot: hasSlot,
    slotNumber: slotNumber,
    slotLimit: slotLimit,
    modelNum: modelNum,
    hardwareRevision: hardwareRevision,
    firmwareRevision: firmwareRevision,
  );

  @override
  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId) =>
      _mock.listSlots(wirelessKeypadId);

  @override
  TaskEither<AppException, Unit> delete(
    int wirelessKeypadId, {
    int? slotNumber,
  }) => _mock.delete(wirelessKeypadId, slotNumber: slotNumber);

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

void main() {
  late _MockRepo repo;
  late MockTTRemoteKeypadApi remoteKeypadApi;
  late ProviderContainer container;
  late WirelessKeypadDomain domain;

  const lock = LockEntity(
    lockId: 1,
    lockMac: 'LK',
    lockAlias: '大门',
    lockData: 'ld',
  );

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockRepo();
    remoteKeypadApi = MockTTRemoteKeypadApi();
    installMockAccessoryApis(remoteKeypadApi: remoteKeypadApi);
    container = ProviderContainer(
      overrides: [
        wirelessKeypadRepositoryProvider.overrideWith(() => _FakeRepo(repo)),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(wirelessKeypadDomainProvider.notifier);
  });

  test('addNormal 传 hasSlot=2 且不带槽位与版本三兄弟', () async {
    when(
      () => remoteKeypadApi.initRemoteKeypad(
        'KP',
        'LK',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer(
      (_) async => RemoteKeypadInitResult(
        electricQuantity: 80,
        wirelessKeypadFeatureValue: 'fv',
      ),
    );
    when(
      () => repo.add(
        any(),
        any(),
        wirelessKeypadName: any(named: 'wirelessKeypadName'),
        wirelessKeypadNumber: any(named: 'wirelessKeypadNumber'),
        wirelessKeypadFeatureValue: any(named: 'wirelessKeypadFeatureValue'),
        electricQuantity: any(named: 'electricQuantity'),
        hasSlot: any(named: 'hasSlot'),
        slotNumber: any(named: 'slotNumber'),
        slotLimit: any(named: 'slotLimit'),
        modelNum: any(named: 'modelNum'),
        hardwareRevision: any(named: 'hardwareRevision'),
        firmwareRevision: any(named: 'firmwareRevision'),
      ),
    ).thenAnswer((_) => TaskEither.right(11));

    final r = await domain.addNormal(lock: lock, mac: 'KP', number: 'N1').run();
    expect(r.getOrElse((_) => 0), 11);
    verify(
      () => repo.add(
        1,
        'KP',
        wirelessKeypadName: '大门',
        wirelessKeypadNumber: 'N1',
        wirelessKeypadFeatureValue: 'fv',
        electricQuantity: 80,
        hasSlot: 2,
        slotNumber: null,
        slotLimit: null,
        modelNum: null,
        hardwareRevision: null,
        firmwareRevision: null,
      ),
    ).called(1);
  });

  test('addMulti 把 init 的槽位与版本字段原样转发给仓库', () async {
    when(
      () => remoteKeypadApi.initMultifunctionalKeypad('KP', 'ld'),
    ).thenAnswer(
      (_) async => MultifunctionalKeypadInitResult(
        electricQuantity: 66,
        wirelessKeypadFeatureValue: 'fv2',
        slotNumber: 2,
        slotLimit: 3,
        modelNum: 'SN843',
        hardwareRevision: '1.1',
        firmwareRevision: '7.0.03.250101',
      ),
    );
    when(
      () => repo.add(
        any(),
        any(),
        wirelessKeypadName: any(named: 'wirelessKeypadName'),
        wirelessKeypadNumber: any(named: 'wirelessKeypadNumber'),
        wirelessKeypadFeatureValue: any(named: 'wirelessKeypadFeatureValue'),
        electricQuantity: any(named: 'electricQuantity'),
        hasSlot: any(named: 'hasSlot'),
        slotNumber: any(named: 'slotNumber'),
        slotLimit: any(named: 'slotLimit'),
        modelNum: any(named: 'modelNum'),
        hardwareRevision: any(named: 'hardwareRevision'),
        firmwareRevision: any(named: 'firmwareRevision'),
      ),
    ).thenAnswer((_) => TaskEither.right(12));

    final r = await domain.addMulti(lock: lock, mac: 'KP', number: 'N1').run();
    expect(r.getOrElse((_) => 0), 12);
    verify(
      () => repo.add(
        1,
        'KP',
        wirelessKeypadName: '大门',
        wirelessKeypadNumber: 'N1',
        wirelessKeypadFeatureValue: 'fv2',
        electricQuantity: 66,
        hasSlot: 1,
        slotNumber: 2,
        slotLimit: 3,
        modelNum: 'SN843',
        hardwareRevision: '1.1',
        firmwareRevision: '7.0.03.250101',
      ),
    ).called(1);
  });

  test('addNormal 的 lockMac 为空 → -21，不发起 BLE', () async {
    final r = await domain
        .addNormal(lock: const LockEntity(lockId: 1), mac: 'KP', number: 'N')
        .run();
    expect(r.isLeft(), isTrue);
    expect((r.getLeft().toNullable()! as AppBusinessException).code, -21);
    verifyNever(
      () => remoteKeypadApi.initRemoteKeypad(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('addMulti 的 lockData 为空 → -21，不发起 BLE', () async {
    final r = await domain
        .addMulti(lock: const LockEntity(lockId: 1), mac: 'KP', number: 'N')
        .run();
    expect(r.isLeft(), isTrue);
    expect((r.getLeft().toNullable()! as AppBusinessException).code, -21);
    verifyNever(() => remoteKeypadApi.initMultifunctionalKeypad(any(), any()));
  });

  test('listSlots 转发给仓库', () async {
    when(() => repo.listSlots(4242)).thenAnswer(
      (_) => TaskEither.right(const [
        KeypadSlot(slotNumber: 1, lockAlias: '大门锁'),
        KeypadSlot(slotNumber: 3),
      ]),
    );

    final r = await domain.listSlots(4242).run();
    final slots = r.getOrElse((_) => const <KeypadSlot>[]);
    expect(slots.length, 2);
    expect(slots.first.lockAlias, '大门锁');
    expect(slots.last.isBound, isFalse);
  });

  test('clearKeypadSlot 转发 mac 与 slot 给 SDK', () async {
    when(
      () => remoteKeypadApi.deleteStoredLock(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});

    final r = await domain
        .clearKeypadSlot(keypadMac: 'KP', slotNumber: 3)
        .run();

    expect(r.isRight(), isTrue);
    verify(
      () => remoteKeypadApi.deleteStoredLock(
        'KP',
        3,
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
    verifyNever(() => repo.delete(any(), slotNumber: any(named: 'slotNumber')));
  });

  test('clearKeypadSlot BLE 失败 → Left', () async {
    when(
      () => remoteKeypadApi.deleteStoredLock(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenThrow(AppException.firmware(message: 'ble fail'));

    final r = await domain
        .clearKeypadSlot(keypadMac: 'KP', slotNumber: 3)
        .run();
    expect(r.isLeft(), isTrue);
  });

  test('unbindFromCloud 多功能带 slot，普通不带', () async {
    when(
      () => repo.delete(any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer((_) => TaskEither.right(unit));

    await domain.unbindFromCloud(wirelessKeypadId: 5, slotNumber: 2).run();
    verify(() => repo.delete(5, slotNumber: 2)).called(1);

    await domain.unbindFromCloud(wirelessKeypadId: 6).run();
    verify(() => repo.delete(6, slotNumber: null)).called(1);
  });

  test('rename 透传 slotNumber', () async {
    when(
      () => repo.rename(any(), any(), slotNumber: any(named: 'slotNumber')),
    ).thenAnswer((_) => TaskEither.right(unit));

    await domain.rename(4242, '新名', slotNumber: 3).run();
    verify(() => repo.rename(4242, '新名', slotNumber: 3)).called(1);
  });

  test('checkUpgrade 转发 id 与 slot', () async {
    when(
      () => repo.checkUpgrade(
        wirelessKeypadId: any(named: 'wirelessKeypadId'),
        slotNumber: any(named: 'slotNumber'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const WirelessKeypadUpgradeCheck(needUpgrade: true, version: '7.0.03'),
      ),
    );

    final r = await domain
        .checkUpgrade(wirelessKeypadId: 4242, slotNumber: 1)
        .run();
    expect(
      r.getOrElse((_) => const WirelessKeypadUpgradeCheck()).version,
      '7.0.03',
    );
    verify(
      () => repo.checkUpgrade(wirelessKeypadId: 4242, slotNumber: 1),
    ).called(1);
  });
}
