// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRoute,
      $lockRoute,
      $gatewayRoute,
      $doorSensorInfoRoute,
      $remoteKeyInfoRoute,
      $keypadInfoRoute,
      $waterMeterRoute,
      $electricMeterRoute,
    ];

RouteBase get $mainShellRoute => StatefulShellRouteData.$route(
      factory: $MainShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: _$DashboardRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/scan',
              factory: _$ScanRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: _$SettingsRoute._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin _$DashboardRoute on GoRouteData {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
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

mixin _$ScanRoute on GoRouteData {
  static ScanRoute _fromState(GoRouterState state) => ScanRoute(
        type: state.uri.queryParameters['type'],
        lockData: state.uri.queryParameters['lock-data'],
        lockMac: state.uri.queryParameters['lock-mac'],
      );

  ScanRoute get _self => this as ScanRoute;

  @override
  String get location => GoRouteData.$location(
        '/scan',
        queryParams: {
          if (_self.type != null) 'type': _self.type,
          if (_self.lockData != null) 'lock-data': _self.lockData,
          if (_self.lockMac != null) 'lock-mac': _self.lockMac,
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

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location(
        '/settings',
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

RouteBase get $lockRoute => GoRouteData.$route(
      path: '/lock/:mac',
      factory: _$LockRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'passcodes',
          factory: _$PasscodeListRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'passcodes/add',
          factory: _$PasscodeAddRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'cards',
          factory: _$CardListRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'cards/add',
          factory: _$CardAddRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'fingerprints',
          factory: _$FingerprintListRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'fingerprints/add',
          factory: _$FingerprintAddRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'faces',
          factory: _$FaceManageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'faces/add',
          factory: _$FaceAddRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: _$LockSettingsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'basic-info',
              factory: _$LockBasicInfoRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'network',
              factory: _$LockNetworkSettingsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'passage-mode',
              factory: _$LockPassageModeRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'advanced',
              factory: _$LockAdvancedSettingsRoute._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'door-sensors',
          factory: _$DoorSensorListRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'remote-keys',
          factory: _$RemoteKeyListRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'keypads',
          factory: _$KeypadListRoute._fromState,
        ),
      ],
    );

mixin _$LockRoute on GoRouteData {
  static LockRoute _fromState(GoRouterState state) => LockRoute(
        state.pathParameters['mac']!,
      );

  LockRoute get _self => this as LockRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}',
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

mixin _$PasscodeListRoute on GoRouteData {
  static PasscodeListRoute _fromState(GoRouterState state) => PasscodeListRoute(
        state.pathParameters['mac']!,
      );

  PasscodeListRoute get _self => this as PasscodeListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/passcodes',
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

mixin _$PasscodeAddRoute on GoRouteData {
  static PasscodeAddRoute _fromState(GoRouterState state) => PasscodeAddRoute(
        state.pathParameters['mac']!,
      );

  PasscodeAddRoute get _self => this as PasscodeAddRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/passcodes/add',
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

mixin _$CardListRoute on GoRouteData {
  static CardListRoute _fromState(GoRouterState state) => CardListRoute(
        state.pathParameters['mac']!,
      );

  CardListRoute get _self => this as CardListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/cards',
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

mixin _$CardAddRoute on GoRouteData {
  static CardAddRoute _fromState(GoRouterState state) => CardAddRoute(
        state.pathParameters['mac']!,
      );

  CardAddRoute get _self => this as CardAddRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/cards/add',
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

mixin _$FingerprintListRoute on GoRouteData {
  static FingerprintListRoute _fromState(GoRouterState state) =>
      FingerprintListRoute(
        state.pathParameters['mac']!,
      );

  FingerprintListRoute get _self => this as FingerprintListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/fingerprints',
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

mixin _$FingerprintAddRoute on GoRouteData {
  static FingerprintAddRoute _fromState(GoRouterState state) =>
      FingerprintAddRoute(
        state.pathParameters['mac']!,
      );

  FingerprintAddRoute get _self => this as FingerprintAddRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/fingerprints/add',
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

mixin _$FaceManageRoute on GoRouteData {
  static FaceManageRoute _fromState(GoRouterState state) => FaceManageRoute(
        state.pathParameters['mac']!,
      );

  FaceManageRoute get _self => this as FaceManageRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/faces',
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

mixin _$FaceAddRoute on GoRouteData {
  static FaceAddRoute _fromState(GoRouterState state) => FaceAddRoute(
        state.pathParameters['mac']!,
      );

  FaceAddRoute get _self => this as FaceAddRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/faces/add',
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

mixin _$LockSettingsRoute on GoRouteData {
  static LockSettingsRoute _fromState(GoRouterState state) => LockSettingsRoute(
        state.pathParameters['mac']!,
      );

  LockSettingsRoute get _self => this as LockSettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/settings',
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

mixin _$LockBasicInfoRoute on GoRouteData {
  static LockBasicInfoRoute _fromState(GoRouterState state) =>
      LockBasicInfoRoute(
        state.pathParameters['mac']!,
      );

  LockBasicInfoRoute get _self => this as LockBasicInfoRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/settings/basic-info',
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

mixin _$LockNetworkSettingsRoute on GoRouteData {
  static LockNetworkSettingsRoute _fromState(GoRouterState state) =>
      LockNetworkSettingsRoute(
        state.pathParameters['mac']!,
      );

  LockNetworkSettingsRoute get _self => this as LockNetworkSettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/settings/network',
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

mixin _$LockPassageModeRoute on GoRouteData {
  static LockPassageModeRoute _fromState(GoRouterState state) =>
      LockPassageModeRoute(
        state.pathParameters['mac']!,
      );

  LockPassageModeRoute get _self => this as LockPassageModeRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/settings/passage-mode',
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

mixin _$LockAdvancedSettingsRoute on GoRouteData {
  static LockAdvancedSettingsRoute _fromState(GoRouterState state) =>
      LockAdvancedSettingsRoute(
        state.pathParameters['mac']!,
      );

  LockAdvancedSettingsRoute get _self => this as LockAdvancedSettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/settings/advanced',
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

mixin _$DoorSensorListRoute on GoRouteData {
  static DoorSensorListRoute _fromState(GoRouterState state) =>
      DoorSensorListRoute(
        state.pathParameters['mac']!,
      );

  DoorSensorListRoute get _self => this as DoorSensorListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/door-sensors',
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

mixin _$RemoteKeyListRoute on GoRouteData {
  static RemoteKeyListRoute _fromState(GoRouterState state) =>
      RemoteKeyListRoute(
        state.pathParameters['mac']!,
      );

  RemoteKeyListRoute get _self => this as RemoteKeyListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/remote-keys',
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

mixin _$KeypadListRoute on GoRouteData {
  static KeypadListRoute _fromState(GoRouterState state) => KeypadListRoute(
        state.pathParameters['mac']!,
      );

  KeypadListRoute get _self => this as KeypadListRoute;

  @override
  String get location => GoRouteData.$location(
        '/lock/${Uri.encodeComponent(_self.mac)}/keypads',
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

RouteBase get $gatewayRoute => GoRouteData.$route(
      path: '/gateway/:mac',
      factory: _$GatewayRoute._fromState,
    );

mixin _$GatewayRoute on GoRouteData {
  static GatewayRoute _fromState(GoRouterState state) => GatewayRoute(
        state.pathParameters['mac']!,
        needsWifiConfig: _$convertMapValue('needs-wifi-config',
                state.uri.queryParameters, _$boolConverter) ??
            false,
      );

  GatewayRoute get _self => this as GatewayRoute;

  @override
  String get location => GoRouteData.$location(
        '/gateway/${Uri.encodeComponent(_self.mac)}',
        queryParams: {
          if (_self.needsWifiConfig != false)
            'needs-wifi-config': _self.needsWifiConfig.toString(),
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

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $doorSensorInfoRoute => GoRouteData.$route(
      path: '/door-sensor/:mac',
      factory: _$DoorSensorInfoRoute._fromState,
    );

mixin _$DoorSensorInfoRoute on GoRouteData {
  static DoorSensorInfoRoute _fromState(GoRouterState state) =>
      DoorSensorInfoRoute(
        state.pathParameters['mac']!,
      );

  DoorSensorInfoRoute get _self => this as DoorSensorInfoRoute;

  @override
  String get location => GoRouteData.$location(
        '/door-sensor/${Uri.encodeComponent(_self.mac)}',
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

RouteBase get $remoteKeyInfoRoute => GoRouteData.$route(
      path: '/remote-key/:mac',
      factory: _$RemoteKeyInfoRoute._fromState,
    );

mixin _$RemoteKeyInfoRoute on GoRouteData {
  static RemoteKeyInfoRoute _fromState(GoRouterState state) =>
      RemoteKeyInfoRoute(
        state.pathParameters['mac']!,
      );

  RemoteKeyInfoRoute get _self => this as RemoteKeyInfoRoute;

  @override
  String get location => GoRouteData.$location(
        '/remote-key/${Uri.encodeComponent(_self.mac)}',
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

RouteBase get $keypadInfoRoute => GoRouteData.$route(
      path: '/keypad/:mac',
      factory: _$KeypadInfoRoute._fromState,
    );

mixin _$KeypadInfoRoute on GoRouteData {
  static KeypadInfoRoute _fromState(GoRouterState state) => KeypadInfoRoute(
        state.pathParameters['mac']!,
      );

  KeypadInfoRoute get _self => this as KeypadInfoRoute;

  @override
  String get location => GoRouteData.$location(
        '/keypad/${Uri.encodeComponent(_self.mac)}',
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

RouteBase get $waterMeterRoute => GoRouteData.$route(
      path: '/water-meter/:id',
      factory: _$WaterMeterRoute._fromState,
    );

mixin _$WaterMeterRoute on GoRouteData {
  static WaterMeterRoute _fromState(GoRouterState state) => WaterMeterRoute(
        state.pathParameters['id']!,
      );

  WaterMeterRoute get _self => this as WaterMeterRoute;

  @override
  String get location => GoRouteData.$location(
        '/water-meter/${Uri.encodeComponent(_self.id)}',
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

RouteBase get $electricMeterRoute => GoRouteData.$route(
      path: '/electric-meter/:id',
      factory: _$ElectricMeterRoute._fromState,
    );

mixin _$ElectricMeterRoute on GoRouteData {
  static ElectricMeterRoute _fromState(GoRouterState state) =>
      ElectricMeterRoute(
        state.pathParameters['id']!,
      );

  ElectricMeterRoute get _self => this as ElectricMeterRoute;

  @override
  String get location => GoRouteData.$location(
        '/electric-meter/${Uri.encodeComponent(_self.id)}',
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
