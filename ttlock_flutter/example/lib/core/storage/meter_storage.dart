import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings/model/saved_meter_device.dart';

class MeterStorage {
  static const _key = 'saved_meters';

  Future<List<SavedMeterDevice>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list
        .map((e) => SavedMeterDevice.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<SavedMeterDevice> devices) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(devices.map((e) => e.toJson()).toList()),
    );
  }
}
