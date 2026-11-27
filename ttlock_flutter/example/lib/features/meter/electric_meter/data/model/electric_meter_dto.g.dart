// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElectricMeterDto _$ElectricMeterDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterDto(
  electricMeterId: json['electricMeterId'] == null
      ? 0
      : intFromDynamic(json['electricMeterId']),
  online: json['online'] == null ? false : boolFromDynamic(json['online']),
  rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
  onOff: json['onOff'] == null ? 2 : intFromDynamic(json['onOff']),
  name: json['name'] as String? ?? '',
  number: json['number'] as String? ?? '',
  payMode: json['payMode'] == null ? 0 : intFromDynamic(json['payMode']),
  totalKwh: json['totalKwh'] == null ? '' : stringFromDynamic(json['totalKwh']),
  remainderKwh: json['remainderKwh'] == null
      ? ''
      : stringFromDynamic(json['remainderKwh']),
  price: json['price'] == null ? '' : stringFromDynamic(json['price']),
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  maxPower: json['maxPower'] == null ? '' : stringFromDynamic(json['maxPower']),
  mac: json['mac'] as String? ?? '',
  featureValue: json['featureValue'] as String? ?? '',
  modelNum: json['modelNum'] as String? ?? '',
  hardwareRevision: json['hardwareRevision'] as String? ?? '',
  firmwareRevision: json['firmwareRevision'] as String? ?? '',
  syncKwhDate: nullableDateTimeMsFromJson(json['syncKwhDate']),
  groupName: json['groupName'] as String? ?? '',
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
);

Map<String, dynamic> _$ElectricMeterDtoToJson(_ElectricMeterDto instance) =>
    <String, dynamic>{
      'electricMeterId': instance.electricMeterId,
      'online': instance.online,
      'rssi': instance.rssi,
      'onOff': instance.onOff,
      'name': instance.name,
      'number': instance.number,
      'payMode': instance.payMode,
      'totalKwh': instance.totalKwh,
      'remainderKwh': instance.remainderKwh,
      'price': instance.price,
      'electricQuantity': instance.electricQuantity,
      'maxPower': instance.maxPower,
      'mac': instance.mac,
      'featureValue': instance.featureValue,
      'modelNum': instance.modelNum,
      'hardwareRevision': instance.hardwareRevision,
      'firmwareRevision': instance.firmwareRevision,
      'syncKwhDate': nullableDateTimeMsToJson(instance.syncKwhDate),
      'groupName': instance.groupName,
      'groupId': instance.groupId,
    };

_ElectricMeterUsageRecordDto _$ElectricMeterUsageRecordDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterUsageRecordDto(
  dateType: json['dateType'] == null ? 0 : intFromDynamic(json['dateType']),
  usedKwh: json['usedKwh'] == null ? '' : stringFromDynamic(json['usedKwh']),
  createDate: json['createDate'] == null
      ? ''
      : stringFromDynamic(json['createDate']),
);

Map<String, dynamic> _$ElectricMeterUsageRecordDtoToJson(
  _ElectricMeterUsageRecordDto instance,
) => <String, dynamic>{
  'dateType': instance.dateType,
  'usedKwh': instance.usedKwh,
  'createDate': instance.createDate,
};

_ElectricMeterOperationRecordDto _$ElectricMeterOperationRecordDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterOperationRecordDto(
  id: json['id'] == null ? 0 : intFromDynamic(json['id']),
  recordType: json['recordType'] == null
      ? ''
      : stringFromDynamic(json['recordType']),
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  date: json['date'] == null ? '' : stringFromDynamic(json['date']),
  headUrl: json['headUrl'] as String? ?? '',
);

Map<String, dynamic> _$ElectricMeterOperationRecordDtoToJson(
  _ElectricMeterOperationRecordDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'recordType': instance.recordType,
  'title': instance.title,
  'content': instance.content,
  'date': instance.date,
  'headUrl': instance.headUrl,
};

_ElectricMeterGroupDto _$ElectricMeterGroupDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterGroupDto(
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
  groupName: json['groupName'] as String? ?? '',
  electricMeterCount: json['electricMeterCount'] == null
      ? 0
      : intFromDynamic(json['electricMeterCount']),
);

Map<String, dynamic> _$ElectricMeterGroupDtoToJson(
  _ElectricMeterGroupDto instance,
) => <String, dynamic>{
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'electricMeterCount': instance.electricMeterCount,
};

_ElectricMeterTaskDto _$ElectricMeterTaskDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterTaskDto(
  id: json['id'] == null ? 0 : intFromDynamic(json['id']),
  taskType: json['taskType'] == null ? 0 : intFromDynamic(json['taskType']),
  rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
  rechargeAmount: json['rechargeAmount'] == null
      ? ''
      : stringFromDynamic(json['rechargeAmount']),
  remainderKwh: json['remainderKwh'] == null
      ? ''
      : stringFromDynamic(json['remainderKwh']),
  rechargeKwh: json['rechargeKwh'] == null
      ? ''
      : stringFromDynamic(json['rechargeKwh']),
  usedFlag: json['usedFlag'] == null ? 0 : intFromDynamic(json['usedFlag']),
  price: json['price'] == null ? '' : stringFromDynamic(json['price']),
  executeToken: json['executeToken'] as String? ?? '',
);

Map<String, dynamic> _$ElectricMeterTaskDtoToJson(
  _ElectricMeterTaskDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'taskType': instance.taskType,
  'rssi': instance.rssi,
  'rechargeAmount': instance.rechargeAmount,
  'remainderKwh': instance.remainderKwh,
  'rechargeKwh': instance.rechargeKwh,
  'usedFlag': instance.usedFlag,
  'price': instance.price,
  'executeToken': instance.executeToken,
};

_ElectricMeterGatewayDto _$ElectricMeterGatewayDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterGatewayDto(
  rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
  gatewayName: json['gatewayName'] as String? ?? '',
  gatewayVersion: json['gatewayVersion'] == null
      ? 0
      : intFromDynamic(json['gatewayVersion']),
);

Map<String, dynamic> _$ElectricMeterGatewayDtoToJson(
  _ElectricMeterGatewayDto instance,
) => <String, dynamic>{
  'rssi': instance.rssi,
  'gatewayName': instance.gatewayName,
  'gatewayVersion': instance.gatewayVersion,
};

_ElectricMeterUpgradeCheckDto _$ElectricMeterUpgradeCheckDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterUpgradeCheckDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'] as Map<String, dynamic>?,
  firmwarePackage: json['firmwarePackage'] as String? ?? '',
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$ElectricMeterUpgradeCheckDtoToJson(
  _ElectricMeterUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};

_ElectricMeterCatOneDetailDto _$ElectricMeterCatOneDetailDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterCatOneDetailDto(
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

Map<String, dynamic> _$ElectricMeterCatOneDetailDtoToJson(
  _ElectricMeterCatOneDetailDto instance,
) => <String, dynamic>{
  'rssiGrade': instance.rssiGrade,
  'catOneNodeId': instance.catOneNodeId,
  'catOneCardNumber': instance.catOneCardNumber,
  'catOneOperator': instance.catOneOperator,
  'catOneImsi': instance.catOneImsi,
  'catOneApn': instance.catOneApn,
  'overseaCard': instance.overseaCard,
};

_ElectricMeterExecuteTokenDto _$ElectricMeterExecuteTokenDtoFromJson(
  Map<String, dynamic> json,
) => _ElectricMeterExecuteTokenDto(
  executeToken: json['executeToken'] == null
      ? ''
      : stringFromDynamic(json['executeToken']),
);

Map<String, dynamic> _$ElectricMeterExecuteTokenDtoToJson(
  _ElectricMeterExecuteTokenDto instance,
) => <String, dynamic>{'executeToken': instance.executeToken};
