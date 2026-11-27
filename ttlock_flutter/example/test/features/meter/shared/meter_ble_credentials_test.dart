import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ble_credentials.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_kind.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _FakeAppConfigDomain extends AppConfigDomain {
  _FakeAppConfigDomain(this._config);
  final AppConfig _config;

  @override
  void build() {}

  @override
  TaskEither<AppException, AppConfig> load() => TaskEither.right(_config);
}

class _FakeUserProvider extends UserProvider {
  _FakeUserProvider(this._session);
  final UserSession? _session;

  @override
  UserSession? build() => _session;
}

const _session = UserSession(accessToken: 'tok', refreshToken: 'r');

ProviderContainer _container({
  required AppConfig config,
  UserSession? session,
}) {
  final c = ProviderContainer(
    overrides: [
      appConfigDomainProvider.overrideWith(() => _FakeAppConfigDomain(config)),
      userProvider.overrideWith(() => _FakeUserProvider(session)),
    ],
  );
  addTearDown(c.dispose);
  return c;
}

void main() {
  const config = AppConfig(
    clientId: 'cid',
    clientSecret: 'sec',
    site: AppSite.cn,
  );

  test('电表返回表计专用域名下的电表指令 url', () async {
    final c = _container(config: config, session: _session);
    final r = await c
        .read(meterBleCredentialsResolverProvider.notifier)
        .resolve(MeterKind.electric)
        .run();
    expect(r.isRight(), isTrue);
    final creds = r.getRight().toNullable()!;
    expect(
      creds.url,
      'https://cnapi.ttlock.com/v3/electricMeter/executeCommand',
    );
    expect(creds.clientId, 'cid');
    expect(creds.token, 'tok');
  });

  test('水表返回水表指令 url', () async {
    final c = _container(config: config, session: _session);
    final r = await c
        .read(meterBleCredentialsResolverProvider.notifier)
        .resolve(MeterKind.water)
        .run();
    expect(
      r.getRight().toNullable()!.url,
      'https://cnapi.ttlock.com/v3/waterMeter/executeCommand',
    );
  });

  test('clientId 为空时返回 business(-32)', () async {
    final c = _container(
      config: const AppConfig(site: AppSite.cn),
      session: _session,
    );
    final r = await c
        .read(meterBleCredentialsResolverProvider.notifier)
        .resolve(MeterKind.electric)
        .run();
    expect(r.isLeft(), isTrue);
    expect((r.getLeft().toNullable()! as AppBusinessException).code, -32);
  });

  test('token 为空时返回 business(-32)', () async {
    final c = _container(config: config, session: null);
    final r = await c
        .read(meterBleCredentialsResolverProvider.notifier)
        .resolve(MeterKind.electric)
        .run();
    expect((r.getLeft().toNullable()! as AppBusinessException).code, -32);
  });
}
