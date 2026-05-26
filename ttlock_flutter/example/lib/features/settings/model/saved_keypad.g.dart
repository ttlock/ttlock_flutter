// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_keypad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedKeypad _$SavedKeypadFromJson(Map<String, dynamic> json) => _SavedKeypad(
      name: json['name'] as String,
      mac: json['mac'] as String,
      boundLockMac: json['bound_lock_mac'] as String,
      isMultiFunction: json['is_multi_function'] as bool? ?? false,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedKeypadToJson(_SavedKeypad instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'bound_lock_mac': instance.boundLockMac,
      'is_multi_function': instance.isMultiFunction,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
