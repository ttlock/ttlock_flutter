// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_local_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LockLocalCache _$LockLocalCacheFromJson(Map<String, dynamic> json) =>
    _LockLocalCache(
      supportedFunctions: (json['supported_functions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      capabilitiesProbedAt: json['capabilities_probed_at'] == null
          ? null
          : DateTime.parse(json['capabilities_probed_at'] as String),
      settings: json['settings'] == null
          ? null
          : LockSettingsSnapshot.fromJson(
              json['settings'] as Map<String, dynamic>),
      settingsFetchedAt: json['settings_fetched_at'] == null
          ? null
          : DateTime.parse(json['settings_fetched_at'] as String),
      passcodes: (json['passcodes'] as List<dynamic>?)
          ?.map((e) => CachedPasscode.fromJson(e as Map<String, dynamic>))
          .toList(),
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CachedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      fingerprints: (json['fingerprints'] as List<dynamic>?)
          ?.map((e) => CachedFingerprint.fromJson(e as Map<String, dynamic>))
          .toList(),
      faces: (json['faces'] as List<dynamic>?)
          ?.map((e) => CachedFace.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentialsFetchedAt: json['credentials_fetched_at'] == null
          ? null
          : DateTime.parse(json['credentials_fetched_at'] as String),
    );

Map<String, dynamic> _$LockLocalCacheToJson(_LockLocalCache instance) =>
    <String, dynamic>{
      'supported_functions': instance.supportedFunctions,
      'capabilities_probed_at':
          instance.capabilitiesProbedAt?.toIso8601String(),
      'settings': instance.settings,
      'settings_fetched_at': instance.settingsFetchedAt?.toIso8601String(),
      'passcodes': instance.passcodes,
      'cards': instance.cards,
      'fingerprints': instance.fingerprints,
      'faces': instance.faces,
      'credentials_fetched_at':
          instance.credentialsFetchedAt?.toIso8601String(),
    };
