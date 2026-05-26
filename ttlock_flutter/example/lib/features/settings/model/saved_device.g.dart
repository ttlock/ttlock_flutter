// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedDevice _$SavedDeviceFromJson(Map<String, dynamic> json) => _SavedDevice(
      name: json['name'] as String,
      mac: json['mac'] as String,
      lockData: json['lock_data'] as String,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedDeviceToJson(_SavedDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'lock_data': instance.lockData,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
