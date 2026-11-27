import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P4x water meter RoutePaths', () {
    expect(RoutePaths.waterMeterList, '/devices/water-meters');
    expect(RoutePaths.waterMeterAdd, '/devices/water-meters/add');
    expect(
      RoutePaths.waterMeterDetail,
      '/devices/water-meters/detail/:meterId',
    );
    expect(RoutePaths.waterMeterRecharge, '/devices/water-meters/recharge');
    expect(RoutePaths.waterMeterRename, '/devices/water-meters/rename');
    expect(
      RoutePaths.waterMeterDeleteConfirm,
      '/devices/water-meters/delete-confirm',
    );
    expect(
      RoutePaths.waterMeterOperationRecords,
      '/devices/water-meters/operation-records/:meterId',
    );
    expect(
      RoutePaths.waterMeterUsageRecords,
      '/devices/water-meters/usage-records/:meterId',
    );
    expect(RoutePaths.waterMeterPrice, '/devices/water-meters/price');
    expect(RoutePaths.waterMeterPayMode, '/devices/water-meters/pay-mode');
    expect(
      RoutePaths.waterMeterTotalUsage,
      '/devices/water-meters/total-usage',
    );
    expect(
      RoutePaths.waterMeterClearConfirm,
      '/devices/water-meters/clear-confirm',
    );
    expect(
      RoutePaths.waterMeterSettings,
      '/devices/water-meters/settings/:meterId',
    );
    expect(
      RoutePaths.waterMeterCatOne,
      '/devices/water-meters/cat-one/:meterId',
    );
    expect(
      RoutePaths.waterMeterCatOneConfig,
      '/devices/water-meters/cat-one-config',
    );
  });

  test('P4x typed routes location', () {
    const entity = WaterMeterEntity(waterMeterId: 7, mac: 'AA:BB');
    expect(const WaterMeterListRoute().location, '/devices/water-meters');
    expect(const WaterMeterAddRoute().location, '/devices/water-meters/add');
    // 详情只带 meterId（不复用列表 entity），列表进入与深链是同一条路径。
    expect(
      const WaterMeterDetailRoute(meterId: 7).location,
      '/devices/water-meters/detail/7',
    );
    expect(
      WaterMeterRechargeSheetRoute($extra: entity).location,
      '/devices/water-meters/recharge',
    );
    expect(
      WaterMeterRenameSheetRoute($extra: entity).location,
      '/devices/water-meters/rename',
    );
    expect(
      WaterMeterDeleteConfirmSheetRoute($extra: entity).location,
      '/devices/water-meters/delete-confirm',
    );
    expect(
      const WaterMeterOperationRecordsRoute(meterId: 7).location,
      '/devices/water-meters/operation-records/7',
    );
    expect(
      const WaterMeterUsageRecordsRoute(meterId: 7).location,
      '/devices/water-meters/usage-records/7',
    );
    expect(
      WaterMeterPriceSheetRoute($extra: entity).location,
      '/devices/water-meters/price',
    );
    expect(
      WaterMeterPayModeSheetRoute($extra: entity).location,
      '/devices/water-meters/pay-mode',
    );
    expect(
      WaterMeterTotalUsageSheetRoute($extra: entity).location,
      '/devices/water-meters/total-usage',
    );
    expect(
      const WaterMeterClearConfirmDialogRoute().location,
      '/devices/water-meters/clear-confirm',
    );
    expect(
      const WaterMeterSettingsRoute(meterId: 7).location,
      '/devices/water-meters/settings/7',
    );
    expect(
      const WaterMeterCatOneRoute(meterId: 7).location,
      '/devices/water-meters/cat-one/7',
    );
    expect(
      const WaterMeterCatOneApnSheetRoute().location,
      '/devices/water-meters/cat-one-config',
    );
  });
}
