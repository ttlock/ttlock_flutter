import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P6 hotel RoutePaths', () {
    expect(RoutePaths.hotelLockList, '/hotel/locks');
    expect(RoutePaths.hotelLockDetail, '/hotel/locks/detail/:lockId');
    expect(RoutePaths.hotelSectorSheet, '/hotel/locks/sector');
    expect(RoutePaths.hotelBuildingSheet, '/hotel/locks/building');
  });

  test('P6 typed routes location', () {
    expect(const HotelLocksRoute().location, '/hotel/locks');
    expect(
      const HotelLockDetailRoute(lockId: 42).location,
      '/hotel/locks/detail/42',
    );
    expect(
      const HotelLockDetailRoute(
        lockId: 42,
        $extra: HotelLockEntity(lockId: 42),
      ).location,
      '/hotel/locks/detail/42',
    );
    expect(
      const HotelLockDetailRoute(lockId: 42, hotelType: 2).location,
      '/hotel/locks/detail/42?hotel-type=2',
    );
    expect(
      const LiftWorkModeRoute(lockId: 7).location,
      '/lock/7/lift/work-mode',
    );
    expect(
      const LiftControlableFloorsRoute(lockId: 7).location,
      '/lock/7/lift/controlable',
    );
    expect(
      const HotelSectorRoute($extra: HotelLockEntity(lockId: 42)).location,
      '/hotel/locks/sector',
    );
    expect(
      const HotelBuildingRoute($extra: HotelLockEntity(lockId: 42)).location,
      '/hotel/locks/building',
    );
  });
}
