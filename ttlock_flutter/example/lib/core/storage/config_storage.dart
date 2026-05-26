import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../features/settings/model/config_model.dart';

class ConfigStorage {
  static const _key = 'app_config';

  Future<ConfigModel> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return const ConfigModel();
    try {
      return ConfigModel.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (_) {
      return const ConfigModel();
    }
  }

  Future<void> save(ConfigModel config) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(config.toJson()));
  }
}
