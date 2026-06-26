import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/gateway_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/storage/meter_list_provider.dart';
import '../../features/settings/model/saved_door_sensor.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../features/settings/model/saved_keypad.dart';
import '../../features/settings/model/saved_lock_device.dart';
import '../../features/settings/model/saved_meter_device.dart';
import '../../features/settings/model/saved_remote_key.dart';
import '../../features/lock/lock_cache_initializer.dart';
import '../../providers/ttlock_providers.dart';
import 'scan_config.dart';

part 'scan_provider.g.dart';

bool gatewayNeedsWifi(TTGatewayType type) {
  return type == TTGatewayType.g2 ||
      type == TTGatewayType.g5 ||
      type == TTGatewayType.g6;
}

class DiscoveredDevice {
  final DeviceType type;
  final String name;
  final String mac;
  final int rssi;
  final bool isInited;
  final TTLockVersion? lockVersion;
  final bool isMultifunctionalKeypad;
  final TTGatewayType? gatewayType;

  DiscoveredDevice({
    required this.type,
    required this.name,
    required this.mac,
    required this.rssi,
    this.isInited = false,
    this.lockVersion,
    this.isMultifunctionalKeypad = false,
    this.gatewayType,
  });
}

class ScanState {
  final ScanConfig config;
  final DeviceType? selectedType;
  final bool isScanning;
  final List<DiscoveredDevice> devices;
  final String? error;

  const ScanState({
    required this.config,
    this.selectedType,
    this.isScanning = false,
    this.devices = const [],
    this.error,
  });
}

@riverpod
class ScanNotifier extends _$ScanNotifier {
  final List<StreamSubscription<dynamic>> _subs = [];

  @override
  ScanState build(ScanConfig config) {
    ref.onDispose(_cancelAll);
    final selected = config.isAccessory
        ? config.deviceType
        : config.deviceType;
    return ScanState(config: config, selectedType: selected);
  }

  void selectType(DeviceType type) {
    stopScan();
    state = ScanState(
      config: state.config,
      selectedType: type,
      devices: const [],
    );
  }

  Future<void> startScan() async {
    final type = state.selectedType;
    if (type == null) return;
    stopScan();
    state = ScanState(
      config: state.config,
      selectedType: type,
      isScanning: true,
      devices: const [],
    );
    final devices = <DiscoveredDevice>[];

    void update() {
      state = ScanState(
        config: state.config,
        selectedType: type,
        isScanning: true,
        devices: List.from(devices),
      );
    }

    void onError(Object e) {
      state = ScanState(
        config: state.config,
        selectedType: type,
        isScanning: false,
        devices: state.devices,
        error: e.toString(),
      );
    }

    switch (type) {
      case DeviceType.lock:
        _subs.add(TTLock.lock.lockScanLock().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.lockMac);
            devices.add(DiscoveredDevice(
              type: DeviceType.lock,
              name: m.lockName,
              mac: m.lockMac,
              rssi: m.rssi,
              isInited: m.isInited,
              lockVersion: m.lockVersion,
            ));
            devices.sort((a, b) => (a.isInited ? 1 : 0) - (b.isInited ? 1 : 0));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.gateway:
        _subs.add(TTLock.gateway.gatewayStartScan().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.gatewayMac);
            devices.add(DiscoveredDevice(
              type: DeviceType.gateway,
              name: m.gatewayName,
              mac: m.gatewayMac,
              rssi: m.rssi,
              gatewayType: m.type,
            ));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.doorSensor:
        _subs.add(TTLock.doorSensor.accessoryStartScanDoorSensor().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.mac);
            devices.add(DiscoveredDevice(
              type: DeviceType.doorSensor,
              name: m.name,
              mac: m.mac,
              rssi: m.rssi,
            ));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.remoteKey:
        _subs.add(TTLock.remoteKey.accessoryStartScanRemoteKey().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.mac);
            devices.add(DiscoveredDevice(
              type: DeviceType.remoteKey,
              name: m.name,
              mac: m.mac,
              rssi: m.rssi,
            ));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.keypad:
        _subs.add(TTLock.remoteKeypad.accessoryStartScanRemoteKeypad().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.mac);
            devices.add(DiscoveredDevice(
              type: DeviceType.keypad,
              name: m.name,
              mac: m.mac,
              rssi: m.rssi,
              isMultifunctionalKeypad: m.isMultifunctionalKeypad,
            ));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.waterMeter:
        _subs.add(TTLock.waterMeter.accessoryWaterMeterStartScan().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.mac);
            devices.add(DiscoveredDevice(
              type: DeviceType.waterMeter,
              name: m.name,
              mac: m.mac,
              rssi: m.rssi,
            ));
            update();
          },
          onError: onError,
        ));
        break;
      case DeviceType.electricMeter:
        _subs.add(
            TTLock.electricMeter.accessoryElectricMeterStartScan().listen(
          (m) {
            devices.removeWhere((d) => d.mac == m.mac);
            devices.add(DiscoveredDevice(
              type: DeviceType.electricMeter,
              name: m.name,
              mac: m.mac,
              rssi: m.rssi,
            ));
            update();
          },
          onError: onError,
        ));
        break;
    }
  }

  void stopScan() {
    _cancelAll();
    state = ScanState(
      config: state.config,
      selectedType: state.selectedType,
      isScanning: false,
      devices: state.devices,
    );
  }

  void _cancelAll() {
    for (final s in _subs) {
      s.cancel();
    }
    _subs.clear();
  }

  Future<InitResult> initDevice(DiscoveredDevice device) async {
    final now = DateTime.now();
    try {
      switch (device.type) {
        case DeviceType.lock:
          if (device.lockVersion == null) {
            return InitResult.failure('Lock version missing');
          }
          final api = ref.read(lockApiProvider);
          final lockData = await api.initLock(TTLockInitParams(
            lockMac: device.mac,
            lockVersion: device.lockVersion!,
            isInited: device.isInited,
          ));
          await initializeLockLocalCache(
            api: api,
            lockMac: device.mac,
            lockData: lockData,
          );
          await ref.read(lockListNotifierProvider.notifier).addDevice(
                SavedLockDevice.fromLockVersion(
                  name: device.name,
                  mac: device.mac,
                  lockData: lockData,
                  lockVersion: device.lockVersion!,
                  initializedAt: now,
                ),
              );
          return InitResult.lock(device.mac);

        case DeviceType.gateway:
          final api = ref.read(gatewayApiProvider);
          final gatewayType = device.gatewayType ?? TTGatewayType.g2;
          final status = await runGatewayApi(() => api.connect(device.mac));
          if (status != TTGatewayConnectStatus.success) {
            return InitResult.failure('Gateway connect failed');
          }
          await ref.read(gatewayListNotifierProvider.notifier).addDevice(
                SavedGatewayDevice(
                  name: device.name,
                  mac: device.mac,
                  initializedAt: now,
                ),
              );
          return InitResult.gateway(
            device.mac,
            gatewayType: gatewayType,
            needsWifi: gatewayNeedsWifi(gatewayType),
          );

        case DeviceType.doorSensor:
          final lockData = state.config.lockData!;
          final lockMac = state.config.lockMac!;
          await runRemoteAccessoryApi(() => ref
              .read(doorSensorApiProvider)
              .initDoorSensor(device.mac, lockData));
          await ref
              .read(doorSensorListNotifierProvider(lockMac).notifier)
              .add(SavedDoorSensor(
                name: device.name,
                mac: device.mac,
                boundLockMac: lockMac,
                initializedAt: now,
              ));
          return InitResult.doorSensor(device.mac);

        case DeviceType.remoteKey:
          final lockData = state.config.lockData!;
          final lockMac = state.config.lockMac!;
          await runRemoteAccessoryApi(() => ref
              .read(remoteKeyApiProvider)
              .initRemoteKey(device.mac, lockData));
          await ref
              .read(remoteKeyListNotifierProvider(lockMac).notifier)
              .add(SavedRemoteKey(
                name: device.name,
                mac: device.mac,
                boundLockMac: lockMac,
                initializedAt: now,
              ));
          return InitResult.remoteKey(device.mac);

        case DeviceType.keypad:
          final lockData = state.config.lockData!;
          final lockMac = state.config.lockMac!;
          if (device.isMultifunctionalKeypad) {
            await runMultifunctionalKeypadInit(() => ref
                .read(remoteKeypadApiProvider)
                .initMultifunctionalKeypad(device.mac, lockData));
          } else {
            await runRemoteAccessoryApi(() => ref
                .read(remoteKeypadApiProvider)
                .initRemoteKeypad(device.mac, lockMac));
          }
          await ref.read(keypadListNotifierProvider(lockMac).notifier).add(
                SavedKeypad(
                  name: device.name,
                  mac: device.mac,
                  boundLockMac: lockMac,
                  isMultiFunction: device.isMultifunctionalKeypad,
                  initializedAt: now,
                ),
              );
          return InitResult.keypad(device.mac);

        case DeviceType.waterMeter:
          final result = await ref.read(waterMeterApiProvider).waterMeterInit(
                TTWaterMeterInitParam(
                  mac: device.mac,
                  name: device.name,
                  payMode: TTMeterPayMode.postpaid,
                  price: 0,
                ),
              );
          await ref.read(meterListNotifierProvider.notifier).addDevice(
                SavedMeterDevice(
                  name: device.name,
                  mac: device.mac,
                  meterId: result.waterMeterId.toString(),
                  meterType: 'water',
                  initializedAt: now,
                ),
              );
          return InitResult.waterMeter(device.mac);

        case DeviceType.electricMeter:
          final result = await ref.read(electricMeterApiProvider).electricMeterInit(
                TTElectricMeterInitParam(
                  mac: device.mac,
                  name: device.name,
                  payMode: TTMeterPayMode.postpaid,
                  price: 0,
                ),
              );
          await ref.read(meterListNotifierProvider.notifier).addDevice(
                SavedMeterDevice(
                  name: device.name,
                  mac: device.mac,
                  meterId: result.electricMeterId.toString(),
                  meterType: 'electric',
                  initializedAt: now,
                ),
              );
          return InitResult.electricMeter(device.mac);
      }
    } catch (e) {
      toastification.show(
        title: Text('Init failed: $e'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
      );
      return InitResult.failure(e.toString());
    }
  }
}

sealed class InitResult {
  const InitResult();

  factory InitResult.failure(String message) = InitFailure;

  factory InitResult.lock(String mac) = InitLock;
  factory InitResult.gateway(
    String mac, {
    required TTGatewayType gatewayType,
    required bool needsWifi,
  }) = InitGateway;
  factory InitResult.doorSensor(String mac) = InitDoorSensor;
  factory InitResult.remoteKey(String mac) = InitRemoteKey;
  factory InitResult.keypad(String mac) = InitKeypad;
  factory InitResult.waterMeter(String id) = InitWaterMeter;
  factory InitResult.electricMeter(String id) = InitElectricMeter;
}

class InitFailure extends InitResult {
  final String message;
  const InitFailure(this.message);
}

class InitLock extends InitResult {
  final String mac;
  const InitLock(this.mac);
}

class InitGateway extends InitResult {
  final String mac;
  final TTGatewayType gatewayType;
  final bool needsWifi;
  const InitGateway(
    this.mac, {
    required this.gatewayType,
    required this.needsWifi,
  });
}

class InitDoorSensor extends InitResult {
  final String mac;
  const InitDoorSensor(this.mac);
}

class InitRemoteKey extends InitResult {
  final String mac;
  const InitRemoteKey(this.mac);
}

class InitKeypad extends InitResult {
  final String mac;
  const InitKeypad(this.mac);
}

class InitWaterMeter extends InitResult {
  final String id;
  const InitWaterMeter(this.id);
}

class InitElectricMeter extends InitResult {
  final String id;
  const InitElectricMeter(this.id);
}
