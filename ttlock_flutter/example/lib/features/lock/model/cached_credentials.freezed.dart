// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedPasscode {
  String get keyboardPwd;
  String get newKeyboardPwd;
  int get startDate;
  int get endDate;
  int get keyboardPwdType;
  int get cycleType;

  /// Create a copy of CachedPasscode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedPasscodeCopyWith<CachedPasscode> get copyWith =>
      _$CachedPasscodeCopyWithImpl<CachedPasscode>(
          this as CachedPasscode, _$identity);

  /// Serializes this CachedPasscode to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedPasscode &&
            (identical(other.keyboardPwd, keyboardPwd) ||
                other.keyboardPwd == keyboardPwd) &&
            (identical(other.newKeyboardPwd, newKeyboardPwd) ||
                other.newKeyboardPwd == newKeyboardPwd) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.keyboardPwdType, keyboardPwdType) ||
                other.keyboardPwdType == keyboardPwdType) &&
            (identical(other.cycleType, cycleType) ||
                other.cycleType == cycleType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyboardPwd, newKeyboardPwd,
      startDate, endDate, keyboardPwdType, cycleType);

  @override
  String toString() {
    return 'CachedPasscode(keyboardPwd: $keyboardPwd, newKeyboardPwd: $newKeyboardPwd, startDate: $startDate, endDate: $endDate, keyboardPwdType: $keyboardPwdType, cycleType: $cycleType)';
  }
}

/// @nodoc
abstract mixin class $CachedPasscodeCopyWith<$Res> {
  factory $CachedPasscodeCopyWith(
          CachedPasscode value, $Res Function(CachedPasscode) _then) =
      _$CachedPasscodeCopyWithImpl;
  @useResult
  $Res call(
      {String keyboardPwd,
      String newKeyboardPwd,
      int startDate,
      int endDate,
      int keyboardPwdType,
      int cycleType});
}

/// @nodoc
class _$CachedPasscodeCopyWithImpl<$Res>
    implements $CachedPasscodeCopyWith<$Res> {
  _$CachedPasscodeCopyWithImpl(this._self, this._then);

  final CachedPasscode _self;
  final $Res Function(CachedPasscode) _then;

  /// Create a copy of CachedPasscode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyboardPwd = null,
    Object? newKeyboardPwd = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? keyboardPwdType = null,
    Object? cycleType = null,
  }) {
    return _then(_self.copyWith(
      keyboardPwd: null == keyboardPwd
          ? _self.keyboardPwd
          : keyboardPwd // ignore: cast_nullable_to_non_nullable
              as String,
      newKeyboardPwd: null == newKeyboardPwd
          ? _self.newKeyboardPwd
          : newKeyboardPwd // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardPwdType: null == keyboardPwdType
          ? _self.keyboardPwdType
          : keyboardPwdType // ignore: cast_nullable_to_non_nullable
              as int,
      cycleType: null == cycleType
          ? _self.cycleType
          : cycleType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CachedPasscode extends CachedPasscode {
  const _CachedPasscode(
      {required this.keyboardPwd,
      this.newKeyboardPwd = '',
      required this.startDate,
      required this.endDate,
      this.keyboardPwdType = 0,
      this.cycleType = 0})
      : super._();
  factory _CachedPasscode.fromJson(Map<String, dynamic> json) =>
      _$CachedPasscodeFromJson(json);

  @override
  final String keyboardPwd;
  @override
  @JsonKey()
  final String newKeyboardPwd;
  @override
  final int startDate;
  @override
  final int endDate;
  @override
  @JsonKey()
  final int keyboardPwdType;
  @override
  @JsonKey()
  final int cycleType;

  /// Create a copy of CachedPasscode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedPasscodeCopyWith<_CachedPasscode> get copyWith =>
      __$CachedPasscodeCopyWithImpl<_CachedPasscode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedPasscodeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedPasscode &&
            (identical(other.keyboardPwd, keyboardPwd) ||
                other.keyboardPwd == keyboardPwd) &&
            (identical(other.newKeyboardPwd, newKeyboardPwd) ||
                other.newKeyboardPwd == newKeyboardPwd) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.keyboardPwdType, keyboardPwdType) ||
                other.keyboardPwdType == keyboardPwdType) &&
            (identical(other.cycleType, cycleType) ||
                other.cycleType == cycleType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, keyboardPwd, newKeyboardPwd,
      startDate, endDate, keyboardPwdType, cycleType);

  @override
  String toString() {
    return 'CachedPasscode(keyboardPwd: $keyboardPwd, newKeyboardPwd: $newKeyboardPwd, startDate: $startDate, endDate: $endDate, keyboardPwdType: $keyboardPwdType, cycleType: $cycleType)';
  }
}

/// @nodoc
abstract mixin class _$CachedPasscodeCopyWith<$Res>
    implements $CachedPasscodeCopyWith<$Res> {
  factory _$CachedPasscodeCopyWith(
          _CachedPasscode value, $Res Function(_CachedPasscode) _then) =
      __$CachedPasscodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String keyboardPwd,
      String newKeyboardPwd,
      int startDate,
      int endDate,
      int keyboardPwdType,
      int cycleType});
}

/// @nodoc
class __$CachedPasscodeCopyWithImpl<$Res>
    implements _$CachedPasscodeCopyWith<$Res> {
  __$CachedPasscodeCopyWithImpl(this._self, this._then);

  final _CachedPasscode _self;
  final $Res Function(_CachedPasscode) _then;

  /// Create a copy of CachedPasscode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keyboardPwd = null,
    Object? newKeyboardPwd = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? keyboardPwdType = null,
    Object? cycleType = null,
  }) {
    return _then(_CachedPasscode(
      keyboardPwd: null == keyboardPwd
          ? _self.keyboardPwd
          : keyboardPwd // ignore: cast_nullable_to_non_nullable
              as String,
      newKeyboardPwd: null == newKeyboardPwd
          ? _self.newKeyboardPwd
          : newKeyboardPwd // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardPwdType: null == keyboardPwdType
          ? _self.keyboardPwdType
          : keyboardPwdType // ignore: cast_nullable_to_non_nullable
              as int,
      cycleType: null == cycleType
          ? _self.cycleType
          : cycleType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CachedCard {
  String get cardNumber;
  int get startDate;
  int get endDate;

  /// Create a copy of CachedCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedCardCopyWith<CachedCard> get copyWith =>
      _$CachedCardCopyWithImpl<CachedCard>(this as CachedCard, _$identity);

  /// Serializes this CachedCard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedCard &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedCard(cardNumber: $cardNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $CachedCardCopyWith<$Res> {
  factory $CachedCardCopyWith(
          CachedCard value, $Res Function(CachedCard) _then) =
      _$CachedCardCopyWithImpl;
  @useResult
  $Res call({String cardNumber, int startDate, int endDate});
}

/// @nodoc
class _$CachedCardCopyWithImpl<$Res> implements $CachedCardCopyWith<$Res> {
  _$CachedCardCopyWithImpl(this._self, this._then);

  final CachedCard _self;
  final $Res Function(CachedCard) _then;

  /// Create a copy of CachedCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      cardNumber: null == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CachedCard extends CachedCard {
  const _CachedCard(
      {required this.cardNumber,
      required this.startDate,
      required this.endDate})
      : super._();
  factory _CachedCard.fromJson(Map<String, dynamic> json) =>
      _$CachedCardFromJson(json);

  @override
  final String cardNumber;
  @override
  final int startDate;
  @override
  final int endDate;

  /// Create a copy of CachedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedCardCopyWith<_CachedCard> get copyWith =>
      __$CachedCardCopyWithImpl<_CachedCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedCardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedCard &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedCard(cardNumber: $cardNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CachedCardCopyWith<$Res>
    implements $CachedCardCopyWith<$Res> {
  factory _$CachedCardCopyWith(
          _CachedCard value, $Res Function(_CachedCard) _then) =
      __$CachedCardCopyWithImpl;
  @override
  @useResult
  $Res call({String cardNumber, int startDate, int endDate});
}

/// @nodoc
class __$CachedCardCopyWithImpl<$Res> implements _$CachedCardCopyWith<$Res> {
  __$CachedCardCopyWithImpl(this._self, this._then);

  final _CachedCard _self;
  final $Res Function(_CachedCard) _then;

  /// Create a copy of CachedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cardNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CachedCard(
      cardNumber: null == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CachedFingerprint {
  String get fingerprintNumber;
  int get startDate;
  int get endDate;

  /// Create a copy of CachedFingerprint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedFingerprintCopyWith<CachedFingerprint> get copyWith =>
      _$CachedFingerprintCopyWithImpl<CachedFingerprint>(
          this as CachedFingerprint, _$identity);

  /// Serializes this CachedFingerprint to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedFingerprint &&
            (identical(other.fingerprintNumber, fingerprintNumber) ||
                other.fingerprintNumber == fingerprintNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fingerprintNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedFingerprint(fingerprintNumber: $fingerprintNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $CachedFingerprintCopyWith<$Res> {
  factory $CachedFingerprintCopyWith(
          CachedFingerprint value, $Res Function(CachedFingerprint) _then) =
      _$CachedFingerprintCopyWithImpl;
  @useResult
  $Res call({String fingerprintNumber, int startDate, int endDate});
}

/// @nodoc
class _$CachedFingerprintCopyWithImpl<$Res>
    implements $CachedFingerprintCopyWith<$Res> {
  _$CachedFingerprintCopyWithImpl(this._self, this._then);

  final CachedFingerprint _self;
  final $Res Function(CachedFingerprint) _then;

  /// Create a copy of CachedFingerprint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fingerprintNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      fingerprintNumber: null == fingerprintNumber
          ? _self.fingerprintNumber
          : fingerprintNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CachedFingerprint extends CachedFingerprint {
  const _CachedFingerprint(
      {required this.fingerprintNumber,
      required this.startDate,
      required this.endDate})
      : super._();
  factory _CachedFingerprint.fromJson(Map<String, dynamic> json) =>
      _$CachedFingerprintFromJson(json);

  @override
  final String fingerprintNumber;
  @override
  final int startDate;
  @override
  final int endDate;

  /// Create a copy of CachedFingerprint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedFingerprintCopyWith<_CachedFingerprint> get copyWith =>
      __$CachedFingerprintCopyWithImpl<_CachedFingerprint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedFingerprintToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedFingerprint &&
            (identical(other.fingerprintNumber, fingerprintNumber) ||
                other.fingerprintNumber == fingerprintNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fingerprintNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedFingerprint(fingerprintNumber: $fingerprintNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CachedFingerprintCopyWith<$Res>
    implements $CachedFingerprintCopyWith<$Res> {
  factory _$CachedFingerprintCopyWith(
          _CachedFingerprint value, $Res Function(_CachedFingerprint) _then) =
      __$CachedFingerprintCopyWithImpl;
  @override
  @useResult
  $Res call({String fingerprintNumber, int startDate, int endDate});
}

/// @nodoc
class __$CachedFingerprintCopyWithImpl<$Res>
    implements _$CachedFingerprintCopyWith<$Res> {
  __$CachedFingerprintCopyWithImpl(this._self, this._then);

  final _CachedFingerprint _self;
  final $Res Function(_CachedFingerprint) _then;

  /// Create a copy of CachedFingerprint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fingerprintNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CachedFingerprint(
      fingerprintNumber: null == fingerprintNumber
          ? _self.fingerprintNumber
          : fingerprintNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CachedFace {
  String get faceNumber;
  int get startDate;
  int get endDate;

  /// Create a copy of CachedFace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedFaceCopyWith<CachedFace> get copyWith =>
      _$CachedFaceCopyWithImpl<CachedFace>(this as CachedFace, _$identity);

  /// Serializes this CachedFace to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedFace &&
            (identical(other.faceNumber, faceNumber) ||
                other.faceNumber == faceNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, faceNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedFace(faceNumber: $faceNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $CachedFaceCopyWith<$Res> {
  factory $CachedFaceCopyWith(
          CachedFace value, $Res Function(CachedFace) _then) =
      _$CachedFaceCopyWithImpl;
  @useResult
  $Res call({String faceNumber, int startDate, int endDate});
}

/// @nodoc
class _$CachedFaceCopyWithImpl<$Res> implements $CachedFaceCopyWith<$Res> {
  _$CachedFaceCopyWithImpl(this._self, this._then);

  final CachedFace _self;
  final $Res Function(CachedFace) _then;

  /// Create a copy of CachedFace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      faceNumber: null == faceNumber
          ? _self.faceNumber
          : faceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CachedFace extends CachedFace {
  const _CachedFace(
      {required this.faceNumber,
      required this.startDate,
      required this.endDate})
      : super._();
  factory _CachedFace.fromJson(Map<String, dynamic> json) =>
      _$CachedFaceFromJson(json);

  @override
  final String faceNumber;
  @override
  final int startDate;
  @override
  final int endDate;

  /// Create a copy of CachedFace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedFaceCopyWith<_CachedFace> get copyWith =>
      __$CachedFaceCopyWithImpl<_CachedFace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedFaceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedFace &&
            (identical(other.faceNumber, faceNumber) ||
                other.faceNumber == faceNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, faceNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedFace(faceNumber: $faceNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CachedFaceCopyWith<$Res>
    implements $CachedFaceCopyWith<$Res> {
  factory _$CachedFaceCopyWith(
          _CachedFace value, $Res Function(_CachedFace) _then) =
      __$CachedFaceCopyWithImpl;
  @override
  @useResult
  $Res call({String faceNumber, int startDate, int endDate});
}

/// @nodoc
class __$CachedFaceCopyWithImpl<$Res> implements _$CachedFaceCopyWith<$Res> {
  __$CachedFaceCopyWithImpl(this._self, this._then);

  final _CachedFace _self;
  final $Res Function(_CachedFace) _then;

  /// Create a copy of CachedFace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? faceNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CachedFace(
      faceNumber: null == faceNumber
          ? _self.faceNumber
          : faceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CachedPalmVein {
  String get palmVeinNumber;
  int get startDate;
  int get endDate;

  /// Create a copy of CachedPalmVein
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedPalmVeinCopyWith<CachedPalmVein> get copyWith =>
      _$CachedPalmVeinCopyWithImpl<CachedPalmVein>(
          this as CachedPalmVein, _$identity);

  /// Serializes this CachedPalmVein to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedPalmVein &&
            (identical(other.palmVeinNumber, palmVeinNumber) ||
                other.palmVeinNumber == palmVeinNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, palmVeinNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedPalmVein(palmVeinNumber: $palmVeinNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $CachedPalmVeinCopyWith<$Res> {
  factory $CachedPalmVeinCopyWith(
          CachedPalmVein value, $Res Function(CachedPalmVein) _then) =
      _$CachedPalmVeinCopyWithImpl;
  @useResult
  $Res call({String palmVeinNumber, int startDate, int endDate});
}

/// @nodoc
class _$CachedPalmVeinCopyWithImpl<$Res>
    implements $CachedPalmVeinCopyWith<$Res> {
  _$CachedPalmVeinCopyWithImpl(this._self, this._then);

  final CachedPalmVein _self;
  final $Res Function(CachedPalmVein) _then;

  /// Create a copy of CachedPalmVein
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? palmVeinNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      palmVeinNumber: null == palmVeinNumber
          ? _self.palmVeinNumber
          : palmVeinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CachedPalmVein implements CachedPalmVein {
  const _CachedPalmVein(
      {required this.palmVeinNumber,
      required this.startDate,
      required this.endDate});
  factory _CachedPalmVein.fromJson(Map<String, dynamic> json) =>
      _$CachedPalmVeinFromJson(json);

  @override
  final String palmVeinNumber;
  @override
  final int startDate;
  @override
  final int endDate;

  /// Create a copy of CachedPalmVein
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedPalmVeinCopyWith<_CachedPalmVein> get copyWith =>
      __$CachedPalmVeinCopyWithImpl<_CachedPalmVein>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedPalmVeinToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedPalmVein &&
            (identical(other.palmVeinNumber, palmVeinNumber) ||
                other.palmVeinNumber == palmVeinNumber) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, palmVeinNumber, startDate, endDate);

  @override
  String toString() {
    return 'CachedPalmVein(palmVeinNumber: $palmVeinNumber, startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CachedPalmVeinCopyWith<$Res>
    implements $CachedPalmVeinCopyWith<$Res> {
  factory _$CachedPalmVeinCopyWith(
          _CachedPalmVein value, $Res Function(_CachedPalmVein) _then) =
      __$CachedPalmVeinCopyWithImpl;
  @override
  @useResult
  $Res call({String palmVeinNumber, int startDate, int endDate});
}

/// @nodoc
class __$CachedPalmVeinCopyWithImpl<$Res>
    implements _$CachedPalmVeinCopyWith<$Res> {
  __$CachedPalmVeinCopyWithImpl(this._self, this._then);

  final _CachedPalmVein _self;
  final $Res Function(_CachedPalmVein) _then;

  /// Create a copy of CachedPalmVein
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? palmVeinNumber = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CachedPalmVein(
      palmVeinNumber: null == palmVeinNumber
          ? _self.palmVeinNumber
          : palmVeinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
