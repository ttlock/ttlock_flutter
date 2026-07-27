import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/config/server_endpoint_config.dart';
import 'package:ttlock_flutter_example/features/settings/model/config_model.dart';

void main() {
  group('resolveServerEndpoint', () {
    test('gateway china', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.china,
        DeviceServerKind.gateway,
      );
      expect(endpoint.address, 'cnplug.ttlock.com');
      expect(endpoint.port, '2999');
    });

    test('gateway global', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.global,
        DeviceServerKind.gateway,
      );
      expect(endpoint.address, 'euplug.ttlock.com');
      expect(endpoint.port, '2999');
    });

    test('wifi lock china', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.china,
        DeviceServerKind.wifiLock,
      );
      expect(endpoint.address, 'cnwifilock.ttlock.com');
      expect(endpoint.port, '4999');
    });

    test('standalone door sensor global', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.global,
        DeviceServerKind.standaloneDoorSensor,
      );
      expect(endpoint.address, 'euds.ttlock.com');
      expect(endpoint.port, '5999');
    });

    test('water meter china', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.china,
        DeviceServerKind.waterMeter,
      );
      expect(endpoint.address, 'cnwm.ttlock.com');
      expect(endpoint.port, '6999');
    });

    test('electric meter global', () {
      final endpoint = resolveServerEndpoint(
        ServerRegion.global,
        DeviceServerKind.electricMeter,
      );
      expect(endpoint.address, 'euem.ttlock.com');
      expect(endpoint.port, '7999');
    });
  });

  group('ConfigModel.defaultServerEndpoint offline', () {
    test('uses configured server ip and port', () {
      const config = ConfigModel(
        uid: 1,
        serverIp: '10.0.0.1',
        serverPort: '8080',
      );
      final endpoint =
          config.defaultServerEndpoint(DeviceServerKind.gateway);
      expect(endpoint.address, '10.0.0.1');
      expect(endpoint.port, '8080');
    });
  });
}
