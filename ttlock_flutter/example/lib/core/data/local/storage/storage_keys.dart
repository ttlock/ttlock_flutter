// Callers: AppConfigRepository, UserProvider.
// Affected API: string key constants only.
// Schema: prefs keys app_config / user_session (unchanged).
// User: 「将id、密钥、用户信息等都缓存本地」
abstract final class StorageKeys {
  static const appConfig = 'app_config';
  static const userSession = 'user_session';
}
