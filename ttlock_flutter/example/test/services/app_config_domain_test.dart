import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';

// `appConfigRepositoryProvider` 的 override 需要具体 notifier 类型
// `AppConfigRepository`（其 `build()` 会 watch loader/storage），因此桩继承它
// 并把 `build()` 置空，只覆写数据方法。
class _FixedSiteAppConfigRepository extends AppConfigRepository {
  _FixedSiteAppConfigRepository(this._config);
  final AppConfig _config;

  @override
  void build() {}

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.right(_config);

  @override
  TaskEither<AppException, void> save(AppConfig config) =>
      TaskEither.right(null);
}

class _FailingLoadAppConfigRepository extends AppConfigRepository {
  @override
  void build() {}

  @override
  TaskEither<AppException, AppConfig> load() =>
      TaskEither.left(AppException.business(code: -1, message: 'load failed'));

  @override
  TaskEither<AppException, void> save(AppConfig config) =>
      TaskEither.right(null);
}

void main() {
  group('endpointFor', () {
    test('国内站点 → cn 前缀域名', () async {
      final container = ProviderContainer(
        overrides: [
          appConfigRepositoryProvider.overrideWith(
            () => _FixedSiteAppConfigRepository(
              const AppConfig(site: AppSite.cn),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(appConfigDomainProvider.notifier)
          .endpointFor(DeviceServerKind.gateway)
          .run();

      expect(result.isRight(), isTrue);
      expect(
        result.getRight().toNullable()?.addressWithPort,
        'cnplug.ttlock.com:2999',
      );
    });

    test('国外站点 → eu 前缀域名', () async {
      final container = ProviderContainer(
        overrides: [
          appConfigRepositoryProvider.overrideWith(
            () => _FixedSiteAppConfigRepository(
              const AppConfig(site: AppSite.overseas),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(appConfigDomainProvider.notifier)
          .endpointFor(DeviceServerKind.standaloneDoorSensor)
          .run();

      expect(result.isRight(), isTrue);
      expect(
        result.getRight().toNullable()?.addressWithPort,
        'euds.ttlock.com:5999',
      );
    });

    test('load 失败 → Left 透传', () async {
      final container = ProviderContainer(
        overrides: [
          appConfigRepositoryProvider.overrideWith(
            _FailingLoadAppConfigRepository.new,
          ),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(appConfigDomainProvider.notifier)
          .endpointFor(DeviceServerKind.gateway)
          .run();

      expect(result.isLeft(), isTrue);
    });
  });
}
