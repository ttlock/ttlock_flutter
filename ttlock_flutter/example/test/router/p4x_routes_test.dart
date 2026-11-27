// P4.x 全屏路由烟测：/devices 与 /devices/gateways* 能真实抵达对应 Screen。
// 绕过 redirect 门禁：注入有凭证的 AppConfigService + 已登录会话。
// 网关 List/Add/Detail 依赖的 Domain/Notifier 以 Fake 提供，避免真实 BLE/网络。
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_add_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_list_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/other_devices/presentation/screen/other_devices_screen.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _CredAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig(clientId: 'cid', clientSecret: 'sec');
}

/// 网关列表用 Fake：list 返回一条网关（确定性、不触网）。
class _FakeGatewayDomain extends GatewayDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({int pageNo = 1}) =>
      TaskEither.right(
        const PageState<GatewayEntity>(
          data: [
            GatewayEntity(
              gatewayId: 1,
              gatewayMac: 'AA:BB:CC:DD:EE:01',
              gatewayName: 'GW-1',
            ),
          ],
          currentPage: 1,
          total: 1,
        ),
      );
}

/// 网关配网向导用 Fake：静态停在 done 步（无无限转圈），使 pumpAndSettle 可收敛。
class _StaticGatewayAddNotifier extends GatewayAddNotifier {
  @override
  Future<GatewayAddState> build() async =>
      const GatewayAddState(step: GatewayAddStep.done(gatewayId: 1));

  @override
  Future<void> startScan() async {}
}

/// 初始终端为「/」即 Home Tab 会调 listLocks；Fake 返回空列表，避免真实请求。
class _FakeLockDomain extends LockDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<LockEntity>> listLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => TaskEither.right(const PageState<LockEntity>());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  Future<ProviderContainer> loggedInContainer() async {
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        appConfigServiceProvider.overrideWith(_CredAppConfigService.new),
        gatewayDomainProvider.overrideWith(_FakeGatewayDomain.new),
        gatewayAddProvider.overrideWith(_StaticGatewayAddNotifier.new),
        lockDomainProvider.overrideWith(_FakeLockDomain.new),
      ],
    );
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));
    return container;
  }

  Future<void> pumpApp(WidgetTester tester, ProviderContainer container) async {
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
  }

  testWidgets('/devices 可达 OtherDevicesScreen', (tester) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.otherDevices);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.otherDevices,
    );
    expect(find.byType(OtherDevicesScreen), findsOneWidget);
  });

  testWidgets('/devices/gateways 可达 GatewayListScreen', (tester) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.gatewayList);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.gatewayList,
    );
    expect(find.byType(GatewayListScreen), findsOneWidget);
  });

  testWidgets('/devices/gateways/add 可达 GatewayAddScreen', (tester) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.gatewayAdd);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.gatewayAdd,
    );
    expect(find.byType(GatewayAddScreen), findsOneWidget);
  });

  testWidgets('/devices/gateways/detail 可达 GatewayDetailScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);
    const gateway = GatewayEntity(
      gatewayId: 7,
      gatewayMac: 'AA:BB',
      gatewayName: 'GW-7',
    );

    router.go(RoutePaths.gatewayDetail, extra: gateway);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.gatewayDetail,
    );
    expect(find.byType(GatewayDetailScreen), findsOneWidget);
  });
}
