import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings/model/saved_device.dart';
import '../../features/settings/model/saved_lock_device.dart';

class LockStorage {
  static const _legacyKey = 'saved_devices';
  static const _key = 'saved_locks';

  Future<List<SavedLockDevice>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json != null) {
      final list = jsonDecode(json) as List;
      return list
          .map((e) => SavedLockDevice.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return _migrateLegacy(prefs);
  }

  Future<List<SavedLockDevice>> _migrateLegacy(SharedPreferences prefs) async {
    final legacy = prefs.getString(_legacyKey);
    if (legacy == null) return [];
    final list = jsonDecode(legacy) as List;
    final devices = list
        .map((e) => SavedDevice.fromJson(e as Map<String, dynamic>))
        .map(
          (d) => SavedLockDevice(
            name: d.name,
            mac: d.mac,
            lockData: d.lockData,
            initializedAt: d.initializedAt,
          ),
        )
        .toList();
    await save(devices);
    await prefs.remove(_legacyKey);
    return devices;
  }

  Future<void> save(List<SavedLockDevice> devices) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(devices.map((e) => e.toJson()).toList()),
    );
  }
}
