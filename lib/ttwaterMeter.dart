import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart';

@Deprecated('Use Stream<TTWaterMeterScanModel> from TTLock.accessory.startScanWaterMeter().')
typedef TTWaterMeterScanCallback = void Function(TTMeterScanModel scanModel);

@Deprecated('Use Future<TTWaterMeterInitResult> from TTLock.accessory.waterMeterInit(...).')
typedef TTWaterMeterInitCallback = void Function(TTWaterMeterInitResult initResult);

@Deprecated('Use Future<Map<String, Object?>> from TTLock.accessory.waterMeterGetDeviceInfo(waterMeterId).')
typedef TTWaterDeviceInfoCallback = void Function(Map<String, Object?> deviceInfo);

/// Legacy water meter API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory.*waterMeter* APIs instead.')
class TTWaterMeter {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_SERVER = 'waterMeterConfigServer';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'waterMeterStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'waterMeterStopScan';

  @Deprecated('Use TTLock.accessory.waterMeterConfigServer(...) instead.')
  static void configServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) {
    new_ttlock.TTLock.accessory.waterMeterConfigServer(
      url: url,
      clientId: clientId,
      accessToken: accessToken,
    );
  }

  @Deprecated('Use TTLock.accessory.startScanWaterMeter() and listen to the stream instead.')
  static void startScan(TTWaterMeterScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.waterMeterStartScan().listen(scanCallback);
  }

  @Deprecated('Use TTLock.accessory.stopScanWaterMeter() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.waterMeterStopScan();
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

  @Deprecated('Use TTLock.accessory.waterMeterConnect(mac) instead.')
  static void connect(String mac, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.waterMeterConnect(mac).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterDisconnect(mac) instead.')
  static void disconnect(String mac) {
    new_ttlock.TTLock.accessory.waterMeterDisconnect(mac);
  }

  @Deprecated('Use TTLock.accessory.waterMeterInit(...) instead.')
  static void init(Map<String, dynamic> info, TTWaterMeterInitCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.waterMeterInit(info).then(callback).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterDelete(waterMeterId) instead.')
  static void delete(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory.waterMeterDelete(waterMeterId).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterSetPowerOnOff(...) instead.')
  static void setPowerOnOff(String waterMeterId, bool isOn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterSetPowerOnOff(waterMeterId: waterMeterId, isOn: isOn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterSetRemainderM3(...) instead.')
  static void setRemainderM3(String waterMeterId, num remainderM3, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterSetRemainderM3(waterMeterId: waterMeterId, remainderM3: remainderM3)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterClearRemainderM3(...) instead.')
  static void clearRemainderM3(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterClearRemainderM3(waterMeterId: waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterReadData(...) instead.')
  static void readData(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterReadData(waterMeterId: waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterSetPayMode(...) instead.')
  static void setPayMode(String waterMeterId, int payMode, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterSetPayMode(waterMeterId: waterMeterId, payMode: payMode)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterCharge(...) instead.')
  static void charge(String waterMeterId, num amount, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterCharge(waterMeterId: waterMeterId, amount: amount)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterSetTotalUsage(...) instead.')
  static void setTotalUsage(String waterMeterId, num totalM3, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterSetTotalUsage(waterMeterId: waterMeterId, totalM3: totalM3)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterGetDeviceInfo(waterMeterId) instead.')
  static void getDeviceInfo(String waterMeterId, TTWaterDeviceInfoCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterGetDeviceInfo(waterMeterId)
        .then(callback)
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterConfigApn(...) instead.')
  static void configApn(String apn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterConfigApn(apn: apn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterConfigMeterServer(...) instead.')
  static void configMeterServer(String ip, String port, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterConfigMeterServer(ip: ip, port: port)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.accessory.waterMeterReset(waterMeterId) instead.')
  static void reset(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.accessory
        .waterMeterReset(waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }
}

