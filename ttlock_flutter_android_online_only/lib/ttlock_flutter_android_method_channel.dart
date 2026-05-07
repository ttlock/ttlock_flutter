import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ttlock_flutter_android_platform_interface.dart';

/// An implementation of [TtlockFlutterAndroidPlatform] that uses method channels.
class MethodChannelTtlockFlutterAndroid extends TtlockFlutterAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ttlock_flutter_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
