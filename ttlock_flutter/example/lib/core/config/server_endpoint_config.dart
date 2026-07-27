import '../env/app_mode.dart';
import '../../features/settings/model/config_model.dart';

/// 需要配置服务器地址的设备类型。
enum DeviceServerKind {
  gateway,
  wifiLock,
  standaloneDoorSensor,
  waterMeter,
  electricMeter,
}

class ServerEndpoint {
  const ServerEndpoint({required this.address, required this.port});

  final String address;
  final String port;

  bool get isValid => address.isNotEmpty && port.isNotEmpty;
}

ServerEndpoint resolveServerEndpoint(
  ServerRegion region,
  DeviceServerKind kind,
) {
  final isChina = region == ServerRegion.china;
  return switch (kind) {
    DeviceServerKind.gateway => ServerEndpoint(
        address: isChina ? 'cnplug.ttlock.com' : 'euplug.ttlock.com',
        port: '2999',
      ),
    DeviceServerKind.wifiLock => ServerEndpoint(
        address: isChina ? 'cnwifilock.ttlock.com' : 'euwifilock.ttlock.com',
        port: '4999',
      ),
    DeviceServerKind.standaloneDoorSensor => ServerEndpoint(
        address: isChina ? 'cnds.ttlock.com' : 'euds.ttlock.com',
        port: '5999',
      ),
    DeviceServerKind.waterMeter => ServerEndpoint(
        address: isChina ? 'cnwm.ttlock.com' : 'euwm.ttlock.com',
        port: '6999',
      ),
    DeviceServerKind.electricMeter => ServerEndpoint(
        address: isChina ? 'cnem.ttlock.com' : 'euem.ttlock.com',
        port: '7999',
      ),
  };
}

extension ConfigModelServerEndpoint on ConfigModel {
  ServerEndpoint defaultServerEndpoint(DeviceServerKind kind) {
    if (AppEnv.isOnline) {
      return resolveServerEndpoint(serverRegion, kind);
    }
    return ServerEndpoint(
      address: serverIp ?? '',
      port: serverPort ?? '',
    );
  }
}
