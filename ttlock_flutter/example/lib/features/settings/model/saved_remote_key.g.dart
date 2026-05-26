// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_remote_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedRemoteKey _$SavedRemoteKeyFromJson(Map<String, dynamic> json) =>
    _SavedRemoteKey(
      name: json['name'] as String,
      mac: json['mac'] as String,
      boundLockMac: json['bound_lock_mac'] as String,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedRemoteKeyToJson(_SavedRemoteKey instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'bound_lock_mac': instance.boundLockMac,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
