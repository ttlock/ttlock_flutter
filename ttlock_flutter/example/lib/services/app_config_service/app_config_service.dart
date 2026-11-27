import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/config_json_loader.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';

part 'app_config_service.g.dart';

@Riverpod(keepAlive: true)
class AppConfigService extends _$AppConfigService {
  AppConfigService({ConfigJsonLoader? loader, SharedPreferences? prefs})
    : _loader = loader,
      _prefs = prefs;

  final ConfigJsonLoader? _loader;
  final SharedPreferences? _prefs;
  AppConfig _standalone = const AppConfig();

  bool get _standaloneMode => _loader != null && _prefs != null;

  @override
  AppConfig build() => const AppConfig();

  AppConfig get current => _standaloneMode ? _standalone : state;

  Future<void> init() async {
    final result = await _load().run();
    result.fold((_) {}, _setCurrent);
  }

  Future<void> update(AppConfig config) async {
    final result = await _save(config).run();
    result.fold((_) {}, (_) => _setCurrent(config));
  }

  void _setCurrent(AppConfig config) {
    if (_standaloneMode) {
      _standalone = config;
    } else {
      state = config;
    }
  }

  TaskEither<AppException, AppConfig> _load() {
    if (_standaloneMode) {
      return StandaloneAppConfigRepository(
        loader: _loader!,
        prefs: _prefs!,
      ).load();
    }
    return ref.read(appConfigDomainProvider.notifier).load();
  }

  TaskEither<AppException, void> _save(AppConfig config) {
    if (_standaloneMode) {
      return StandaloneAppConfigRepository(
        loader: _loader!,
        prefs: _prefs!,
      ).save(config);
    }
    return ref.read(appConfigDomainProvider.notifier).save(config);
  }
}
