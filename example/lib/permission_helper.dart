import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// 扫描门锁/网关所需的蓝牙和定位权限
Future<bool> requestScanPermissions() async {
  final permissions = Platform.isAndroid
      ? [
          Permission.bluetoothConnect,
          Permission.bluetoothScan,
          Permission.locationWhenInUse,
        ]
      : [
          Permission.bluetooth,
          Permission.locationWhenInUse,
        ];

  final results = await permissions.request();
  return results.values.every((e) => e.isGranted || e.isLimited);
}
