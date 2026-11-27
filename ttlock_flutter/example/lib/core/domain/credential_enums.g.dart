// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_enums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CyclicConfig _$CyclicConfigFromJson(Map<String, dynamic> json) =>
    _CyclicConfig(
      weekDay: (json['weekDay'] as num?)?.toInt() ?? 0,
      startTime: (json['startTime'] as num?)?.toInt() ?? 0,
      endTime: (json['endTime'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CyclicConfigToJson(_CyclicConfig instance) =>
    <String, dynamic>{
      'weekDay': instance.weekDay,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
