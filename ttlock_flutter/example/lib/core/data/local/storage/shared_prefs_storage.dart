// Callers: appStorageProvider → repositories.
// Affected API: LocalStorage impl over SharedPreferences.
// Schema: String/int/bool/double/List<String>/Map→JSON.
// User: core 本地存储抽象（方案 B）.
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/local_storage.dart';

class SharedPrefsStorage implements LocalStorage {
  SharedPrefsStorage(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else if (value is Map) {
      await _prefs.setString(key, jsonEncode(value));
    } else {
      throw UnsupportedError('Unsupported type: ${value.runtimeType}');
    }
  }

  @override
  Future<T?> get<T>(String key) async {
    final value = _prefs.get(key);
    if (value == null) return null;

    if (T == String || T == int || T == bool || T == double) {
      return value as T;
    }
    if (T == List<String>) {
      return _prefs.getStringList(key) as T?;
    }
    if (value is String) {
      try {
        return jsonDecode(value) as T;
      } catch (_) {
        return value as T;
      }
    }
    return null;
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
