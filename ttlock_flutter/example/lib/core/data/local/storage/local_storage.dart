// Callers: SharedPrefsStorage, AppConfigRepository, UserProvider, appStorageProvider.
// Affected API: LocalStorage save/get/remove/clear.
// Schema: opaque key-value; keys in StorageKeys.
// User: 「当前core只有网络请求，没有提供本地存储；将id、密钥、用户信息等都缓存本地」
abstract class LocalStorage {
  Future<void> save(String key, dynamic value);
  Future<T?> get<T>(String key);
  Future<void> remove(String key);
  Future<void> clear();
}
