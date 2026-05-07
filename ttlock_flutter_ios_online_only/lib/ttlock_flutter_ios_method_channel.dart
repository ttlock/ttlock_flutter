import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ttlock_flutter_ios_platform_interface.dart';

/// An implementation of [TtlockFlutterIosPlatform] that uses method channels.
class MethodChannelTtlockFlutterIos extends TtlockFlutterIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ttlock_flutter_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
