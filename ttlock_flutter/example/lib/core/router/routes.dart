import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/door_sensor/door_sensor_info_page.dart';
import '../../features/door_sensor/door_sensor_list_page.dart';
import '../../features/electric_meter/electric_meter_page.dart';
import '../../features/gateway/gateway_page.dart';
import '../../features/lock/lock_page.dart';
import '../../features/remote_key/remote_key_info_page.dart';
import '../../features/remote_key/remote_key_list_page.dart';
import '../../features/remote_keypad/keypad_info_page.dart';
import '../../features/remote_keypad/keypad_list_page.dart';
import '../../features/scan/scan_config.dart';
import '../../features/scan/scan_page.dart';
import '../../features/settings/settings_page.dart';
import '../../features/water_meter/water_meter_page.dart';

part 'routes.g.dart';

// ─── Shell branches ───
class DashboardBranch extends StatefulShellBranchData {
  const DashboardBranch();
}

class ScanBranch extends StatefulShellBranchData {
  const ScanBranch();
}

class SettingsBranch extends StatefulShellBranchData {
  const SettingsBranch();
}

// ─── Main Shell ───
@TypedStatefulShellRoute<MainShellRoute>(
  branches: [
    TypedStatefulShellBranch<DashboardBranch>(
      routes: [
        TypedGoRoute<DashboardRoute>(path: '/'),
      ],
    ),
    TypedStatefulShellBranch<ScanBranch>(
      routes: [
        TypedGoRoute<ScanRoute>(path: '/scan'),
      ],
    ),
    TypedStatefulShellBranch<SettingsBranch>(
      routes: [
        TypedGoRoute<SettingsRoute>(path: '/settings'),
      ],
    ),
  ],
)
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppShell(navigationShell: navigationShell);
  }
}

// ─── Dashboard ───
class DashboardRoute extends GoRouteData with _$DashboardRoute {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardPage();
}

// ─── Scan ───
class ScanRoute extends GoRouteData with _$ScanRoute {
  const ScanRoute({this.type, this.lockData, this.lockMac});

  final String? type;
  final String? lockData;
  final String? lockMac;

  ScanConfig get scanConfig => ScanConfig.fromQuery(
        type: type,
        lockData: lockData,
        lockMac: lockMac,
      );

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ScanPage(config: scanConfig);
}

// ─── Settings ───
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

// ─── Lock Detail ───
@TypedGoRoute<LockRoute>(
  path: '/lock/:mac',
  routes: [
    TypedGoRoute<DoorSensorListRoute>(path: 'door-sensors'),
    TypedGoRoute<RemoteKeyListRoute>(path: 'remote-keys'),
    TypedGoRoute<KeypadListRoute>(path: 'keypads'),
  ],
)
class LockRoute extends GoRouteData with _$LockRoute {
  const LockRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockPage(mac: mac);
}

class DoorSensorListRoute extends GoRouteData with _$DoorSensorListRoute {
  const DoorSensorListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoorSensorListPage(lockMac: mac);
}

class RemoteKeyListRoute extends GoRouteData with _$RemoteKeyListRoute {
  const RemoteKeyListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      RemoteKeyListPage(lockMac: mac);
}

class KeypadListRoute extends GoRouteData with _$KeypadListRoute {
  const KeypadListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      KeypadListPage(lockMac: mac);
}

// ─── Gateway Detail ───
@TypedGoRoute<GatewayRoute>(path: '/gateway/:mac')
class GatewayRoute extends GoRouteData with _$GatewayRoute {
  const GatewayRoute(this.mac, {this.needsWifiConfig = false});

  final String mac;
  final bool needsWifiConfig;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GatewayPage(mac: mac, needsWifiConfig: needsWifiConfig);
}

// ─── Accessory Detail ───
@TypedGoRoute<DoorSensorInfoRoute>(path: '/door-sensor/:mac')
class DoorSensorInfoRoute extends GoRouteData with _$DoorSensorInfoRoute {
  const DoorSensorInfoRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DoorSensorInfoPage(mac: mac);
}

@TypedGoRoute<RemoteKeyInfoRoute>(path: '/remote-key/:mac')
class RemoteKeyInfoRoute extends GoRouteData with _$RemoteKeyInfoRoute {
  const RemoteKeyInfoRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      RemoteKeyInfoPage(mac: mac);
}

@TypedGoRoute<KeypadInfoRoute>(path: '/keypad/:mac')
class KeypadInfoRoute extends GoRouteData with _$KeypadInfoRoute {
  const KeypadInfoRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      KeypadInfoPage(mac: mac);
}

// ─── Meters ───
@TypedGoRoute<WaterMeterRoute>(path: '/water-meter/:id')
class WaterMeterRoute extends GoRouteData with _$WaterMeterRoute {
  const WaterMeterRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WaterMeterPage(mac: id, meterId: id);
  }
}

@TypedGoRoute<ElectricMeterRoute>(path: '/electric-meter/:id')
class ElectricMeterRoute extends GoRouteData with _$ElectricMeterRoute {
  const ElectricMeterRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ElectricMeterPage(mac: id, meterId: id);
  }
}
