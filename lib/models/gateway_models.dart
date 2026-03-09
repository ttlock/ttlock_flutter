import 'dart:convert' as convert;

class TTGatewayInitParams {
  final int type;
  final int ttlockUid;
  final String? gatewayName;
  final String ttlockLoginPassword;
  final String? wifi;
  final String? wifiPassword;
  final String? serverIp;
  final String? serverPort;
  final int? companyId;
  final int? branchId;

  const TTGatewayInitParams({
    required this.type,
    required this.ttlockUid,
    this.gatewayName,
    this.ttlockLoginPassword = '123456',
    this.wifi,
    this.wifiPassword,
    this.serverIp,
    this.serverPort,
    this.companyId,
    this.branchId,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'type': type,
      'ttlockUid': ttlockUid,
      'ttlockLoginPassword': ttlockLoginPassword,
    };
    if (gatewayName != null) map['gatewayName'] = gatewayName;
    if (wifi != null) map['wifi'] = wifi;
    if (wifiPassword != null) map['wifiPassword'] = wifiPassword;
    if (serverIp != null) map['serverIp'] = serverIp;
    if (serverPort != null) map['serverPort'] = serverPort;
    if (companyId != null) map['companyId'] = companyId;
    if (branchId != null) map['branchId'] = branchId;
    return map;
  }

  String toJsonStr() => convert.jsonEncode(toMap());
}
