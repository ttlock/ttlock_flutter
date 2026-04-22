
import 'ttlock_flutter_ohos_platform_interface.dart';

class TtlockFlutterOhos {
  Future<String?> getPlatformVersion() {
    return TtlockFlutterOhosPlatform.instance.getPlatformVersion();
  }
}
