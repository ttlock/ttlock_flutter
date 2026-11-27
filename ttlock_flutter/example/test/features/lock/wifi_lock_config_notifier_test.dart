import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_state.dart';

import '../../helpers/mock_tt_lock_api.dart';

/// 只覆盖本任务用到的两个方法；其余 LockDomain 方法保持基类实现（不会被调用）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain({WifiLockEntity? wifiInfo, AppException? wifiInfoError})
    : wifiInfo = wifiInfo ?? const WifiLockEntity(),
      _wifiInfoError = wifiInfoError;

  final WifiLockEntity wifiInfo;
  final AppException? _wifiInfoError;

  /// submit 观测点。
  int configureCalls = 0;
  String? capturedWifiName;
  String? capturedWifiPassword;
  String? capturedStaticIp;
  String? capturedPreferredDns;
  String? capturedAlternateDns;
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
    capturedWifiName = wifiName;
    capturedWifiPassword = wifiPassword;
    capturedStaticIp = staticIp;
    capturedPreferredDns = preferredDns;
    capturedAlternateDns = alternateDns;
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

TTWifiScanEntry _entry(String ssid, int rssi) =>
    TTWifiScanEntry(ssid: ssid, wifiRssi: rssi);

void main() {
  setUpAll(registerTtLockFallbacks);

  MockTTLockApi installApi({bool Function(TTLockFunction)? supports}) {
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api, supports: supports);
    when(
      () => api.lockScanWifi(any()),
    ).thenAnswer((_) => const Stream<TTWifiScanResult>.empty());
    return api;
  }

  void disposeContainer(ProviderContainer container) {
    addTearDown(container.dispose);
  }

  /// 保持 autoDispose provider 在 await 间隙不被回收（模拟页面 watch）。
  Future<(WifiLockConfigNotifier, WifiLockConfigState)> readReady(
    ProviderContainer container,
    LockEntity lock,
  ) async {
    container.listen(wifiLockConfigProvider(lock.lockId, lock), (_, _) {});
    final state = await container.read(
      wifiLockConfigProvider(lock.lockId, lock).future,
    );
    final notifier = container.read(
      wifiLockConfigProvider(lock.lockId, lock).notifier,
    );
    return (notifier, state);
  }

  WifiLockConfigState current(
    ProviderContainer container,
    LockEntity lock,
  ) => container.read(wifiLockConfigProvider(lock.lockId, lock)).requireValue;

  setUp(installApi);
  tearDown(resetTtLockTestHooks);

  test('build 载入云端已配置信息（SSID / MAC / 在线 / 省电模式）', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        wifiMac: '11:22:33:44:55:66',
        isOnline: true,
        powerSavingMode: 1,
      ),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.configuredSsid, 'Office');
    expect(state.configuredWifiMac, '11:22:33:44:55:66');
    expect(state.configuredOnline, isTrue);
    expect(state.configuredPowerSavingMode, 1);
    expect(state.hasExistingWifi, isTrue);
  });

  test('build 载入云端已配置的静态 IP / 子网掩码 / 网关 / DNS', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(
        networkName: 'Office',
        ip: '192.168.1.2',
        subnetMask: '255.255.255.0',
        defaultGateway: '192.168.1.1',
        preferredDns: '8.8.8.8',
        alternateDns: '8.8.4.4',
      ),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.configuredIp, '192.168.1.2');
    expect(state.configuredSubnetMask, '255.255.255.0');
    expect(state.configuredDefaultGateway, '192.168.1.1');
    expect(state.configuredPreferredDns, '8.8.8.8');
    expect(state.configuredAlternateDns, '8.8.4.4');
  });

  test('supportFunction(wifiLockStaticIP)=true → supportsStaticIp 为 true', () async {
    installApi(supports: (f) => f == TTLockFunction.wifiLockStaticIP);
    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.supportsStaticIp, isTrue);
  });

  test('supportFunction(wifiLockStaticIP)=false → supportsStaticIp 为 false', () async {
    installApi(supports: (_) => false);
    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.supportsStaticIp, isFalse);
  });

  test('lockData 为空 → supportsStaticIp 为 false', () async {
    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    const emptyLock = LockEntity(lockId: 1, lockMac: 'AA', lockData: '');
    final (_, state) = await readReady(container, emptyLock);

    expect(state.supportsStaticIp, isFalse);
  });

  test('getWifiInfo 失败 → loadError 落库，configuredSsid 保持空串', () async {
    final domain = _FakeLockDomain(
      wifiInfoError: const AppException.business(
        code: -3034,
        message: 'no net',
      ),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.loadError, isA<AppBusinessException>());
    expect(state.configuredSsid, '');
    expect(state.hasExistingWifi, isFalse);
  });

  test('扫描按 ssid 去重、同 ssid 取更强 RSSI、按 RSSI 降序', () async {
    final controller = StreamController<TTWifiScanResult>();
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api);
    when(() => api.lockScanWifi(any())).thenAnswer((_) => controller.stream);

    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);

    await notifier.scan(_lock);
    controller.add(testWifiScan(wifiList: [_entry('A', -80)]));
    controller.add(testWifiScan(wifiList: [_entry('B', -40)]));
    controller.add(testWifiScan(wifiList: [_entry('A', -30)]));
    await pumpEventQueue();
    await controller.close();
    await pumpEventQueue();

    final state = current(container, _lock);
    expect(state.networks.map((e) => e.ssid).toList(), ['A', 'B']);
    expect(state.networks.first.rssi, -30);
    expect(state.isScanning, isFalse);
  });

  test('扫描错误 → error 落库且 isScanning 复位', () async {
    final controller = StreamController<TTWifiScanResult>();
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api);
    when(() => api.lockScanWifi(any())).thenAnswer((_) => controller.stream);

    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);

    await notifier.scan(_lock);
    controller.addError(Exception('ble boom'));
    await pumpEventQueue();
    await controller.close();
    await pumpEventQueue();

    final state = current(container, _lock);
    expect(state.isScanning, isFalse);
    expect(state.error, isNotNull);
  });

  test('lockData 为空 → scan 不发起 BLE，isScanning 保持 false', () async {
    final api = installApi();
    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    const emptyLock = LockEntity(lockId: 1, lockMac: 'AA', lockData: '');
    final (notifier, _) = await readReady(container, emptyLock);

    await notifier.scan(emptyLock);

    verifyNever(() => api.lockScanWifi(any()));
    expect(current(container, emptyLock).isScanning, isFalse);
  });

  test('未选网络 → submit 返回 false 且不调用 domain', () async {
    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);

    final ok = await notifier.submit(lock: _lock, wifiPassword: 'x');

    expect(ok, isFalse);
    expect(domain.configureCalls, 0);
  });

  test('submit 成功 → true、configuredSsid 更新、密码透传', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Cafe');

    final ok = await notifier.submit(lock: _lock, wifiPassword: 'secret');

    expect(ok, isTrue);
    expect(domain.configureCalls, 1);
    expect(domain.capturedWifiName, 'Cafe');
    expect(domain.capturedWifiPassword, 'secret');
    expect(current(container, _lock).configuredSsid, 'Cafe');
    expect(current(container, _lock).submitting, isFalse);
  });

  test('submit 重选同名已配置网络 → 密码传空串（不改密码）', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Office');

    expect(current(container, _lock).needsPassword, isFalse);
    await notifier.submit(lock: _lock, wifiPassword: 'ignored');

    expect(domain.capturedWifiPassword, '');
  });

  test('supportsStaticIp=false 时 submit 丢弃静态 IP / DNS 参数', () async {
    installApi(supports: (_) => false);
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Office');

    await notifier.submit(
      lock: _lock,
      wifiPassword: '',
      staticIp: '192.168.1.50',
      subnetMask: '255.255.255.0',
      defaultGateway: '192.168.1.1',
      preferredDns: '8.8.8.8',
      alternateDns: '8.8.4.4',
    );

    expect(domain.configureCalls, 1);
    expect(domain.capturedStaticIp, isNull);
    expect(domain.capturedPreferredDns, isNull);
    expect(domain.capturedAlternateDns, isNull);
  });

  test('submit 失败 → false、error 落库、submitting 复位', () async {
    final domain = _FakeLockDomain()..configureShouldFail = true;
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Cafe');

    final ok = await notifier.submit(lock: _lock, wifiPassword: 'x');

    expect(ok, isFalse);
    expect(current(container, _lock).error, isA<AppBusinessException>());
    expect(current(container, _lock).submitting, isFalse);
  });

  test('cloud 无已配置网络 → hasExistingWifi 为 false', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: ''),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (_, state) = await readReady(container, _lock);

    expect(state.hasExistingWifi, isFalse);
  });

  test('选中与已配置同名的网络 → needsPassword 为 false', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Office');

    expect(current(container, _lock).needsPassword, isFalse);
  });

  test('选中不同网络 → needsPassword 为 true', () async {
    final domain = _FakeLockDomain(
      wifiInfo: const WifiLockEntity(networkName: 'Office'),
    );
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );
    disposeContainer(container);

    final (notifier, _) = await readReady(container, _lock);
    notifier.select('Cafe');

    expect(current(container, _lock).needsPassword, isTrue);
  });

  test('离页（dispose）取消扫描订阅', () async {
    final controller = StreamController<TTWifiScanResult>();
    final api = MockTTLockApi();
    installMockLockApi(api);
    stubLockApiDefaults(api);
    when(() => api.lockScanWifi(any())).thenAnswer((_) => controller.stream);

    final domain = _FakeLockDomain();
    final container = ProviderContainer(
      overrides: [lockDomainProvider.overrideWith(() => domain)],
    );

    final (notifier, _) = await readReady(container, _lock);

    await notifier.scan(_lock);
    expect(controller.hasListener, isTrue);

    container.dispose();
    await pumpEventQueue();

    expect(controller.hasListener, isFalse);

    // 订阅已取消：再推数据不应抛异常（也证明 _disposed 守卫生效）。
    controller.add(testWifiScan(wifiList: [_entry('A', -30)]));
    await controller.close();
    await pumpEventQueue();
  });
}
