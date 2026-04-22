import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ttlock_flutter_ohos_method_channel.dart';

abstract class TtlockFlutterOhosPlatform extends PlatformInterface {
  /// Constructs a TtlockFlutterOhosPlatform.
  TtlockFlutterOhosPlatform() : super(token: _token);

  static final Object _token = Object();

  static TtlockFlutterOhosPlatform _instance = MethodChannelTtlockFlutterOhos();

  /// The default instance of [TtlockFlutterOhosPlatform] to use.
  ///
  /// Defaults to [MethodChannelTtlockFlutterOhos].
  static TtlockFlutterOhosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TtlockFlutterOhosPlatform] when
  /// they register themselves.
  static set instance(TtlockFlutterOhosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
