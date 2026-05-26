import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/settings/model/saved_gateway_device.dart';

class GatewayStorage {
  static const _key = 'saved_gateways';

  Future<List<SavedGatewayDevice>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list
        .map((e) => SavedGatewayDevice.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<SavedGatewayDevice> devices) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(devices.map((e) => e.toJson()).toList()),
    );
  }
}
