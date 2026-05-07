
import 'ttlock_flutter_ios_platform_interface.dart';

class TtlockFlutterIos {
  Future<String?> getPlatformVersion() {
    return TtlockFlutterIosPlatform.instance.getPlatformVersion();
  }
}
