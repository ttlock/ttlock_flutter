import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/provider/card_encoder_domain.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

class _MockLockDomain extends Mock implements LockDomain {}

class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> applyHotelCardSector({
    required int lockId,
    required String lockData,
    required String sector,
  }) => _mock.applyHotelCardSector(
    lockId: lockId,
    lockData: lockData,
    sector: sector,
  );

  @override
  TaskEither<AppException, Unit> syncHotelCardSector(
    int lockId,
    String sector,
  ) => _mock.syncHotelCardSector(lockId, sector);

  @override
  TaskEither<AppException, Unit> writeHotelInfo({
    required String lockData,
    required String hotelInfo,
    required int buildingNumber,
    required int floorNumber,
  }) => _mock.writeHotelInfo(
    lockData: lockData,
    hotelInfo: hotelInfo,
    buildingNumber: buildingNumber,
    floorNumber: floorNumber,
  );
}

class _MockCardEncoderDomain extends Mock implements CardEncoderDomain {}

class _FakeCardEncoderDomain extends CardEncoderDomain {
  _FakeCardEncoderDomain(this._mock);
  final _MockCardEncoderDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, String> getHotelInfo() => _mock.getHotelInfo();

  @override
  TaskEither<AppException, String> getIcKey() => _mock.getIcKey();
}

const _lock = HotelLockEntity(lockId: 7, lockData: 'LD', lockAlias: '大门锁');
const _args = HotelLockDetailArgs(lock: _lock);

void main() {
  late _MockLockDomain lockDomain;
  late _MockCardEncoderDomain encoder;
  late ProviderContainer container;

  setUp(() {
    lockDomain = _MockLockDomain();
    encoder = _MockCardEncoderDomain();
    container = ProviderContainer(
      overrides: [
        lockDomainProvider.overrideWith(() => _FakeLockDomain(lockDomain)),
        cardEncoderDomainProvider.overrideWith(
          () => _FakeCardEncoderDomain(encoder),
        ),
      ],
    );
    addTearDown(container.dispose);
  });

  test('BLE 失败 → error 非空且 cloudPending 为 false（两条路径可区分）', () async {
    when(
      () => lockDomain.applyHotelCardSector(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        sector: any(named: 'sector'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(code: 500, message: 'ble down'),
      ),
    );

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.applySector('1,2');

    final s = container.read(hotelLockDetailNotifierProvider(_args));
    expect(s.error, isNotNull);
    expect(s.cloudPending, isFalse);
    expect(s.pendingSector, isNull);
  });

  test(
    'BLE 成功但云端失败 → cloudPending 为 true、pendingSector 有值、error 为 null',
    () async {
      when(
        () => lockDomain.applyHotelCardSector(
          lockId: any(named: 'lockId'),
          lockData: any(named: 'lockData'),
          sector: any(named: 'sector'),
        ),
      ).thenAnswer(
        (_) => TaskEither.left(
          AppException.business(
            code: kHotelSectorCloudPendingCode,
            message: 'hotel_sector_cloud_pending',
            data: '3,4',
          ),
        ),
      );

      final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
      await n.applySector('3,4');

      final s = container.read(hotelLockDetailNotifierProvider(_args));
      expect(s.cloudPending, isTrue);
      expect(s.pendingSector, '3,4');
      expect(s.error, isNull);
    },
  );

  test('retryCloudSync 成功后清空 cloudPending 与 pendingSector', () async {
    when(
      () => lockDomain.applyHotelCardSector(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        sector: any(named: 'sector'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(
          code: kHotelSectorCloudPendingCode,
          message: 'hotel_sector_cloud_pending',
          data: '3,4',
        ),
      ),
    );
    when(
      () => lockDomain.syncHotelCardSector(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.applySector('3,4');
    await n.retryCloudSync();

    final s = container.read(hotelLockDetailNotifierProvider(_args));
    expect(s.cloudPending, isFalse);
    expect(s.pendingSector, isNull);
  });

  test('retryCloudSync 失败后仍保持 cloudPending 与 pendingSector', () async {
    when(
      () => lockDomain.applyHotelCardSector(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        sector: any(named: 'sector'),
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(
          code: kHotelSectorCloudPendingCode,
          message: 'hotel_sector_cloud_pending',
          data: '3,4',
        ),
      ),
    );
    when(() => lockDomain.syncHotelCardSector(any(), any())).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(code: 500, message: 'still down'),
      ),
    );

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.applySector('3,4');
    await n.retryCloudSync();

    final s = container.read(hotelLockDetailNotifierProvider(_args));
    expect(s.cloudPending, isTrue, reason: '锁仍已改、云端仍未同步 —— 重试入口不能丢');
    expect(s.pendingSector, '3,4');
    expect(s.error, isNotNull);
  });

  test('writeBuildingFloor：hotelInfo 取不到 → error 且不调 BLE', () async {
    when(() => encoder.getHotelInfo()).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(
          code: kCardEncoderUnavailableCode,
          message: 'card_encoder_unavailable',
        ),
      ),
    );

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.writeBuildingFloor(buildingNumber: 1, floorNumber: 2);

    final s = container.read(hotelLockDetailNotifierProvider(_args));
    expect(s.error, isNotNull);
    verifyNever(
      () => lockDomain.writeHotelInfo(
        lockData: any(named: 'lockData'),
        hotelInfo: any(named: 'hotelInfo'),
        buildingNumber: any(named: 'buildingNumber'),
        floorNumber: any(named: 'floorNumber'),
      ),
    );
  });

  test('writeBuildingFloor 成功：取 hotelInfo 后写 BLE', () async {
    when(
      () => encoder.getHotelInfo(),
    ).thenAnswer((_) => TaskEither.right('HOTEL'));
    when(
      () => lockDomain.writeHotelInfo(
        lockData: any(named: 'lockData'),
        hotelInfo: any(named: 'hotelInfo'),
        buildingNumber: any(named: 'buildingNumber'),
        floorNumber: any(named: 'floorNumber'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.writeBuildingFloor(buildingNumber: 3, floorNumber: 4);

    verify(
      () => lockDomain.writeHotelInfo(
        lockData: 'LD',
        hotelInfo: 'HOTEL',
        buildingNumber: 3,
        floorNumber: 4,
      ),
    ).called(1);
  });

  test('loadIcKey 失败置 icKeyError 且不影响其他字段', () async {
    when(() => encoder.getIcKey()).thenAnswer(
      (_) => TaskEither.left(
        AppException.business(
          code: kCardEncoderUnavailableCode,
          message: 'card_encoder_unavailable',
        ),
      ),
    );

    final n = container.read(hotelLockDetailNotifierProvider(_args).notifier);
    await n.loadIcKey();

    final s = container.read(hotelLockDetailNotifierProvider(_args));
    expect(s.icKeyError, isNotNull);
    expect(s.icKey, isNull);
    expect(s.error, isNull);
    expect(s.cloudPending, isFalse);
  });
}
