import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'lock_local_cache.dart';

class LockLocalStorage {
  static String _key(String mac) => 'lock_local_$mac';

  Future<LockLocalCache?> load(String mac) async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key(mac));
    if (json == null) return null;
    return LockLocalCache.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> save(String mac, LockLocalCache cache) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key(mac), jsonEncode(cache.toJson()));
  }

  Future<LockLocalCache> loadOrEmpty(String mac) async =>
      await load(mac) ?? const LockLocalCache();

  Future<void> patch(
    String mac,
    LockLocalCache Function(LockLocalCache current) update,
  ) async {
    final current = await loadOrEmpty(mac);
    await save(mac, update(current));
  }

  Future<void> delete(String mac) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key(mac));
  }
}
