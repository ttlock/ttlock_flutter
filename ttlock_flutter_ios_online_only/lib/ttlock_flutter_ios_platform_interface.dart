import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ttlock_flutter_ios_method_channel.dart';

abstract class TtlockFlutterIosPlatform extends PlatformInterface {
  /// Constructs a TtlockFlutterIosPlatform.
  TtlockFlutterIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static TtlockFlutterIosPlatform _instance = MethodChannelTtlockFlutterIos();

  /// The default instance of [TtlockFlutterIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelTtlockFlutterIos].
  static TtlockFlutterIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TtlockFlutterIosPlatform] when
  /// they register themselves.
  static set instance(TtlockFlutterIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
