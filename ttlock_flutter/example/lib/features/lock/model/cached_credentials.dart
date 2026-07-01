import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'cached_credentials.freezed.dart';
part 'cached_credentials.g.dart';

@freezed
abstract class CachedPasscode with _$CachedPasscode {
  const factory CachedPasscode({
    required String keyboardPwd,
  @Default('') String newKeyboardPwd,
    required int startDate,
    required int endDate,
    @Default(0) int keyboardPwdType,
    @Default(0) int cycleType,
  }) = _CachedPasscode;

  factory CachedPasscode.fromJson(Map<String, dynamic> json) =>
      _$CachedPasscodeFromJson(json);

  factory CachedPasscode.fromModel(TTPasscodeModel m) => CachedPasscode(
        keyboardPwd: m.keyboardPwd,
        newKeyboardPwd: m.newKeyboardPwd,
        startDate: m.startDate,
        endDate: m.endDate,
        keyboardPwdType: m.keyboardPwdType,
        cycleType: m.cycleType,
      );

  const CachedPasscode._();

  TTPasscodeModel toModel() => TTPasscodeModel(
        keyboardPwd: keyboardPwd,
        newKeyboardPwd: newKeyboardPwd,
        startDate: startDate,
        endDate: endDate,
        keyboardPwdType: keyboardPwdType,
        cycleType: cycleType,
      );
}

@freezed
abstract class CachedCard with _$CachedCard {
  const factory CachedCard({
    required String cardNumber,
    required int startDate,
    required int endDate,
  }) = _CachedCard;

  factory CachedCard.fromJson(Map<String, dynamic> json) =>
      _$CachedCardFromJson(json);

  factory CachedCard.fromModel(TTICCardModel m) => CachedCard(
        cardNumber: m.cardNumber,
        startDate: m.startDate,
        endDate: m.endDate,
      );

  const CachedCard._();

  TTICCardModel toModel() => TTICCardModel(
        cardNumber: cardNumber,
        startDate: startDate,
        endDate: endDate,
      );
}

@freezed
abstract class CachedFingerprint with _$CachedFingerprint {
  const factory CachedFingerprint({
    required String fingerprintNumber,
    required int startDate,
    required int endDate,
  }) = _CachedFingerprint;

  factory CachedFingerprint.fromJson(Map<String, dynamic> json) =>
      _$CachedFingerprintFromJson(json);

  factory CachedFingerprint.fromModel(TTFingerprintModel m) => CachedFingerprint(
        fingerprintNumber: m.fingerprintNumber,
        startDate: m.startDate,
        endDate: m.endDate,
      );

  const CachedFingerprint._();

  TTFingerprintModel toModel() => TTFingerprintModel(
        fingerprintNumber: fingerprintNumber,
        startDate: startDate,
        endDate: endDate,
      );
}

@freezed
abstract class CachedFace with _$CachedFace {
  const factory CachedFace({
    required String faceNumber,
    required int startDate,
    required int endDate,
  }) = _CachedFace;

  factory CachedFace.fromJson(Map<String, dynamic> json) =>
      _$CachedFaceFromJson(json);

  const CachedFace._();
}

@freezed
abstract class CachedPalmVein with _$CachedPalmVein {
  const factory CachedPalmVein({
    required String palmVeinNumber,
    required int startDate,
    required int endDate,
  }) = _CachedPalmVein;

  factory CachedPalmVein.fromJson(Map<String, dynamic> json) =>
      _$CachedPalmVeinFromJson(json);
}
