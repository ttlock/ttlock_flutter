// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $loginRoute,
  $registerRoute,
  $mainShellRoute,
  $configRoute,
  $lockScanRoute,
  $lockRenameSheetRoute,
  $lockTransferSheetRoute,
  $lockDeleteConfirmSheetRoute,
  $lockClearRecordsConfirmSheetRoute,
  $lockGroupPickerSheetRoute,
  $lockAutoLockTimeSheetRoute,
  $lockDoorNotClosedAlertSheetRoute,
  $lockSoundSheetRoute,
  $lockSensitivitySheetRoute,
  $lockLightTimeSheetRoute,
  $lockBluetoothAdvertisingIntervalRoute,
  $lockMotorTorqueSheetRoute,
  $lockLatchBoltSheetRoute,
  $lockTimeRoute,
  $lockInfoRoute,
  $lockAdminPasscodeRoute,
  $lockOpenDirectionSheetRoute,
  $lockPassageModeSheetRoute,
  $lockWorkingModeSheetRoute,
  $lockUnauthorizedAttemptSheetRoute,
  $lockNbRegisterSheetRoute,
  $lockRecordsRoute,
  $liftRoute,
  $liftWorkModeRoute,
  $liftControlableFloorsRoute,
  $powerSwitchWorkModeRoute,
  $powerSwitchControlableLockRoute,
  $lockSettingsRoute,
  $lockWifiRoute,
  $lockWifiNetworkSheetRoute,
  $groupManageRoute,
  $groupAddSheetRoute,
  $groupRenameSheetRoute,
  $ekeyListRoute,
  $ekeySendRoute,
  $ekeyDetailRoute,
  $ekeyChangePeriodSheetRoute,
  $ekeyDeleteConfirmSheetRoute,
  $passcodeListRoute,
  $passcodeGetRoute,
  $passcodeAddRoute,
  $passcodeDetailRoute,
  $passcodeChangePeriodSheetRoute,
  $passcodeDeleteConfirmSheetRoute,
  $cardListRoute,
  $cardAddRoute,
  $cardDetailRoute,
  $cardChangePeriodSheetRoute,
  $cardDeleteConfirmSheetRoute,
  $fingerprintListRoute,
  $fingerprintAddRoute,
  $fingerprintDetailRoute,
  $fingerprintChangePeriodSheetRoute,
  $fingerprintDeleteConfirmSheetRoute,
  $faceListRoute,
  $faceAddRoute,
  $faceEnrollMethodRoute,
  $facePhotoAddRoute,
  $faceDetailRoute,
  $faceChangePeriodSheetRoute,
  $faceDeleteConfirmSheetRoute,
  $palmVeinListRoute,
  $palmVeinAddRoute,
  $palmVeinDetailRoute,
  $palmVeinChangePeriodSheetRoute,
  $palmVeinDeleteConfirmSheetRoute,
  $qrCodeListRoute,
  $qrCodeAddRoute,
  $qrCodeDetailRoute,
  $qrCodeChangePeriodSheetRoute,
  $qrCodeDeleteConfirmSheetRoute,
  $remoteListRoute,
  $remoteAddRoute,
  $remoteDetailRoute,
  $remoteChangePeriodSheetRoute,
  $remoteDeleteConfirmSheetRoute,
  $recurringScheduleSheetRoute,
  $doorSensorAddRoute,
  $doorSensorDetailRoute,
  $doorSensorRecordsRoute,
  $standaloneDoorSensorAddRoute,
  $standaloneDoorSensorListRoute,
  $standaloneDoorSensorDetailRoute,
  $standaloneDoorSensorRenameSheetRoute,
  $standaloneDoorSensorDeleteConfirmSheetRoute,
  $standaloneDoorSensorAlertConfigSheetRoute,
  $standaloneDoorSensorWifiConfigSheetRoute,
  $standaloneDoorSensorUserSheetRoute,
  $standaloneDoorSensorRecordsRoute,
  $wirelessKeypadListRoute,
  $wirelessKeypadAddTypeRoute,
  $wirelessKeypadAddRoute,
  $wirelessKeypadDetailRoute,
  $keypadRenameSheetRoute,
  $keypadUnbindConfirmRoute,
  $gatewayListRoute,
  $gatewayAddRoute,
  $gatewayDetailRoute,
  $gatewayRenameSheetRoute,
  $gatewayDeleteConfirmSheetRoute,
  $waterMeterListRoute,
  $waterMeterAddRoute,
  $waterMeterDetailRoute,
  $waterMeterRechargeSheetRoute,
  $waterMeterRenameSheetRoute,
  $waterMeterDeleteConfirmSheetRoute,
  $waterMeterOperationRecordsRoute,
  $waterMeterUsageRecordsRoute,
  $waterMeterPriceSheetRoute,
  $waterMeterPayModeSheetRoute,
  $waterMeterTotalUsageSheetRoute,
  $waterMeterClearConfirmDialogRoute,
  $waterMeterRemainderSheetRoute,
  $waterMeterResetConfirmDialogRoute,
  $waterMeterSettingsRoute,
  $waterMeterCatOneRoute,
  $waterMeterCatOneApnSheetRoute,
  $electricMeterListRoute,
  $electricMeterAddRoute,
  $electricMeterDetailRoute,
  $electricMeterRechargeSheetRoute,
  $electricMeterRenameSheetRoute,
  $electricMeterMaxPowerSheetRoute,
  $electricMeterDeleteConfirmSheetRoute,
  $electricMeterOperationRecordsRoute,
  $electricMeterUsageRecordsRoute,
  $electricMeterPriceSheetRoute,
  $electricMeterPayModeSheetRoute,
  $electricMeterClearConfirmDialogRoute,
  $electricMeterRemainderSheetRoute,
  $electricMeterResetConfirmDialogRoute,
  $electricMeterSettingsRoute,
  $electricMeterCatOneRoute,
  $electricMeterCatOneApnSheetRoute,
  $meterConnectionConfirmRoute,
  $lockDetailRoute,
  $hotelLocksRoute,
  $hotelLockDetailRoute,
  $hotelSectorRoute,
  $hotelBuildingRoute,
];

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: $LoginRoute._fromState);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute =>
    GoRouteData.$route(path: '/register', factory: $RegisterRoute._fromState);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRoute => StatefulShellRouteData.$route(
  factory: $MainShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [GoRouteData.$route(path: '/', factory: $HomeRoute._fromState)],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/devices',
          factory: $OtherDevicesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(path: '/mine', factory: $MineRoute._fromState),
      ],
    ),
  ],
);

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OtherDevicesRoute on GoRouteData {
  static OtherDevicesRoute _fromState(GoRouterState state) =>
      const OtherDevicesRoute();

  @override
  String get location => GoRouteData.$location('/devices');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MineRoute on GoRouteData {
  static MineRoute _fromState(GoRouterState state) => const MineRoute();

  @override
  String get location => GoRouteData.$location('/mine');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $configRoute =>
    GoRouteData.$route(path: '/config', factory: $ConfigRoute._fromState);

mixin $ConfigRoute on GoRouteData {
  static ConfigRoute _fromState(GoRouterState state) => const ConfigRoute();

  @override
  String get location => GoRouteData.$location('/config');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockScanRoute =>
    GoRouteData.$route(path: '/scan', factory: $LockScanRoute._fromState);

mixin $LockScanRoute on GoRouteData {
  static LockScanRoute _fromState(GoRouterState state) => const LockScanRoute();

  @override
  String get location => GoRouteData.$location('/scan');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockRenameSheetRoute => GoRouteData.$route(
  path: '/lock/rename',
  factory: $LockRenameSheetRoute._fromState,
);

mixin $LockRenameSheetRoute on GoRouteData {
  static LockRenameSheetRoute _fromState(GoRouterState state) =>
      LockRenameSheetRoute($extra: state.extra as LockEntity);

  LockRenameSheetRoute get _self => this as LockRenameSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockTransferSheetRoute => GoRouteData.$route(
  path: '/lock/transfer',
  factory: $LockTransferSheetRoute._fromState,
);

mixin $LockTransferSheetRoute on GoRouteData {
  static LockTransferSheetRoute _fromState(GoRouterState state) =>
      LockTransferSheetRoute($extra: state.extra as LockEntity);

  LockTransferSheetRoute get _self => this as LockTransferSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/transfer');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/delete-confirm',
  factory: $LockDeleteConfirmSheetRoute._fromState,
);

mixin $LockDeleteConfirmSheetRoute on GoRouteData {
  static LockDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      LockDeleteConfirmSheetRoute($extra: state.extra as LockEntity);

  LockDeleteConfirmSheetRoute get _self => this as LockDeleteConfirmSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/delete-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockClearRecordsConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/clear-records-confirm',
  factory: $LockClearRecordsConfirmSheetRoute._fromState,
);

mixin $LockClearRecordsConfirmSheetRoute on GoRouteData {
  static LockClearRecordsConfirmSheetRoute _fromState(GoRouterState state) =>
      const LockClearRecordsConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/clear-records-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockGroupPickerSheetRoute => GoRouteData.$route(
  path: '/lock/group-picker',
  factory: $LockGroupPickerSheetRoute._fromState,
);

mixin $LockGroupPickerSheetRoute on GoRouteData {
  static LockGroupPickerSheetRoute _fromState(GoRouterState state) =>
      LockGroupPickerSheetRoute(
        groupId: _$convertMapValue(
          'group-id',
          state.uri.queryParameters,
          int.tryParse,
        ),
      );

  LockGroupPickerSheetRoute get _self => this as LockGroupPickerSheetRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/group-picker',
    queryParams: {
      if (_self.groupId != null) 'group-id': _self.groupId!.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $lockAutoLockTimeSheetRoute => GoRouteData.$route(
  path: '/lock/auto-lock-time',
  factory: $LockAutoLockTimeSheetRoute._fromState,
);

mixin $LockAutoLockTimeSheetRoute on GoRouteData {
  static LockAutoLockTimeSheetRoute _fromState(
    GoRouterState state,
  ) => LockAutoLockTimeSheetRoute(
    step: _$convertMapValue('step', state.uri.queryParameters, int.parse) ?? 5,
    $extra: state.extra as AutoLockingTime?,
  );

  LockAutoLockTimeSheetRoute get _self => this as LockAutoLockTimeSheetRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/auto-lock-time',
    queryParams: {if (_self.step != 5) 'step': _self.step.toString()},
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockDoorNotClosedAlertSheetRoute => GoRouteData.$route(
  path: '/lock/door-not-closed-alert',
  factory: $LockDoorNotClosedAlertSheetRoute._fromState,
);

mixin $LockDoorNotClosedAlertSheetRoute on GoRouteData {
  static LockDoorNotClosedAlertSheetRoute _fromState(GoRouterState state) =>
      LockDoorNotClosedAlertSheetRoute(
        initialSeconds:
            _$convertMapValue(
              'initial-seconds',
              state.uri.queryParameters,
              int.parse,
            ) ??
            0,
        $extra: state.extra as LockEntity,
      );

  LockDoorNotClosedAlertSheetRoute get _self =>
      this as LockDoorNotClosedAlertSheetRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/door-not-closed-alert',
    queryParams: {
      if (_self.initialSeconds != 0)
        'initial-seconds': _self.initialSeconds.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockSoundSheetRoute => GoRouteData.$route(
  path: '/lock/sound',
  factory: $LockSoundSheetRoute._fromState,
);

mixin $LockSoundSheetRoute on GoRouteData {
  static LockSoundSheetRoute _fromState(GoRouterState state) =>
      LockSoundSheetRoute($extra: state.extra as LockEntity);

  LockSoundSheetRoute get _self => this as LockSoundSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/sound');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockSensitivitySheetRoute => GoRouteData.$route(
  path: '/lock/sensitivity',
  factory: $LockSensitivitySheetRoute._fromState,
);

mixin $LockSensitivitySheetRoute on GoRouteData {
  static LockSensitivitySheetRoute _fromState(GoRouterState state) =>
      LockSensitivitySheetRoute($extra: state.extra as LockEntity);

  LockSensitivitySheetRoute get _self => this as LockSensitivitySheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/sensitivity');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockLightTimeSheetRoute => GoRouteData.$route(
  path: '/lock/light-time',
  factory: $LockLightTimeSheetRoute._fromState,
);

mixin $LockLightTimeSheetRoute on GoRouteData {
  static LockLightTimeSheetRoute _fromState(GoRouterState state) =>
      LockLightTimeSheetRoute($extra: state.extra as LockEntity);

  LockLightTimeSheetRoute get _self => this as LockLightTimeSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/light-time');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockBluetoothAdvertisingIntervalRoute => GoRouteData.$route(
  path: '/lock/:lockId/bluetooth-advertising-interval',
  factory: $LockBluetoothAdvertisingIntervalRoute._fromState,
);

mixin $LockBluetoothAdvertisingIntervalRoute on GoRouteData {
  static LockBluetoothAdvertisingIntervalRoute _fromState(
    GoRouterState state,
  ) => LockBluetoothAdvertisingIntervalRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockBluetoothAdvertisingIntervalRoute get _self =>
      this as LockBluetoothAdvertisingIntervalRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/bluetooth-advertising-interval',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockMotorTorqueSheetRoute => GoRouteData.$route(
  path: '/lock/motor-torque',
  factory: $LockMotorTorqueSheetRoute._fromState,
);

mixin $LockMotorTorqueSheetRoute on GoRouteData {
  static LockMotorTorqueSheetRoute _fromState(GoRouterState state) =>
      const LockMotorTorqueSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/motor-torque');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockLatchBoltSheetRoute => GoRouteData.$route(
  path: '/lock/latch-bolt',
  factory: $LockLatchBoltSheetRoute._fromState,
);

mixin $LockLatchBoltSheetRoute on GoRouteData {
  static LockLatchBoltSheetRoute _fromState(GoRouterState state) =>
      const LockLatchBoltSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/latch-bolt');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $lockTimeRoute => GoRouteData.$route(
  path: '/lock/:lockId/time',
  factory: $LockTimeRoute._fromState,
);

mixin $LockTimeRoute on GoRouteData {
  static LockTimeRoute _fromState(GoRouterState state) => LockTimeRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockTimeRoute get _self => this as LockTimeRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/time',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockInfoRoute => GoRouteData.$route(
  path: '/lock/:lockId/info',
  factory: $LockInfoRoute._fromState,
);

mixin $LockInfoRoute on GoRouteData {
  static LockInfoRoute _fromState(GoRouterState state) => LockInfoRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockInfoRoute get _self => this as LockInfoRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/info',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockAdminPasscodeRoute => GoRouteData.$route(
  path: '/lock/:lockId/admin-passcode',
  factory: $LockAdminPasscodeRoute._fromState,
);

mixin $LockAdminPasscodeRoute on GoRouteData {
  static LockAdminPasscodeRoute _fromState(GoRouterState state) =>
      LockAdminPasscodeRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  LockAdminPasscodeRoute get _self => this as LockAdminPasscodeRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/admin-passcode',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockOpenDirectionSheetRoute => GoRouteData.$route(
  path: '/lock/open-direction',
  factory: $LockOpenDirectionSheetRoute._fromState,
);

mixin $LockOpenDirectionSheetRoute on GoRouteData {
  static LockOpenDirectionSheetRoute _fromState(GoRouterState state) =>
      LockOpenDirectionSheetRoute($extra: state.extra as LockOpenDirectionArgs);

  LockOpenDirectionSheetRoute get _self => this as LockOpenDirectionSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/open-direction');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockPassageModeSheetRoute => GoRouteData.$route(
  path: '/lock/passage-mode',
  factory: $LockPassageModeSheetRoute._fromState,
);

mixin $LockPassageModeSheetRoute on GoRouteData {
  static LockPassageModeSheetRoute _fromState(GoRouterState state) =>
      LockPassageModeSheetRoute($extra: state.extra as LockEntity);

  LockPassageModeSheetRoute get _self => this as LockPassageModeSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/passage-mode');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockWorkingModeSheetRoute => GoRouteData.$route(
  path: '/lock/working-mode',
  factory: $LockWorkingModeSheetRoute._fromState,
);

mixin $LockWorkingModeSheetRoute on GoRouteData {
  static LockWorkingModeSheetRoute _fromState(GoRouterState state) =>
      LockWorkingModeSheetRoute($extra: state.extra as LockEntity);

  LockWorkingModeSheetRoute get _self => this as LockWorkingModeSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/working-mode');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockUnauthorizedAttemptSheetRoute => GoRouteData.$route(
  path: '/lock/unauthorized-attempt',
  factory: $LockUnauthorizedAttemptSheetRoute._fromState,
);

mixin $LockUnauthorizedAttemptSheetRoute on GoRouteData {
  static LockUnauthorizedAttemptSheetRoute _fromState(GoRouterState state) =>
      LockUnauthorizedAttemptSheetRoute($extra: state.extra as LockEntity);

  LockUnauthorizedAttemptSheetRoute get _self =>
      this as LockUnauthorizedAttemptSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/unauthorized-attempt');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockNbRegisterSheetRoute => GoRouteData.$route(
  path: '/lock/nb-register',
  factory: $LockNbRegisterSheetRoute._fromState,
);

mixin $LockNbRegisterSheetRoute on GoRouteData {
  static LockNbRegisterSheetRoute _fromState(GoRouterState state) =>
      LockNbRegisterSheetRoute($extra: state.extra as LockEntity);

  LockNbRegisterSheetRoute get _self => this as LockNbRegisterSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/nb-register');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockRecordsRoute => GoRouteData.$route(
  path: '/lock/:lockId/records',
  factory: $LockRecordsRoute._fromState,
);

mixin $LockRecordsRoute on GoRouteData {
  static LockRecordsRoute _fromState(GoRouterState state) => LockRecordsRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockRecordsRoute get _self => this as LockRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/records',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $liftRoute => GoRouteData.$route(
  path: '/lock/:lockId/lift',
  factory: $LiftRoute._fromState,
);

mixin $LiftRoute on GoRouteData {
  static LiftRoute _fromState(GoRouterState state) => LiftRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LiftRoute get _self => this as LiftRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/lift',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $liftWorkModeRoute => GoRouteData.$route(
  path: '/lock/:lockId/lift/work-mode',
  factory: $LiftWorkModeRoute._fromState,
);

mixin $LiftWorkModeRoute on GoRouteData {
  static LiftWorkModeRoute _fromState(GoRouterState state) => LiftWorkModeRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LiftWorkModeRoute get _self => this as LiftWorkModeRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/lift/work-mode',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $liftControlableFloorsRoute => GoRouteData.$route(
  path: '/lock/:lockId/lift/controlable',
  factory: $LiftControlableFloorsRoute._fromState,
);

mixin $LiftControlableFloorsRoute on GoRouteData {
  static LiftControlableFloorsRoute _fromState(GoRouterState state) =>
      LiftControlableFloorsRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  LiftControlableFloorsRoute get _self => this as LiftControlableFloorsRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/lift/controlable',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $powerSwitchWorkModeRoute => GoRouteData.$route(
  path: '/lock/:lockId/power-switch/work-mode',
  factory: $PowerSwitchWorkModeRoute._fromState,
);

mixin $PowerSwitchWorkModeRoute on GoRouteData {
  static PowerSwitchWorkModeRoute _fromState(GoRouterState state) =>
      PowerSwitchWorkModeRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  PowerSwitchWorkModeRoute get _self => this as PowerSwitchWorkModeRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/power-switch/work-mode',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $powerSwitchControlableLockRoute => GoRouteData.$route(
  path: '/lock/:lockId/power-switch/controlable',
  factory: $PowerSwitchControlableLockRoute._fromState,
);

mixin $PowerSwitchControlableLockRoute on GoRouteData {
  static PowerSwitchControlableLockRoute _fromState(GoRouterState state) =>
      PowerSwitchControlableLockRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  PowerSwitchControlableLockRoute get _self =>
      this as PowerSwitchControlableLockRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/power-switch/controlable',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockSettingsRoute => GoRouteData.$route(
  path: '/lock/:lockId/settings',
  factory: $LockSettingsRoute._fromState,
);

mixin $LockSettingsRoute on GoRouteData {
  static LockSettingsRoute _fromState(GoRouterState state) => LockSettingsRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockSettingsRoute get _self => this as LockSettingsRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/settings',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockWifiRoute => GoRouteData.$route(
  path: '/lock/:lockId/wifi',
  factory: $LockWifiRoute._fromState,
);

mixin $LockWifiRoute on GoRouteData {
  static LockWifiRoute _fromState(GoRouterState state) => LockWifiRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockWifiRoute get _self => this as LockWifiRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/wifi',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockWifiNetworkSheetRoute => GoRouteData.$route(
  path: '/lock/:lockId/wifi/network',
  factory: $LockWifiNetworkSheetRoute._fromState,
);

mixin $LockWifiNetworkSheetRoute on GoRouteData {
  static LockWifiNetworkSheetRoute _fromState(GoRouterState state) =>
      LockWifiNetworkSheetRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  LockWifiNetworkSheetRoute get _self => this as LockWifiNetworkSheetRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/wifi/network',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $groupManageRoute =>
    GoRouteData.$route(path: '/groups', factory: $GroupManageRoute._fromState);

mixin $GroupManageRoute on GoRouteData {
  static GroupManageRoute _fromState(GoRouterState state) =>
      const GroupManageRoute();

  @override
  String get location => GoRouteData.$location('/groups');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $groupAddSheetRoute => GoRouteData.$route(
  path: '/groups/add',
  factory: $GroupAddSheetRoute._fromState,
);

mixin $GroupAddSheetRoute on GoRouteData {
  static GroupAddSheetRoute _fromState(GoRouterState state) =>
      const GroupAddSheetRoute();

  @override
  String get location => GoRouteData.$location('/groups/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $groupRenameSheetRoute => GoRouteData.$route(
  path: '/groups/rename',
  factory: $GroupRenameSheetRoute._fromState,
);

mixin $GroupRenameSheetRoute on GoRouteData {
  static GroupRenameSheetRoute _fromState(GoRouterState state) =>
      GroupRenameSheetRoute($extra: state.extra as GroupEntity);

  GroupRenameSheetRoute get _self => this as GroupRenameSheetRoute;

  @override
  String get location => GoRouteData.$location('/groups/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $ekeyListRoute => GoRouteData.$route(
  path: '/lock/:lockId/ekeys',
  factory: $EkeyListRoute._fromState,
);

mixin $EkeyListRoute on GoRouteData {
  static EkeyListRoute _fromState(GoRouterState state) => EkeyListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  EkeyListRoute get _self => this as EkeyListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/ekeys',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $ekeySendRoute => GoRouteData.$route(
  path: '/lock/ekey-send',
  factory: $EkeySendRoute._fromState,
);

mixin $EkeySendRoute on GoRouteData {
  static EkeySendRoute _fromState(GoRouterState state) =>
      EkeySendRoute($extra: state.extra as LockEntity);

  EkeySendRoute get _self => this as EkeySendRoute;

  @override
  String get location => GoRouteData.$location('/lock/ekey-send');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $ekeyDetailRoute => GoRouteData.$route(
  path: '/lock/ekey-detail',
  factory: $EkeyDetailRoute._fromState,
);

mixin $EkeyDetailRoute on GoRouteData {
  static EkeyDetailRoute _fromState(GoRouterState state) =>
      EkeyDetailRoute($extra: state.extra as EkeyDetailArgs);

  EkeyDetailRoute get _self => this as EkeyDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/ekey-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $ekeyChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/ekey-change-period',
  factory: $EkeyChangePeriodSheetRoute._fromState,
);

mixin $EkeyChangePeriodSheetRoute on GoRouteData {
  static EkeyChangePeriodSheetRoute _fromState(GoRouterState state) =>
      EkeyChangePeriodSheetRoute($extra: state.extra as KeyEntity);

  EkeyChangePeriodSheetRoute get _self => this as EkeyChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/ekey-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $ekeyDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/ekey-delete-confirm',
  factory: $EkeyDeleteConfirmSheetRoute._fromState,
);

mixin $EkeyDeleteConfirmSheetRoute on GoRouteData {
  static EkeyDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const EkeyDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/ekey-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $passcodeListRoute => GoRouteData.$route(
  path: '/lock/:lockId/passcodes',
  factory: $PasscodeListRoute._fromState,
);

mixin $PasscodeListRoute on GoRouteData {
  static PasscodeListRoute _fromState(GoRouterState state) => PasscodeListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  PasscodeListRoute get _self => this as PasscodeListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/passcodes',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $passcodeGetRoute => GoRouteData.$route(
  path: '/lock/passcode-get',
  factory: $PasscodeGetRoute._fromState,
);

mixin $PasscodeGetRoute on GoRouteData {
  static PasscodeGetRoute _fromState(GoRouterState state) =>
      PasscodeGetRoute($extra: state.extra as LockEntity);

  PasscodeGetRoute get _self => this as PasscodeGetRoute;

  @override
  String get location => GoRouteData.$location('/lock/passcode-get');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $passcodeAddRoute => GoRouteData.$route(
  path: '/lock/passcode-add',
  factory: $PasscodeAddRoute._fromState,
);

mixin $PasscodeAddRoute on GoRouteData {
  static PasscodeAddRoute _fromState(GoRouterState state) =>
      PasscodeAddRoute($extra: state.extra as LockEntity);

  PasscodeAddRoute get _self => this as PasscodeAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/passcode-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $passcodeDetailRoute => GoRouteData.$route(
  path: '/lock/passcode-detail',
  factory: $PasscodeDetailRoute._fromState,
);

mixin $PasscodeDetailRoute on GoRouteData {
  static PasscodeDetailRoute _fromState(GoRouterState state) =>
      PasscodeDetailRoute($extra: state.extra as PasscodeDetailArgs);

  PasscodeDetailRoute get _self => this as PasscodeDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/passcode-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $passcodeChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/passcode-change-period',
  factory: $PasscodeChangePeriodSheetRoute._fromState,
);

mixin $PasscodeChangePeriodSheetRoute on GoRouteData {
  static PasscodeChangePeriodSheetRoute _fromState(GoRouterState state) =>
      PasscodeChangePeriodSheetRoute($extra: state.extra as KeyboardPwdEntity);

  PasscodeChangePeriodSheetRoute get _self =>
      this as PasscodeChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/passcode-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $passcodeDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/passcode-delete-confirm',
  factory: $PasscodeDeleteConfirmSheetRoute._fromState,
);

mixin $PasscodeDeleteConfirmSheetRoute on GoRouteData {
  static PasscodeDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const PasscodeDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/passcode-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cardListRoute => GoRouteData.$route(
  path: '/lock/:lockId/cards',
  factory: $CardListRoute._fromState,
);

mixin $CardListRoute on GoRouteData {
  static CardListRoute _fromState(GoRouterState state) => CardListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  CardListRoute get _self => this as CardListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/cards',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $cardAddRoute => GoRouteData.$route(
  path: '/lock/card-add',
  factory: $CardAddRoute._fromState,
);

mixin $CardAddRoute on GoRouteData {
  static CardAddRoute _fromState(GoRouterState state) => CardAddRoute(
    keypadMac: state.uri.queryParameters['keypad-mac'],
    $extra: state.extra as LockEntity,
  );

  CardAddRoute get _self => this as CardAddRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/card-add',
    queryParams: {if (_self.keypadMac != null) 'keypad-mac': _self.keypadMac},
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $cardDetailRoute => GoRouteData.$route(
  path: '/lock/card-detail',
  factory: $CardDetailRoute._fromState,
);

mixin $CardDetailRoute on GoRouteData {
  static CardDetailRoute _fromState(GoRouterState state) =>
      CardDetailRoute($extra: state.extra as CardDetailArgs);

  CardDetailRoute get _self => this as CardDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/card-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $cardChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/card-change-period',
  factory: $CardChangePeriodSheetRoute._fromState,
);

mixin $CardChangePeriodSheetRoute on GoRouteData {
  static CardChangePeriodSheetRoute _fromState(GoRouterState state) =>
      CardChangePeriodSheetRoute($extra: state.extra as IdentityCardEntity);

  CardChangePeriodSheetRoute get _self => this as CardChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/card-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $cardDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/card-delete-confirm',
  factory: $CardDeleteConfirmSheetRoute._fromState,
);

mixin $CardDeleteConfirmSheetRoute on GoRouteData {
  static CardDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const CardDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/card-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $fingerprintListRoute => GoRouteData.$route(
  path: '/lock/:lockId/fingerprints',
  factory: $FingerprintListRoute._fromState,
);

mixin $FingerprintListRoute on GoRouteData {
  static FingerprintListRoute _fromState(GoRouterState state) =>
      FingerprintListRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  FingerprintListRoute get _self => this as FingerprintListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/fingerprints',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $fingerprintAddRoute => GoRouteData.$route(
  path: '/lock/fingerprint-add',
  factory: $FingerprintAddRoute._fromState,
);

mixin $FingerprintAddRoute on GoRouteData {
  static FingerprintAddRoute _fromState(GoRouterState state) =>
      FingerprintAddRoute(
        keypadMac: state.uri.queryParameters['keypad-mac'],
        $extra: state.extra as LockEntity,
      );

  FingerprintAddRoute get _self => this as FingerprintAddRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/fingerprint-add',
    queryParams: {if (_self.keypadMac != null) 'keypad-mac': _self.keypadMac},
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $fingerprintDetailRoute => GoRouteData.$route(
  path: '/lock/fingerprint-detail',
  factory: $FingerprintDetailRoute._fromState,
);

mixin $FingerprintDetailRoute on GoRouteData {
  static FingerprintDetailRoute _fromState(GoRouterState state) =>
      FingerprintDetailRoute($extra: state.extra as FingerprintDetailArgs);

  FingerprintDetailRoute get _self => this as FingerprintDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/fingerprint-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $fingerprintChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/fingerprint-change-period',
  factory: $FingerprintChangePeriodSheetRoute._fromState,
);

mixin $FingerprintChangePeriodSheetRoute on GoRouteData {
  static FingerprintChangePeriodSheetRoute _fromState(GoRouterState state) =>
      FingerprintChangePeriodSheetRoute(
        $extra: state.extra as FingerprintEntity,
      );

  FingerprintChangePeriodSheetRoute get _self =>
      this as FingerprintChangePeriodSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/lock/fingerprint-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $fingerprintDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/fingerprint-delete-confirm',
  factory: $FingerprintDeleteConfirmSheetRoute._fromState,
);

mixin $FingerprintDeleteConfirmSheetRoute on GoRouteData {
  static FingerprintDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const FingerprintDeleteConfirmSheetRoute();

  @override
  String get location =>
      GoRouteData.$location('/lock/fingerprint-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $faceListRoute => GoRouteData.$route(
  path: '/lock/:lockId/faces',
  factory: $FaceListRoute._fromState,
);

mixin $FaceListRoute on GoRouteData {
  static FaceListRoute _fromState(GoRouterState state) => FaceListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  FaceListRoute get _self => this as FaceListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/faces',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $faceAddRoute => GoRouteData.$route(
  path: '/lock/face-add',
  factory: $FaceAddRoute._fromState,
);

mixin $FaceAddRoute on GoRouteData {
  static FaceAddRoute _fromState(GoRouterState state) =>
      FaceAddRoute($extra: state.extra as LockEntity);

  FaceAddRoute get _self => this as FaceAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/face-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $faceEnrollMethodRoute => GoRouteData.$route(
  path: '/lock/face-enroll-method',
  factory: $FaceEnrollMethodRoute._fromState,
);

mixin $FaceEnrollMethodRoute on GoRouteData {
  static FaceEnrollMethodRoute _fromState(GoRouterState state) =>
      FaceEnrollMethodRoute($extra: state.extra as LockEntity);

  FaceEnrollMethodRoute get _self => this as FaceEnrollMethodRoute;

  @override
  String get location => GoRouteData.$location('/lock/face-enroll-method');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $facePhotoAddRoute => GoRouteData.$route(
  path: '/lock/face-photo-add',
  factory: $FacePhotoAddRoute._fromState,
);

mixin $FacePhotoAddRoute on GoRouteData {
  static FacePhotoAddRoute _fromState(GoRouterState state) =>
      FacePhotoAddRoute($extra: state.extra as LockEntity);

  FacePhotoAddRoute get _self => this as FacePhotoAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/face-photo-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $faceDetailRoute => GoRouteData.$route(
  path: '/lock/face-detail',
  factory: $FaceDetailRoute._fromState,
);

mixin $FaceDetailRoute on GoRouteData {
  static FaceDetailRoute _fromState(GoRouterState state) =>
      FaceDetailRoute($extra: state.extra as FaceDetailArgs);

  FaceDetailRoute get _self => this as FaceDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/face-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $faceChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/face-change-period',
  factory: $FaceChangePeriodSheetRoute._fromState,
);

mixin $FaceChangePeriodSheetRoute on GoRouteData {
  static FaceChangePeriodSheetRoute _fromState(GoRouterState state) =>
      FaceChangePeriodSheetRoute($extra: state.extra as FaceEntity);

  FaceChangePeriodSheetRoute get _self => this as FaceChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/face-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $faceDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/face-delete-confirm',
  factory: $FaceDeleteConfirmSheetRoute._fromState,
);

mixin $FaceDeleteConfirmSheetRoute on GoRouteData {
  static FaceDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const FaceDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/face-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $palmVeinListRoute => GoRouteData.$route(
  path: '/lock/:lockId/palm-veins',
  factory: $PalmVeinListRoute._fromState,
);

mixin $PalmVeinListRoute on GoRouteData {
  static PalmVeinListRoute _fromState(GoRouterState state) => PalmVeinListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  PalmVeinListRoute get _self => this as PalmVeinListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/palm-veins',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $palmVeinAddRoute => GoRouteData.$route(
  path: '/lock/palm-vein-add',
  factory: $PalmVeinAddRoute._fromState,
);

mixin $PalmVeinAddRoute on GoRouteData {
  static PalmVeinAddRoute _fromState(GoRouterState state) =>
      PalmVeinAddRoute($extra: state.extra as LockEntity);

  PalmVeinAddRoute get _self => this as PalmVeinAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/palm-vein-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $palmVeinDetailRoute => GoRouteData.$route(
  path: '/lock/palm-vein-detail',
  factory: $PalmVeinDetailRoute._fromState,
);

mixin $PalmVeinDetailRoute on GoRouteData {
  static PalmVeinDetailRoute _fromState(GoRouterState state) =>
      PalmVeinDetailRoute($extra: state.extra as PalmVeinDetailArgs);

  PalmVeinDetailRoute get _self => this as PalmVeinDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/palm-vein-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $palmVeinChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/palm-vein-change-period',
  factory: $PalmVeinChangePeriodSheetRoute._fromState,
);

mixin $PalmVeinChangePeriodSheetRoute on GoRouteData {
  static PalmVeinChangePeriodSheetRoute _fromState(GoRouterState state) =>
      PalmVeinChangePeriodSheetRoute($extra: state.extra as PalmVeinEntity);

  PalmVeinChangePeriodSheetRoute get _self =>
      this as PalmVeinChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/palm-vein-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $palmVeinDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/palm-vein-delete-confirm',
  factory: $PalmVeinDeleteConfirmSheetRoute._fromState,
);

mixin $PalmVeinDeleteConfirmSheetRoute on GoRouteData {
  static PalmVeinDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const PalmVeinDeleteConfirmSheetRoute();

  @override
  String get location =>
      GoRouteData.$location('/lock/palm-vein-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $qrCodeListRoute => GoRouteData.$route(
  path: '/lock/:lockId/qr-codes',
  factory: $QrCodeListRoute._fromState,
);

mixin $QrCodeListRoute on GoRouteData {
  static QrCodeListRoute _fromState(GoRouterState state) => QrCodeListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  QrCodeListRoute get _self => this as QrCodeListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/qr-codes',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $qrCodeAddRoute => GoRouteData.$route(
  path: '/lock/qr-code-add',
  factory: $QrCodeAddRoute._fromState,
);

mixin $QrCodeAddRoute on GoRouteData {
  static QrCodeAddRoute _fromState(GoRouterState state) =>
      QrCodeAddRoute($extra: state.extra as LockEntity);

  QrCodeAddRoute get _self => this as QrCodeAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/qr-code-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $qrCodeDetailRoute => GoRouteData.$route(
  path: '/lock/qr-code-detail',
  factory: $QrCodeDetailRoute._fromState,
);

mixin $QrCodeDetailRoute on GoRouteData {
  static QrCodeDetailRoute _fromState(GoRouterState state) =>
      QrCodeDetailRoute($extra: state.extra as QrCodeDetailArgs);

  QrCodeDetailRoute get _self => this as QrCodeDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/qr-code-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $qrCodeChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/qr-code-change-period',
  factory: $QrCodeChangePeriodSheetRoute._fromState,
);

mixin $QrCodeChangePeriodSheetRoute on GoRouteData {
  static QrCodeChangePeriodSheetRoute _fromState(GoRouterState state) =>
      QrCodeChangePeriodSheetRoute($extra: state.extra as QrCodeEntity);

  QrCodeChangePeriodSheetRoute get _self =>
      this as QrCodeChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/qr-code-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $qrCodeDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/qr-code-delete-confirm',
  factory: $QrCodeDeleteConfirmSheetRoute._fromState,
);

mixin $QrCodeDeleteConfirmSheetRoute on GoRouteData {
  static QrCodeDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const QrCodeDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/qr-code-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $remoteListRoute => GoRouteData.$route(
  path: '/lock/:lockId/remotes',
  factory: $RemoteListRoute._fromState,
);

mixin $RemoteListRoute on GoRouteData {
  static RemoteListRoute _fromState(GoRouterState state) => RemoteListRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  RemoteListRoute get _self => this as RemoteListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/remotes',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $remoteAddRoute => GoRouteData.$route(
  path: '/lock/remote-add',
  factory: $RemoteAddRoute._fromState,
);

mixin $RemoteAddRoute on GoRouteData {
  static RemoteAddRoute _fromState(GoRouterState state) =>
      RemoteAddRoute($extra: state.extra as LockEntity);

  RemoteAddRoute get _self => this as RemoteAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/remote-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $remoteDetailRoute => GoRouteData.$route(
  path: '/lock/remote-detail',
  factory: $RemoteDetailRoute._fromState,
);

mixin $RemoteDetailRoute on GoRouteData {
  static RemoteDetailRoute _fromState(GoRouterState state) =>
      RemoteDetailRoute($extra: state.extra as RemoteDetailArgs);

  RemoteDetailRoute get _self => this as RemoteDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/remote-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $remoteChangePeriodSheetRoute => GoRouteData.$route(
  path: '/lock/remote-change-period',
  factory: $RemoteChangePeriodSheetRoute._fromState,
);

mixin $RemoteChangePeriodSheetRoute on GoRouteData {
  static RemoteChangePeriodSheetRoute _fromState(GoRouterState state) =>
      RemoteChangePeriodSheetRoute($extra: state.extra as RemoteEntity);

  RemoteChangePeriodSheetRoute get _self =>
      this as RemoteChangePeriodSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/remote-change-period');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $remoteDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/lock/remote-delete-confirm',
  factory: $RemoteDeleteConfirmSheetRoute._fromState,
);

mixin $RemoteDeleteConfirmSheetRoute on GoRouteData {
  static RemoteDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      const RemoteDeleteConfirmSheetRoute();

  @override
  String get location => GoRouteData.$location('/lock/remote-delete-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $recurringScheduleSheetRoute => GoRouteData.$route(
  path: '/lock/recurring-schedule-sheet',
  factory: $RecurringScheduleSheetRoute._fromState,
);

mixin $RecurringScheduleSheetRoute on GoRouteData {
  static RecurringScheduleSheetRoute _fromState(GoRouterState state) =>
      RecurringScheduleSheetRoute($extra: state.extra as CyclicSchedule?);

  RecurringScheduleSheetRoute get _self => this as RecurringScheduleSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/lock/recurring-schedule-sheet');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $doorSensorAddRoute => GoRouteData.$route(
  path: '/lock/door-sensor-add',
  factory: $DoorSensorAddRoute._fromState,
);

mixin $DoorSensorAddRoute on GoRouteData {
  static DoorSensorAddRoute _fromState(GoRouterState state) =>
      DoorSensorAddRoute($extra: state.extra as LockEntity);

  DoorSensorAddRoute get _self => this as DoorSensorAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/door-sensor-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $doorSensorDetailRoute => GoRouteData.$route(
  path: '/lock/door-sensor-detail',
  factory: $DoorSensorDetailRoute._fromState,
);

mixin $DoorSensorDetailRoute on GoRouteData {
  static DoorSensorDetailRoute _fromState(GoRouterState state) =>
      DoorSensorDetailRoute($extra: state.extra as DoorSensorDetailArgs);

  DoorSensorDetailRoute get _self => this as DoorSensorDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/door-sensor-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $doorSensorRecordsRoute => GoRouteData.$route(
  path: '/lock/door-sensor-records/:lockId',
  factory: $DoorSensorRecordsRoute._fromState,
);

mixin $DoorSensorRecordsRoute on GoRouteData {
  static DoorSensorRecordsRoute _fromState(GoRouterState state) =>
      DoorSensorRecordsRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
      );

  DoorSensorRecordsRoute get _self => this as DoorSensorRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/door-sensor-records/${Uri.encodeComponent(_self.lockId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $standaloneDoorSensorAddRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/add',
  factory: $StandaloneDoorSensorAddRoute._fromState,
);

mixin $StandaloneDoorSensorAddRoute on GoRouteData {
  static StandaloneDoorSensorAddRoute _fromState(GoRouterState state) =>
      const StandaloneDoorSensorAddRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $standaloneDoorSensorListRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors',
  factory: $StandaloneDoorSensorListRoute._fromState,
);

mixin $StandaloneDoorSensorListRoute on GoRouteData {
  static StandaloneDoorSensorListRoute _fromState(GoRouterState state) =>
      const StandaloneDoorSensorListRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $standaloneDoorSensorDetailRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/detail',
  factory: $StandaloneDoorSensorDetailRoute._fromState,
);

mixin $StandaloneDoorSensorDetailRoute on GoRouteData {
  static StandaloneDoorSensorDetailRoute _fromState(GoRouterState state) =>
      StandaloneDoorSensorDetailRoute(
        $extra: state.extra as StandaloneDoorSensorDetailArgs,
      );

  StandaloneDoorSensorDetailRoute get _self =>
      this as StandaloneDoorSensorDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorRenameSheetRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/rename',
  factory: $StandaloneDoorSensorRenameSheetRoute._fromState,
);

mixin $StandaloneDoorSensorRenameSheetRoute on GoRouteData {
  static StandaloneDoorSensorRenameSheetRoute _fromState(GoRouterState state) =>
      StandaloneDoorSensorRenameSheetRoute(
        $extra: state.extra as StandaloneDoorSensorEntity,
      );

  StandaloneDoorSensorRenameSheetRoute get _self =>
      this as StandaloneDoorSensorRenameSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorDeleteConfirmSheetRoute =>
    GoRouteData.$route(
      path: '/devices/standalone-door-sensors/delete-confirm',
      factory: $StandaloneDoorSensorDeleteConfirmSheetRoute._fromState,
    );

mixin $StandaloneDoorSensorDeleteConfirmSheetRoute on GoRouteData {
  static StandaloneDoorSensorDeleteConfirmSheetRoute _fromState(
    GoRouterState state,
  ) => StandaloneDoorSensorDeleteConfirmSheetRoute(
    $extra: state.extra as StandaloneDoorSensorEntity,
  );

  StandaloneDoorSensorDeleteConfirmSheetRoute get _self =>
      this as StandaloneDoorSensorDeleteConfirmSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/delete-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorAlertConfigSheetRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/alert-config',
  factory: $StandaloneDoorSensorAlertConfigSheetRoute._fromState,
);

mixin $StandaloneDoorSensorAlertConfigSheetRoute on GoRouteData {
  static StandaloneDoorSensorAlertConfigSheetRoute _fromState(
    GoRouterState state,
  ) => StandaloneDoorSensorAlertConfigSheetRoute(
    $extra: state.extra as StandaloneDoorSensorEntity,
  );

  StandaloneDoorSensorAlertConfigSheetRoute get _self =>
      this as StandaloneDoorSensorAlertConfigSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/alert-config');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorWifiConfigSheetRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/wifi-config',
  factory: $StandaloneDoorSensorWifiConfigSheetRoute._fromState,
);

mixin $StandaloneDoorSensorWifiConfigSheetRoute on GoRouteData {
  static StandaloneDoorSensorWifiConfigSheetRoute _fromState(
    GoRouterState state,
  ) => StandaloneDoorSensorWifiConfigSheetRoute(
    $extra: state.extra as StandaloneDoorSensorEntity,
  );

  StandaloneDoorSensorWifiConfigSheetRoute get _self =>
      this as StandaloneDoorSensorWifiConfigSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/wifi-config');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorUserSheetRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/users',
  factory: $StandaloneDoorSensorUserSheetRoute._fromState,
);

mixin $StandaloneDoorSensorUserSheetRoute on GoRouteData {
  static StandaloneDoorSensorUserSheetRoute _fromState(GoRouterState state) =>
      StandaloneDoorSensorUserSheetRoute(
        $extra: state.extra as StandaloneDoorSensorEntity,
      );

  StandaloneDoorSensorUserSheetRoute get _self =>
      this as StandaloneDoorSensorUserSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/standalone-door-sensors/users');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $standaloneDoorSensorRecordsRoute => GoRouteData.$route(
  path: '/devices/standalone-door-sensors/records/:doorSensorId',
  factory: $StandaloneDoorSensorRecordsRoute._fromState,
);

mixin $StandaloneDoorSensorRecordsRoute on GoRouteData {
  static StandaloneDoorSensorRecordsRoute _fromState(GoRouterState state) =>
      StandaloneDoorSensorRecordsRoute(
        doorSensorId: int.parse(state.pathParameters['doorSensorId']!),
      );

  StandaloneDoorSensorRecordsRoute get _self =>
      this as StandaloneDoorSensorRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/standalone-door-sensors/records/${Uri.encodeComponent(_self.doorSensorId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $wirelessKeypadListRoute => GoRouteData.$route(
  path: '/lock/:lockId/keypads',
  factory: $WirelessKeypadListRoute._fromState,
);

mixin $WirelessKeypadListRoute on GoRouteData {
  static WirelessKeypadListRoute _fromState(GoRouterState state) =>
      WirelessKeypadListRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        $extra: state.extra as LockEntity?,
      );

  WirelessKeypadListRoute get _self => this as WirelessKeypadListRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}/keypads',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $wirelessKeypadAddTypeRoute => GoRouteData.$route(
  path: '/lock/keypad-add-type',
  factory: $WirelessKeypadAddTypeRoute._fromState,
);

mixin $WirelessKeypadAddTypeRoute on GoRouteData {
  static WirelessKeypadAddTypeRoute _fromState(GoRouterState state) =>
      WirelessKeypadAddTypeRoute($extra: state.extra as LockEntity);

  WirelessKeypadAddTypeRoute get _self => this as WirelessKeypadAddTypeRoute;

  @override
  String get location => GoRouteData.$location('/lock/keypad-add-type');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $wirelessKeypadAddRoute => GoRouteData.$route(
  path: '/lock/keypad-add',
  factory: $WirelessKeypadAddRoute._fromState,
);

mixin $WirelessKeypadAddRoute on GoRouteData {
  static WirelessKeypadAddRoute _fromState(GoRouterState state) =>
      WirelessKeypadAddRoute($extra: state.extra as WirelessKeypadAddArgs);

  WirelessKeypadAddRoute get _self => this as WirelessKeypadAddRoute;

  @override
  String get location => GoRouteData.$location('/lock/keypad-add');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $wirelessKeypadDetailRoute => GoRouteData.$route(
  path: '/lock/keypad-detail',
  factory: $WirelessKeypadDetailRoute._fromState,
);

mixin $WirelessKeypadDetailRoute on GoRouteData {
  static WirelessKeypadDetailRoute _fromState(GoRouterState state) =>
      WirelessKeypadDetailRoute(
        $extra: state.extra as WirelessKeypadDetailArgs,
      );

  WirelessKeypadDetailRoute get _self => this as WirelessKeypadDetailRoute;

  @override
  String get location => GoRouteData.$location('/lock/keypad-detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $keypadRenameSheetRoute => GoRouteData.$route(
  path: '/lock/keypad-rename',
  factory: $KeypadRenameSheetRoute._fromState,
);

mixin $KeypadRenameSheetRoute on GoRouteData {
  static KeypadRenameSheetRoute _fromState(GoRouterState state) =>
      KeypadRenameSheetRoute($extra: state.extra as KeypadRenameArgs);

  KeypadRenameSheetRoute get _self => this as KeypadRenameSheetRoute;

  @override
  String get location => GoRouteData.$location('/lock/keypad-rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $keypadUnbindConfirmRoute => GoRouteData.$route(
  path: '/lock/keypad-unbind-confirm',
  factory: $KeypadUnbindConfirmRoute._fromState,
);

mixin $KeypadUnbindConfirmRoute on GoRouteData {
  static KeypadUnbindConfirmRoute _fromState(GoRouterState state) =>
      KeypadUnbindConfirmRoute($extra: state.extra as KeypadUnbindArgs);

  KeypadUnbindConfirmRoute get _self => this as KeypadUnbindConfirmRoute;

  @override
  String get location => GoRouteData.$location('/lock/keypad-unbind-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $gatewayListRoute => GoRouteData.$route(
  path: '/devices/gateways',
  factory: $GatewayListRoute._fromState,
);

mixin $GatewayListRoute on GoRouteData {
  static GatewayListRoute _fromState(GoRouterState state) =>
      const GatewayListRoute();

  @override
  String get location => GoRouteData.$location('/devices/gateways');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $gatewayAddRoute => GoRouteData.$route(
  path: '/devices/gateways/add',
  factory: $GatewayAddRoute._fromState,
);

mixin $GatewayAddRoute on GoRouteData {
  static GatewayAddRoute _fromState(GoRouterState state) =>
      const GatewayAddRoute();

  @override
  String get location => GoRouteData.$location('/devices/gateways/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $gatewayDetailRoute => GoRouteData.$route(
  path: '/devices/gateways/detail',
  factory: $GatewayDetailRoute._fromState,
);

mixin $GatewayDetailRoute on GoRouteData {
  static GatewayDetailRoute _fromState(GoRouterState state) =>
      GatewayDetailRoute($extra: state.extra as GatewayEntity);

  GatewayDetailRoute get _self => this as GatewayDetailRoute;

  @override
  String get location => GoRouteData.$location('/devices/gateways/detail');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $gatewayRenameSheetRoute => GoRouteData.$route(
  path: '/devices/gateways/rename',
  factory: $GatewayRenameSheetRoute._fromState,
);

mixin $GatewayRenameSheetRoute on GoRouteData {
  static GatewayRenameSheetRoute _fromState(GoRouterState state) =>
      GatewayRenameSheetRoute($extra: state.extra as GatewayEntity);

  GatewayRenameSheetRoute get _self => this as GatewayRenameSheetRoute;

  @override
  String get location => GoRouteData.$location('/devices/gateways/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $gatewayDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/devices/gateways/delete-confirm',
  factory: $GatewayDeleteConfirmSheetRoute._fromState,
);

mixin $GatewayDeleteConfirmSheetRoute on GoRouteData {
  static GatewayDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      GatewayDeleteConfirmSheetRoute($extra: state.extra as GatewayEntity);

  GatewayDeleteConfirmSheetRoute get _self =>
      this as GatewayDeleteConfirmSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/gateways/delete-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterListRoute => GoRouteData.$route(
  path: '/devices/water-meters',
  factory: $WaterMeterListRoute._fromState,
);

mixin $WaterMeterListRoute on GoRouteData {
  static WaterMeterListRoute _fromState(GoRouterState state) =>
      const WaterMeterListRoute();

  @override
  String get location => GoRouteData.$location('/devices/water-meters');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterAddRoute => GoRouteData.$route(
  path: '/devices/water-meters/add',
  factory: $WaterMeterAddRoute._fromState,
);

mixin $WaterMeterAddRoute on GoRouteData {
  static WaterMeterAddRoute _fromState(GoRouterState state) =>
      const WaterMeterAddRoute();

  @override
  String get location => GoRouteData.$location('/devices/water-meters/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterDetailRoute => GoRouteData.$route(
  path: '/devices/water-meters/detail/:meterId',
  factory: $WaterMeterDetailRoute._fromState,
);

mixin $WaterMeterDetailRoute on GoRouteData {
  static WaterMeterDetailRoute _fromState(GoRouterState state) =>
      WaterMeterDetailRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  WaterMeterDetailRoute get _self => this as WaterMeterDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/water-meters/detail/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterRechargeSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/recharge',
  factory: $WaterMeterRechargeSheetRoute._fromState,
);

mixin $WaterMeterRechargeSheetRoute on GoRouteData {
  static WaterMeterRechargeSheetRoute _fromState(GoRouterState state) =>
      WaterMeterRechargeSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterRechargeSheetRoute get _self =>
      this as WaterMeterRechargeSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/recharge');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterRenameSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/rename',
  factory: $WaterMeterRenameSheetRoute._fromState,
);

mixin $WaterMeterRenameSheetRoute on GoRouteData {
  static WaterMeterRenameSheetRoute _fromState(GoRouterState state) =>
      WaterMeterRenameSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterRenameSheetRoute get _self => this as WaterMeterRenameSheetRoute;

  @override
  String get location => GoRouteData.$location('/devices/water-meters/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/delete-confirm',
  factory: $WaterMeterDeleteConfirmSheetRoute._fromState,
);

mixin $WaterMeterDeleteConfirmSheetRoute on GoRouteData {
  static WaterMeterDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      WaterMeterDeleteConfirmSheetRoute(
        $extra: state.extra as WaterMeterEntity,
      );

  WaterMeterDeleteConfirmSheetRoute get _self =>
      this as WaterMeterDeleteConfirmSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/delete-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterOperationRecordsRoute => GoRouteData.$route(
  path: '/devices/water-meters/operation-records/:meterId',
  factory: $WaterMeterOperationRecordsRoute._fromState,
);

mixin $WaterMeterOperationRecordsRoute on GoRouteData {
  static WaterMeterOperationRecordsRoute _fromState(GoRouterState state) =>
      WaterMeterOperationRecordsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  WaterMeterOperationRecordsRoute get _self =>
      this as WaterMeterOperationRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/water-meters/operation-records/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterUsageRecordsRoute => GoRouteData.$route(
  path: '/devices/water-meters/usage-records/:meterId',
  factory: $WaterMeterUsageRecordsRoute._fromState,
);

mixin $WaterMeterUsageRecordsRoute on GoRouteData {
  static WaterMeterUsageRecordsRoute _fromState(GoRouterState state) =>
      WaterMeterUsageRecordsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  WaterMeterUsageRecordsRoute get _self => this as WaterMeterUsageRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/water-meters/usage-records/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterPriceSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/price',
  factory: $WaterMeterPriceSheetRoute._fromState,
);

mixin $WaterMeterPriceSheetRoute on GoRouteData {
  static WaterMeterPriceSheetRoute _fromState(GoRouterState state) =>
      WaterMeterPriceSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterPriceSheetRoute get _self => this as WaterMeterPriceSheetRoute;

  @override
  String get location => GoRouteData.$location('/devices/water-meters/price');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterPayModeSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/pay-mode',
  factory: $WaterMeterPayModeSheetRoute._fromState,
);

mixin $WaterMeterPayModeSheetRoute on GoRouteData {
  static WaterMeterPayModeSheetRoute _fromState(GoRouterState state) =>
      WaterMeterPayModeSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterPayModeSheetRoute get _self => this as WaterMeterPayModeSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/pay-mode');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterTotalUsageSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/total-usage',
  factory: $WaterMeterTotalUsageSheetRoute._fromState,
);

mixin $WaterMeterTotalUsageSheetRoute on GoRouteData {
  static WaterMeterTotalUsageSheetRoute _fromState(GoRouterState state) =>
      WaterMeterTotalUsageSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterTotalUsageSheetRoute get _self =>
      this as WaterMeterTotalUsageSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/total-usage');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterClearConfirmDialogRoute => GoRouteData.$route(
  path: '/devices/water-meters/clear-confirm',
  factory: $WaterMeterClearConfirmDialogRoute._fromState,
);

mixin $WaterMeterClearConfirmDialogRoute on GoRouteData {
  static WaterMeterClearConfirmDialogRoute _fromState(GoRouterState state) =>
      const WaterMeterClearConfirmDialogRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/clear-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterRemainderSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/remainder',
  factory: $WaterMeterRemainderSheetRoute._fromState,
);

mixin $WaterMeterRemainderSheetRoute on GoRouteData {
  static WaterMeterRemainderSheetRoute _fromState(GoRouterState state) =>
      WaterMeterRemainderSheetRoute($extra: state.extra as WaterMeterEntity);

  WaterMeterRemainderSheetRoute get _self =>
      this as WaterMeterRemainderSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/remainder');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $waterMeterResetConfirmDialogRoute => GoRouteData.$route(
  path: '/devices/water-meters/reset-confirm',
  factory: $WaterMeterResetConfirmDialogRoute._fromState,
);

mixin $WaterMeterResetConfirmDialogRoute on GoRouteData {
  static WaterMeterResetConfirmDialogRoute _fromState(GoRouterState state) =>
      const WaterMeterResetConfirmDialogRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/reset-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterSettingsRoute => GoRouteData.$route(
  path: '/devices/water-meters/settings/:meterId',
  factory: $WaterMeterSettingsRoute._fromState,
);

mixin $WaterMeterSettingsRoute on GoRouteData {
  static WaterMeterSettingsRoute _fromState(GoRouterState state) =>
      WaterMeterSettingsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  WaterMeterSettingsRoute get _self => this as WaterMeterSettingsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/water-meters/settings/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterCatOneRoute => GoRouteData.$route(
  path: '/devices/water-meters/cat-one/:meterId',
  factory: $WaterMeterCatOneRoute._fromState,
);

mixin $WaterMeterCatOneRoute on GoRouteData {
  static WaterMeterCatOneRoute _fromState(GoRouterState state) =>
      WaterMeterCatOneRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  WaterMeterCatOneRoute get _self => this as WaterMeterCatOneRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/water-meters/cat-one/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterMeterCatOneApnSheetRoute => GoRouteData.$route(
  path: '/devices/water-meters/cat-one-config',
  factory: $WaterMeterCatOneApnSheetRoute._fromState,
);

mixin $WaterMeterCatOneApnSheetRoute on GoRouteData {
  static WaterMeterCatOneApnSheetRoute _fromState(GoRouterState state) =>
      const WaterMeterCatOneApnSheetRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/water-meters/cat-one-config');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterListRoute => GoRouteData.$route(
  path: '/devices/electric-meters',
  factory: $ElectricMeterListRoute._fromState,
);

mixin $ElectricMeterListRoute on GoRouteData {
  static ElectricMeterListRoute _fromState(GoRouterState state) =>
      const ElectricMeterListRoute();

  @override
  String get location => GoRouteData.$location('/devices/electric-meters');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterAddRoute => GoRouteData.$route(
  path: '/devices/electric-meters/add',
  factory: $ElectricMeterAddRoute._fromState,
);

mixin $ElectricMeterAddRoute on GoRouteData {
  static ElectricMeterAddRoute _fromState(GoRouterState state) =>
      const ElectricMeterAddRoute();

  @override
  String get location => GoRouteData.$location('/devices/electric-meters/add');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterDetailRoute => GoRouteData.$route(
  path: '/devices/electric-meters/detail/:meterId',
  factory: $ElectricMeterDetailRoute._fromState,
);

mixin $ElectricMeterDetailRoute on GoRouteData {
  static ElectricMeterDetailRoute _fromState(GoRouterState state) =>
      ElectricMeterDetailRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  ElectricMeterDetailRoute get _self => this as ElectricMeterDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/electric-meters/detail/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterRechargeSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/recharge',
  factory: $ElectricMeterRechargeSheetRoute._fromState,
);

mixin $ElectricMeterRechargeSheetRoute on GoRouteData {
  static ElectricMeterRechargeSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterRechargeSheetRoute(
        $extra: state.extra as ElectricMeterEntity,
      );

  ElectricMeterRechargeSheetRoute get _self =>
      this as ElectricMeterRechargeSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/recharge');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterRenameSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/rename',
  factory: $ElectricMeterRenameSheetRoute._fromState,
);

mixin $ElectricMeterRenameSheetRoute on GoRouteData {
  static ElectricMeterRenameSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterRenameSheetRoute($extra: state.extra as ElectricMeterEntity);

  ElectricMeterRenameSheetRoute get _self =>
      this as ElectricMeterRenameSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/rename');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterMaxPowerSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/max-power',
  factory: $ElectricMeterMaxPowerSheetRoute._fromState,
);

mixin $ElectricMeterMaxPowerSheetRoute on GoRouteData {
  static ElectricMeterMaxPowerSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterMaxPowerSheetRoute(
        $extra: state.extra as ElectricMeterEntity,
      );

  ElectricMeterMaxPowerSheetRoute get _self =>
      this as ElectricMeterMaxPowerSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/max-power');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterDeleteConfirmSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/delete-confirm',
  factory: $ElectricMeterDeleteConfirmSheetRoute._fromState,
);

mixin $ElectricMeterDeleteConfirmSheetRoute on GoRouteData {
  static ElectricMeterDeleteConfirmSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterDeleteConfirmSheetRoute(
        $extra: state.extra as ElectricMeterEntity,
      );

  ElectricMeterDeleteConfirmSheetRoute get _self =>
      this as ElectricMeterDeleteConfirmSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/delete-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterOperationRecordsRoute => GoRouteData.$route(
  path: '/devices/electric-meters/operation-records/:meterId',
  factory: $ElectricMeterOperationRecordsRoute._fromState,
);

mixin $ElectricMeterOperationRecordsRoute on GoRouteData {
  static ElectricMeterOperationRecordsRoute _fromState(GoRouterState state) =>
      ElectricMeterOperationRecordsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  ElectricMeterOperationRecordsRoute get _self =>
      this as ElectricMeterOperationRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/electric-meters/operation-records/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterUsageRecordsRoute => GoRouteData.$route(
  path: '/devices/electric-meters/usage-records/:meterId',
  factory: $ElectricMeterUsageRecordsRoute._fromState,
);

mixin $ElectricMeterUsageRecordsRoute on GoRouteData {
  static ElectricMeterUsageRecordsRoute _fromState(GoRouterState state) =>
      ElectricMeterUsageRecordsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  ElectricMeterUsageRecordsRoute get _self =>
      this as ElectricMeterUsageRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/electric-meters/usage-records/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterPriceSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/price',
  factory: $ElectricMeterPriceSheetRoute._fromState,
);

mixin $ElectricMeterPriceSheetRoute on GoRouteData {
  static ElectricMeterPriceSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterPriceSheetRoute($extra: state.extra as ElectricMeterEntity);

  ElectricMeterPriceSheetRoute get _self =>
      this as ElectricMeterPriceSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/price');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterPayModeSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/pay-mode',
  factory: $ElectricMeterPayModeSheetRoute._fromState,
);

mixin $ElectricMeterPayModeSheetRoute on GoRouteData {
  static ElectricMeterPayModeSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterPayModeSheetRoute(
        $extra: state.extra as ElectricMeterEntity,
      );

  ElectricMeterPayModeSheetRoute get _self =>
      this as ElectricMeterPayModeSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/pay-mode');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterClearConfirmDialogRoute => GoRouteData.$route(
  path: '/devices/electric-meters/clear-confirm',
  factory: $ElectricMeterClearConfirmDialogRoute._fromState,
);

mixin $ElectricMeterClearConfirmDialogRoute on GoRouteData {
  static ElectricMeterClearConfirmDialogRoute _fromState(GoRouterState state) =>
      const ElectricMeterClearConfirmDialogRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/clear-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterRemainderSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/remainder',
  factory: $ElectricMeterRemainderSheetRoute._fromState,
);

mixin $ElectricMeterRemainderSheetRoute on GoRouteData {
  static ElectricMeterRemainderSheetRoute _fromState(GoRouterState state) =>
      ElectricMeterRemainderSheetRoute(
        $extra: state.extra as ElectricMeterEntity,
      );

  ElectricMeterRemainderSheetRoute get _self =>
      this as ElectricMeterRemainderSheetRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/remainder');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $electricMeterResetConfirmDialogRoute => GoRouteData.$route(
  path: '/devices/electric-meters/reset-confirm',
  factory: $ElectricMeterResetConfirmDialogRoute._fromState,
);

mixin $ElectricMeterResetConfirmDialogRoute on GoRouteData {
  static ElectricMeterResetConfirmDialogRoute _fromState(GoRouterState state) =>
      const ElectricMeterResetConfirmDialogRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/reset-confirm');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterSettingsRoute => GoRouteData.$route(
  path: '/devices/electric-meters/settings/:meterId',
  factory: $ElectricMeterSettingsRoute._fromState,
);

mixin $ElectricMeterSettingsRoute on GoRouteData {
  static ElectricMeterSettingsRoute _fromState(GoRouterState state) =>
      ElectricMeterSettingsRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  ElectricMeterSettingsRoute get _self => this as ElectricMeterSettingsRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/electric-meters/settings/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterCatOneRoute => GoRouteData.$route(
  path: '/devices/electric-meters/cat-one/:meterId',
  factory: $ElectricMeterCatOneRoute._fromState,
);

mixin $ElectricMeterCatOneRoute on GoRouteData {
  static ElectricMeterCatOneRoute _fromState(GoRouterState state) =>
      ElectricMeterCatOneRoute(
        meterId: int.parse(state.pathParameters['meterId']!),
      );

  ElectricMeterCatOneRoute get _self => this as ElectricMeterCatOneRoute;

  @override
  String get location => GoRouteData.$location(
    '/devices/electric-meters/cat-one/${Uri.encodeComponent(_self.meterId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $electricMeterCatOneApnSheetRoute => GoRouteData.$route(
  path: '/devices/electric-meters/cat-one-config',
  factory: $ElectricMeterCatOneApnSheetRoute._fromState,
);

mixin $ElectricMeterCatOneApnSheetRoute on GoRouteData {
  static ElectricMeterCatOneApnSheetRoute _fromState(GoRouterState state) =>
      const ElectricMeterCatOneApnSheetRoute();

  @override
  String get location =>
      GoRouteData.$location('/devices/electric-meters/cat-one-config');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $meterConnectionConfirmRoute => GoRouteData.$route(
  path: '/devices/meters/connection-confirm',
  factory: $MeterConnectionConfirmRoute._fromState,
);

mixin $MeterConnectionConfirmRoute on GoRouteData {
  static MeterConnectionConfirmRoute _fromState(GoRouterState state) =>
      MeterConnectionConfirmRoute(
        $extra: state.extra as MeterConnectionConfirmArgs,
      );

  MeterConnectionConfirmRoute get _self => this as MeterConnectionConfirmRoute;

  @override
  String get location =>
      GoRouteData.$location('/devices/meters/connection-confirm');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $lockDetailRoute => GoRouteData.$route(
  path: '/lock/:lockId',
  factory: $LockDetailRoute._fromState,
);

mixin $LockDetailRoute on GoRouteData {
  static LockDetailRoute _fromState(GoRouterState state) => LockDetailRoute(
    lockId: int.parse(state.pathParameters['lockId']!),
    $extra: state.extra as LockEntity?,
  );

  LockDetailRoute get _self => this as LockDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/lock/${Uri.encodeComponent(_self.lockId.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $hotelLocksRoute => GoRouteData.$route(
  path: '/hotel/locks',
  factory: $HotelLocksRoute._fromState,
);

mixin $HotelLocksRoute on GoRouteData {
  static HotelLocksRoute _fromState(GoRouterState state) =>
      const HotelLocksRoute();

  @override
  String get location => GoRouteData.$location('/hotel/locks');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $hotelLockDetailRoute => GoRouteData.$route(
  path: '/hotel/locks/detail/:lockId',
  factory: $HotelLockDetailRoute._fromState,
);

mixin $HotelLockDetailRoute on GoRouteData {
  static HotelLockDetailRoute _fromState(GoRouterState state) =>
      HotelLockDetailRoute(
        lockId: int.parse(state.pathParameters['lockId']!),
        hotelType:
            _$convertMapValue(
              'hotel-type',
              state.uri.queryParameters,
              int.parse,
            ) ??
            1,
        $extra: state.extra as HotelLockEntity?,
      );

  HotelLockDetailRoute get _self => this as HotelLockDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/hotel/locks/detail/${Uri.encodeComponent(_self.lockId.toString())}',
    queryParams: {
      if (_self.hotelType != 1) 'hotel-type': _self.hotelType.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $hotelSectorRoute => GoRouteData.$route(
  path: '/hotel/locks/sector',
  factory: $HotelSectorRoute._fromState,
);

mixin $HotelSectorRoute on GoRouteData {
  static HotelSectorRoute _fromState(GoRouterState state) =>
      HotelSectorRoute($extra: state.extra as HotelLockEntity);

  HotelSectorRoute get _self => this as HotelSectorRoute;

  @override
  String get location => GoRouteData.$location('/hotel/locks/sector');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $hotelBuildingRoute => GoRouteData.$route(
  path: '/hotel/locks/building',
  factory: $HotelBuildingRoute._fromState,
);

mixin $HotelBuildingRoute on GoRouteData {
  static HotelBuildingRoute _fromState(GoRouterState state) =>
      HotelBuildingRoute($extra: state.extra as HotelLockEntity);

  HotelBuildingRoute get _self => this as HotelBuildingRoute;

  @override
  String get location => GoRouteData.$location('/hotel/locks/building');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
