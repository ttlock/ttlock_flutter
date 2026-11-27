import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';

abstract class WifiLockRepositoryInterface {
  TaskEither<AppException, WifiLockEntity> detail(int lockId);

  /// 上传 WiFi 网络信息到云端（`/v3/wifiLock/updateNetwork`）。
  ///
  /// 所有字段可选；null 表示不更新该项。
  TaskEither<AppException, Unit> updateNetwork(
    int lockId, {
    String? networkName,
    String? wifiMac,
    int? rssi,
    bool? useStaticIp,
    String? ip,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
  });
}
