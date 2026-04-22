import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_ios/ttlock_flutter_ios.dart';
import 'package:ttlock_flutter_ios/ttlock_flutter_ios_platform_interface.dart';
import 'package:ttlock_flutter_ios/ttlock_flutter_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTtlockFlutterIosPlatform
    with MockPlatformInterfaceMixin
    implements TtlockFlutterIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TtlockFlutterIosPlatform initialPlatform = TtlockFlutterIosPlatform.instance;

  test('$MethodChannelTtlockFlutterIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTtlockFlutterIos>());
  });

  test('getPlatformVersion', () async {
    TtlockFlutterIos ttlockFlutterIosPlugin = TtlockFlutterIos();
    MockTtlockFlutterIosPlatform fakePlatform = MockTtlockFlutterIosPlatform();
    TtlockFlutterIosPlatform.instance = fakePlatform;

    expect(await ttlockFlutterIosPlugin.getPlatformVersion(), '42');
  });
}
