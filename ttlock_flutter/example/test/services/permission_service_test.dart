import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ttlock_flutter_demo/services/permission_service/permission_service.dart';

void main() {
  tearDown(() {
    PermissionService.debugIsAndroid = null;
    PermissionService.debugAndroidSdkInt = null;
  });

  test('Android 9 仅请求定位，不请求 SCAN/CONNECT', () async {
    PermissionService.debugIsAndroid = true;
    PermissionService.debugAndroidSdkInt = () async => 28;
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final perms = await container
        .read(permissionServiceProvider.notifier)
        .blePermissions();
    expect(perms, [Permission.locationWhenInUse]);
  });

  test('Android 12+ 请求 SCAN/CONNECT + 定位', () async {
    PermissionService.debugIsAndroid = true;
    PermissionService.debugAndroidSdkInt = () async => 31;
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final perms = await container
        .read(permissionServiceProvider.notifier)
        .blePermissions();
    expect(perms, [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.locationWhenInUse,
    ]);
  });
}
