
import 'ttlock_flutter_android_platform_interface.dart';

class TtlockFlutterAndroid {
  Future<String?> getPlatformVersion() {
    return TtlockFlutterAndroidPlatform.instance.getPlatformVersion();
  }
}
