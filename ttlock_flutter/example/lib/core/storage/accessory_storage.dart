import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings/model/saved_door_sensor.dart';
import '../../features/settings/model/saved_keypad.dart';
import '../../features/settings/model/saved_remote_key.dart';

class AccessoryStorage {
  static const _key = 'saved_accessories';

  Future<List<SavedDoorSensor>> loadDoorSensors() async {
    final data = await _loadRaw();
    final list = data['door_sensors'] as List? ?? [];
    return list
        .map((e) => SavedDoorSensor.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SavedRemoteKey>> loadRemoteKeys() async {
    final data = await _loadRaw();
    final list = data['remote_keys'] as List? ?? [];
    return list
        .map((e) => SavedRemoteKey.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SavedKeypad>> loadKeypads() async {
    final data = await _loadRaw();
    final list = data['keypads'] as List? ?? [];
    return list
        .map((e) => SavedKeypad.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveDoorSensors(List<SavedDoorSensor> items) async {
    final data = await _loadRaw();
    data['door_sensors'] = items.map((e) => e.toJson()).toList();
    await _saveRaw(data);
  }

  Future<void> saveRemoteKeys(List<SavedRemoteKey> items) async {
    final data = await _loadRaw();
    data['remote_keys'] = items.map((e) => e.toJson()).toList();
    await _saveRaw(data);
  }

  Future<void> saveKeypads(List<SavedKeypad> items) async {
    final data = await _loadRaw();
    data['keypads'] = items.map((e) => e.toJson()).toList();
    await _saveRaw(data);
  }

  Future<Map<String, dynamic>> _loadRaw() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return {};
    return Map<String, dynamic>.from(jsonDecode(json) as Map);
  }

  Future<void> _saveRaw(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(data));
  }
}
