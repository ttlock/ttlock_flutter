// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_standalone_door_sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedStandaloneDoorSensor _$SavedStandaloneDoorSensorFromJson(
        Map<String, dynamic> json) =>
    _SavedStandaloneDoorSensor(
      name: json['name'] as String,
      mac: json['mac'] as String,
      doorSensorData: json['door_sensor_data'] as String?,
      featureValue: json['feature_value'] as String?,
      modelNum: json['model_num'] as String?,
      electricQuantity: (json['electric_quantity'] as num?)?.toInt(),
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedStandaloneDoorSensorToJson(
        _SavedStandaloneDoorSensor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'door_sensor_data': instance.doorSensorData,
      'feature_value': instance.featureValue,
      'model_num': instance.modelNum,
      'electric_quantity': instance.electricQuantity,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
