import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/config_json_loader.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';

class _FakeJsonLoader implements ConfigJsonLoader {
  _FakeJsonLoader(this.json);
  final String json;
  @override
  Future<Map<String, dynamic>> load() async =>
      jsonDecode(json) as Map<String, dynamic>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  test('持久化覆盖 config.json，config.json 覆盖默认', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('app_config');
    final service = AppConfigService(
      loader: _FakeJsonLoader(
        '{"clientId":"fromJson","clientSecret":"","site":"cn"}',
      ),
      prefs: prefs,
    );
    await service.init();
    expect(service.current.clientId, 'fromJson');

    await service.update(
      const AppConfig(
        clientId: 'fromPrefs',
        clientSecret: '',
        site: AppSite.overseas,
      ),
    );
    expect(service.current.clientId, 'fromPrefs');
    expect(service.current.site.baseUrl, 'https://euapi.sciener.com');

    final reloaded = AppConfigService(
      loader: _FakeJsonLoader(
        '{"clientId":"fromJson","clientSecret":"","site":"cn"}',
      ),
      prefs: prefs,
    );
    await reloaded.init();
    expect(reloaded.current.clientId, 'fromPrefs');
    expect(reloaded.current.site, AppSite.overseas);
  });

  test('无持久化且 json 缺省时用默认', () async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('app_config');
    final service = AppConfigService(
      loader: _FakeJsonLoader('{}'),
      prefs: prefs,
    );
    await service.init();
    expect(service.current.clientId, '');
    expect(service.current.clientSecret, '');
    expect(service.current.site, AppSite.cn);
    expect(service.current.site.baseUrl, 'https://api.sciener.com');
  });
}
