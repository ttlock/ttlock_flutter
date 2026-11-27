// Callers: main override, AppConfigRepository, UserProvider, all tests using prefs.
// Affected API: sharedPreferencesProvider moved to core; appStorageProvider added.
// Schema: none beyond SharedPreferences.
// User: core 本地存储；main 注入 prefs.
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/local_storage.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/shared_prefs_storage.dart';

part 'app_storage.g.dart';

/// Override in `main` with [SharedPreferences.getInstance].
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'Override sharedPreferencesProvider with SharedPreferences.getInstance() at startup',
  );
}

@Riverpod(keepAlive: true)
LocalStorage appStorage(Ref ref) =>
    SharedPrefsStorage(ref.watch(sharedPreferencesProvider));
