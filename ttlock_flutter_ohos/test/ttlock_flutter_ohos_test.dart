import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_ohos/ttlock_flutter_ohos.dart';
import 'package:ttlock_flutter_ohos/ttlock_flutter_ohos_platform_interface.dart';
import 'package:ttlock_flutter_ohos/ttlock_flutter_ohos_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTtlockFlutterOhosPlatform
    with MockPlatformInterfaceMixin
    implements TtlockFlutterOhosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TtlockFlutterOhosPlatform initialPlatform = TtlockFlutterOhosPlatform.instance;

  test('$MethodChannelTtlockFlutterOhos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTtlockFlutterOhos>());
  });

  test('getPlatformVersion', () async {
    TtlockFlutterOhos ttlockFlutterOhosPlugin = TtlockFlutterOhos();
    MockTtlockFlutterOhosPlatform fakePlatform = MockTtlockFlutterOhosPlatform();
    TtlockFlutterOhosPlatform.instance = fakePlatform;

    expect(await ttlockFlutterOhosPlugin.getPlatformVersion(), '42');
  });
}
