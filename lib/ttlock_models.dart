/// Parameter class for [TTLock.initLock].
/// Keys in [toMap] match Android TtlockModel / iOS dict for initLock.
class TTLockInitParams {
  TTLockInitParams({
    required this.lockMac,
    required this.lockVersion,
    required this.isInited,
    this.clientPara,
    this.hotelInfo,
    this.buildingNumber,
    this.floorNumber,
  });

  final String lockMac;
  final String lockVersion;
  final bool isInited;
  final String? clientPara;
  final String? hotelInfo;
  final int? buildingNumber;
  final int? floorNumber;

  /// Map for platform channel. Keys match native TtlockModel fields.
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'lockMac': lockMac,
      'lockVersion': lockVersion,
      'isInited': isInited,
    };
    if (clientPara != null) map['clientPara'] = clientPara;
    if (hotelInfo != null) map['hotelInfo'] = hotelInfo;
    if (buildingNumber != null) map['buildingNumber'] = buildingNumber;
    if (floorNumber != null) map['floorNumber'] = floorNumber;
    return map;
  }
}

/// IP setting for lock/gateway configIp. Type: 0 = manual/static, 1 = automatic/DHCP.
/// Use [TTIpSettingType] index for [type].
class TTIpSetting {
  TTIpSetting({
    required this.type,
    this.ipAddress,
    this.subnetMask,
    this.router,
    this.preferredDns,
    this.alternateDns,
  });

  /// 0 = STATIC_IP, 1 = DHCP (see [TTIpSettingType]).
  final int type;
  final String? ipAddress;
  final String? subnetMask;
  final String? router;
  final String? preferredDns;
  final String? alternateDns;

  /// Map for platform channel. Keys match native IpSetting JSON.
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{'type': type};
    if (ipAddress != null) map['ipAddress'] = ipAddress;
    if (subnetMask != null) map['subnetMask'] = subnetMask;
    if (router != null) map['router'] = router;
    if (preferredDns != null) map['preferredDns'] = preferredDns;
    if (alternateDns != null) map['alternateDns'] = alternateDns;
    return map;
  }
}

/// Parameter class for [TTGateway.init].
/// Keys in [toMap] match Android GatewayModel / iOS addGatewayJsonStr dict.
class TTGatewayInitParams {
  TTGatewayInitParams({
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

  /// Gateway type index (e.g. [TTGatewayType.index]).
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

  /// Map for platform channel. Keys match native GatewayModel fields.
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
}
