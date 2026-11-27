import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

abstract class QrCodeRepositoryInterface {
  TaskEither<AppException, PageState<QrCodeEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  });

  TaskEither<AppException, QrCodeEntity> add(
    int lockId, {
    String? qrCodeName,
    String? qrCodeNumber,
    DateTime? startDate,
    DateTime? endDate,
    QrCodeType type = QrCodeType.limited,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  });

  /// 改期/改名。须回传原凭证 [type]；[channel] 映射为 API `changeType`。
  TaskEither<AppException, Unit> update(
    int qrCodeId, {
    required QrCodeType type,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  });

  TaskEither<AppException, QrCodeEntity> getData(int qrCodeId);

  TaskEither<AppException, Unit> delete(
    int lockId,
    int qrCodeId, {
    ChannelType channel = ChannelType.cloudOnly,
  });

  TaskEither<AppException, Unit> clear(int lockId);
}
