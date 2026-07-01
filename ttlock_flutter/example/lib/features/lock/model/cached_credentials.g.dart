// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedPasscode _$CachedPasscodeFromJson(Map<String, dynamic> json) =>
    _CachedPasscode(
      keyboardPwd: json['keyboard_pwd'] as String,
      newKeyboardPwd: json['new_keyboard_pwd'] as String? ?? '',
      startDate: (json['start_date'] as num).toInt(),
      endDate: (json['end_date'] as num).toInt(),
      keyboardPwdType: (json['keyboard_pwd_type'] as num?)?.toInt() ?? 0,
      cycleType: (json['cycle_type'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CachedPasscodeToJson(_CachedPasscode instance) =>
    <String, dynamic>{
      'keyboard_pwd': instance.keyboardPwd,
      'new_keyboard_pwd': instance.newKeyboardPwd,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'keyboard_pwd_type': instance.keyboardPwdType,
      'cycle_type': instance.cycleType,
    };

_CachedCard _$CachedCardFromJson(Map<String, dynamic> json) => _CachedCard(
      cardNumber: json['card_number'] as String,
      startDate: (json['start_date'] as num).toInt(),
      endDate: (json['end_date'] as num).toInt(),
    );

Map<String, dynamic> _$CachedCardToJson(_CachedCard instance) =>
    <String, dynamic>{
      'card_number': instance.cardNumber,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

_CachedFingerprint _$CachedFingerprintFromJson(Map<String, dynamic> json) =>
    _CachedFingerprint(
      fingerprintNumber: json['fingerprint_number'] as String,
      startDate: (json['start_date'] as num).toInt(),
      endDate: (json['end_date'] as num).toInt(),
    );

Map<String, dynamic> _$CachedFingerprintToJson(_CachedFingerprint instance) =>
    <String, dynamic>{
      'fingerprint_number': instance.fingerprintNumber,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

_CachedFace _$CachedFaceFromJson(Map<String, dynamic> json) => _CachedFace(
      faceNumber: json['face_number'] as String,
      startDate: (json['start_date'] as num).toInt(),
      endDate: (json['end_date'] as num).toInt(),
    );

Map<String, dynamic> _$CachedFaceToJson(_CachedFace instance) =>
    <String, dynamic>{
      'face_number': instance.faceNumber,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

_CachedPalmVein _$CachedPalmVeinFromJson(Map<String, dynamic> json) =>
    _CachedPalmVein(
      palmVeinNumber: json['palm_vein_number'] as String,
      startDate: (json['start_date'] as num).toInt(),
      endDate: (json['end_date'] as num).toInt(),
    );

Map<String, dynamic> _$CachedPalmVeinToJson(_CachedPalmVein instance) =>
    <String, dynamic>{
      'palm_vein_number': instance.palmVeinNumber,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
