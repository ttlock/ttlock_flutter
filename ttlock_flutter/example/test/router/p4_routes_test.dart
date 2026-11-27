import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P4 accessory RoutePaths', () {
    expect(RoutePaths.remoteList, '/lock/:lockId/remotes');
    expect(RoutePaths.remoteAdd, '/lock/remote-add');
    expect(RoutePaths.doorSensorAdd, '/lock/door-sensor-add');
    expect(RoutePaths.doorSensorDetail, '/lock/door-sensor-detail');
    expect(RoutePaths.wirelessKeypadList, '/lock/:lockId/keypads');
    expect(RoutePaths.wirelessKeypadAddType, '/lock/keypad-add-type');
    expect(RoutePaths.wirelessKeypadAdd, '/lock/keypad-add');
    expect(RoutePaths.wirelessKeypadDetail, '/lock/keypad-detail');
  });

  test('P4 typed routes location', () {
    expect(const RemoteListRoute(lockId: 1).location, '/lock/1/remotes');
    expect(
      const WirelessKeypadListRoute(lockId: 1).location,
      '/lock/1/keypads',
    );
    expect(
      const DoorSensorAddRoute($extra: LockEntity(lockId: 1)).location,
      '/lock/door-sensor-add',
    );
  });
}
