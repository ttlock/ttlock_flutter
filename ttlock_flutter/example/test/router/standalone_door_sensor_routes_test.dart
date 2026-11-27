import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/standalone_door_sensor_args.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P4.x standalone door sensor RoutePaths', () {
    expect(
      RoutePaths.standaloneDoorSensorList,
      '/devices/standalone-door-sensors',
    );
    expect(
      RoutePaths.standaloneDoorSensorAdd,
      '/devices/standalone-door-sensors/add',
    );
    expect(
      RoutePaths.standaloneDoorSensorDetail,
      '/devices/standalone-door-sensors/detail',
    );
    expect(
      RoutePaths.standaloneDoorSensorRename,
      '/devices/standalone-door-sensors/rename',
    );
    expect(
      RoutePaths.standaloneDoorSensorDeleteConfirm,
      '/devices/standalone-door-sensors/delete-confirm',
    );
    expect(
      RoutePaths.standaloneDoorSensorAlertConfig,
      '/devices/standalone-door-sensors/alert-config',
    );
    expect(
      RoutePaths.standaloneDoorSensorWifiConfig,
      '/devices/standalone-door-sensors/wifi-config',
    );
    expect(
      RoutePaths.standaloneDoorSensorUsers,
      '/devices/standalone-door-sensors/users',
    );
  });

  test('P4.x typed routes location', () {
    const entity = StandaloneDoorSensorEntity(doorSensorId: 7, mac: 'AA:BB');
    expect(
      const StandaloneDoorSensorListRoute().location,
      '/devices/standalone-door-sensors',
    );
    expect(
      const StandaloneDoorSensorAddRoute().location,
      '/devices/standalone-door-sensors/add',
    );
    expect(
      StandaloneDoorSensorDetailRoute(
        $extra: const StandaloneDoorSensorDetailArgs(item: entity),
      ).location,
      '/devices/standalone-door-sensors/detail',
    );
    expect(
      StandaloneDoorSensorRenameSheetRoute($extra: entity).location,
      '/devices/standalone-door-sensors/rename',
    );
    expect(
      StandaloneDoorSensorDeleteConfirmSheetRoute($extra: entity).location,
      '/devices/standalone-door-sensors/delete-confirm',
    );
    expect(
      StandaloneDoorSensorAlertConfigSheetRoute($extra: entity).location,
      '/devices/standalone-door-sensors/alert-config',
    );
    expect(
      StandaloneDoorSensorWifiConfigSheetRoute($extra: entity).location,
      '/devices/standalone-door-sensors/wifi-config',
    );
    expect(
      StandaloneDoorSensorUserSheetRoute($extra: entity).location,
      '/devices/standalone-door-sensors/users',
    );
    expect(
      const StandaloneDoorSensorDetailArgs(item: entity).item.doorSensorId,
      7,
    );
  });
}
