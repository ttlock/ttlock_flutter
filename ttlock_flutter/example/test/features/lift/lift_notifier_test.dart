import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lift/domain/provider/lift_domain.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_notifier.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

class _MockLiftDomain extends Mock implements LiftDomain {}

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Provider 的 override 必须用可构造子类（同 lock_domain_test 约定）：
/// Fake 继承生成基类、`build()` 置空，测试用到的方法转发给内嵌 Mock。
class _FakeLiftDomain extends LiftDomain {
  _FakeLiftDomain(this._mock);
  final _MockLiftDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, Option<String>> activateFloors({
    required int lockId,
    required List<int> floors,
    String lockData = '',
  }) =>
      _mock.activateFloors(lockId: lockId, floors: floors, lockData: lockData);

  @override
  TaskEither<AppException, Unit> setWorkMode({
    required TTLiftWorkActivateType type,
    required String lockData,
  }) => _mock.setWorkMode(type: type, lockData: lockData);

  @override
  TaskEither<AppException, Unit> setControlableFloors({
    required List<int> floors,
    required String lockData,
  }) => _mock.setControlableFloors(floors: floors, lockData: lockData);
}

class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, Unit> syncLockData(int lockId, String lockData) =>
      _mock.syncLockData(lockId, lockData);
}

void main() {
  late _MockLiftDomain liftDomainMock;
  late _MockLockDomain lockDomainMock;
  late ProviderContainer container;

  setUp(() {
    liftDomainMock = _MockLiftDomain();
    lockDomainMock = _MockLockDomain();
    container = ProviderContainer(
      overrides: [
        liftDomainProvider.overrideWith(() => _FakeLiftDomain(liftDomainMock)),
        lockDomainProvider.overrideWith(() => _FakeLockDomain(lockDomainMock)),
      ],
    );
    addTearDown(container.dispose);
  });

  test('Some 保鲜成功 → 调 syncLockData，outcome=bleFallback（成功刷新）', () async {
    when(
      () => liftDomainMock.activateFloors(
        lockId: 1,
        floors: [1, 2],
        lockData: 'ld',
      ),
    ).thenAnswer((_) => TaskEither.right(Option.of('ld2')));
    when(
      () => lockDomainMock.syncLockData(1, 'ld2'),
    ).thenAnswer((_) => TaskEither.right(unit));

    final notifier = container.read(liftProvider.notifier);
    await notifier.activate(lockId: 1, floors: [1, 2], lockData: 'ld');

    verify(() => lockDomainMock.syncLockData(1, 'ld2')).called(1);
    final state = container.read(liftProvider);
    expect(state.outcome, LiftActivateOutcome.bleFallback);
    expect(state.error, isNull);
  });

  test('syncLockData 失败 → outcome=bleActivatedSyncFailed，不显示成功刷新', () async {
    when(
      () => liftDomainMock.activateFloors(
        lockId: 1,
        floors: [1, 2],
        lockData: 'ld',
      ),
    ).thenAnswer((_) => TaskEither.right(Option.of('ld2')));
    when(() => lockDomainMock.syncLockData(1, 'ld2')).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );

    final notifier = container.read(liftProvider.notifier);
    await notifier.activate(lockId: 1, floors: [1, 2], lockData: 'ld');

    verify(() => lockDomainMock.syncLockData(1, 'ld2')).called(1);
    final state = container.read(liftProvider);
    expect(state.outcome, LiftActivateOutcome.bleActivatedSyncFailed);
    expect(state.outcome, isNot(LiftActivateOutcome.bleFallback));
  });

  test('云端失败且 lockData 空 → error，无 outcome', () async {
    when(
      () => liftDomainMock.activateFloors(lockId: 1, floors: [1], lockData: ''),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );

    final notifier = container.read(liftProvider.notifier);
    await notifier.activate(lockId: 1, floors: [1], lockData: '');

    final state = container.read(liftProvider);
    expect(state.error, isNotNull);
    expect(state.outcome, isNull);
    verifyNever(() => lockDomainMock.syncLockData(any(), any()));
  });

  test('setWorkMode 成功 → configOutcome=workModeSaved', () async {
    when(
      () => liftDomainMock.setWorkMode(
        type: TTLiftWorkActivateType.specificFloors,
        lockData: 'ld',
      ),
    ).thenAnswer((_) => TaskEither.right(unit));

    final notifier = container.read(liftProvider.notifier);
    await notifier.setWorkMode(
      type: TTLiftWorkActivateType.specificFloors,
      lockData: 'ld',
    );

    final state = container.read(liftProvider);
    expect(state.configOutcome, LiftConfigOutcome.workModeSaved);
    expect(state.error, isNull);
  });

  test('setControlableFloors 成功 → configOutcome=controlableFloorsSaved', () async {
    when(
      () => liftDomainMock.setControlableFloors(floors: [1, 2], lockData: 'ld'),
    ).thenAnswer((_) => TaskEither.right(unit));

    final notifier = container.read(liftProvider.notifier);
    await notifier.setControlableFloors(floors: [1, 2], lockData: 'ld');

    final state = container.read(liftProvider);
    expect(state.configOutcome, LiftConfigOutcome.controlableFloorsSaved);
    expect(state.error, isNull);
  });
}
