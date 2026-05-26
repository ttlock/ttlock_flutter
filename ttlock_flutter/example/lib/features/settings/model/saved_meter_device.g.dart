// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_meter_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedMeterDevice _$SavedMeterDeviceFromJson(Map<String, dynamic> json) =>
    _SavedMeterDevice(
      name: json['name'] as String,
      mac: json['mac'] as String,
      meterId: json['meter_id'] as String,
      meterType: json['meter_type'] as String,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedMeterDeviceToJson(_SavedMeterDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'meter_id': instance.meterId,
      'meter_type': instance.meterType,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
