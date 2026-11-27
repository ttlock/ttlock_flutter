import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lift/data/repository/lift_repository.dart';
import 'package:ttlock_flutter_demo/features/lift/domain/provider/lift_domain.dart';

import '../../helpers/mock_tt_lock_api.dart';

class _MockLiftRepo extends Mock implements LiftRepository {}

/// class 型 Provider 的 override 必须用可构造子类（同 lock_domain_test 约定）：
/// Fake 继承生成基类、`build()` 置空，测试用到的方法转发给内嵌 Mock。
class _FakeLiftRepository extends LiftRepository {
  _FakeLiftRepository(this._mock);
  final _MockLiftRepo _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, Unit> activateFloors(
    int lockId,
    List<String> floors,
  ) => _mock.activateFloors(lockId, floors);
}

void main() {
  late _MockLiftRepo liftRepo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late LiftDomain liftDomain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
  });

  tearDown(resetTtLockTestHooks);

  ProviderContainer makeContainer() => ProviderContainer(
    overrides: [
      liftRepositoryProvider.overrideWith(() => _FakeLiftRepository(liftRepo)),
    ],
  );

  setUp(() {
    liftRepo = _MockLiftRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = makeContainer();
    addTearDown(container.dispose);
    liftDomain = container.read(liftDomainProvider.notifier);
  });

  test('activateFloors：云端成功 → 不走 BLE，返回 None', () async {
    when(
      () => liftRepo.activateFloors(1, ['1', '2']),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await liftDomain
        .activateFloors(lockId: 1, floors: [1, 2], lockData: 'ld')
        .run();
    expect(r.getRight().toNullable()?.isNone(), isTrue);
    verifyNever(
      () => ttlock.activateLift(any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('activateFloors：云端失败且 lockData 非空 → BLE 回退并带回新 lockData', () async {
    when(() => liftRepo.activateFloors(1, ['1', '2'])).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );
    when(
      () => ttlock.activateLift('1,2', 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer(
      (_) async => ControlLockResult(
        lockTime: 0,
        electricQuantity: 80,
        uniqueId: 0,
        lockData: 'ld2',
      ),
    );
    final r = await liftDomain
        .activateFloors(lockId: 1, floors: [1, 2], lockData: 'ld')
        .run();
    expect(
      r.getRight().toNullable()?.toNullable(),
      'ld2',
    ); // Notifier 据此调 syncLockData
    verify(
      () => ttlock.activateLift('1,2', 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('activateFloors：BLE 回退 lockData 未变 → 返回 None（无需保鲜）', () async {
    when(() => liftRepo.activateFloors(1, ['1'])).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );
    when(
      () => ttlock.activateLift('1', 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer(
      (_) async => ControlLockResult(
        lockTime: 0,
        electricQuantity: 80,
        uniqueId: 0,
        lockData: 'ld',
      ),
    ); // 与传入相同
    final r = await liftDomain
        .activateFloors(lockId: 1, floors: [1], lockData: 'ld')
        .run();
    expect(r.getRight().toNullable()?.isNone(), isTrue);
  });

  test('activateFloors：云端失败且 lockData 空 → Left（不回退）', () async {
    when(() => liftRepo.activateFloors(1, ['1'])).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Object(), message: 'net'),
      ),
    );
    final r = await liftDomain.activateFloors(lockId: 1, floors: [1]).run();
    expect(r.isLeft(), true);
  });

  test('setWorkMode：BLE 成功', () async {
    when(
      () => ttlock.setLiftWorkMode(
        TTLiftWorkActivateType.allFloors,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    final r = await liftDomain
        .setWorkMode(type: TTLiftWorkActivateType.allFloors, lockData: 'ld')
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setLiftWorkMode(
        TTLiftWorkActivateType.allFloors,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });

  test('setWorkMode：lockData 空 → Left(-21)', () async {
    final r = await liftDomain
        .setWorkMode(type: TTLiftWorkActivateType.allFloors, lockData: '')
        .run();
    expect(r.isLeft(), isTrue);
    final err = r.getLeft().toNullable();
    expect(err, isA<AppBusinessException>());
    expect((err as AppBusinessException).code, -21);
  });

  test('setControlableFloors：BLE 传逗号串', () async {
    when(
      () => ttlock.setLiftControlable(
        '1,3',
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    final r = await liftDomain
        .setControlableFloors(floors: [1, 3], lockData: 'ld')
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.setLiftControlable(
        '1,3',
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });

  test('setControlableFloors：floors 空 → Left', () async {
    final r = await liftDomain
        .setControlableFloors(floors: const [], lockData: 'ld')
        .run();
    expect(r.isLeft(), isTrue);
  });
}
