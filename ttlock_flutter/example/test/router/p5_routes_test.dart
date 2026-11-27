// P5 全屏路由烟测：/devices/water-meters*、/devices/electric-meters*、/lock/:lockId/lift 能真实抵达对应 Screen。
// 绕过 redirect 门禁：注入有凭证的 AppConfigService + 已登录会话。
// 表计 List/Add/Detail 依赖的 Domain/Notifier 以 Fake 提供，避免真实 BLE/网络。
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/screen/lift_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_add_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_add_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_list_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_add_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_list_screen.dart';
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

/// 水表 Domain 用 Fake：list 返回一条、listRecords 返回空（确定性、不触网）。
class _FakeWaterMeterDomain extends WaterMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<WaterMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => TaskEither.right(
    const PageState<WaterMeterEntity>(
      data: [WaterMeterEntity(waterMeterId: 1, name: 'WM-1', mac: 'AA:BB')],
      currentPage: 1,
      total: 1,
    ),
  );

  @override
  TaskEither<AppException, List<WaterMeterRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => TaskEither.right(const <WaterMeterRecordEntity>[]);
}

/// 电表 Domain 用 Fake：list 返回一条、listRecords 返回空。
class _FakeElectricMeterDomain extends ElectricMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => TaskEither.right(
    const PageState<ElectricMeterEntity>(
      data: [ElectricMeterEntity(electricMeterId: 1, name: 'EM-1')],
      currentPage: 1,
      total: 1,
    ),
  );

  @override
  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => TaskEither.right(const <ElectricMeterUsageRecordEntity>[]);
}

/// 水表配网向导用 Fake：静态停在 done 步（无无限转圈），使 pumpAndSettle 可收敛。
class _StaticWaterMeterAddNotifier extends WaterMeterAddNotifier {
  @override
  Future<WaterMeterAddState> build() async =>
      const WaterMeterAddState(step: WaterMeterAddStep.done(meterId: 1));

  @override
  Future<void> startScan() async {}
}

/// 电表配网向导用 Fake：静态停在 done 步。
class _StaticElectricMeterAddNotifier extends ElectricMeterAddNotifier {
  @override
  Future<ElectricMeterAddState> build() async =>
      const ElectricMeterAddState(step: ElectricMeterAddStep.done(meterId: 1));

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
        waterMeterDomainProvider.overrideWith(_FakeWaterMeterDomain.new),
        waterMeterAddProvider.overrideWith(_StaticWaterMeterAddNotifier.new),
        electricMeterDomainProvider.overrideWith(_FakeElectricMeterDomain.new),
        electricMeterAddProvider.overrideWith(
          _StaticElectricMeterAddNotifier.new,
        ),
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

  testWidgets('/devices/water-meters 可达 WaterMeterListScreen', (tester) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.waterMeterList);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.waterMeterList,
    );
    expect(find.byType(WaterMeterListScreen), findsOneWidget);
  });

  testWidgets('/devices/water-meters/add 可达 WaterMeterAddScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.waterMeterAdd);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.waterMeterAdd,
    );
    expect(find.byType(WaterMeterAddScreen), findsOneWidget);
  });

  testWidgets('/devices/water-meters/detail 可达 WaterMeterDetailScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);
    const meter = WaterMeterEntity(waterMeterId: 1, name: 'WM-1', mac: 'AA:BB');

    router.go('/devices/water-meters/detail/1', extra: meter);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      '/devices/water-meters/detail/1',
    );
    expect(find.byType(WaterMeterDetailScreen), findsOneWidget);
  });

  testWidgets('/devices/electric-meters 可达 ElectricMeterListScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.electricMeterList);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.electricMeterList,
    );
    expect(find.byType(ElectricMeterListScreen), findsOneWidget);
  });

  testWidgets('/devices/electric-meters/add 可达 ElectricMeterAddScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);

    router.go(RoutePaths.electricMeterAdd);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      RoutePaths.electricMeterAdd,
    );
    expect(find.byType(ElectricMeterAddScreen), findsOneWidget);
  });

  testWidgets('/devices/electric-meters/detail 可达 ElectricMeterDetailScreen', (
    tester,
  ) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);
    const meter = ElectricMeterEntity(electricMeterId: 1, name: 'EM-1');

    router.go('/devices/electric-meters/detail/1', extra: meter);
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      '/devices/electric-meters/detail/1',
    );
    expect(find.byType(ElectricMeterDetailScreen), findsOneWidget);
  });

  testWidgets('/lock/:lockId/lift 可达 LiftScreen', (tester) async {
    final container = await loggedInContainer();
    await pumpApp(tester, container);
    final router = container.read(appRouterProvider);
    const lockId = 1;

    router.go('/lock/$lockId/lift');
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.uri.path,
      '/lock/$lockId/lift',
    );
    expect(find.byType(LiftScreen), findsOneWidget);
  });
}
