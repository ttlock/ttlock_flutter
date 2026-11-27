import 'package:ttlock_flutter_demo/core/config/app_site.dart';

/// 添加时需要配置服务器地址的设备类型。
///
/// [hostSuffix] 与 [port] 与站点无关；域名前缀由 [AppSite] 决定。
enum DeviceServerKind {
  gateway('plug', 2999),
  wifiLock('wifilock', 4999),
  standaloneDoorSensor('ds', 5999),
  waterMeter('wm', 6999),
  electricMeter('em', 7999);

  const DeviceServerKind(this.hostSuffix, this.port);

  final String hostSuffix;
  final int port;
}

/// 设备上报服务器的地址与端口。
///
/// 仅 address + port，**不含 scheme、不含路径**——SDK 各参数位要么分开收
/// host/port，要么收 `host:port` 单串。
class DeviceServerEndpoint {
  const DeviceServerEndpoint({required this.address, required this.port});

  final String address;
  final int port;

  String get portString => '$port';

  String get addressWithPort => '$address:$port';

  @override
  bool operator ==(Object other) =>
      other is DeviceServerEndpoint &&
      other.address == address &&
      other.port == port;

  @override
  int get hashCode => Object.hash(address, port);

  @override
  String toString() => 'DeviceServerEndpoint($addressWithPort)';
}

/// 按站点解析端点。表是静态的，恒成功。
DeviceServerEndpoint resolveDeviceServerEndpoint(
  AppSite site,
  DeviceServerKind kind,
) {
  final prefix = site == AppSite.cn ? 'cn' : 'eu';
  return DeviceServerEndpoint(
    address: '$prefix${kind.hostSuffix}.ttlock.com',
    port: kind.port,
  );
}

/// 表计蓝牙指令 url 的站点主机。
///
/// **与云 API 基址 `AppSite.baseUrl` 不是一回事**：后者（`api.sciener.com` /
/// `euapi.sciener.com`）是本 App 调开放平台接口的地址，而表计设备侧要的是
/// `cnapi.ttlock.com` / `euapi.ttlock.com`。
String _meterCommandHost(AppSite site) =>
    site == AppSite.cn ? 'cnapi.ttlock.com' : 'euapi.ttlock.com';

/// 表计蓝牙指令端点 url（SDK `setClientParam(url, clientId, token)` 的入参）。
///
/// 形如 `https://cnapi.ttlock.com/v3/waterMeter/executeCommand`；SDK 把该 url
/// 原样存为 POST 目标，须带 scheme 与完整路径。
///
/// [apiPath] 为表计在开放平台的资源名（`waterMeter` / `electricMeter`）。
String resolveMeterCommandUrl(AppSite site, String apiPath) =>
    'https://${_meterCommandHost(site)}/v3/$apiPath/executeCommand';
