// Callers: AppConfigDomain/Service, Standalone for tests, main via providers.
// Affected API: persists via core LocalStorage; sharedPreferencesProvider re-exported from core.
// Schema: prefs key StorageKeys.appConfig JSON {clientId,clientSecret,site}.
// User: id/密钥本地缓存；core 本地存储.
import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/local_storage.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/shared_prefs_storage.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/storage_keys.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_dto.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/config_json_loader.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_repository_interface.dart';

/// Backward-compatible export for existing imports/tests.
export 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart'
    show sharedPreferencesProvider;

part 'app_config_repository.g.dart';

@Deprecated('Use StorageKeys.appConfig')
const kAppConfigPrefsKey = StorageKeys.appConfig;

@Riverpod(keepAlive: true)
class AppConfigRepository extends _$AppConfigRepository
    implements AppConfigRepositoryInterface {
  late final ConfigJsonLoader _loader;
  late final LocalStorage _storage;

  @override
  void build() {
    _loader = ref.watch(configJsonLoaderProvider);
    _storage = ref.watch(appStorageProvider);
  }

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.tryCatch(
    () async {
      final persisted = await _fromStorage(_storage);
      if (persisted != null) return persisted;
      try {
        final json = await _loader.load();
        return AppConfigDto.fromJson(json).toEntity();
      } catch (_) {
        return const AppConfig();
      }
    },
    (error, stackTrace) => AppException.unknown(
      message: '加载应用配置失败: $error',
      error: error,
      stackTrace: stackTrace,
    ),
  );

  @override
  TaskEither<AppException, void> save(AppConfig config) => TaskEither.tryCatch(
    () async {
      final dto = AppConfigDto.fromEntity(config);
      await _storage.save(StorageKeys.appConfig, jsonEncode(dto.toJson()));
    },
    (error, stackTrace) => AppException.database(
      message: '保存应用配置失败: $error',
      stackTrace: stackTrace,
    ),
  );
}

/// Standalone repository for [AppConfigService] test constructor (no Riverpod).
class StandaloneAppConfigRepository implements AppConfigRepositoryInterface {
  StandaloneAppConfigRepository({
    required ConfigJsonLoader loader,
    required SharedPreferences prefs,
  }) : _loader = loader,
       _storage = SharedPrefsStorage(prefs);

  final ConfigJsonLoader _loader;
  final LocalStorage _storage;

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.tryCatch(
    () async {
      final persisted = await _fromStorage(_storage);
      if (persisted != null) return persisted;
      try {
        final json = await _loader.load();
        return AppConfigDto.fromJson(json).toEntity();
      } catch (_) {
        return const AppConfig();
      }
    },
    (error, stackTrace) => AppException.unknown(
      message: '加载应用配置失败: $error',
      error: error,
      stackTrace: stackTrace,
    ),
  );

  @override
  TaskEither<AppException, void> save(AppConfig config) => TaskEither.tryCatch(
    () async {
      final dto = AppConfigDto.fromEntity(config);
      await _storage.save(StorageKeys.appConfig, jsonEncode(dto.toJson()));
    },
    (error, stackTrace) => AppException.database(
      message: '保存应用配置失败: $error',
      stackTrace: stackTrace,
    ),
  );
}

Future<AppConfig?> _fromStorage(LocalStorage storage) async {
  final raw = await storage.get<String>(StorageKeys.appConfig);
  if (raw == null || raw.isEmpty) return null;
  try {
    return AppConfigDto.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    ).toEntity();
  } catch (_) {
    return null;
  }
}
