import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P4x electric meter RoutePaths', () {
    expect(RoutePaths.electricMeterList, '/devices/electric-meters');
    expect(RoutePaths.electricMeterAdd, '/devices/electric-meters/add');
    expect(
      RoutePaths.electricMeterDetail,
      '/devices/electric-meters/detail/:meterId',
    );
    expect(
      RoutePaths.electricMeterRecharge,
      '/devices/electric-meters/recharge',
    );
    expect(RoutePaths.electricMeterRename, '/devices/electric-meters/rename');
    expect(
      RoutePaths.electricMeterMaxPower,
      '/devices/electric-meters/max-power',
    );
    expect(
      RoutePaths.electricMeterDeleteConfirm,
      '/devices/electric-meters/delete-confirm',
    );
    expect(
      RoutePaths.electricMeterOperationRecords,
      '/devices/electric-meters/operation-records/:meterId',
    );
    expect(
      RoutePaths.electricMeterUsageRecords,
      '/devices/electric-meters/usage-records/:meterId',
    );
    expect(RoutePaths.electricMeterPrice, '/devices/electric-meters/price');
    expect(
      RoutePaths.electricMeterPayMode,
      '/devices/electric-meters/pay-mode',
    );
    expect(
      RoutePaths.electricMeterClearConfirm,
      '/devices/electric-meters/clear-confirm',
    );
    expect(
      RoutePaths.electricMeterSettings,
      '/devices/electric-meters/settings/:meterId',
    );
    expect(
      RoutePaths.electricMeterCatOne,
      '/devices/electric-meters/cat-one/:meterId',
    );
    expect(
      RoutePaths.electricMeterCatOneConfig,
      '/devices/electric-meters/cat-one-config',
    );
  });

  test('P4x typed routes location', () {
    const entity = ElectricMeterEntity(electricMeterId: 7, name: 'em');
    expect(const ElectricMeterListRoute().location, '/devices/electric-meters');
    expect(
      const ElectricMeterAddRoute().location,
      '/devices/electric-meters/add',
    );
    // 详情只带 meterId（不复用列表 entity），列表进入与深链是同一条路径。
    expect(
      const ElectricMeterDetailRoute(meterId: 7).location,
      '/devices/electric-meters/detail/7',
    );
    expect(
      ElectricMeterRechargeSheetRoute($extra: entity).location,
      '/devices/electric-meters/recharge',
    );
    expect(
      ElectricMeterRenameSheetRoute($extra: entity).location,
      '/devices/electric-meters/rename',
    );
    expect(
      ElectricMeterMaxPowerSheetRoute($extra: entity).location,
      '/devices/electric-meters/max-power',
    );
    expect(
      ElectricMeterDeleteConfirmSheetRoute($extra: entity).location,
      '/devices/electric-meters/delete-confirm',
    );
    expect(
      const ElectricMeterOperationRecordsRoute(meterId: 7).location,
      '/devices/electric-meters/operation-records/7',
    );
    expect(
      const ElectricMeterUsageRecordsRoute(meterId: 7).location,
      '/devices/electric-meters/usage-records/7',
    );
    expect(
      ElectricMeterPriceSheetRoute($extra: entity).location,
      '/devices/electric-meters/price',
    );
    expect(
      ElectricMeterPayModeSheetRoute($extra: entity).location,
      '/devices/electric-meters/pay-mode',
    );
    expect(
      const ElectricMeterClearConfirmDialogRoute().location,
      '/devices/electric-meters/clear-confirm',
    );
    expect(
      const ElectricMeterSettingsRoute(meterId: 7).location,
      '/devices/electric-meters/settings/7',
    );
    expect(
      const ElectricMeterCatOneRoute(meterId: 7).location,
      '/devices/electric-meters/cat-one/7',
    );
    expect(
      const ElectricMeterCatOneApnSheetRoute().location,
      '/devices/electric-meters/cat-one-config',
    );
  });
}
