import 'dart:async';

import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_remote_accessory_exception.dart';
@Deprecated('Use Stream<TTMeterScanModel> from TTLock.waterMeter.accessoryWaterMeterStartScan().')
typedef TTWaterMeterScanCallback = void Function(TTMeterScanModel scanModel);

@Deprecated('Use Future<TTWaterMeterInitResult> from TTLock.waterMeter.waterMeterInit(...).')
typedef TTWaterMeterInitCallback = void Function(TTWaterMeterInitResult initResult);

@Deprecated('Use Future<Map<String, Object?>> from TTLock.waterMeter.waterMeterGetDeviceInfo(waterMeterId).')
typedef TTWaterDeviceInfoCallback = void Function(Map<String, Object?> deviceInfo);

/// Legacy water meter API. Prefer [new_ttlock.TTLock.waterMeter] instead.
@Deprecated('Use TTLock.waterMeter.* APIs instead.')
class TTWaterMeter {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_SERVER = 'waterMeterConfigServer';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'waterMeterStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'waterMeterStopScan';

  static StreamSubscription<TTMeterScanModel>? _scanSub;

  @Deprecated('Use TTLock.waterMeter.waterMeterConfigServer(...) instead.')
  static void configServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) {
    new_ttlock.TTLock.waterMeter.waterMeterConfigServer(
      url,
      clientId,
      accessToken,
    );
  }

  @Deprecated('Use TTLock.waterMeter.accessoryWaterMeterStartScan() and listen to the stream instead.')
  static void startScan(TTWaterMeterScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.waterMeter.accessoryWaterMeterStartScan().listen(scanCallback);
  }

  @Deprecated('Cancel the subscription from accessoryWaterMeterStartScan().')
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

  @Deprecated('Use TTLock.waterMeter.waterMeterConnect(mac) instead.')
  static void connect(String mac, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter.waterMeterConnect(mac).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterDisconnect(mac) instead.')
  static void disconnect(String mac) {
    new_ttlock.TTLock.waterMeter.waterMeterDisconnect(mac);
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterInit(...) instead.')
  static void init(Map<String, dynamic> info, TTWaterMeterInitCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter.waterMeterInit(Map<String, Object?>.from(info)).then(callback).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterDelete(waterMeterId) instead.')
  static void delete(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter.waterMeterDelete(waterMeterId).then((_) => callback()).catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterSetPowerOnOff(...) instead.')
  static void setPowerOnOff(String waterMeterId, bool isOn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterSetPowerOnOff(waterMeterId, isOn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterSetRemainderM3(...) instead.')
  static void setRemainderM3(String waterMeterId, num remainderM3, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterSetRemainderM3(waterMeterId, remainderM3.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterClearRemainderM3(...) instead.')
  static void clearRemainderM3(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterClearRemainderM3(waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterReadData(...) instead.')
  static void readData(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterReadData(waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterSetPayMode(...) instead.')
  static void setPayMode(String waterMeterId, int payMode, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterSetPayMode(waterMeterId, payMode)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterCharge(...) instead.')
  static void charge(String waterMeterId, num amount, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterCharge(waterMeterId, amount.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterSetTotalUsage(...) instead.')
  static void setTotalUsage(String waterMeterId, num totalM3, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterSetTotalUsage(waterMeterId, totalM3.toDouble())
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterGetDeviceInfo(waterMeterId) instead.')
  static void getDeviceInfo(String waterMeterId, TTWaterDeviceInfoCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterGetDeviceInfo(waterMeterId)
        .then((info) {
      callback(<String, Object?>{
        'catOneCardNumber': info.catOneCardNumber,
        'catOneImsi': info.catOneImsi,
        'catOneNodeId': info.catOneNodeId,
        'catOneOperator': info.catOneOperator,
        'catOneRssi': info.catOneRssi,
      });
    }).catchError((e, _) {
      _fail(e, failedCallback);
    });
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterConfigApn(...) instead.')
  static void configApn(String apn, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterConfigApn(apn)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterConfigMeterServer(...) instead.')
  static void configMeterServer(String ip, String port, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterConfigMeterServer(ip, port)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }

  @Deprecated('Use TTLock.waterMeter.waterMeterReset(waterMeterId) instead.')
  static void reset(String waterMeterId, TTSuccessCallback callback, TTRemoteFailedCallback failedCallback) {
    new_ttlock.TTLock.waterMeter
        .waterMeterReset(waterMeterId)
        .then((_) => callback())
        .catchError((e, _) => _fail(e, failedCallback));
  }
}
