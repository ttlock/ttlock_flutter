import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ttlock_flutter_ohos_platform_interface.dart';

/// An implementation of [TtlockFlutterOhosPlatform] that uses method channels.
class MethodChannelTtlockFlutterOhos extends TtlockFlutterOhosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ttlock_flutter_ohos');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
