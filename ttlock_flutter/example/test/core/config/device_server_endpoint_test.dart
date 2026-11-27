import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';

void main() {
  group('resolveDeviceServerEndpoint 国内站点', () {
    const cases = <DeviceServerKind, (String, int)>{
      DeviceServerKind.gateway: ('cnplug.ttlock.com', 2999),
      DeviceServerKind.wifiLock: ('cnwifilock.ttlock.com', 4999),
      DeviceServerKind.standaloneDoorSensor: ('cnds.ttlock.com', 5999),
      DeviceServerKind.waterMeter: ('cnwm.ttlock.com', 6999),
      DeviceServerKind.electricMeter: ('cnem.ttlock.com', 7999),
    };

    for (final entry in cases.entries) {
      test('${entry.key.name} → ${entry.value.$1}:${entry.value.$2}', () {
        final ep = resolveDeviceServerEndpoint(AppSite.cn, entry.key);
        expect(ep.address, entry.value.$1);
        expect(ep.port, entry.value.$2);
      });
    }
  });

  group('resolveDeviceServerEndpoint 国外站点', () {
    const cases = <DeviceServerKind, (String, int)>{
      DeviceServerKind.gateway: ('euplug.ttlock.com', 2999),
      DeviceServerKind.wifiLock: ('euwifilock.ttlock.com', 4999),
      DeviceServerKind.standaloneDoorSensor: ('euds.ttlock.com', 5999),
      DeviceServerKind.waterMeter: ('euwm.ttlock.com', 6999),
      DeviceServerKind.electricMeter: ('euem.ttlock.com', 7999),
    };

    for (final entry in cases.entries) {
      test('${entry.key.name} → ${entry.value.$1}:${entry.value.$2}', () {
        final ep = resolveDeviceServerEndpoint(AppSite.overseas, entry.key);
        expect(ep.address, entry.value.$1);
        expect(ep.port, entry.value.$2);
      });
    }
  });

  test('portString 与 addressWithPort 不带 scheme', () {
    final ep = resolveDeviceServerEndpoint(
      AppSite.cn,
      DeviceServerKind.waterMeter,
    );
    expect(ep.portString, '6999');
    expect(ep.addressWithPort, 'cnwm.ttlock.com:6999');
    expect(ep.addressWithPort.contains('://'), isFalse);
  });

  group('resolveMeterCommandUrl 表计蓝牙指令 url', () {
    test('国内 → cnapi.ttlock.com', () {
      expect(
        resolveMeterCommandUrl(AppSite.cn, 'waterMeter'),
        'https://cnapi.ttlock.com/v3/waterMeter/executeCommand',
      );
    });

    test('国外 → euapi.ttlock.com', () {
      expect(
        resolveMeterCommandUrl(AppSite.overseas, 'electricMeter'),
        'https://euapi.ttlock.com/v3/electricMeter/executeCommand',
      );
    });

    test('主机取自站点专用域名，不用云 API 基址', () {
      for (final site in AppSite.values) {
        final url = resolveMeterCommandUrl(site, 'waterMeter');
        expect(url, isNot(contains(site.baseUrl)));
        expect(url, isNot(contains('sciener.com')));
      }
    });
  });
}
