// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_door_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedDoorSensor _$SavedDoorSensorFromJson(Map<String, dynamic> json) =>
    _SavedDoorSensor(
      name: json['name'] as String,
      mac: json['mac'] as String,
      boundLockMac: json['bound_lock_mac'] as String,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedDoorSensorToJson(_SavedDoorSensor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'bound_lock_mac': instance.boundLockMac,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
