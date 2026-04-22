import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_ohos/ttlock_flutter_ohos_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelTtlockFlutterOhos platform = MethodChannelTtlockFlutterOhos();
  const MethodChannel channel = MethodChannel('ttlock_flutter_ohos');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
