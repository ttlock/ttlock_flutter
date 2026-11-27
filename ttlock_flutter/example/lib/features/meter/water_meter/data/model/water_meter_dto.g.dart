// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaterMeterDto _$WaterMeterDtoFromJson(
  Map<String, dynamic> json,
) => _WaterMeterDto(
  waterMeterId: json['waterMeterId'] == null
      ? 0
      : intFromDynamic(json['waterMeterId']),
  online: json['online'] == null ? false : boolFromDynamic(json['online']),
  rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
  onOff: json['onOff'] == null
      ? MeterOnOff.unknown
      : _onOffFromJson(json['onOff']),
  name: json['name'] as String? ?? '',
  number: json['number'] as String? ?? '',
  payMode: json['payMode'] == null
      ? MeterPayMode.energy
      : _payModeFromJson(json['payMode']),
  totalM3: json['totalM3'] == null ? '' : stringFromDynamic(json['totalM3']),
  remainderM3: json['remainderM3'] == null
      ? ''
      : stringFromDynamic(json['remainderM3']),
  price: json['price'] == null ? '' : stringFromDynamic(json['price']),
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  mac: json['mac'] as String? ?? '',
  featureValue: json['featureValue'] as String? ?? '',
  modelNum: json['modelNum'] as String? ?? '',
  hardwareRevision: json['hardwareRevision'] as String? ?? '',
  firmwareRevision: json['firmwareRevision'] as String? ?? '',
  syncM3Date: json['syncM3Date'] == null
      ? ''
      : stringFromDynamic(json['syncM3Date']),
  maxPower: json['maxPower'] == null ? '' : stringFromDynamic(json['maxPower']),
  groupName: json['groupName'] as String? ?? '',
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
);

Map<String, dynamic> _$WaterMeterDtoToJson(_WaterMeterDto instance) =>
    <String, dynamic>{
      'waterMeterId': instance.waterMeterId,
      'online': instance.online,
      'rssi': instance.rssi,
      'onOff': _$MeterOnOffEnumMap[instance.onOff]!,
      'name': instance.name,
      'number': instance.number,
      'payMode': _$MeterPayModeEnumMap[instance.payMode]!,
      'totalM3': instance.totalM3,
      'remainderM3': instance.remainderM3,
      'price': instance.price,
      'electricQuantity': instance.electricQuantity,
      'mac': instance.mac,
      'featureValue': instance.featureValue,
      'modelNum': instance.modelNum,
      'hardwareRevision': instance.hardwareRevision,
      'firmwareRevision': instance.firmwareRevision,
      'syncM3Date': instance.syncM3Date,
      'maxPower': instance.maxPower,
      'groupName': instance.groupName,
      'groupId': instance.groupId,
    };

const _$MeterOnOffEnumMap = {
  MeterOnOff.off: 'off',
  MeterOnOff.on: 'on',
  MeterOnOff.unknown: 'unknown',
};

const _$MeterPayModeEnumMap = {
  MeterPayMode.energy: 'energy',
  MeterPayMode.prepaid: 'prepaid',
};

_WaterMeterRecordDto _$WaterMeterRecordDtoFromJson(Map<String, dynamic> json) =>
    _WaterMeterRecordDto(
      dateType: json['dateType'] == null ? 0 : intFromDynamic(json['dateType']),
      usedM3: json['usedM3'] == null ? '' : stringFromDynamic(json['usedM3']),
      createDate: json['createDate'] == null
          ? ''
          : stringFromDynamic(json['createDate']),
    );

Map<String, dynamic> _$WaterMeterRecordDtoToJson(
  _WaterMeterRecordDto instance,
) => <String, dynamic>{
  'dateType': instance.dateType,
  'usedM3': instance.usedM3,
  'createDate': instance.createDate,
};

_WaterMeterGroupDto _$WaterMeterGroupDtoFromJson(Map<String, dynamic> json) =>
    _WaterMeterGroupDto(
      groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
      groupName: json['groupName'] as String? ?? '',
      waterMeterCount: json['waterMeterCount'] == null
          ? 0
          : intFromDynamic(json['waterMeterCount']),
    );

Map<String, dynamic> _$WaterMeterGroupDtoToJson(_WaterMeterGroupDto instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'groupName': instance.groupName,
      'waterMeterCount': instance.waterMeterCount,
    };

_WaterMeterOperationRecordDto _$WaterMeterOperationRecordDtoFromJson(
  Map<String, dynamic> json,
) => _WaterMeterOperationRecordDto(
  id: json['id'] == null ? 0 : intFromDynamic(json['id']),
  recordType: json['recordType'] == null
      ? ''
      : stringFromDynamic(json['recordType']),
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  date: json['date'] == null ? '' : stringFromDynamic(json['date']),
  headUrl: json['headUrl'] as String? ?? '',
);

Map<String, dynamic> _$WaterMeterOperationRecordDtoToJson(
  _WaterMeterOperationRecordDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'recordType': instance.recordType,
  'title': instance.title,
  'content': instance.content,
  'date': instance.date,
  'headUrl': instance.headUrl,
};

_WaterMeterTaskDto _$WaterMeterTaskDtoFromJson(Map<String, dynamic> json) =>
    _WaterMeterTaskDto(
      id: json['id'] == null ? 0 : intFromDynamic(json['id']),
      taskType: json['taskType'] == null ? 0 : intFromDynamic(json['taskType']),
      rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
      rechargeAmount: (json['rechargeAmount'] as num?)?.toDouble() ?? 0,
      remainderM3: json['remainderM3'] == null
          ? ''
          : stringFromDynamic(json['remainderM3']),
      rechargeM3: (json['rechargeM3'] as num?)?.toDouble() ?? 0,
      usedFlag: json['usedFlag'] == null ? 0 : intFromDynamic(json['usedFlag']),
      price: json['price'] == null ? '' : stringFromDynamic(json['price']),
      executeToken: json['executeToken'] as String? ?? '',
    );

Map<String, dynamic> _$WaterMeterTaskDtoToJson(_WaterMeterTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskType': instance.taskType,
      'rssi': instance.rssi,
      'rechargeAmount': instance.rechargeAmount,
      'remainderM3': instance.remainderM3,
      'rechargeM3': instance.rechargeM3,
      'usedFlag': instance.usedFlag,
      'price': instance.price,
      'executeToken': instance.executeToken,
    };

_WaterMeterGatewayDto _$WaterMeterGatewayDtoFromJson(
  Map<String, dynamic> json,
) => _WaterMeterGatewayDto(
  rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
  gatewayName: json['gatewayName'] as String? ?? '',
  gatewayVersion: json['gatewayVersion'] == null
      ? 0
      : intFromDynamic(json['gatewayVersion']),
);

Map<String, dynamic> _$WaterMeterGatewayDtoToJson(
  _WaterMeterGatewayDto instance,
) => <String, dynamic>{
  'rssi': instance.rssi,
  'gatewayName': instance.gatewayName,
  'gatewayVersion': instance.gatewayVersion,
};

_WaterMeterCatOneDetailDto _$WaterMeterCatOneDetailDtoFromJson(
  Map<String, dynamic> json,
) => _WaterMeterCatOneDetailDto(
  rssiGrade: json['rssiGrade'] == null ? 0 : intFromDynamic(json['rssiGrade']),
  catOneNodeId: json['catOneNodeId'] as String? ?? '',
  catOneCardNumber: json['catOneCardNumber'] as String? ?? '',
  catOneOperator: json['catOneOperator'] as String? ?? '',
  catOneImsi: json['catOneImsi'] as String? ?? '',
  catOneApn: json['catOneApn'] as String? ?? '',
  overseaCard: json['overseaCard'] == null
      ? 0
      : intFromDynamic(json['overseaCard']),
);

Map<String, dynamic> _$WaterMeterCatOneDetailDtoToJson(
  _WaterMeterCatOneDetailDto instance,
) => <String, dynamic>{
  'rssiGrade': instance.rssiGrade,
  'catOneNodeId': instance.catOneNodeId,
  'catOneCardNumber': instance.catOneCardNumber,
  'catOneOperator': instance.catOneOperator,
  'catOneImsi': instance.catOneImsi,
  'catOneApn': instance.catOneApn,
  'overseaCard': instance.overseaCard,
};

_WaterMeterUpgradeCheckDto _$WaterMeterUpgradeCheckDtoFromJson(
  Map<String, dynamic> json,
) => _WaterMeterUpgradeCheckDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'] as Map<String, dynamic>?,
  firmwarePackage: json['firmwarePackage'] as String? ?? '',
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$WaterMeterUpgradeCheckDtoToJson(
  _WaterMeterUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};
