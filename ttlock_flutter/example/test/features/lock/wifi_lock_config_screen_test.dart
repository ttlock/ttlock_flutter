import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/wifi_lock_config_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/wifi_lock_network_sheet.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/ip_address_field.dart';

import '../../helpers/mock_tt_lock_api.dart';

/// 只覆盖本页用到的两个方法；其余 LockDomain 方法保持基类实现（不会被调用）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain({WifiLockEntity? wifiInfo, AppException? wifiInfoError})
    : wifiInfo = wifiInfo ?? const WifiLockEntity(),
      _wifiInfoError = wifiInfoError;

  final WifiLockEntity wifiInfo;
  final AppException? _wifiInfoError;

  /// 观测点：提交是否真的下发，以及下发了什么。
  int configureCalls = 0;
  bool? capturedPowerSavingModeOn;
  String? capturedStaticIp;

  /// 提交失败（避免成功后导航需要 GoRouter）。
  bool configureShouldFail = false;

  @override
  void build() {}

  @override
  TaskEither<AppException, WifiLockEntity> getWifiInfo(int lockId) =>
      _wifiInfoError != null
      ? TaskEither.left(_wifiInfoError)
      : TaskEither.right(wifiInfo);

  @override
  TaskEither<AppException, Unit> configureWifiNetwork({
    required LockEntity lock,
    required String wifiName,
    required String wifiPassword,
    String? staticIp,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
    bool? powerSavingModeOn,
  }) {
    configureCalls++;
    capturedPowerSavingModeOn = powerSavingModeOn;
    capturedStaticIp = staticIp;
    return configureShouldFail
        ? TaskEither.left(
            const AppException.business(code: -9, message: 'configure_failed'),
          )
        : TaskEither.right(unit);
  }
}

const _lock = LockEntity(
  lockId: 1,
  lockMac: 'AA:BB:CC:DD:EE:FF',
  lockData: 'LOCK_DATA',
);

final _l10n = lookupAppLocalizations(const Locale('zh'));

void main() {
  setUpAll(registerTtLockFallbacks);
  tearDown(resetTtLockTestHooks);

  /// 扫描永不产出（页面 useEffect 会自动触发一次扫描，必须打桩）。
  MockTTLockApi installEmptyScanApi({
    bool Function(TTLockFunction)? supports,
  }) {
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api, supports: supports);
    when(
      () => api.lockScanWifi(any()),
    ).thenAnswer((_) => const Stream<TTWifiScanResult>.empty());
    return api;
  }

  Future<void> tallSurface(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  Future<_FakeLockDomain> pumpScreen(
    WidgetTester tester, {
    required WifiLockEntity wifiInfo,
    AppException? wifiInfoError,
    _FakeLockDomain? domain,
    LockEntity lock = _lock,
    bool Function(TTLockFunction)? supports,
  }) async {
    final resolved =
        domain ??
        _FakeLockDomain(wifiInfo: wifiInfo, wifiInfoError: wifiInfoError);
    installEmptyScanApi(supports: supports);
    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [lockDomainProvider.overrideWith(() => resolved)],
        child: MaterialApp(home: WifiLockConfigScreen(lockId: 1, lock: lock)),
      ),
    );
    await tester.pumpAndSettle();
    return resolved;
  }

  /// 选中与云端已配置同名的网络：`needsPassword` 为 false，校验可走到后续分支。
  Future<void> selectExistingNetwork(
    WidgetTester tester, {
    String ssid = 'Office',
  }) async {
    ProviderScope.containerOf(
      tester.element(find.byType(WifiLockConfigScreen)),
      listen: false,
    ).read(wifiLockConfigProvider(1, _lock).notifier).select(ssid);
    await tester.pump();
  }

  /// 向四分段 IP 输入框逐段填入（点号由组件固定展示）。
  Future<void> enterIpAddress(
    WidgetTester tester,
    Key fieldKey,
    String ip,
  ) async {
    final parts = ip.split('.');
    expect(parts, hasLength(4));
    final fields = find.descendant(
      of: find.byKey(fieldKey),
      matching: find.byType(TextField),
    );
    expect(fields, findsNWidgets(4));
    for (var i = 0; i < 4; i++) {
      await tester.enterText(fields.at(i), parts[i]);
    }
    await tester.pump();
  }

  String ipAddressOf(WidgetTester tester, Key fieldKey) {
    return tester.widget<IpAddressField>(find.byKey(fieldKey)).controller.text;
  }

  testWidgets('未配置过 → 底部按钮文案为「开始配置」', (tester) async {
    await pumpScreen(tester, wifiInfo: const WifiLockEntity(networkName: ''));

    expect(find.text(_l10n.startConfig), findsOneWidget);
    expect(find.text(_l10n.save), findsNothing);
  });

  testWidgets('已配置过 → 底部按钮文案为「保存」', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        wifiMac: '11:22:33:44:55:66',
      ),
    );

    expect(find.text(_l10n.save), findsOneWidget);
    expect(find.text(_l10n.startConfig), findsNothing);
  });

  testWidgets('未选网络点提交 → 提示先选网络，且不触发提交', (tester) async {
    await pumpScreen(tester, wifiInfo: const WifiLockEntity(networkName: ''));

    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump(); // 触发 SnackBar 插入
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text(_l10n.pleaseSelectWifiNetwork), findsOneWidget);
  });

  testWidgets('静态 IP 段越界 → 提示格式错误，且不下发', (tester) async {
    final domain = await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
      supports: (_) => true,
    );

    // 重选同名已配置网络：needsPassword 为 false，校验能走到 IP 分支
    await selectExistingNetwork(tester);

    await tester.tap(find.byKey(const Key('wifi_config_advanced_toggle')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('wifi_config_use_static_ip')));
    await tester.pumpAndSettle();
    await enterIpAddress(
      tester,
      const Key('wifi_config_static_ip'),
      '999.1.1.1', // 正则命中但段值越界
    );

    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text(_l10n.staticIpAddressFormatIncorrect), findsOneWidget);
    expect(domain.configureCalls, 0);
  });

  testWidgets('不支持静态 IP → 不展示高级设置（静态 IP / DNS）', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        ip: '192.168.1.2',
        preferredDns: '8.8.8.8',
      ),
      supports: (f) => f != TTLockFunction.wifiLockStaticIP,
    );

    expect(find.byKey(const Key('wifi_config_advanced_toggle')), findsNothing);
    expect(find.byKey(const Key('wifi_config_use_static_ip')), findsNothing);
    expect(find.byKey(const Key('wifi_config_use_custom_dns')), findsNothing);
  });

  testWidgets('实体省电模式为 1 → 开关初值为开', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(networkName: 'Office', powerSavingMode: 1),
    );

    final tile = tester.widget<SwitchListTile>(
      find.byKey(const Key('wifi_config_power_saving')),
    );
    expect(tile.value, isTrue);
  });

  testWidgets('未改动省电开关直接提交 → powerSavingModeOn 传 null', (tester) async {
    final domain = await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(networkName: 'Office', powerSavingMode: 1),
    );
    // 提交失败 → 停在页面，避开成功分支的导航（本用例只关心下发参数）
    domain.configureShouldFail = true;

    await selectExistingNetwork(tester);
    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(domain.configureCalls, 1);
    expect(domain.capturedPowerSavingModeOn, isNull);
  });

  testWidgets('改动省电开关后提交 → 传改动后的值', (tester) async {
    final domain = await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(networkName: 'Office', powerSavingMode: 1),
    );
    domain.configureShouldFail = true;

    await selectExistingNetwork(tester);
    await tester.tap(
      find.byKey(const Key('wifi_config_power_saving')),
    ); // 开 → 关
    await tester.pump();
    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(domain.configureCalls, 1);
    expect(domain.capturedPowerSavingModeOn, isFalse);
  });

  testWidgets('WiFi 选择 sheet：空态展示、刷新后列出扫描到的网络', (tester) async {
    final controller = StreamController<TTWifiScanResult>();
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api);
    when(() => api.lockScanWifi(any())).thenAnswer((_) => controller.stream);

    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [lockDomainProvider.overrideWith(() => _FakeLockDomain())],
        child: const MaterialApp(
          home: Scaffold(body: WifiLockNetworkSheet(lockId: 1, lock: _lock)),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 未扫描时：空态 + 重新扫描入口（chassis 的返回按钮即关闭 affordance）
    expect(find.text(_l10n.selectWifiNetwork), findsOneWidget);
    expect(find.text(_l10n.noAvailableWifi), findsOneWidget);
    expect(find.byKey(const Key('wifi_sheet_rescan')), findsOneWidget);
    expect(find.text(_l10n.commonCancel), findsNothing);

    await tester.tap(find.byKey(const Key('wifi_sheet_rescan')));
    await tester.pump(); // scan() 订阅建立
    controller.add(
      testWifiScan(wifiList: [TTWifiScanEntry(ssid: 'Cafe', wifiRssi: -45)]),
    );
    await tester.pump(); // 列表状态更新
    await controller.close();
    await tester.pump(); // onDone → isScanning 复位

    expect(find.text('Cafe'), findsOneWidget);
    expect(find.text(_l10n.noAvailableWifi), findsNothing);
  });

  testWidgets('已配置静态 IP / DNS → 高级设置回显各字段', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        ip: '192.168.1.2',
        subnetMask: '255.255.255.0',
        defaultGateway: '192.168.1.1',
        preferredDns: '8.8.8.8',
        alternateDns: '8.8.4.4',
      ),
      supports: (_) => true,
    );

    await tester.tap(find.byKey(const Key('wifi_config_advanced_toggle')));
    await tester.pumpAndSettle();

    // 开关自动置开，字段回显云端值（四分段组件，读 controller）。
    expect(
      ipAddressOf(tester, const Key('wifi_config_static_ip')),
      '192.168.1.2',
    );
    expect(
      ipAddressOf(tester, const Key('wifi_config_subnet_mask')),
      '255.255.255.0',
    );
    expect(
      ipAddressOf(tester, const Key('wifi_config_default_gateway')),
      '192.168.1.1',
    );
    expect(
      ipAddressOf(tester, const Key('wifi_config_preferred_dns')),
      '8.8.8.8',
    );
    expect(
      ipAddressOf(tester, const Key('wifi_config_alternate_dns')),
      '8.8.4.4',
    );
  });

  testWidgets('已配置静态 IP 的锁保存 → 下发回显的静态 IP', (tester) async {
    final domain = await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        ip: '192.168.1.2',
        subnetMask: '255.255.255.0',
        defaultGateway: '192.168.1.1',
      ),
      supports: (_) => true,
    );
    domain.configureShouldFail = true; // 停在页面，避开成功分支导航

    await selectExistingNetwork(tester);
    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(domain.configureCalls, 1);
    expect(domain.capturedStaticIp, '192.168.1.2');
  });

  testWidgets('云端载入失败 → 页面展示错误提示', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(),
      wifiInfoError: const AppException.business(
        code: -3034,
        message: 'no net',
      ),
    );

    expect(find.byKey(const Key('wifi_config_load_error')), findsOneWidget);
    expect(find.text('no net'), findsOneWidget);
  });

  testWidgets('缺少 lockData → 提示无法配置网络（而非先提示选网络）', (tester) async {
    await pumpScreen(
      tester,
      wifiInfo: const WifiLockEntity(),
      lock: const LockEntity(lockId: 1, lockMac: 'AA', lockData: ''),
    );

    await tester.tap(find.byKey(const Key('wifi_config_submit')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text(_l10n.missingLockDataCannotConfigWifi), findsOneWidget);
    expect(find.text(_l10n.pleaseSelectWifiNetwork), findsNothing);
  });
}
