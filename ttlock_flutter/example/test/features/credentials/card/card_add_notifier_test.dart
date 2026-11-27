import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockCardDomain extends Mock implements CardDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeCardDomain extends CardDomain {
  _FakeCardDomain(this._mock);
  final _MockCardDomain _mock;

  @override
  void build() {}

  @override
  Stream<AddCardEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) => _mock.addViaBle(
    lockData: lockData,
    startMs: startMs,
    endMs: endMs,
    cycleList: cycleList,
  );

  @override
  Stream<AddCardEvent> addViaKeypad({
    required String keypadMac,
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) => _mock.addViaKeypad(
    keypadMac: keypadMac,
    lockData: lockData,
    startMs: startMs,
    endMs: endMs,
    cycleList: cycleList,
  );

  @override
  void cancelAdd() => _mock.cancelAdd();

  @override
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String lockData,
    required String cardNumber,
    String? cardName,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => _mock.confirmAdd(
    lockId: lockId,
    lockData: lockData,
    cardNumber: cardNumber,
    cardName: cardName,
    kind: kind,
    start: start,
    end: end,
    schedule: schedule,
  );
}

void main() {
  const lock = LockEntity(lockId: 1, lockData: 'ld');

  tearDown(resetTtLockTestHooks);

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(CredentialValidityKind.permanent);
    registerFallbackValue(TTLockFunction.cyclicCardOrFingerprint);
    registerFallbackValue(<TTCycleModel>[]);
  });

  ProviderContainer containerOf({
    required _MockCardDomain domain,
    MockTTLockApi? ttlock,
  }) {
    final mockTtlock = ttlock ?? MockTTLockApi();
    installMockLockApi(mockTtlock);
    when(
      () => mockTtlock.supportFunction(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => false);
    return ProviderContainer(
      overrides: [
        cardDomainProvider.overrideWith(() => _FakeCardDomain(domain)),
      ],
    );
  }

  test('phase==success && cardNumber 时调 confirmAdd', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.waiting),
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'AA'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: 1,
        lockData: 'ld',
        cardNumber: 'AA',
        cardName: 'n',
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(3));
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    final n = container.read(
      cardAddProvider(const CardAddArgs(lock: lock)).notifier,
    );
    final ok = await n.start(cardName: 'n');
    expect(ok, isTrue);
    verify(
      () => domain.confirmAdd(
        lockId: 1,
        lockData: 'ld',
        cardNumber: 'AA',
        cardName: 'n',
        kind: CredentialValidityKind.permanent,
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).called(1);
  });

  test('cancel 后不调 confirmAdd，保留 showCancelHint', () async {
    final domain = _MockCardDomain();
    final controller = StreamController<AddCardEvent>();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) => controller.stream);
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(() async {
      container.dispose();
      await controller.close();
    });
    container.listen(cardAddProvider(const CardAddArgs(lock: lock)), (_, _) {});
    final n = container.read(
      cardAddProvider(const CardAddArgs(lock: lock)).notifier,
    );
    final future = n.start(cardName: 'n');
    controller.add(AddCardEvent(phase: TTAddCardPhase.waiting));
    await Future<void>.delayed(Duration.zero);
    n.cancel();
    expect(n.state.enrolling, isFalse);
    expect(n.state.showCancelHint, isTrue);
    controller.add(
      AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'AA'),
    );
    await controller.close();
    expect(await future, isFalse);
    verify(() => domain.cancelAdd()).called(greaterThanOrEqualTo(1));
    verifyNever(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    );
  });

  test('Stream 无 success 结束时复位 enrolling/waiting', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([AddCardEvent(phase: TTAddCardPhase.waiting)]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    final n = container.read(
      cardAddProvider(const CardAddArgs(lock: lock)).notifier,
    );
    final ok = await n.start(cardName: 'n');
    expect(ok, isFalse);
    expect(n.state.enrolling, isFalse);
    expect(n.state.waiting, isFalse);
  });

  test('lockData 空 → ble_unreachable，不开始 Stream', () async {
    final domain = _MockCardDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const empty = LockEntity(lockId: 1);
    final n = container.read(
      cardAddProvider(const CardAddArgs(lock: empty)).notifier,
    );
    final ok = await n.start(cardName: 'n');
    expect(ok, isFalse);
    expect((n.state.error! as AppBusinessException).code, -21);
    verifyNever(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    );
  });

  test('keypadMac 非空时分派到 addViaKeypad', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaKeypad(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(3));

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    final n = container.read(
      cardAddProvider(
        const CardAddArgs(lock: lock, keypadMac: 'AA:BB'),
      ).notifier,
    );

    await n.start(cardName: 'n');

    verify(
      () => domain.addViaKeypad(
        keypadMac: 'AA:BB',
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).called(1);
    verifyNever(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    );
  });

  test('keypadMac 为 null 时仍走 addViaBle', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'B1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(3));

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    final n = container.read(
      cardAddProvider(const CardAddArgs(lock: lock)).notifier,
    );

    await n.start(cardName: 'n');

    verify(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).called(1);
    verifyNever(
      () => domain.addViaKeypad(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    );
  });

  test('confirmAdd 失败 → pendingRegister 为 true 且保留编号与名称快照', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(code: 500, message: 'cloud down'),
      ),
    );

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const args = CardAddArgs(lock: lock);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(cardAddProvider(args), (_, _) {});
    final n = container.read(cardAddProvider(args).notifier);

    final ok = await n.start(cardName: '小明');

    expect(ok, isFalse);
    expect(n.state.pendingRegister, isTrue);
    expect(n.state.pendingCardNumber, 'K1');
    expect(n.state.cardName, '小明');
  });

  test('retryRegister 用快照重新登记，成功后清空 pendingRegister', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    var attempt = 0;
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) {
      attempt++;
      return attempt == 1
          ? TaskEither.left(
              AppException.business(code: 500, message: 'cloud down'),
            )
          : TaskEither.right(3);
    });

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const args = CardAddArgs(lock: lock);
    container.listen(cardAddProvider(args), (_, _) {});
    final n = container.read(cardAddProvider(args).notifier);

    await n.start(cardName: '小明');
    final ok = await n.retryRegister();

    expect(ok, isTrue);
    expect(n.state.pendingRegister, isFalse);
    expect(n.state.pendingCardNumber, isNull);

    // 一共两次 confirmAdd（start 一次 + retry 一次），两次都必须携带提交
    // 时刻的名称与编号快照。若 retry 传了 cardName: null，命中数会掉到 1，
    // 本用例失败。
    verify(
      () => domain.confirmAdd(
        lockId: 1,
        lockData: 'ld',
        cardNumber: 'K1',
        cardName: '小明',
        kind: CredentialValidityKind.permanent,
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).called(2);
  });

  test('retryRegister 进行中不提前清 pendingRegister，并置 enrolling', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    final retryGate = Completer<int>();
    var attempt = 0;
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) {
      attempt++;
      if (attempt == 1) {
        return TaskEither.left(
          AppException.business(code: 500, message: 'cloud down'),
        );
      }
      return TaskEither.tryCatch(
        () async => retryGate.future,
        (e, s) => AppException.unknown(message: '$e'),
      );
    });

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const args = CardAddArgs(lock: lock);
    container.listen(cardAddProvider(args), (_, _) {});
    final n = container.read(cardAddProvider(args).notifier);

    await n.start(cardName: '小明');
    expect(n.state.pendingRegister, isTrue);

    final inFlight = n.retryRegister();
    await Future<void>.delayed(Duration.zero);

    // 重试在飞行中：pendingRegister 不能被提前清掉（否则重试块消失、
    // 主按钮复活，可以叠第二次录入），且必须置 enrolling 让页面的守卫生效。
    expect(n.state.pendingRegister, isTrue);
    expect(n.state.enrolling, isTrue);

    retryGate.complete(3);

    expect(await inFlight, isTrue);
    expect(n.state.pendingRegister, isFalse);
    expect(n.state.pendingCardNumber, isNull);
    expect(n.state.enrolling, isFalse);
  });

  test('retryRegister 飞行中被 cancel，失败后仍保留可用的待登记编号', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K1'),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    final retryGate = Completer<int>();
    var attempt = 0;
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) {
      attempt++;
      if (attempt == 1) {
        return TaskEither.left(
          AppException.business(code: 500, message: 'cloud down'),
        );
      }
      return TaskEither.tryCatch(
        () async => retryGate.future,
        (e, s) => AppException.unknown(message: '$e'),
      );
    });

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const args = CardAddArgs(lock: lock);
    container.listen(cardAddProvider(args), (_, _) {});
    final n = container.read(cardAddProvider(args).notifier);

    await n.start(cardName: '小明');
    expect(n.state.pendingCardNumber, 'K1');

    final inFlight = n.retryRegister();
    await Future<void>.delayed(Duration.zero);

    // 飞行中取消：cancel() 会连待登记编号一起清掉。
    n.cancel();
    expect(n.state.pendingCardNumber, isNull);

    // 重试随后失败：失败分支必须把编号放回去，否则 pendingRegister 为 true
    // 而编号为 null，页面渲染的「重试登记」按钮点下去直接 return false，
    // 主按钮又被禁用 —— 恢复入口变成死胡同。
    retryGate.completeError(
      AppException.business(code: 500, message: 'cloud down'),
    );

    expect(await inFlight, isFalse);
    expect(n.state.pendingRegister, isTrue);
    expect(n.state.pendingCardNumber, 'K1');
  });

  test('pendingRegister 期间再次 start 会顶掉待登记编号（页面据此禁用主按钮）', () async {
    final domain = _MockCardDomain();
    var enrolled = 0;
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) {
      enrolled++;
      return Stream.fromIterable([
        AddCardEvent(phase: TTAddCardPhase.success, cardNumber: 'K$enrolled'),
      ]);
    });
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        cardNumber: any(named: 'cardNumber'),
        cardName: any(named: 'cardName'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(code: 500, message: 'cloud down'),
      ),
    );

    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const args = CardAddArgs(lock: lock);
    container.listen(cardAddProvider(args), (_, _) {});
    final n = container.read(cardAddProvider(args).notifier);

    await n.start(cardName: '小明');
    expect(n.state.pendingCardNumber, 'K1');

    // 待登记状态下再点一次「开始录入」：K1 已被顶掉，永远到不了云端，
    // 而锁里那张卡是真实存在的。本用例固化这一事实，说明页面为何必须在
    // pendingRegister 时禁用主按钮。若日后在 Notifier 层加了防护，
    // 本用例会失败，届时按新语义改写。
    await n.start(cardName: '小明');

    expect(n.state.pendingCardNumber, 'K2');
  });
}
