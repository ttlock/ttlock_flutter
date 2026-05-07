import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_android/ttlock_flutter_android.dart';
import 'package:ttlock_flutter_android/ttlock_flutter_android_platform_interface.dart';
import 'package:ttlock_flutter_android/ttlock_flutter_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTtlockFlutterAndroidPlatform
    with MockPlatformInterfaceMixin
    implements TtlockFlutterAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TtlockFlutterAndroidPlatform initialPlatform = TtlockFlutterAndroidPlatform.instance;

  test('$MethodChannelTtlockFlutterAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTtlockFlutterAndroid>());
  });

  test('getPlatformVersion', () async {
    TtlockFlutterAndroid ttlockFlutterAndroidPlugin = TtlockFlutterAndroid();
    MockTtlockFlutterAndroidPlatform fakePlatform = MockTtlockFlutterAndroidPlatform();
    TtlockFlutterAndroidPlatform.instance = fakePlatform;

    expect(await ttlockFlutterAndroidPlugin.getPlatformVersion(), '42');
  });
}
