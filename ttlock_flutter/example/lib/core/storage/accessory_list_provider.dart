import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/model/saved_door_sensor.dart';
import '../../features/settings/model/saved_keypad.dart';
import '../../features/settings/model/saved_remote_key.dart';
import 'accessory_storage.dart';

part 'accessory_list_provider.g.dart';

final _accessoryStorage = AccessoryStorage();

@riverpod
class DoorSensorListNotifier extends _$DoorSensorListNotifier {
  @override
  Future<List<SavedDoorSensor>> build(String lockMac) async {
    final all = await _accessoryStorage.loadDoorSensors();
    return all.where((a) => a.boundLockMac == lockMac).toList();
  }

  Future<void> add(SavedDoorSensor device) async {
    final all = await _accessoryStorage.loadDoorSensors();
    await _accessoryStorage.saveDoorSensors([...all, device]);
    ref.invalidateSelf();
  }

  Future<void> remove(String mac) async {
    final all = await _accessoryStorage.loadDoorSensors();
    await _accessoryStorage
        .saveDoorSensors(all.where((d) => d.mac != mac).toList());
    ref.invalidateSelf();
  }

  Future<void> updateDevice(SavedDoorSensor device) async {
    final all = await _accessoryStorage.loadDoorSensors();
    await _accessoryStorage.saveDoorSensors(
      all.map((d) => d.mac == device.mac ? device : d).toList(),
    );
    ref.invalidateSelf();
  }
}

@riverpod
class RemoteKeyListNotifier extends _$RemoteKeyListNotifier {
  @override
  Future<List<SavedRemoteKey>> build(String lockMac) async {
    final all = await _accessoryStorage.loadRemoteKeys();
    return all.where((a) => a.boundLockMac == lockMac).toList();
  }

  Future<void> add(SavedRemoteKey device) async {
    final all = await _accessoryStorage.loadRemoteKeys();
    await _accessoryStorage.saveRemoteKeys([...all, device]);
    ref.invalidateSelf();
  }

  Future<void> remove(String mac) async {
    final all = await _accessoryStorage.loadRemoteKeys();
    await _accessoryStorage
        .saveRemoteKeys(all.where((d) => d.mac != mac).toList());
    ref.invalidateSelf();
  }

  Future<void> updateDevice(SavedRemoteKey device) async {
    final all = await _accessoryStorage.loadRemoteKeys();
    await _accessoryStorage.saveRemoteKeys(
      all.map((d) => d.mac == device.mac ? device : d).toList(),
    );
    ref.invalidateSelf();
  }
}

@riverpod
class KeypadListNotifier extends _$KeypadListNotifier {
  @override
  Future<List<SavedKeypad>> build(String lockMac) async {
    final all = await _accessoryStorage.loadKeypads();
    return all.where((a) => a.boundLockMac == lockMac).toList();
  }

  Future<void> add(SavedKeypad device) async {
    final all = await _accessoryStorage.loadKeypads();
    await _accessoryStorage.saveKeypads([...all, device]);
    ref.invalidateSelf();
  }

  Future<void> remove(String mac) async {
    final all = await _accessoryStorage.loadKeypads();
    await _accessoryStorage
        .saveKeypads(all.where((d) => d.mac != mac).toList());
    ref.invalidateSelf();
  }

  Future<void> updateDevice(SavedKeypad device) async {
    final all = await _accessoryStorage.loadKeypads();
    await _accessoryStorage.saveKeypads(
      all.map((d) => d.mac == device.mac ? device : d).toList(),
    );
    ref.invalidateSelf();
  }
}

@riverpod
Future<AccessoryCounts> accessoryCounts(Ref ref, String lockMac) async {
  final sensors =
      await ref.watch(doorSensorListNotifierProvider(lockMac).future);
  final keys = await ref.watch(remoteKeyListNotifierProvider(lockMac).future);
  final keypads = await ref.watch(keypadListNotifierProvider(lockMac).future);
  return AccessoryCounts(
    doorSensors: sensors.length,
    remoteKeys: keys.length,
    keypads: keypads.length,
  );
}

class AccessoryCounts {
  final int doorSensors;
  final int remoteKeys;
  final int keypads;

  const AccessoryCounts({
    required this.doorSensors,
    required this.remoteKeys,
    required this.keypads,
  });
}
