import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_repository_interface.dart';

part 'app_config_domain.g.dart';

@Riverpod(keepAlive: true)
class AppConfigDomain extends _$AppConfigDomain {
  AppConfigRepositoryInterface get _repository =>
      ref.watch(appConfigRepositoryProvider.notifier);

  @override
  void build() {}

  TaskEither<AppException, AppConfig> load() => _repository.load();

  TaskEither<AppException, void> save(AppConfig config) =>
      _repository.save(config);

  /// 按当前站点解析设备的服务器端点。
  ///
  /// 表是静态的，恒成功；`load()` 的失败面沿既有 `TaskEither` 透传。
  TaskEither<AppException, DeviceServerEndpoint> endpointFor(
    DeviceServerKind kind,
  ) => load().map((config) => resolveDeviceServerEndpoint(config.site, kind));
}
