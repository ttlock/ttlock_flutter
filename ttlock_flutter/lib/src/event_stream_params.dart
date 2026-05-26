import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

/// 凭证类 EventChannel 默认有效期：自 [startMs] 起 30 天（仅 Dart 层便利默认值，原生不再硬编码）。
int defaultCredentialEndMs(int startMs) => startMs + 30 * 24 * 3600 * 1000;

int credentialStartMsOrNow(int? startDate) =>
    startDate ?? DateTime.now().millisecondsSinceEpoch;

pigeon.TTLockCredentialEventParam buildLockCredentialParam({
  required String lockData,
  List<pigeon.TTCycleModel>? cycleList,
  int? startDate,
  int? endDate,
}) {
  final start = credentialStartMsOrNow(startDate);
  return pigeon.TTLockCredentialEventParam(
    lockData: lockData,
    cycleList: cycleList,
    startDate: start,
    endDate: endDate ?? defaultCredentialEndMs(start),
  );
}

pigeon.TTKeypadCredentialEventParam buildKeypadCredentialParam({
  required String keypadMac,
  required String lockData,
  bool isMultifunctional = true,
  List<pigeon.TTCycleModel>? cycleList,
  int? startDate,
  int? endDate,
}) {
  final start = credentialStartMsOrNow(startDate);
  return pigeon.TTKeypadCredentialEventParam(
    keypadMac: keypadMac,
    lockData: lockData,
    isMultifunctional: isMultifunctional,
    cycleList: cycleList,
    startDate: start,
    endDate: endDate ?? defaultCredentialEndMs(start),
  );
}
