// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keyboard_pwd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KeyboardPwdEntity {

 int get keyboardPwdId; int get lockId; String get keyboardPwd; String get keyboardPwdName; KeyboardPwdType get keyboardPwdType; DateTime? get startDate; DateTime? get endDate; DateTime? get sendDate; bool get isCustom; String get senderUsername;
/// Create a copy of KeyboardPwdEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyboardPwdEntityCopyWith<KeyboardPwdEntity> get copyWith => _$KeyboardPwdEntityCopyWithImpl<KeyboardPwdEntity>(this as KeyboardPwdEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyboardPwdEntity&&(identical(other.keyboardPwdId, keyboardPwdId) || other.keyboardPwdId == keyboardPwdId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.keyboardPwdName, keyboardPwdName) || other.keyboardPwdName == keyboardPwdName)&&(identical(other.keyboardPwdType, keyboardPwdType) || other.keyboardPwdType == keyboardPwdType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}


@override
int get hashCode => Object.hash(runtimeType,keyboardPwdId,lockId,keyboardPwd,keyboardPwdName,keyboardPwdType,startDate,endDate,sendDate,isCustom,senderUsername);

@override
String toString() {
  return 'KeyboardPwdEntity(keyboardPwdId: $keyboardPwdId, lockId: $lockId, keyboardPwd: $keyboardPwd, keyboardPwdName: $keyboardPwdName, keyboardPwdType: $keyboardPwdType, startDate: $startDate, endDate: $endDate, sendDate: $sendDate, isCustom: $isCustom, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class $KeyboardPwdEntityCopyWith<$Res>  {
  factory $KeyboardPwdEntityCopyWith(KeyboardPwdEntity value, $Res Function(KeyboardPwdEntity) _then) = _$KeyboardPwdEntityCopyWithImpl;
@useResult
$Res call({
 int keyboardPwdId, int lockId, String keyboardPwd, String keyboardPwdName, KeyboardPwdType keyboardPwdType, DateTime? startDate, DateTime? endDate, DateTime? sendDate, bool isCustom, String senderUsername
});




}
/// @nodoc
class _$KeyboardPwdEntityCopyWithImpl<$Res>
    implements $KeyboardPwdEntityCopyWith<$Res> {
  _$KeyboardPwdEntityCopyWithImpl(this._self, this._then);

  final KeyboardPwdEntity _self;
  final $Res Function(KeyboardPwdEntity) _then;

/// Create a copy of KeyboardPwdEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyboardPwdId = null,Object? lockId = null,Object? keyboardPwd = null,Object? keyboardPwdName = null,Object? keyboardPwdType = null,Object? startDate = freezed,Object? endDate = freezed,Object? sendDate = freezed,Object? isCustom = null,Object? senderUsername = null,}) {
  return _then(_self.copyWith(
keyboardPwdId: null == keyboardPwdId ? _self.keyboardPwdId : keyboardPwdId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdName: null == keyboardPwdName ? _self.keyboardPwdName : keyboardPwdName // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdType: null == keyboardPwdType ? _self.keyboardPwdType : keyboardPwdType // ignore: cast_nullable_to_non_nullable
as KeyboardPwdType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyboardPwdEntity].
extension KeyboardPwdEntityPatterns on KeyboardPwdEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyboardPwdEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyboardPwdEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyboardPwdEntity value)  $default,){
final _that = this;
switch (_that) {
case _KeyboardPwdEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyboardPwdEntity value)?  $default,){
final _that = this;
switch (_that) {
case _KeyboardPwdEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int keyboardPwdId,  int lockId,  String keyboardPwd,  String keyboardPwdName,  KeyboardPwdType keyboardPwdType,  DateTime? startDate,  DateTime? endDate,  DateTime? sendDate,  bool isCustom,  String senderUsername)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyboardPwdEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int keyboardPwdId,  int lockId,  String keyboardPwd,  String keyboardPwdName,  KeyboardPwdType keyboardPwdType,  DateTime? startDate,  DateTime? endDate,  DateTime? sendDate,  bool isCustom,  String senderUsername)  $default,) {final _that = this;
switch (_that) {
case _KeyboardPwdEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int keyboardPwdId,  int lockId,  String keyboardPwd,  String keyboardPwdName,  KeyboardPwdType keyboardPwdType,  DateTime? startDate,  DateTime? endDate,  DateTime? sendDate,  bool isCustom,  String senderUsername)?  $default,) {final _that = this;
switch (_that) {
case _KeyboardPwdEntity() when $default != null:
return $default(_that.keyboardPwdId,_that.lockId,_that.keyboardPwd,_that.keyboardPwdName,_that.keyboardPwdType,_that.startDate,_that.endDate,_that.sendDate,_that.isCustom,_that.senderUsername);case _:
  return null;

}
}

}

/// @nodoc


class _KeyboardPwdEntity extends KeyboardPwdEntity {
  const _KeyboardPwdEntity({this.keyboardPwdId = 0, this.lockId = 0, this.keyboardPwd = '', this.keyboardPwdName = '', this.keyboardPwdType = KeyboardPwdType.limited, this.startDate, this.endDate, this.sendDate, this.isCustom = false, this.senderUsername = ''}): super._();
  

@override@JsonKey() final  int keyboardPwdId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  String keyboardPwd;
@override@JsonKey() final  String keyboardPwdName;
@override@JsonKey() final  KeyboardPwdType keyboardPwdType;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? sendDate;
@override@JsonKey() final  bool isCustom;
@override@JsonKey() final  String senderUsername;

/// Create a copy of KeyboardPwdEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyboardPwdEntityCopyWith<_KeyboardPwdEntity> get copyWith => __$KeyboardPwdEntityCopyWithImpl<_KeyboardPwdEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyboardPwdEntity&&(identical(other.keyboardPwdId, keyboardPwdId) || other.keyboardPwdId == keyboardPwdId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.keyboardPwdName, keyboardPwdName) || other.keyboardPwdName == keyboardPwdName)&&(identical(other.keyboardPwdType, keyboardPwdType) || other.keyboardPwdType == keyboardPwdType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}


@override
int get hashCode => Object.hash(runtimeType,keyboardPwdId,lockId,keyboardPwd,keyboardPwdName,keyboardPwdType,startDate,endDate,sendDate,isCustom,senderUsername);

@override
String toString() {
  return 'KeyboardPwdEntity(keyboardPwdId: $keyboardPwdId, lockId: $lockId, keyboardPwd: $keyboardPwd, keyboardPwdName: $keyboardPwdName, keyboardPwdType: $keyboardPwdType, startDate: $startDate, endDate: $endDate, sendDate: $sendDate, isCustom: $isCustom, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class _$KeyboardPwdEntityCopyWith<$Res> implements $KeyboardPwdEntityCopyWith<$Res> {
  factory _$KeyboardPwdEntityCopyWith(_KeyboardPwdEntity value, $Res Function(_KeyboardPwdEntity) _then) = __$KeyboardPwdEntityCopyWithImpl;
@override @useResult
$Res call({
 int keyboardPwdId, int lockId, String keyboardPwd, String keyboardPwdName, KeyboardPwdType keyboardPwdType, DateTime? startDate, DateTime? endDate, DateTime? sendDate, bool isCustom, String senderUsername
});




}
/// @nodoc
class __$KeyboardPwdEntityCopyWithImpl<$Res>
    implements _$KeyboardPwdEntityCopyWith<$Res> {
  __$KeyboardPwdEntityCopyWithImpl(this._self, this._then);

  final _KeyboardPwdEntity _self;
  final $Res Function(_KeyboardPwdEntity) _then;

/// Create a copy of KeyboardPwdEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyboardPwdId = null,Object? lockId = null,Object? keyboardPwd = null,Object? keyboardPwdName = null,Object? keyboardPwdType = null,Object? startDate = freezed,Object? endDate = freezed,Object? sendDate = freezed,Object? isCustom = null,Object? senderUsername = null,}) {
  return _then(_KeyboardPwdEntity(
keyboardPwdId: null == keyboardPwdId ? _self.keyboardPwdId : keyboardPwdId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdName: null == keyboardPwdName ? _self.keyboardPwdName : keyboardPwdName // ignore: cast_nullable_to_non_nullable
as String,keyboardPwdType: null == keyboardPwdType ? _self.keyboardPwdType : keyboardPwdType // ignore: cast_nullable_to_non_nullable
as KeyboardPwdType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
