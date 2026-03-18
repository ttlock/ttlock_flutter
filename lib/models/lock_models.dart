import 'dart:convert' as convert;

class ControlLockResult {
  final int lockTime;
  final int electricQuantity;
  final int uniqueId;
  final String? lockData;

  const ControlLockResult({
    required this.lockTime,
    required this.electricQuantity,
    required this.uniqueId,
    this.lockData,
  });

  factory ControlLockResult.fromMap(Map<String, dynamic> map) {
    return ControlLockResult(
      lockTime: map['lockTime'] as int,
      electricQuantity: map['electricQuantity'] as int,
      uniqueId: map['uniqueId'] as int,
      lockData: map['lockData'] as String?,
    );
  }

  ControlLockResult copyWith({
    int? lockTime,
    int? electricQuantity,
    int? uniqueId,
    String? lockData,
  }) {
    return ControlLockResult(
      lockTime: lockTime ?? this.lockTime,
      electricQuantity: electricQuantity ?? this.electricQuantity,
      uniqueId: uniqueId ?? this.uniqueId,
      lockData: lockData ?? this.lockData,
    );
  }
}

class AutoLockingTime {
  final int currentTime;
  final int minTime;
  final int maxTime;

  const AutoLockingTime({
    required this.currentTime,
    required this.minTime,
    required this.maxTime,
  });

  factory AutoLockingTime.fromMap(Map<String, dynamic> map) {
    return AutoLockingTime(
      currentTime: map['currentTime'] as int,
      minTime: map['minTime'] as int,
      maxTime: map['maxTime'] as int,
    );
  }

  AutoLockingTime copyWith({
    int? currentTime,
    int? minTime,
    int? maxTime,
  }) {
    return AutoLockingTime(
      currentTime: currentTime ?? this.currentTime,
      minTime: minTime ?? this.minTime,
      maxTime: maxTime ?? this.maxTime,
    );
  }
}

class AccessoryElectricQuantityResult {
  final int electricQuantity;
  final int updateDate;

  const AccessoryElectricQuantityResult({
    required this.electricQuantity,
    required this.updateDate,
  });

  factory AccessoryElectricQuantityResult.fromMap(Map<String, dynamic> map) {
    return AccessoryElectricQuantityResult(
      electricQuantity: map['electricQuantity'] as int,
      updateDate: map['updateDate'] as int,
    );
  }

  AccessoryElectricQuantityResult copyWith({
    int? electricQuantity,
    int? updateDate,
  }) {
    return AccessoryElectricQuantityResult(
      electricQuantity: electricQuantity ?? this.electricQuantity,
      updateDate: updateDate ?? this.updateDate,
    );
  }
}

class TTLockSystemModel {
  final String? modelNum;
  final String? hardwareRevision;
  final String? firmwareRevision;
  final int? electricQuantity;
  final String? nbOperator;
  final String? nbNodeId;
  final String? nbCardNumber;
  final String? nbRssi;
  final String? lockData;

  const TTLockSystemModel({
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
    this.electricQuantity,
    this.nbOperator,
    this.nbNodeId,
    this.nbCardNumber,
    this.nbRssi,
    this.lockData,
  });

  factory TTLockSystemModel.fromMap(Map<String, dynamic> map) {
    return TTLockSystemModel(
      modelNum: map['modelNum'] as String?,
      hardwareRevision: map['hardwareRevision'] as String?,
      firmwareRevision: map['firmwareRevision'] as String?,
      electricQuantity: map['electricQuantity'] as int?,
      nbOperator: map['nbOperator'] as String?,
      nbNodeId: map['nbNodeId'] as String?,
      nbCardNumber: map['nbCardNumber'] as String?,
      nbRssi: map['nbRssi'] as String?,
      lockData: map['lockData'] as String?,
    );
  }

  TTLockSystemModel copyWith({
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
    int? electricQuantity,
    String? nbOperator,
    String? nbNodeId,
    String? nbCardNumber,
    String? nbRssi,
    String? lockData,
  }) {
    return TTLockSystemModel(
      modelNum: modelNum ?? this.modelNum,
      hardwareRevision: hardwareRevision ?? this.hardwareRevision,
      firmwareRevision: firmwareRevision ?? this.firmwareRevision,
      electricQuantity: electricQuantity ?? this.electricQuantity,
      nbOperator: nbOperator ?? this.nbOperator,
      nbNodeId: nbNodeId ?? this.nbNodeId,
      nbCardNumber: nbCardNumber ?? this.nbCardNumber,
      nbRssi: nbRssi ?? this.nbRssi,
      lockData: lockData ?? this.lockData,
    );
  }
}

class TTCycleModel {
  final int weekDay;
  final int startTime;
  final int endTime;

  const TTCycleModel({
    required this.weekDay,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() => {
        'weekDay': weekDay,
        'startTime': startTime,
        'endTime': endTime,
      };

  static String encodeList(List<TTCycleModel>? list) {
    if (list == null || list.isEmpty) return '';
    return convert.jsonEncode(list.map((e) => e.toJson()).toList());
  }

  TTCycleModel copyWith({
    int? weekDay,
    int? startTime,
    int? endTime,
  }) {
    return TTCycleModel(
      weekDay: weekDay ?? this.weekDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}

class TTWifiInfoModel {
  final String wifiMac;
  final int wifiRssi;

  const TTWifiInfoModel({required this.wifiMac, required this.wifiRssi});

  factory TTWifiInfoModel.fromMap(Map<String, dynamic> map) {
    return TTWifiInfoModel(
      wifiMac: map['wifiMac'] as String,
      wifiRssi: map['wifiRssi'] as int,
    );
  }

  TTWifiInfoModel copyWith({
    String? wifiMac,
    int? wifiRssi,
  }) {
    return TTWifiInfoModel(
      wifiMac: wifiMac ?? this.wifiMac,
      wifiRssi: wifiRssi ?? this.wifiRssi,
    );
  }
}

class CameraLockWifiResult {
  final String serialNumber;
  final String wifiName;

  const CameraLockWifiResult({required this.serialNumber, required this.wifiName});

  factory CameraLockWifiResult.fromMap(Map<String, dynamic> map) {
    return CameraLockWifiResult(
      serialNumber: map['videoModuleSerialNumber'] as String,
      wifiName: map['wifiName'] as String,
    );
  }

  CameraLockWifiResult copyWith({
    String? serialNumber,
    String? wifiName,
  }) {
    return CameraLockWifiResult(
      serialNumber: serialNumber ?? this.serialNumber,
      wifiName: wifiName ?? this.wifiName,
    );
  }
}

class TTLockInitParams {
  final String lockMac;
  final String lockVersion;
  final bool isInited;
  final String? clientPara;
  final String? hotelInfo;
  final int? buildingNumber;
  final int? floorNumber;

  const TTLockInitParams({
    required this.lockMac,
    required this.lockVersion,
    required this.isInited,
    this.clientPara,
    this.hotelInfo,
    this.buildingNumber,
    this.floorNumber,
  });

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

  /// Creates params from a map (e.g. from classic API initLock(Map, ...)).
  static TTLockInitParams fromMap(Map map) {
    return TTLockInitParams(
      lockMac: map['lockMac'] as String,
      lockVersion: map['lockVersion'] as String,
      isInited: map['isInited'] as bool,
      clientPara: map['clientPara'] as String?,
      hotelInfo: map['hotelInfo'] as String?,
      buildingNumber: map['buildingNumber'] as int?,
      floorNumber: map['floorNumber'] as int?,
    );
  }

  TTLockInitParams copyWith({
    String? lockMac,
    String? lockVersion,
    bool? isInited,
    String? clientPara,
    String? hotelInfo,
    int? buildingNumber,
    int? floorNumber,
  }) {
    return TTLockInitParams(
      lockMac: lockMac ?? this.lockMac,
      lockVersion: lockVersion ?? this.lockVersion,
      isInited: isInited ?? this.isInited,
      clientPara: clientPara ?? this.clientPara,
      hotelInfo: hotelInfo ?? this.hotelInfo,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
    );
  }
}

class TTIpSetting {
  final int type;
  final String? ipAddress;
  final String? subnetMask;
  final String? router;
  final String? preferredDns;
  final String? alternateDns;

  const TTIpSetting({
    required this.type,
    this.ipAddress,
    this.subnetMask,
    this.router,
    this.preferredDns,
    this.alternateDns,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{'type': type};
    if (ipAddress != null) map['ipAddress'] = ipAddress;
    if (subnetMask != null) map['subnetMask'] = subnetMask;
    if (router != null) map['router'] = router;
    if (preferredDns != null) map['preferredDns'] = preferredDns;
    if (alternateDns != null) map['alternateDns'] = alternateDns;
    return map;
  }

  TTIpSetting copyWith({
    int? type,
    String? ipAddress,
    String? subnetMask,
    String? router,
    String? preferredDns,
    String? alternateDns,
  }) {
    return TTIpSetting(
      type: type ?? this.type,
      ipAddress: ipAddress ?? this.ipAddress,
      subnetMask: subnetMask ?? this.subnetMask,
      router: router ?? this.router,
      preferredDns: preferredDns ?? this.preferredDns,
      alternateDns: alternateDns ?? this.alternateDns,
    );
  }
}
