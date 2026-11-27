// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockRecordEntity {

 int get recordId; int get lockId; int get recordTypeFromLock; int get recordType; bool get success; String get username; String get keyboardPwd; DateTime? get lockDate; DateTime? get serverDate; int get subRecordType;
/// Create a copy of LockRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockRecordEntityCopyWith<LockRecordEntity> get copyWith => _$LockRecordEntityCopyWithImpl<LockRecordEntity>(this as LockRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockRecordEntity&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate)&&(identical(other.subRecordType, subRecordType) || other.subRecordType == subRecordType));
}


@override
int get hashCode => Object.hash(runtimeType,recordId,lockId,recordTypeFromLock,recordType,success,username,keyboardPwd,lockDate,serverDate,subRecordType);

@override
String toString() {
  return 'LockRecordEntity(recordId: $recordId, lockId: $lockId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, username: $username, keyboardPwd: $keyboardPwd, lockDate: $lockDate, serverDate: $serverDate, subRecordType: $subRecordType)';
}


}

/// @nodoc
abstract mixin class $LockRecordEntityCopyWith<$Res>  {
  factory $LockRecordEntityCopyWith(LockRecordEntity value, $Res Function(LockRecordEntity) _then) = _$LockRecordEntityCopyWithImpl;
@useResult
$Res call({
 int recordId, int lockId, int recordTypeFromLock, int recordType, bool success, String username, String keyboardPwd, DateTime? lockDate, DateTime? serverDate, int subRecordType
});




}
/// @nodoc
class _$LockRecordEntityCopyWithImpl<$Res>
    implements $LockRecordEntityCopyWith<$Res> {
  _$LockRecordEntityCopyWithImpl(this._self, this._then);

  final LockRecordEntity _self;
  final $Res Function(LockRecordEntity) _then;

/// Create a copy of LockRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recordId = null,Object? lockId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? username = null,Object? keyboardPwd = null,Object? lockDate = freezed,Object? serverDate = freezed,Object? subRecordType = null,}) {
  return _then(_self.copyWith(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,recordTypeFromLock: null == recordTypeFromLock ? _self.recordTypeFromLock : recordTypeFromLock // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,lockDate: freezed == lockDate ? _self.lockDate : lockDate // ignore: cast_nullable_to_non_nullable
as DateTime?,serverDate: freezed == serverDate ? _self.serverDate : serverDate // ignore: cast_nullable_to_non_nullable
as DateTime?,subRecordType: null == subRecordType ? _self.subRecordType : subRecordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LockRecordEntity].
extension LockRecordEntityPatterns on LockRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _LockRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LockRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int recordId,  int lockId,  int recordTypeFromLock,  int recordType,  bool success,  String username,  String keyboardPwd,  DateTime? lockDate,  DateTime? serverDate,  int subRecordType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockRecordEntity() when $default != null:
return $default(_that.recordId,_that.lockId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.username,_that.keyboardPwd,_that.lockDate,_that.serverDate,_that.subRecordType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int recordId,  int lockId,  int recordTypeFromLock,  int recordType,  bool success,  String username,  String keyboardPwd,  DateTime? lockDate,  DateTime? serverDate,  int subRecordType)  $default,) {final _that = this;
switch (_that) {
case _LockRecordEntity():
return $default(_that.recordId,_that.lockId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.username,_that.keyboardPwd,_that.lockDate,_that.serverDate,_that.subRecordType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int recordId,  int lockId,  int recordTypeFromLock,  int recordType,  bool success,  String username,  String keyboardPwd,  DateTime? lockDate,  DateTime? serverDate,  int subRecordType)?  $default,) {final _that = this;
switch (_that) {
case _LockRecordEntity() when $default != null:
return $default(_that.recordId,_that.lockId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.username,_that.keyboardPwd,_that.lockDate,_that.serverDate,_that.subRecordType);case _:
  return null;

}
}

}

/// @nodoc


class _LockRecordEntity extends LockRecordEntity {
  const _LockRecordEntity({this.recordId = 0, this.lockId = 0, this.recordTypeFromLock = 0, this.recordType = 0, this.success = false, this.username = '', this.keyboardPwd = '', this.lockDate, this.serverDate, this.subRecordType = 0}): super._();
  

@override@JsonKey() final  int recordId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  int recordTypeFromLock;
@override@JsonKey() final  int recordType;
@override@JsonKey() final  bool success;
@override@JsonKey() final  String username;
@override@JsonKey() final  String keyboardPwd;
@override final  DateTime? lockDate;
@override final  DateTime? serverDate;
@override@JsonKey() final  int subRecordType;

/// Create a copy of LockRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockRecordEntityCopyWith<_LockRecordEntity> get copyWith => __$LockRecordEntityCopyWithImpl<_LockRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockRecordEntity&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate)&&(identical(other.subRecordType, subRecordType) || other.subRecordType == subRecordType));
}


@override
int get hashCode => Object.hash(runtimeType,recordId,lockId,recordTypeFromLock,recordType,success,username,keyboardPwd,lockDate,serverDate,subRecordType);

@override
String toString() {
  return 'LockRecordEntity(recordId: $recordId, lockId: $lockId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, username: $username, keyboardPwd: $keyboardPwd, lockDate: $lockDate, serverDate: $serverDate, subRecordType: $subRecordType)';
}


}

/// @nodoc
abstract mixin class _$LockRecordEntityCopyWith<$Res> implements $LockRecordEntityCopyWith<$Res> {
  factory _$LockRecordEntityCopyWith(_LockRecordEntity value, $Res Function(_LockRecordEntity) _then) = __$LockRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int recordId, int lockId, int recordTypeFromLock, int recordType, bool success, String username, String keyboardPwd, DateTime? lockDate, DateTime? serverDate, int subRecordType
});




}
/// @nodoc
class __$LockRecordEntityCopyWithImpl<$Res>
    implements _$LockRecordEntityCopyWith<$Res> {
  __$LockRecordEntityCopyWithImpl(this._self, this._then);

  final _LockRecordEntity _self;
  final $Res Function(_LockRecordEntity) _then;

/// Create a copy of LockRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordId = null,Object? lockId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? username = null,Object? keyboardPwd = null,Object? lockDate = freezed,Object? serverDate = freezed,Object? subRecordType = null,}) {
  return _then(_LockRecordEntity(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,recordTypeFromLock: null == recordTypeFromLock ? _self.recordTypeFromLock : recordTypeFromLock // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,keyboardPwd: null == keyboardPwd ? _self.keyboardPwd : keyboardPwd // ignore: cast_nullable_to_non_nullable
as String,lockDate: freezed == lockDate ? _self.lockDate : lockDate // ignore: cast_nullable_to_non_nullable
as DateTime?,serverDate: freezed == serverDate ? _self.serverDate : serverDate // ignore: cast_nullable_to_non_nullable
as DateTime?,subRecordType: null == subRecordType ? _self.subRecordType : subRecordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
