import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings/model/saved_standalone_door_sensor.dart';

class StandaloneDoorSensorStorage {
  static const _key = 'saved_standalone_door_sensors';

  Future<List<SavedStandaloneDoorSensor>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list
        .map((e) =>
            SavedStandaloneDoorSensor.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<SavedStandaloneDoorSensor> devices) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(devices.map((e) => e.toJson()).toList()),
    );
  }
}
