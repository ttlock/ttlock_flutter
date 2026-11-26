import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

import 'pigeon_errors.dart';

/// 固件升级。
///
/// 进度流本身不加默认 45s 超时；仅 `setUpgrade*Param` 与 `stopUpgrade*`
/// 经 [runUpgradeApi] 使用 BleTimeout 短超时。
///
/// Android 上 [upgradeGateway] 对同一 `gatewayMac` 再次订阅表示按 `dfuType` 重试。
/// 水电表固件包升级须先调用 `waterMeterSetClientParam` / `electricMeterSetClientParam`。
class TTUpgradeApi {
  TTUpgradeApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTUpgradeHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTUpgradeHostApi _host;

  pigeon.TTUpgradeHostApi get host => _host;

  Stream<pigeon.TTUpgradeEvent> _open(
    Future<void> Function() setParam,
    String method,
    Stream<pigeon.TTUpgradeEvent> Function({String instanceName}) openStream,
  ) {
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runUpgradeApi(setParam, method: method),
      ).asyncExpand((_) => mapUpgradeStreamErrors(openStream())),
    );
  }

  /// 锁固件包升级。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeLock({
    required String lockMac,
    required String lockData,
    required String firmwarePackage,
  }) {
    final param = pigeon.TTUpgradeLockParam(
      lockMac: lockMac,
      lockData: lockData,
      firmwarePackage: firmwarePackage,
    );
    return _open(
      () => _host.setUpgradeLockParam(param),
      'setUpgradeLockParam',
      pigeon.upgradeLock,
    );
  }

  /// 网关网络 DFU。
  ///
  /// Android：同一 [gatewayMac] 再次订阅表示按 [dfuType] 重试。
  /// 流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeGateway({
    required pigeon.TTDfuType dfuType,
    required String clientId,
    required String accessToken,
    required int gatewayId,
    required String gatewayMac,
  }) {
    final param = pigeon.TTUpgradeGatewayParam(
      dfuType: dfuType,
      clientId: clientId,
      accessToken: accessToken,
      gatewayId: gatewayId,
      gatewayMac: gatewayMac,
    );
    return _open(
      () => _host.setUpgradeGatewayParam(param),
      'setUpgradeGatewayParam',
      pigeon.upgradeGateway,
    );
  }

  /// 网关固件包升级。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeGatewayByPackage({
    required String firmwarePackage,
    required String gatewayMac,
  }) {
    final param = pigeon.TTUpgradeGatewayByPackageParam(
      firmwarePackage: firmwarePackage,
      gatewayMac: gatewayMac,
    );
    return _open(
      () => _host.setUpgradeGatewayByPackageParam(param),
      'setUpgradeGatewayByPackageParam',
      pigeon.upgradeGatewayByPackage,
    );
  }

  /// 水表网络升级。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeWaterMeter({
    required String clientId,
    required String accessToken,
    required int deviceId,
    required String deviceMac,
  }) {
    final param = pigeon.TTUpgradeWaterMeterParam(
      clientId: clientId,
      accessToken: accessToken,
      deviceId: deviceId,
      deviceMac: deviceMac,
    );
    return _open(
      () => _host.setUpgradeWaterMeterParam(param),
      'setUpgradeWaterMeterParam',
      pigeon.upgradeWaterMeter,
    );
  }

  /// 水表固件包升级。
  ///
  /// 须先对该水表调用 `waterMeterSetClientParam`。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeWaterMeterByPackage({
    required int deviceId,
    required String deviceMac,
    required String firmwarePackage,
  }) {
    final param = pigeon.TTUpgradeWaterMeterByPackageParam(
      deviceId: deviceId,
      deviceMac: deviceMac,
      firmwarePackage: firmwarePackage,
    );
    return _open(
      () => _host.setUpgradeWaterMeterByPackageParam(param),
      'setUpgradeWaterMeterByPackageParam',
      pigeon.upgradeWaterMeterByPackage,
    );
  }

  /// 电表网络升级。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeElectricMeter({
    required String clientId,
    required String accessToken,
    required int deviceId,
    required String deviceMac,
  }) {
    final param = pigeon.TTUpgradeElectricMeterParam(
      clientId: clientId,
      accessToken: accessToken,
      deviceId: deviceId,
      deviceMac: deviceMac,
    );
    return _open(
      () => _host.setUpgradeElectricMeterParam(param),
      'setUpgradeElectricMeterParam',
      pigeon.upgradeElectricMeter,
    );
  }

  /// 电表固件包升级。
  ///
  /// 须先对该电表调用 `electricMeterSetClientParam`。流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeElectricMeterByPackage({
    required int deviceId,
    required String deviceMac,
    required String firmwarePackage,
  }) {
    final param = pigeon.TTUpgradeElectricMeterByPackageParam(
      deviceId: deviceId,
      deviceMac: deviceMac,
      firmwarePackage: firmwarePackage,
    );
    return _open(
      () => _host.setUpgradeElectricMeterByPackageParam(param),
      'setUpgradeElectricMeterByPackageParam',
      pigeon.upgradeElectricMeterByPackage,
    );
  }

  /// 键盘网络升级。
  ///
  /// [lockData] / [slotNumber] / [featureValue] 可选，缺省由原生按空串 / 0 处理。
  /// 流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeKeypad({
    required String clientId,
    required String accessToken,
    required int deviceId,
    required String deviceMac,
    String? lockData,
    int? slotNumber,
    String? featureValue,
  }) {
    final param = pigeon.TTUpgradeKeypadParam(
      clientId: clientId,
      accessToken: accessToken,
      deviceId: deviceId,
      deviceMac: deviceMac,
      lockData: lockData,
      slotNumber: slotNumber,
      featureValue: featureValue,
    );
    return _open(
      () => _host.setUpgradeKeypadParam(param),
      'setUpgradeKeypadParam',
      pigeon.upgradeKeypad,
    );
  }

  /// 键盘固件包升级。
  ///
  /// [lockData] / [slotNumber] / [featureValue] 可选，缺省由原生按空串 / 0 处理。
  /// 流无默认 45s 超时。
  Stream<pigeon.TTUpgradeEvent> upgradeKeypadByPackage({
    required int deviceId,
    required String deviceMac,
    required String firmwarePackage,
    String? lockData,
    int? slotNumber,
    String? featureValue,
  }) {
    final param = pigeon.TTUpgradeKeypadByPackageParam(
      deviceId: deviceId,
      deviceMac: deviceMac,
      firmwarePackage: firmwarePackage,
      lockData: lockData,
      slotNumber: slotNumber,
      featureValue: featureValue,
    );
    return _open(
      () => _host.setUpgradeKeypadByPackageParam(param),
      'setUpgradeKeypadByPackageParam',
      pigeon.upgradeKeypadByPackage,
    );
  }

  /// 停止锁升级。短超时，不作用于进度流。
  Future<void> stopUpgradeLock() => runUpgradeApi(
        () => _host.stopUpgradeLock(),
        method: 'stopUpgradeLock',
      );

  /// 停止网关升级（网络 DFU 与固件包共用）。短超时，不作用于进度流。
  Future<void> stopUpgradeGateway() => runUpgradeApi(
        () => _host.stopUpgradeGateway(),
        method: 'stopUpgradeGateway',
      );

  /// 停止水表升级。不得 abort 锁或网关 DFU。
  Future<void> stopUpgradeWaterMeter() => runUpgradeApi(
        () => _host.stopUpgradeWaterMeter(),
        method: 'stopUpgradeWaterMeter',
      );

  /// 停止电表升级。不得 abort 锁或网关 DFU。
  Future<void> stopUpgradeElectricMeter() => runUpgradeApi(
        () => _host.stopUpgradeElectricMeter(),
        method: 'stopUpgradeElectricMeter',
      );

  /// 停止键盘升级。不得 abort 锁或网关 DFU。
  Future<void> stopUpgradeKeypad() => runUpgradeApi(
        () => _host.stopUpgradeKeypad(),
        method: 'stopUpgradeKeypad',
      );
}
