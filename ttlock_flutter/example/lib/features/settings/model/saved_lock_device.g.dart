// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_lock_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedLockDevice _$SavedLockDeviceFromJson(Map<String, dynamic> json) =>
    _SavedLockDevice(
      name: json['name'] as String,
      mac: json['mac'] as String,
      lockData: json['lock_data'] as String,
      protocolType: (json['protocol_type'] as num?)?.toInt() ?? 5,
      protocolVersion: (json['protocol_version'] as num?)?.toInt() ?? 3,
      scene: (json['scene'] as num?)?.toInt() ?? 2,
      groupId: (json['group_id'] as num?)?.toInt() ?? 1,
      orgId: (json['org_id'] as num?)?.toInt() ?? 1,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedLockDeviceToJson(_SavedLockDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'lock_data': instance.lockData,
      'protocol_type': instance.protocolType,
      'protocol_version': instance.protocolVersion,
      'scene': instance.scene,
      'group_id': instance.groupId,
      'org_id': instance.orgId,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
