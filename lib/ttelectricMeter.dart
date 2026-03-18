import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';
import 'package:ttlock_premise_flutter/models/meter_models.dart';

@Deprecated('Use Stream<TTElectricMeterScanModel> from TTLock.accessory.startScanElectricMeter().')
typedef TTElectricMeterScanCallback = void Function(TTMeterScanModel scanModel);

@Deprecated('Use Future<TTElectricMeterInitResult> from TTLock.accessory.electricMeterInit(...).')
typedef TTElectricMeterInitCallback = void Function(TTElectricMeterInitResult initResult);

/// Legacy electricity meter API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory.*electricMeter* APIs instead.')
class TTElectricMeter {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_SERVER = 'electricMeterConfigServer';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'electricMeterStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'electricMeterStopScan';

  @Deprecated('Use TTLock.accessory.electricMeterConfigServer(...) instead.')
  static void configServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) {
    new_ttlock.TTLock.accessory.electricMeterConfigServer(
      url: url,
      clientId: clientId,
      accessToken: accessToken,
    );
  }

  @Deprecated('Use TTLock.accessory.startScanElectricMeter() and listen to the stream instead.')
  static void startScan(TTElectricMeterScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.electricMeterStartScan().listen(scanCallback);
  }

  @Deprecated('Use TTLock.accessory.stopScanElectricMeter() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.electricMeterStopScan();
  }

  static void _fail(Object e, TTRemoteFailedCallback failedCallback) {
    if (e is TTAccessoryException) {
      final error = e.code >= 0 && e.code < TTRemoteAccessoryError.values.length
          ? TTRemoteAccessoryError.values[e.code]
          : TTRemoteAccessoryError.fail;
      failedCallback(error, e.message);
      return;
    }
    failedCallback(TTRemoteAccessoryError.fail, e.toString());
  }

  @Deprecated('Use TTLock.accessory.electricMeterConnect(mac) instead.')
  static void connect(String mac, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.electricMeterConnect(mac).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterDisconnect(mac) instead.')
  static void disconnect(String mac) {
    new_ttlock.TTLock.accessory.electricMeterDisconnect(mac);
  }

  @Deprecated('Use TTLock.accessory.electricMeterInit(...) instead.')
  static void init(Map<String, dynamic> info, TTElectricMeterInitCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.electricMeterInit(info).then(callback).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterDelete(electricMeterId) instead.')
  static void delete(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.electricMeterDelete(electricMeterId).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterSetPowerOnOff(...) instead.')
  static void setPowerOnOff(String electricMeterId, bool isOn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterSetPowerOnOff(electricMeterId: electricMeterId, isOn: isOn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterSetRemainderKwh(...) instead.')
  static void setRemainderKwh(String electricMeterId, num remainderKwh, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterSetRemainderKwh(electricMeterId: electricMeterId, remainderKwh: remainderKwh)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterClearRemainderKwh(...) instead.')
  static void clearRemainderKwh(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterClearRemainderKwh(electricMeterId: electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterReadData(...) instead.')
  static void readData(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterReadData(electricMeterId: electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterSetPayMode(...) instead.')
  static void setPayMode(String electricMeterId, int payMode, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterSetPayMode(electricMeterId: electricMeterId, payMode: payMode)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterCharge(...) instead.')
  static void charge(String electricMeterId, num amount, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterCharge(electricMeterId: electricMeterId, amount: amount)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterSetMaxPower(...) instead.')
  static void setMaxPower(String electricMeterId, num maxPower, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterSetMaxPower(electricMeterId: electricMeterId, maxPower: maxPower)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.electricMeterGetFeatureValue(...) instead.')
  static void getFeatureValue(String electricMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .electricMeterGetFeatureValue(electricMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }
}

