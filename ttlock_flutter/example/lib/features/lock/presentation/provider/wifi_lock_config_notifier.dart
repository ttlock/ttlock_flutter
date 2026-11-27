import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_network.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_state.dart';

part 'wifi_lock_config_notifier.g.dart';

/// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
///
/// 页面级（autoDispose）；离页取消扫描订阅。
@Riverpod()
class WifiLockConfigNotifier extends _$WifiLockConfigNotifier {
  StreamSubscription<WifiNetwork>? _sub;
  bool _disposed = false;

  LockDomain get _domain => ref.read(lockDomainProvider.notifier);

  void _set(WifiLockConfigState next) {
    if (_disposed) return;
    state = AsyncData(next);
  }

  @override
  Future<WifiLockConfigState> build(int lockId, LockEntity lock) async {
    _disposed = false;
    ref.onDispose(() {
      _disposed = true;
      unawaited(_sub?.cancel());
      _sub = null;
    });

    final supportsStaticIp = await _probeStaticIp(lock.lockData);

    final result = await _domain.getWifiInfo(lockId).run();
    return result.fold(
      (err) => WifiLockConfigState(
        supportsStaticIp: supportsStaticIp,
        loadError: err,
      ),
      (info) => WifiLockConfigState(
        supportsStaticIp: supportsStaticIp,
        configuredSsid: info.networkName,
        configuredWifiMac: info.wifiMac,
        configuredOnline: info.isOnline,
        configuredPowerSavingMode: info.powerSavingMode,
        configuredIp: info.ip,
        configuredSubnetMask: info.subnetMask,
        configuredDefaultGateway: info.defaultGateway,
        configuredPreferredDns: info.preferredDns,
        configuredAlternateDns: info.alternateDns,
      ),
    );
  }

  /// 本地解析 lockData（不连 BLE）；空 lockData / 探测异常 → 不支持。
  Future<bool> _probeStaticIp(String lockData) async {
    if (lockData.isEmpty) return false;
    try {
      return await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.wifiLockStaticIP,
          lockData,
        ),
      );
    } on Object {
      return false;
    }
  }

  /// 扫描周边 WiFi。`lockData` 为空 → 直接返回，不发起 BLE。
  Future<void> scan(LockEntity lock) async {
    final current = state.value;
    if (current == null) return;
    if (lock.lockData.isEmpty || current.isScanning) return;
    await _sub?.cancel();
    _set(current.copyWith(networks: const [], isScanning: true, error: null));
    _sub = gateBleStream(() => TTLock.lock.lockScanWifi(lock.lockData))
        .expand((TTWifiScanResult r) sync* {
          for (final w in r.wifiList) {
            final name = w.ssid ?? w.wifiName ?? w.name ?? '';
            if (name.isNotEmpty) {
              yield WifiNetwork(ssid: name, rssi: w.wifiRssi ?? -127);
            }
          }
        })
        .listen(
          (network) {
            final s = state.value;
            if (_disposed || s == null) return;
            final list = [...s.networks];
            final index = list.indexWhere((e) => e.ssid == network.ssid);
            if (index >= 0) {
              if (network.rssi > list[index].rssi) list[index] = network;
            } else {
              list.add(network);
            }
            list.sort((a, b) => b.rssi.compareTo(a.rssi));
            _set(s.copyWith(networks: list));
          },
          onError: (Object e, StackTrace st) {
            final s = state.value;
            if (_disposed || s == null) return;
            _set(
              s.copyWith(
                isScanning: false,
                error: ExceptionUtils.extractAppException(e, st),
              ),
            );
          },
          onDone: () {
            final s = state.value;
            if (_disposed || s == null) return;
            _set(s.copyWith(isScanning: false));
          },
        );
  }

  void select(String ssid) {
    final s = state.value;
    if (s == null) return;
    _set(s.copyWith(selectedSsid: ssid));
  }

  /// 提交配网。返回 true 表示成功（调用方据此导航）。
  Future<bool> submit({
    required LockEntity lock,
    required String wifiPassword,
    String? staticIp,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
    bool? powerSavingModeOn,
  }) async {
    final current = state.value;
    if (current == null) return false;
    final ssid = current.selectedSsid;
    if ((ssid == null && !current.hasExistingWifi) || current.submitting) {
      return false;
    }

    _set(current.copyWith(submitting: true, error: null));
    final result = await _domain
        .configureWifiNetwork(
          lock: lock,
          wifiName: ssid ?? current.configuredSsid,
          // 重选已配置网络 = 不改密码。
          wifiPassword: current.needsPassword ? wifiPassword : '',
          // 静态 IP / DNS 均走 configIP，能力位不支持时一律不下发。
          staticIp: current.supportsStaticIp ? staticIp : null,
          subnetMask: current.supportsStaticIp ? subnetMask : null,
          defaultGateway: current.supportsStaticIp ? defaultGateway : null,
          preferredDns: current.supportsStaticIp ? preferredDns : null,
          alternateDns: current.supportsStaticIp ? alternateDns : null,
          powerSavingModeOn: powerSavingModeOn,
        )
        .run();
    if (_disposed) return false;

    final after = state.value;
    if (after == null) return false;

    var ok = false;
    result.fold(
      (err) => _set(after.copyWith(submitting: false, error: err)),
      (_) {
        ok = true;
        _set(
          after.copyWith(
            submitting: false,
            configuredSsid: ssid ?? after.configuredSsid,
            loadError: null,
            error: null,
          ),
        );
      },
    );
    return ok;
  }
}
