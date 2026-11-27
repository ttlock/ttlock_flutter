import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/gateway_args.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P4x gateway RoutePaths', () {
    expect(RoutePaths.gatewayList, '/devices/gateways');
    expect(RoutePaths.gatewayAdd, '/devices/gateways/add');
    expect(RoutePaths.gatewayDetail, '/devices/gateways/detail');
    expect(RoutePaths.gatewayRename, '/devices/gateways/rename');
    expect(RoutePaths.gatewayDeleteConfirm, '/devices/gateways/delete-confirm');
  });

  test('P4x typed routes location', () {
    const entity = GatewayEntity(gatewayId: 7, gatewayMac: 'AA:BB');
    expect(const GatewayListRoute().location, '/devices/gateways');
    expect(const GatewayAddRoute().location, '/devices/gateways/add');
    expect(
      GatewayDetailRoute($extra: entity).location,
      '/devices/gateways/detail',
    );
    expect(
      GatewayRenameSheetRoute($extra: entity).location,
      '/devices/gateways/rename',
    );
    expect(
      GatewayDeleteConfirmSheetRoute($extra: entity).location,
      '/devices/gateways/delete-confirm',
    );
    expect(const GatewayDetailArgs(gateway: entity).gateway.gatewayId, 7);
  });
}
