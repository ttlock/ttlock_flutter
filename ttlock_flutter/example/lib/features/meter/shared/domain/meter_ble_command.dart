import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_credentials.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_kind.dart';

typedef MeterBleCredsCall = Future<void> Function(
  MeterKind kind,
  MeterBleCredentials credentials,
);

Future<void> _defaultSetClientParam(
  MeterKind kind,
  MeterBleCredentials c,
) => switch (kind) {
  MeterKind.water => TTLock.waterMeter.waterMeterSetClientParam(
    c.url,
    c.clientId,
    c.token,
  ),
  MeterKind.electric => TTLock.electricMeter.electricMeterSetClientParam(
    c.url,
    c.clientId,
    c.token,
  ),
};

/// 在**已绑定表**上执行一条 BLE 指令。
///
/// 只重设客户端凭证，**不 connect / 不 disconnect** —— 连接只在绑定时需要
/// （见各 domain 的 `connectMeter`），绑定后的指令由 SDK 自行处理链路。
/// 凭证在 SDK 侧是内存态，添加流程之外（例如进程重启后）从未被设过，
/// 故每条指令都必须重设。
///
/// [setClientParam] 暴露为可选参数仅为可测性，生产调用方一律用默认值。
Future<T> runMeterBleCommand<T>({
  required MeterKind kind,
  required MeterBleCredentials credentials,
  required Future<T> Function() action,
  MeterBleCredsCall? setClientParam,
}) async {
  final setParam = setClientParam ?? _defaultSetClientParam;
  await runBle(() => setParam(kind, credentials));
  return action();
}
