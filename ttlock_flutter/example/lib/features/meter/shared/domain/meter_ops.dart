import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_channel.dart';

/// 执行一次设备操作：云优先、失败回退 BLE。
///
/// - [online] 为假时**不发起云调用**，直接走 [ble]。
/// - 云通道失败且属于「设备不可达类」时回退 [ble]。
///   TODO(spec §9 风险 4): 实现后用真机摸清云侧错误码，收紧到具体码。
/// - [ble] 也失败时**抛出云侧原始错误** —— 否则「参数非法」会表现为一个
///   与真实原因无关的 BLE 错误（仓库既有的 `lock_domain.dart:114-119`
///   就有这个缺陷，本设计不沿用）。
///
/// 仅限 Domain 内部调用，且必须包在 `TaskEither.tryCatch` 里。
Future<T> runMeterOp<T>({
  required bool online,
  required Future<T> Function() cloud,
  required Future<T> Function() ble,
}) async {
  if (resolveMeterChannel(online: online) == MeterChannel.ble) {
    return ble();
  }

  final AppException cloudError;
  try {
    return await cloud();
  } on AppException catch (e) {
    if (!e.isNetworkException && !e.isBusinessException) rethrow;
    cloudError = e;
  }

  try {
    return await ble();
  } on AppException {
    throw cloudError;
  }
}
