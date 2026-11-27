// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireless_keypad_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WirelessKeypadDto _$WirelessKeypadDtoFromJson(Map<String, dynamic> json) =>
    _WirelessKeypadDto(
      wirelessKeypadId: json['wirelessKeypadId'] == null
          ? 0
          : intFromDynamic(json['wirelessKeypadId']),
      wirelessKeypadNumber: json['wirelessKeypadNumber'] as String? ?? '',
      wirelessKeypadName: json['wirelessKeypadName'] as String? ?? '',
      wirelessKeypadMac: json['wirelessKeypadMac'] as String? ?? '',
      electricQuantity: json['electricQuantity'] == null
          ? 0
          : intFromDynamic(json['electricQuantity']),
      hasSlot: json['hasSlot'] == null ? 0 : intFromDynamic(json['hasSlot']),
      slotNumber: json['slotNumber'] == null
          ? 0
          : intFromDynamic(json['slotNumber']),
      slotLimit: json['slotLimit'] == null
          ? 0
          : intFromDynamic(json['slotLimit']),
      featureValue: json['featureValue'] as String? ?? '',
    );

Map<String, dynamic> _$WirelessKeypadDtoToJson(_WirelessKeypadDto instance) =>
    <String, dynamic>{
      'wirelessKeypadId': instance.wirelessKeypadId,
      'wirelessKeypadNumber': instance.wirelessKeypadNumber,
      'wirelessKeypadName': instance.wirelessKeypadName,
      'wirelessKeypadMac': instance.wirelessKeypadMac,
      'electricQuantity': instance.electricQuantity,
      'hasSlot': instance.hasSlot,
      'slotNumber': instance.slotNumber,
      'slotLimit': instance.slotLimit,
      'featureValue': instance.featureValue,
    };

_WirelessKeypadUpgradeCheckDto _$WirelessKeypadUpgradeCheckDtoFromJson(
  Map<String, dynamic> json,
) => _WirelessKeypadUpgradeCheckDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'],
  firmwarePackage: json['firmwarePackage'] as String? ?? '',
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$WirelessKeypadUpgradeCheckDtoToJson(
  _WirelessKeypadUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};

_KeypadSlotDto _$KeypadSlotDtoFromJson(Map<String, dynamic> json) =>
    _KeypadSlotDto(
      slotNumber: json['slotNumber'] == null
          ? 0
          : intFromDynamic(json['slotNumber']),
      lockAlias: json['lockAlias'] as String? ?? '',
    );

Map<String, dynamic> _$KeypadSlotDtoToJson(_KeypadSlotDto instance) =>
    <String, dynamic>{
      'slotNumber': instance.slotNumber,
      'lockAlias': instance.lockAlias,
    };
