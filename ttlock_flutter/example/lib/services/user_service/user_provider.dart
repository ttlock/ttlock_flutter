// Callers: main restore, UserService, app_router, Dio token.
// Affected API: persist via LocalStorage; restore drops empty accessToken.
// Schema: StorageKeys.userSession JSON unchanged.
// User: 用户信息本地缓存；空 token 不进 App.
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/storage_keys.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';

part 'user_provider.g.dart';

@Deprecated('Use StorageKeys.userSession')
const kUserSessionPrefsKey = StorageKeys.userSession;

@Riverpod(keepAlive: true)
class UserProvider extends _$UserProvider {
  @override
  UserSession? build() => null;

  Future<void> setSession(UserSession? s) async {
    state = s;
    await _persist(s);
  }

  Future<void> restore() async {
    final session = await _read();
    if (session == null || session.accessToken.isEmpty) {
      if (session != null) await _clear();
      state = null;
      return;
    }
    state = session;
  }

  Future<void> logout() async {
    state = null;
    await _clear();
  }

  Future<void> _persist(UserSession? s) async {
    final storage = ref.read(appStorageProvider);
    if (s == null) {
      await storage.remove(StorageKeys.userSession);
      return;
    }
    await storage.save(StorageKeys.userSession, {
      'accessToken': s.accessToken,
      'refreshToken': s.refreshToken,
      'uid': s.uid,
      'expiresIn': s.expiresIn,
      'loginName': s.loginName,
      'obtainedAt': s.obtainedAt,
    });
  }

  Future<UserSession?> _read() async {
    final storage = ref.read(appStorageProvider);
    final raw = await storage.get<String>(StorageKeys.userSession);
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return UserSession(
        accessToken: map['accessToken'] as String? ?? '',
        refreshToken: map['refreshToken'] as String? ?? '',
        uid: (map['uid'] as num?)?.toInt() ?? 0,
        expiresIn: (map['expiresIn'] as num?)?.toInt() ?? 0,
        loginName: map['loginName'] as String? ?? '',
        obtainedAt: (map['obtainedAt'] as num?)?.toInt() ?? 0,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> _clear() async {
    final storage = ref.read(appStorageProvider);
    await storage.remove(StorageKeys.userSession);
  }
}

/// riverpod_annotation 2.6 无 `name:`，class UserProvider 生成 [userProviderProvider]。
/// 对外暴露 brief / Task 7 约定的 `userProvider`。
final userProvider = userProviderProvider;
