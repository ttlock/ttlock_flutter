import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/lock_repository_interface.dart';

import '../../helpers/mock_tt_lock_api.dart';

class _MockLockRepo extends Mock implements LockRepositoryInterface {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeLockRepoProvider extends LockRepository
    implements LockRepositoryInterface {
  _FakeLockRepoProvider(this._mock);
  final _MockLockRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<HotelLockEntity>> listByHotel({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  }) => _mock.listByHotel(
    pageNo: pageNo,
    pageSize: pageSize,
    type: type,
    lockAlias: lockAlias,
    groupId: groupId,
  );

  @override
  TaskEither<AppException, Unit> setHotelCardSector(
    int lockId,
    String sector,
  ) => _mock.setHotelCardSector(lockId, sector);
}

void main() {
  late _MockLockRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late LockDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockLockRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer(
      overrides: [
        lockRepositoryProvider.overrideWith(() => _FakeLockRepoProvider(repo)),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(lockDomainProvider.notifier);
  });

  test('listHotelLocks 转发 type/lockAlias/groupId 给 repo', () async {
    when(
      () => repo.listByHotel(
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        type: any(named: 'type'),
        lockAlias: any(named: 'lockAlias'),
        groupId: any(named: 'groupId'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<HotelLockEntity>(
          data: [HotelLockEntity(lockId: 7, lockAlias: '大门锁')],
          total: 1,
        ),
      ),
    );

    final r = await domain
        .listHotelLocks(pageNo: 1, type: 2, lockAlias: '大门')
        .run();

    expect(r.isRight(), isTrue);
    expect(r.getOrElse((_) => const PageState()).data.single.lockId, 7);
    verify(
      () => repo.listByHotel(
        pageNo: 1,
        pageSize: 20,
        type: 2,
        lockAlias: '大门',
        groupId: null,
      ),
    ).called(1);
  });

  test('applyHotelCardSector：BLE 成功后才调云端，成功返回 Right', () async {
    when(
      () => ttlock.setHotelCardSector(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repo.setHotelCardSector(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    final r = await domain
        .applyHotelCardSector(lockId: 1, lockData: 'ld', sector: '1,2')
        .run();

    expect(r.isRight(), isTrue);
    verify(() => repo.setHotelCardSector(1, '1,2')).called(1);
  });

  test('applyHotelCardSector：BLE 失败时云端调用次数为 0', () async {
    when(
      () => ttlock.setHotelCardSector(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenThrow(TTLockException(TTLockError.fail, 'ble down'));

    final r = await domain
        .applyHotelCardSector(lockId: 1, lockData: 'ld', sector: '1,2')
        .run();

    expect(r.isLeft(), isTrue);
    verifyNever(() => repo.setHotelCardSector(any(), any()));
  });

  test(
    'applyHotelCardSector：BLE 成功但云端失败 → Left(-35) 且 data 携带 sector',
    () async {
      when(
        () => ttlock.setHotelCardSector(
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) async {});
      when(() => repo.setHotelCardSector(any(), any())).thenAnswer(
        (_) => TaskEither.left(
          AppException.business(code: 500, message: 'server down'),
        ),
      );

      final r = await domain
          .applyHotelCardSector(lockId: 1, lockData: 'ld', sector: '3,4')
          .run();

      final err = r.fold((e) => e, (_) => null);
      expect(err, isNotNull);
      expect(err, isA<AppBusinessException>());
      final biz = err! as AppBusinessException;
      expect(biz.code, kHotelSectorCloudPendingCode);
      expect(biz.data, '3,4');
    },
  );

  test('applyHotelCardSector：lockData 为空 → Left(-21) 且不碰 BLE', () async {
    final r = await domain
        .applyHotelCardSector(lockId: 1, lockData: '', sector: '1')
        .run();

    expect(r.isLeft(), isTrue);
    verifyNever(
      () => ttlock.setHotelCardSector(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('syncHotelCardSector 只重发云端，不碰 BLE', () async {
    when(
      () => repo.setHotelCardSector(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    final r = await domain.syncHotelCardSector(5, '1,2,3').run();

    expect(r.isRight(), isTrue);
    verify(() => repo.setHotelCardSector(5, '1,2,3')).called(1);
    verifyNever(
      () => ttlock.setHotelCardSector(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('writeHotelInfo 调 BLE setHotel 并透传四个参数', () async {
    when(
      () => ttlock.setHotel(
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async {});

    final r = await domain
        .writeHotelInfo(
          lockData: 'ld',
          hotelInfo: 'HOTEL',
          buildingNumber: 2,
          floorNumber: 5,
        )
        .run();

    expect(r.isRight(), isTrue);
    verify(
      () =>
          ttlock.setHotel('HOTEL', 2, 5, 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('writeHotelInfo：hotelInfo 为空 → Left(-29) 且不碰 BLE', () async {
    final r = await domain
        .writeHotelInfo(
          lockData: 'ld',
          hotelInfo: '',
          buildingNumber: 2,
          floorNumber: 5,
        )
        .run();

    final err = r.fold((e) => e, (_) => null);
    expect(err, isA<AppBusinessException>());
    expect((err! as AppBusinessException).code, -29);
    verifyNever(
      () => ttlock.setHotel(
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });
}
