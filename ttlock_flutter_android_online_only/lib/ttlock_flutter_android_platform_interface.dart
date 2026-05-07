import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ttlock_flutter_android_method_channel.dart';

abstract class TtlockFlutterAndroidPlatform extends PlatformInterface {
  /// Constructs a TtlockFlutterAndroidPlatform.
  TtlockFlutterAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static TtlockFlutterAndroidPlatform _instance = MethodChannelTtlockFlutterAndroid();

  /// The default instance of [TtlockFlutterAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelTtlockFlutterAndroid].
  static TtlockFlutterAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TtlockFlutterAndroidPlatform] when
  /// they register themselves.
  static set instance(TtlockFlutterAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
