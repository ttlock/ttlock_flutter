import 'dart:async';

import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_remote_accessory_exception.dart';

@Deprecated('Use Stream<TTMeterScanModel> from TTLock.electricMeter.accessoryElectricMeterStartScan().')
typedef TTElectricMeterScanCallback = void Function(TTMeterScanModel scanModel);

@Deprecated('Use Future<TTElectricMeterInitResult> from TTLock.electricMeter.electricMeterInit(...).')
typedef TTElectricMeterInitCallback = void Function(TTElectricMeterInitResult initResult);

/// Legacy electricity meter API. Prefer [new_ttlock.TTLock.electricMeter] instead.
@Deprecated('Use TTLock.electricMeter.* APIs instead.')
class TTElectricMeter {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_SERVER = 'electricMeterConfigServer';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'electricMeterStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'electricMeterStopScan';

  static StreamSubscription<TTMeterScanModel>? _scanSub;

  @Deprecated('Use TTLock.electricMeter.electricMeterConfigServer(...) instead.')
  static void configServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) {
    new_ttlock.TTLock.electricMeter.electricMeterConfigServer(
      url,
      clientId,
      accessToken,
    );
  }

  @Deprecated('Use TTLock.electricMeter.accessoryElectricMeterStartScan() and listen to the stream instead.')
  static void startScan(TTElectricMeterScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.electricMeter.accessoryElectricMeterStartScan().listen(scanCallback);
  }

  @Deprecated('Cancel the subscription from accessoryElectricMeterStartScan().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  static void _fail(Object e, TTRemoteFailedCallback failedCallback) {
    if (e is TTRemoteAccessoryException) {
      failedCallback(e.code, e.message ?? '');
      return;
    }
    failedCallback(TTRemoteAccessoryError.failed, e.toString());
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterConnect(mac) instead.')
  static void connect(String mac, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter.electricMeterConnect(mac).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterDisconnect(mac) instead.')
  static void disconnect(String mac) {
    new_ttlock.TTLock.electricMeter.electricMeterDisconnect(mac);
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterInit(...) instead.')
  static void init(Map<String, dynamic> info, TTElectricMeterInitCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter.electricMeterInit(Map<String, Object?>.from(info)).then(callback).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterDelete(electricMeterId) instead.')
  static void delete(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter.electricMeterDelete(electricMeterId).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterSetPowerOnOff(...) instead.')
  static void setPowerOnOff(String electricMeterId, bool isOn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterSetPowerOnOff(electricMeterId, isOn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterSetRemainderKwh(...) instead.')
  static void setRemainderKwh(String electricMeterId, num remainderKwh, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterSetRemainderKwh(electricMeterId, remainderKwh.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterClearRemainderKwh(...) instead.')
  static void clearRemainderKwh(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterClearRemainderKwh(electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterReadData(...) instead.')
  static void readData(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterReadData(electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterSetPayMode(...) instead.')
  static void setPayMode(String electricMeterId, int payMode, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterSetPayMode(electricMeterId, payMode)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterCharge(...) instead.')
  static void charge(String electricMeterId, num amount, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterCharge(electricMeterId, amount.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterSetMaxPower(...) instead.')
  static void setMaxPower(String electricMeterId, num maxPower, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterSetMaxPower(electricMeterId, maxPower.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.electricMeter.electricMeterGetFeatureValue(...) instead.')
  static void getFeatureValue(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.electricMeter
        .electricMeterGetFeatureValue(electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }
}
