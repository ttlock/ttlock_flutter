// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_setting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtraSettingDto _$ExtraSettingDtoFromJson(Map<String, dynamic> json) =>
    _ExtraSettingDto(
      flag: json['unauthorizedAttemptAlertFlag'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertFlag']),
      count: json['unauthorizedAttemptAlertCount'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertCount']),
      lockTime: json['unauthorizedAttemptAlertLockTime'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertLockTime']),
      pwd: json['unauthorizedAttemptAlertPwd'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertPwd']),
      card: json['unauthorizedAttemptAlertCard'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertCard']),
      fingerprint: json['unauthorizedAttemptAlertFingerprint'] == null
          ? 0
          : intFromDynamic(json['unauthorizedAttemptAlertFingerprint']),
    );

Map<String, dynamic> _$ExtraSettingDtoToJson(_ExtraSettingDto instance) =>
    <String, dynamic>{
      'unauthorizedAttemptAlertFlag': instance.flag,
      'unauthorizedAttemptAlertCount': instance.count,
      'unauthorizedAttemptAlertLockTime': instance.lockTime,
      'unauthorizedAttemptAlertPwd': instance.pwd,
      'unauthorizedAttemptAlertCard': instance.card,
      'unauthorizedAttemptAlertFingerprint': instance.fingerprint,
    };

_PassageModeConfigDto _$PassageModeConfigDtoFromJson(
  Map<String, dynamic> json,
) => _PassageModeConfigDto(
  passageMode: json['passageMode'] == null
      ? 2
      : intFromDynamic(json['passageMode']),
  startDate: json['startDate'] == null ? 0 : intFromDynamic(json['startDate']),
  endDate: json['endDate'] == null ? 0 : intFromDynamic(json['endDate']),
  isAllDay: json['isAllDay'] == null ? 2 : intFromDynamic(json['isAllDay']),
  weekDays: json['weekDays'] == null
      ? const []
      : intListFromJson(json['weekDays']),
  autoUnlock: json['autoUnlock'] == null
      ? 2
      : intFromDynamic(json['autoUnlock']),
);

Map<String, dynamic> _$PassageModeConfigDtoToJson(
  _PassageModeConfigDto instance,
) => <String, dynamic>{
  'passageMode': instance.passageMode,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'isAllDay': instance.isAllDay,
  'weekDays': instance.weekDays,
  'autoUnlock': instance.autoUnlock,
};

_WorkingModeCyclicConfigDto _$WorkingModeCyclicConfigDtoFromJson(
  Map<String, dynamic> json,
) => _WorkingModeCyclicConfigDto(
  isAllDay: json['isAllDay'] == null ? 2 : intFromDynamic(json['isAllDay']),
  startTime: json['startTime'] == null ? 0 : intFromDynamic(json['startTime']),
  endTime: json['endTime'] == null ? 0 : intFromDynamic(json['endTime']),
  weekDays: json['weekDays'] == null
      ? const []
      : intListFromJson(json['weekDays']),
);

Map<String, dynamic> _$WorkingModeCyclicConfigDtoToJson(
  _WorkingModeCyclicConfigDto instance,
) => <String, dynamic>{
  'isAllDay': instance.isAllDay,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
  'weekDays': instance.weekDays,
};

_WorkingModeDto _$WorkingModeDtoFromJson(Map<String, dynamic> json) =>
    _WorkingModeDto(
      workingMode: json['workingMode'] == null
          ? 1
          : intFromDynamic(json['workingMode']),
      cyclicConfig: json['cyclicConfig'] == null
          ? const []
          : cyclicConfigListFromJson(json['cyclicConfig']),
    );

Map<String, dynamic> _$WorkingModeDtoToJson(_WorkingModeDto instance) =>
    <String, dynamic>{
      'workingMode': instance.workingMode,
      'cyclicConfig': instance.cyclicConfig,
    };

_FirmwareInfoDto _$FirmwareInfoDtoFromJson(Map<String, dynamic> json) =>
    _FirmwareInfoDto(
      modelNum: json['modelNum'] as String? ?? '',
      hardwareRevision: json['hardwareRevision'] as String? ?? '',
      firmwareRevision: json['firmwareRevision'] as String? ?? '',
    );

Map<String, dynamic> _$FirmwareInfoDtoToJson(_FirmwareInfoDto instance) =>
    <String, dynamic>{
      'modelNum': instance.modelNum,
      'hardwareRevision': instance.hardwareRevision,
      'firmwareRevision': instance.firmwareRevision,
    };

_LockUpgradeCheckDto _$LockUpgradeCheckDtoFromJson(Map<String, dynamic> json) =>
    _LockUpgradeCheckDto(
      needUpgrade: json['needUpgrade'] == null
          ? 2
          : intFromDynamic(json['needUpgrade']),
      firmwareInfo: firmwareInfoFromJson(json['firmwareInfo']),
      firmwarePackage: json['firmwarePackage'] as String? ?? '',
      version: json['version'] as String? ?? '',
    );

Map<String, dynamic> _$LockUpgradeCheckDtoToJson(
  _LockUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': firmwareInfoToJson(instance.firmwareInfo),
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};

_NbDeviceInfoDto _$NbDeviceInfoDtoFromJson(Map<String, dynamic> json) =>
    _NbDeviceInfoDto(
      nbNodeId: json['nbNodeId'] as String? ?? '',
      nbCardNumber: json['nbCardNumber'] as String? ?? '',
      nbOperator: json['nbOperator'] as String? ?? '',
      nbOperatorName: json['nbOperatorName'] as String? ?? '',
      nbRssi: json['nbRssi'] == null ? 0 : intFromDynamic(json['nbRssi']),
      updateDate: nullableDateTimeMsFromJson(json['updateDate']),
    );

Map<String, dynamic> _$NbDeviceInfoDtoToJson(_NbDeviceInfoDto instance) =>
    <String, dynamic>{
      'nbNodeId': instance.nbNodeId,
      'nbCardNumber': instance.nbCardNumber,
      'nbOperator': instance.nbOperator,
      'nbOperatorName': instance.nbOperatorName,
      'nbRssi': instance.nbRssi,
      'updateDate': nullableDateTimeMsToJson(instance.updateDate),
    };

_NbPlatformEndpointDto _$NbPlatformEndpointDtoFromJson(
  Map<String, dynamic> json,
) => _NbPlatformEndpointDto(
  nbOperator: json['nbOperator'] as String? ?? '',
  ip: json['ip'] as String? ?? '',
  port: json['port'] == null ? 0 : intFromDynamic(json['port']),
);

Map<String, dynamic> _$NbPlatformEndpointDtoToJson(
  _NbPlatformEndpointDto instance,
) => <String, dynamic>{
  'nbOperator': instance.nbOperator,
  'ip': instance.ip,
  'port': instance.port,
};

_HotelLockDto _$HotelLockDtoFromJson(Map<String, dynamic> json) =>
    _HotelLockDto(
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      lockName: json['lockName'] as String? ?? '',
      lockAlias: json['lockAlias'] as String? ?? '',
      lockMac: json['lockMac'] as String? ?? '',
      electricQuantity: json['electricQuantity'] == null
          ? 0
          : intFromDynamic(json['electricQuantity']),
      featureValue: json['featureValue'] as String? ?? '',
      hasGateway: json['hasGateway'] == null
          ? 0
          : intFromDynamic(json['hasGateway']),
      lockData: json['lockData'] as String? ?? '',
      sector: json['sector'] as String? ?? '',
      electricQuantityUpdateDate: nullableDateTimeMsFromJson(
        json['electricQuantityUpdateDate'],
      ),
      buildingName: json['buildingName'] as String? ?? '',
      buildingNumber: _readBuildingNumber(json, 'buildingNumber') == null
          ? 0
          : intFromDynamic(_readBuildingNumber(json, 'buildingNumber')),
      floorName: json['floorName'] as String? ?? '',
      floorNumber: json['floorNumber'] == null
          ? 0
          : intFromDynamic(json['floorNumber']),
      groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
      groupName: json['groupName'] as String? ?? '',
      initDate: nullableDateTimeMsFromJson(json['date']),
    );

Map<String, dynamic> _$HotelLockDtoToJson(_HotelLockDto instance) =>
    <String, dynamic>{
      'lockId': instance.lockId,
      'lockName': instance.lockName,
      'lockAlias': instance.lockAlias,
      'lockMac': instance.lockMac,
      'electricQuantity': instance.electricQuantity,
      'featureValue': instance.featureValue,
      'hasGateway': instance.hasGateway,
      'lockData': instance.lockData,
      'sector': instance.sector,
      'electricQuantityUpdateDate': nullableDateTimeMsToJson(
        instance.electricQuantityUpdateDate,
      ),
      'buildingName': instance.buildingName,
      'buildingNumber': instance.buildingNumber,
      'floorName': instance.floorName,
      'floorNumber': instance.floorNumber,
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'date': nullableDateTimeMsToJson(instance.initDate),
    };

_LockImportDataDto _$LockImportDataDtoFromJson(Map<String, dynamic> json) =>
    _LockImportDataDto(
      keyNum: json['keyNum'] == null ? 0 : intFromDynamic(json['keyNum']),
      keyboardPwdNum: json['keyboardPwdNum'] == null
          ? 0
          : intFromDynamic(json['keyboardPwdNum']),
      cardNum: json['cardNum'] == null ? 0 : intFromDynamic(json['cardNum']),
      keyboardPwdList: json['keyboardPwdList'] == null
          ? const []
          : mapListFromJson(json['keyboardPwdList']),
      identityCardList: json['identityCardList'] == null
          ? const []
          : mapListFromJson(json['identityCardList']),
    );

Map<String, dynamic> _$LockImportDataDtoToJson(_LockImportDataDto instance) =>
    <String, dynamic>{
      'keyNum': instance.keyNum,
      'keyboardPwdNum': instance.keyboardPwdNum,
      'cardNum': instance.cardNum,
      'keyboardPwdList': instance.keyboardPwdList,
      'identityCardList': instance.identityCardList,
    };

_ChangeTimezoneResultDto _$ChangeTimezoneResultDtoFromJson(
  Map<String, dynamic> json,
) => _ChangeTimezoneResultDto(
  lockData: _readLockData(json, 'lockData') == null
      ? ''
      : stringFromDynamic(_readLockData(json, 'lockData')),
);

Map<String, dynamic> _$ChangeTimezoneResultDtoToJson(
  _ChangeTimezoneResultDto instance,
) => <String, dynamic>{'lockData': instance.lockData};
