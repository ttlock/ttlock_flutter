import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

/// cardEncoder 域仓库接口（酒店发卡器对接）。
abstract interface class CardEncoderRepositoryInterface {
  /// 获取前台发卡酒店信息；服务端未返回（空串）时返回 `Left(-29)`。
  TaskEither<AppException, String> getHotelInfo();

  /// 获取加密扇区密钥 ICKey；服务端未返回（空串）时返回 `Left(-29)`。
  TaskEither<AppException, String> getIcKey();
}
