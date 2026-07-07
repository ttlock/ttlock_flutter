import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../app.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/door_sensor/door_sensor_info_page.dart';
import '../../features/door_sensor/door_sensor_list_page.dart';
import '../../features/door_sensor/standalone_door_sensor_info_page.dart';
import '../../features/electric_meter/electric_meter_page.dart';
import '../../features/gateway/gateway_init_page.dart';
import '../../features/gateway/gateway_page.dart';
import '../../features/lock/card/card_add_page.dart';
import '../../features/lock/card/card_list_page.dart';
import '../../features/lock/face/face_add_page.dart';
import '../../features/lock/face/face_manage_page.dart';
import '../../features/lock/fingerprint/fingerprint_add_page.dart';
import '../../features/lock/fingerprint/fingerprint_list_page.dart';
import '../../features/lock/lock_page.dart';
import '../../features/lock/palm_vein/palm_vein_list_page.dart';
import '../../features/lock/passcode/passcode_add_page.dart';
import '../../features/lock/passcode/passcode_list_page.dart';
import '../../features/lock/settings/lock_advanced_settings_page.dart';
import '../../features/lock/settings/lock_basic_info_page.dart';
import '../../features/lock/settings/lock_network_settings_page.dart';
import '../../features/lock/settings/lock_passage_mode_page.dart';
import '../../features/lock/settings/lock_settings_page.dart';
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

// ─── Scan (full-screen, outside shell) ───
@TypedGoRoute<ScanRoute>(path: '/scan')
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
    TypedGoRoute<PasscodeListRoute>(path: 'passcodes'),
    TypedGoRoute<PasscodeAddRoute>(path: 'passcodes/add'),
    TypedGoRoute<CardListRoute>(path: 'cards'),
    TypedGoRoute<CardAddRoute>(path: 'cards/add'),
    TypedGoRoute<FingerprintListRoute>(path: 'fingerprints'),
    TypedGoRoute<FingerprintAddRoute>(path: 'fingerprints/add'),
    TypedGoRoute<FaceManageRoute>(path: 'faces'),
    TypedGoRoute<FaceAddRoute>(path: 'faces/add'),
    TypedGoRoute<LockSettingsRoute>(
      path: 'settings',
      routes: [
        TypedGoRoute<LockBasicInfoRoute>(path: 'basic-info'),
        TypedGoRoute<LockNetworkSettingsRoute>(path: 'network'),
        TypedGoRoute<LockPassageModeRoute>(path: 'passage-mode'),
        TypedGoRoute<LockAdvancedSettingsRoute>(path: 'advanced'),
      ],
    ),
    TypedGoRoute<DoorSensorListRoute>(path: 'door-sensors'),
    TypedGoRoute<RemoteKeyListRoute>(path: 'remote-keys'),
    TypedGoRoute<KeypadListRoute>(path: 'keypads'),
    TypedGoRoute<PalmVeinListRoute>(path: 'palm-veins'),
  ],
)
class LockRoute extends GoRouteData with _$LockRoute {
  const LockRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockPage(mac: mac);
}

class PasscodeListRoute extends GoRouteData with _$PasscodeListRoute {
  const PasscodeListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PasscodeListPage(lockMac: mac);
}

class PasscodeAddRoute extends GoRouteData with _$PasscodeAddRoute {
  const PasscodeAddRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PasscodeAddPage(lockMac: mac);
}

class CardListRoute extends GoRouteData with _$CardListRoute {
  const CardListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CardListPage(lockMac: mac);
}

class CardAddRoute extends GoRouteData with _$CardAddRoute {
  const CardAddRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CardAddPage(lockMac: mac);
}

class FingerprintListRoute extends GoRouteData with _$FingerprintListRoute {
  const FingerprintListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      FingerprintListPage(lockMac: mac);
}

class FingerprintAddRoute extends GoRouteData with _$FingerprintAddRoute {
  const FingerprintAddRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      FingerprintAddPage(lockMac: mac);
}

class FaceManageRoute extends GoRouteData with _$FaceManageRoute {
  const FaceManageRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      FaceManagePage(lockMac: mac);
}

class FaceAddRoute extends GoRouteData with _$FaceAddRoute {
  const FaceAddRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      FaceAddPage(lockMac: mac);
}

class LockSettingsRoute extends GoRouteData with _$LockSettingsRoute {
  const LockSettingsRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockSettingsPage(lockMac: mac);
}

class LockBasicInfoRoute extends GoRouteData with _$LockBasicInfoRoute {
  const LockBasicInfoRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockBasicInfoPage(lockMac: mac);
}

class LockNetworkSettingsRoute extends GoRouteData with _$LockNetworkSettingsRoute {
  const LockNetworkSettingsRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockNetworkSettingsPage(lockMac: mac);
}

class LockPassageModeRoute extends GoRouteData with _$LockPassageModeRoute {
  const LockPassageModeRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockPassageModePage(lockMac: mac);
}

class LockAdvancedSettingsRoute extends GoRouteData with _$LockAdvancedSettingsRoute {
  const LockAdvancedSettingsRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LockAdvancedSettingsPage(lockMac: mac);
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

class PalmVeinListRoute extends GoRouteData with _$PalmVeinListRoute {
  const PalmVeinListRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PalmVeinListPage(lockMac: mac);
}

// ─── Gateway ───
@TypedGoRoute<GatewayRoute>(
  path: '/gateway/:mac',
  routes: [
    TypedGoRoute<GatewayInitRoute>(path: 'init'),
  ],
)
class GatewayRoute extends GoRouteData with _$GatewayRoute {
  const GatewayRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      GatewayPage(mac: mac);
}

class GatewayInitRoute extends GoRouteData with _$GatewayInitRoute {
  const GatewayInitRoute(
    this.mac, {
    this.name = 'Gateway',
    this.gatewayType = TTGatewayType.g2,
    this.needsWifiConfig = false,
  });

  final String mac;
  final String name;
  final TTGatewayType gatewayType;
  final bool needsWifiConfig;

  @override
  Widget build(BuildContext context, GoRouterState state) => GatewayInitPage(
        mac: mac,
        name: name,
        gatewayType: gatewayType,
        needsWifiConfig: needsWifiConfig,
      );
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

@TypedGoRoute<StandaloneDoorSensorRoute>(path: '/standalone-door-sensor/:mac')
class StandaloneDoorSensorRoute extends GoRouteData
    with _$StandaloneDoorSensorRoute {
  const StandaloneDoorSensorRoute(this.mac);

  final String mac;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StandaloneDoorSensorInfoPage(mac: mac);
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
