// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyboard_pwd_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeyboardPwdDto {

@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic) int get keyboardPwdId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'keyboardPwd') String get keyboardPwd;@JsonKey(name: 'keyboardPwdName') String get keyboardPwdName;@JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic) int get keyboardPwdType;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? get endDate;@JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson) DateTime? get sendDate;@JsonKey(name: 'isCustom', fromJson: boolFromDynamic) bool get isCustom;@JsonKey(name: 'senderUsername') String get senderUsername;
/// Create a copy of KeyboardPwdDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyboardPwdDtoCopyWith<KeyboardPwdDto> get copyWith => _$KeyboardPwdDtoCopyWithImpl<KeyboardPwdDto>(this as KeyboardPwdDto, _$identity);

  /// Serializes this KeyboardPwdDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyboardPwdDto&&(identical(other.keyboardPwdId, keyboardPwdId) || other.keyboardPwdId == keyboardPwdId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.keyboardPwdName, keyboardPwdName) || other.keyboardPwdName == keyboardPwdName)&&(identical(other.keyboardPwdType, keyboardPwdType) || other.keyboardPwdType == keyboardPwdType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyboardPwdId,lockId,keyboardPwd,keyboardPwdName,keyboardPwdType,startDate,endDate,sendDate,isCustom,senderUsername);

@override
String toString() {
  return 'KeyboardPwdDto(keyboardPwdId: $keyboardPwdId, lockId: $lockId, keyboardPwd: $keyboardPwd, keyboardPwdName: $keyboardPwdName, keyboardPwdType: $keyboardPwdType, startDate: $startDate, endDate: $endDate, sendDate: $sendDate, isCustom: $isCustom, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class $KeyboardPwdDtoCopyWith<$Res>  {
  factory $KeyboardPwdDtoCopyWith(KeyboardPwdDto value, $Res Function(KeyboardPwdDto) _then) = _$KeyboardPwdDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic) int keyboardPwdId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'keyboardPwd') String keyboardPwd,@JsonKey(name: 'keyboardPwdName') String keyboardPwdName,@JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic) int keyboardPwdType,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson) DateTime? sendDate,@JsonKey(name: 'isCustom', fromJson: boolFromDynamic) bool isCustom,@JsonKey(name: 'senderUsername') String senderUsername
});




}
/// @nodoc
class _$KeyboardPwdDtoCopyWithImpl<$Res>
    implements $KeyboardPwdDtoCopyWith<$Res> {
  _$KeyboardPwdDtoCopyWithImpl(this._self, this._then);

  final KeyboardPwdDto _self;
  final $Res Function(KeyboardPwdDto) _then;

/// Create a copy of KeyboardPwdDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyboardPwdId = null,Object? lockId = null,Object? keyboardPwd = null,Object? keyboardPwdName = null,Object? keyboardPwdType = null,Object? startDate = freezed,Object? endDate = freezed,Object? sendDate = freezed,Object? isCustom = null,Object? senderUsername = null,}) {
  return _then(_self.copyWith(
keyboardPwdId: null == keyboardPwdId ? _self.keyboardPwdId : keyboardPwdId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdName: null == keyboardPwdName ? _self.keyboardPwdName : keyboardPwdName // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdType: null == keyboardPwdType ? _self.keyboardPwdType : keyboardPwdType // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyboardPwdDto].
extension KeyboardPwdDtoPatterns on KeyboardPwdDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyboardPwdDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyboardPwdDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyboardPwdDto value)  $default,){
final _that = this;
switch (_that) {
case _KeyboardPwdDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyboardPwdDto value)?  $default,){
final _that = this;
switch (_that) {
case _KeyboardPwdDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic)  int keyboardPwdId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'keyboardPwdName')  String keyboardPwdName, @JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic)  int keyboardPwdType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson)  DateTime? sendDate, @JsonKey(name: 'isCustom', fromJson: boolFromDynamic)  bool isCustom, @JsonKey(name: 'senderUsername')  String senderUsername)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyboardPwdDto() when $default != null:
return $default(_that.keyboardPwdId,_that.lockId,_that.keyboardPwd,_that.keyboardPwdName,_that.keyboardPwdType,_that.startDate,_that.endDate,_that.sendDate,_that.isCustom,_that.senderUsername);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic)  int keyboardPwdId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'keyboardPwdName')  String keyboardPwdName, @JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic)  int keyboardPwdType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson)  DateTime? sendDate, @JsonKey(name: 'isCustom', fromJson: boolFromDynamic)  bool isCustom, @JsonKey(name: 'senderUsername')  String senderUsername)  $default,) {final _that = this;
switch (_that) {
case _KeyboardPwdDto():
return $default(_that.keyboardPwdId,_that.lockId,_that.keyboardPwd,_that.keyboardPwdName,_that.keyboardPwdType,_that.startDate,_that.endDate,_that.sendDate,_that.isCustom,_that.senderUsername);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic)  int keyboardPwdId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'keyboardPwdName')  String keyboardPwdName, @JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic)  int keyboardPwdType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson)  DateTime? sendDate, @JsonKey(name: 'isCustom', fromJson: boolFromDynamic)  bool isCustom, @JsonKey(name: 'senderUsername')  String senderUsername)?  $default,) {final _that = this;
switch (_that) {
case _KeyboardPwdDto() when $default != null:
return $default(_that.keyboardPwdId,_that.lockId,_that.keyboardPwd,_that.keyboardPwdName,_that.keyboardPwdType,_that.startDate,_that.endDate,_that.sendDate,_that.isCustom,_that.senderUsername);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeyboardPwdDto extends KeyboardPwdDto {
  const _KeyboardPwdDto({@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic) this.keyboardPwdId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'keyboardPwd') this.keyboardPwd = '', @JsonKey(name: 'keyboardPwdName') this.keyboardPwdName = '', @JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic) this.keyboardPwdType = 3, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) this.endDate, @JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson) this.sendDate, @JsonKey(name: 'isCustom', fromJson: boolFromDynamic) this.isCustom = false, @JsonKey(name: 'senderUsername') this.senderUsername = ''}): super._();
  factory _KeyboardPwdDto.fromJson(Map<String, dynamic> json) => _$KeyboardPwdDtoFromJson(json);

@override@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic) final  int keyboardPwdId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'keyboardPwd') final  String keyboardPwd;
@override@JsonKey(name: 'keyboardPwdName') final  String keyboardPwdName;
@override@JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic) final  int keyboardPwdType;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? endDate;
@override@JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? sendDate;
@override@JsonKey(name: 'isCustom', fromJson: boolFromDynamic) final  bool isCustom;
@override@JsonKey(name: 'senderUsername') final  String senderUsername;

/// Create a copy of KeyboardPwdDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyboardPwdDtoCopyWith<_KeyboardPwdDto> get copyWith => __$KeyboardPwdDtoCopyWithImpl<_KeyboardPwdDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeyboardPwdDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyboardPwdDto&&(identical(other.keyboardPwdId, keyboardPwdId) || other.keyboardPwdId == keyboardPwdId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.keyboardPwdName, keyboardPwdName) || other.keyboardPwdName == keyboardPwdName)&&(identical(other.keyboardPwdType, keyboardPwdType) || other.keyboardPwdType == keyboardPwdType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyboardPwdId,lockId,keyboardPwd,keyboardPwdName,keyboardPwdType,startDate,endDate,sendDate,isCustom,senderUsername);

@override
String toString() {
  return 'KeyboardPwdDto(keyboardPwdId: $keyboardPwdId, lockId: $lockId, keyboardPwd: $keyboardPwd, keyboardPwdName: $keyboardPwdName, keyboardPwdType: $keyboardPwdType, startDate: $startDate, endDate: $endDate, sendDate: $sendDate, isCustom: $isCustom, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class _$KeyboardPwdDtoCopyWith<$Res> implements $KeyboardPwdDtoCopyWith<$Res> {
  factory _$KeyboardPwdDtoCopyWith(_KeyboardPwdDto value, $Res Function(_KeyboardPwdDto) _then) = __$KeyboardPwdDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic) int keyboardPwdId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'keyboardPwd') String keyboardPwd,@JsonKey(name: 'keyboardPwdName') String keyboardPwdName,@JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic) int keyboardPwdType,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson) DateTime? sendDate,@JsonKey(name: 'isCustom', fromJson: boolFromDynamic) bool isCustom,@JsonKey(name: 'senderUsername') String senderUsername
});




}
/// @nodoc
class __$KeyboardPwdDtoCopyWithImpl<$Res>
    implements _$KeyboardPwdDtoCopyWith<$Res> {
  __$KeyboardPwdDtoCopyWithImpl(this._self, this._then);

  final _KeyboardPwdDto _self;
  final $Res Function(_KeyboardPwdDto) _then;

/// Create a copy of KeyboardPwdDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyboardPwdId = null,Object? lockId = null,Object? keyboardPwd = null,Object? keyboardPwdName = null,Object? keyboardPwdType = null,Object? startDate = freezed,Object? endDate = freezed,Object? sendDate = freezed,Object? isCustom = null,Object? senderUsername = null,}) {
  return _then(_KeyboardPwdDto(
keyboardPwdId: null == keyboardPwdId ? _self.keyboardPwdId : keyboardPwdId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdName: null == keyboardPwdName ? _self.keyboardPwdName : keyboardPwdName // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdType: null == keyboardPwdType ? _self.keyboardPwdType : keyboardPwdType // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
