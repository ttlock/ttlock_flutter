import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'permission_service.g.dart';

/// 运行时权限服务：扫锁 / 近场 BLE 前统一申请蓝牙（及 Android 定位）权限。
@Riverpod(keepAlive: true)
class PermissionService extends _$PermissionService {
  @override
  void build() {}

  /// 业务错误码：蓝牙相关权限未授予（与 [AppMessageMapper] / l10n 对齐）。
  static const permissionDeniedCode = -11;

  /// Android 12 (API 31) 起才有运行时 BLUETOOTH_SCAN / CONNECT。
  static const _androidBleRuntimeSdk = 31;

  /// 测试可注入。
  static bool? debugIsAndroid;
  static Future<int> Function()? debugAndroidSdkInt;

  Future<int> _sdkInt() async {
    if (debugAndroidSdkInt != null) return debugAndroidSdkInt!();
    final info = await DeviceInfoPlugin().androidInfo;
    return info.version.sdkInt;
  }

  /// 当前平台 BLE 扫连所需权限列表（按 OS / API 分支）。
  ///
  /// - Android &lt; 12：仅 [Permission.locationWhenInUse]（BLE 扫描依赖定位）
  /// - Android 12+：[Permission.bluetoothScan] / [Permission.bluetoothConnect] + 定位
  /// - iOS：[Permission.bluetooth] + 定位
  /// - OHOS：[Permission.bluetoothScan] / [Permission.bluetoothConnect] + 定位
  Future<List<Permission>> blePermissions() async {
    final isAndroid = debugIsAndroid ?? Platform.isAndroid;
    if (isAndroid) {
      final sdk = await _sdkInt();
      if (sdk >= _androidBleRuntimeSdk) {
        return [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
          Permission.locationWhenInUse,
        ];
      }
      // Android 9 等旧版：切勿请求 SCAN/CONNECT，否则 permission_handler
      // 会因 manifest 映射为空直接 DENIED（日志形如 No permissions found … []28）。
      return [Permission.locationWhenInUse];
    } else if (Platform.isIOS) {
      return [Permission.bluetooth, Permission.locationWhenInUse];
    }else{
      return [
          Permission.bluetoothScan,
          Permission.bluetoothConnect,
          Permission.locationWhenInUse,
        ];
    }
  }

  Future<bool> hasBlePermissions() async {
    for (final p in await blePermissions()) {
      final s = await p.status;
      if (!(s.isGranted || s.isLimited)) return false;
    }
    return true;
  }

  /// 请求 BLE 相关权限；全部 granted/limited 返回 true。
  Future<bool> requestBlePermissions() async {
    if (await hasBlePermissions()) return true;
    final results = await (await blePermissions()).request();
    return results.values.every(
      (s) => s.isGranted || s.isLimited
    );
  }

  /// 确保已授权，否则抛出 [AppException.business]。
  Future<void> ensureBlePermissions() async {
    final ok = await requestBlePermissions();
    if (!ok) {
      throw const AppException.business(
        code: permissionDeniedCode,
        message: 'bluetooth_permission_denied',
      );
    }
  }

  Future<bool> openSettings() => openAppSettings();
}
