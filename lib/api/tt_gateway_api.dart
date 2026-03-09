import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/models/gateway_models.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';

/// Abstract interface for gateway operations.
///
/// Access via [TTLock.gateway]. One-shot operations return [Future] and throw
/// [TTGatewayException] on failure. Scanning returns [Stream].
abstract class TTGatewayApi {
  /// Starts scanning for nearby gateways; returns a stream of [TTGatewayScanModel].
  ///
  /// Call [stopScan] or cancel the subscription to stop.
  Stream<TTGatewayScanModel> startScan();

  /// Stops scanning for gateways.
  ///
  /// Throws [TTGatewayException] on failure.
  Future<void> stopScan();

  /// Connects to the gateway identified by [mac].
  ///
  /// Returns [TTGatewayConnectStatus]. Throws [TTGatewayException] on failure.
  Future<TTGatewayConnectStatus> connect(String mac);

  /// Disconnects from the gateway identified by [mac].
  ///
  /// Throws [TTGatewayException] on failure.
  Future<void> disconnect(String mac);

  /// Scans for nearby WiFi networks via the currently connected gateway.
  ///
  /// Each emission is a batch of WiFi entries. The stream closes when scanning is complete.
  /// Throws [TTGatewayException] if not connected or on failure.
  Stream<List<dynamic>> getNearbyWifi();

  /// Initializes (adds) a gateway with [params]; returns the init result map.
  ///
  /// Throws [TTGatewayException] on failure.
  Future<Map<String, dynamic>> init(TTGatewayInitParams params);

  /// Configures the gateway's IP settings using [ipSetting].
  ///
  /// Throws [TTGatewayException] on failure.
  Future<void> configIp(TTIpSetting ipSetting);

  /// Configures the APN for the gateway [mac] to [apn].
  ///
  /// Throws [TTGatewayException] on failure.
  Future<void> configApn({required String mac, required String apn});

  /// Puts the gateway identified by [mac] into upgrade (DFU) mode.
  ///
  /// Throws [TTGatewayException] on failure.
  Future<void> enterUpgradeMode(String mac);
}
