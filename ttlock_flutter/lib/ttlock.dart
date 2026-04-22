/// TTLock Flutter Plugin (On-Premise).
///
/// 基于 Pigeon 的 Future/Stream API。通过 [TTLock.lock]、[TTLock.gateway] 及各类配件入口访问。
///
/// ```dart
/// final subscription = TTLock.lock.lockScanLock().listen((model) {
///   print('Found: ${model.lockName}');
/// });
///
/// try {
///   final lockData = await TTLock.lock.initLock(params);
/// } on TTLockException catch (e) {
///   print('Error: ${e.code}');
/// }
/// ```
library ttlock_flutter;

export 'package:ttlock_flutter/src/tt_door_sensor_api.dart';
export 'package:ttlock_flutter/src/tt_electric_meter_api.dart';
export 'package:ttlock_flutter/src/tt_gateway_api.dart';
export 'package:ttlock_flutter/src/tt_lock_api.dart';
export 'package:ttlock_flutter/src/tt_remote_key_api.dart';
export 'package:ttlock_flutter/src/tt_remote_keypad_api.dart';
export 'package:ttlock_flutter/src/tt_water_meter_api.dart';
export 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' hide TTLockHostApi, TTAccessoryHostApi, TTGatewayHostApi;

export 'package:ttlock_flutter/errors/errors.dart';

import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/tt_door_sensor_api.dart';
import 'package:ttlock_flutter/src/tt_electric_meter_api.dart';
import 'package:ttlock_flutter/src/tt_gateway_api.dart';
import 'package:ttlock_flutter/src/tt_lock_api.dart';
import 'package:ttlock_flutter/src/tt_remote_key_api.dart';
import 'package:ttlock_flutter/src/tt_remote_keypad_api.dart';
import 'package:ttlock_flutter/src/tt_water_meter_api.dart';

/// 插件入口：单例访问各 [TT*Api]。
class TTLock {
  TTLock._();

  static BinaryMessenger? _binaryMessenger;
  static String _messageChannelSuffix = '';

  static TTLockApi? _lock;
  static TTGatewayApi? _gateway;
  static TTRemoteKeyApi? _remoteKey;
  static TTRemoteKeypadApi? _remoteKeypad;
  static TTDoorSensorApi? _doorSensor;
  static TTWaterMeterApi? _waterMeter;
  static TTElectricMeterApi? _electricMeter;

  /// 锁（扫描、初始化、开锁、密码/卡/指纹等）。
  static TTLockApi get lock => _lock ??= TTLockApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 网关（连接、初始化、配网等）。
  static TTGatewayApi get gateway => _gateway ??= TTGatewayApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 无线钥匙（初始化、已存锁列表等）。
  static TTRemoteKeyApi get remoteKey => _remoteKey ??= TTRemoteKeyApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 无线键盘 / 多功能键盘。
  static TTRemoteKeypadApi get remoteKeypad => _remoteKeypad ??= TTRemoteKeypadApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 门磁（挂锁门磁、独立门磁）。
  static TTDoorSensorApi get doorSensor => _doorSensor ??= TTDoorSensorApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 水表。
  static TTWaterMeterApi get waterMeter => _waterMeter ??= TTWaterMeterApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 电表。
  static TTElectricMeterApi get electricMeter => _electricMeter ??= TTElectricMeterApi(
        binaryMessenger: _binaryMessenger,
        messageChannelSuffix: _messageChannelSuffix,
      );

  /// 设置默认 [BinaryMessenger] / 通道后缀（如测试环境），并清空已缓存的 API 实例。
  static void configurePigeon({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    if (binaryMessenger != null) {
      _binaryMessenger = binaryMessenger;
    }
    _messageChannelSuffix = messageChannelSuffix;
    _clearCachedApis();
  }

  static void _clearCachedApis() {
    _lock = null;
    _gateway = null;
    _remoteKey = null;
    _remoteKeypad = null;
    _doorSensor = null;
    _waterMeter = null;
    _electricMeter = null;
  }

  /// 兼容占位；日志由原生 Pigeon 实现侧处理。
  static bool printLog = false;

  /// 注入自定义实现（测试用）。
  static void setImplementations({
    TTLockApi? lockApi,
    TTGatewayApi? gatewayApi,
    TTRemoteKeyApi? remoteKeyApi,
    TTRemoteKeypadApi? remoteKeypadApi,
    TTDoorSensorApi? doorSensorApi,
    TTWaterMeterApi? waterMeterApi,
    TTElectricMeterApi? electricMeterApi,
  }) {
    if (lockApi != null) _lock = lockApi;
    if (gatewayApi != null) _gateway = gatewayApi;
    if (remoteKeyApi != null) _remoteKey = remoteKeyApi;
    if (remoteKeypadApi != null) _remoteKeypad = remoteKeypadApi;
    if (doorSensorApi != null) _doorSensor = doorSensorApi;
    if (waterMeterApi != null) _waterMeter = waterMeterApi;
    if (electricMeterApi != null) _electricMeter = electricMeterApi;
  }
}
