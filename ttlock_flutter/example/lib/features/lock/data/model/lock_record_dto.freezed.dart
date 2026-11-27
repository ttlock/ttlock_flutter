// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_record_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockRecordDto {

@JsonKey(name: 'recordId', fromJson: intFromDynamic) int get recordId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int get recordTypeFromLock;@JsonKey(name: 'recordType', fromJson: intFromDynamic) int get recordType;@JsonKey(name: 'success', fromJson: boolFromDynamic) bool get success;@JsonKey(name: 'username') String get username;@JsonKey(name: 'keyboardPwd') String get keyboardPwd;@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get lockDate;@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get serverDate;@JsonKey(name: 'subRecordType', fromJson: intFromDynamic) int get subRecordType;
/// Create a copy of LockRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockRecordDtoCopyWith<LockRecordDto> get copyWith => _$LockRecordDtoCopyWithImpl<LockRecordDto>(this as LockRecordDto, _$identity);

  /// Serializes this LockRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockRecordDto&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate)&&(identical(other.subRecordType, subRecordType) || other.subRecordType == subRecordType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordId,lockId,recordTypeFromLock,recordType,success,username,keyboardPwd,lockDate,serverDate,subRecordType);

@override
String toString() {
  return 'LockRecordDto(recordId: $recordId, lockId: $lockId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, username: $username, keyboardPwd: $keyboardPwd, lockDate: $lockDate, serverDate: $serverDate, subRecordType: $subRecordType)';
}


}

/// @nodoc
abstract mixin class $LockRecordDtoCopyWith<$Res>  {
  factory $LockRecordDtoCopyWith(LockRecordDto value, $Res Function(LockRecordDto) _then) = _$LockRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recordId', fromJson: intFromDynamic) int recordId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int recordTypeFromLock,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType,@JsonKey(name: 'success', fromJson: boolFromDynamic) bool success,@JsonKey(name: 'username') String username,@JsonKey(name: 'keyboardPwd') String keyboardPwd,@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? lockDate,@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? serverDate,@JsonKey(name: 'subRecordType', fromJson: intFromDynamic) int subRecordType
});




}
/// @nodoc
class _$LockRecordDtoCopyWithImpl<$Res>
    implements $LockRecordDtoCopyWith<$Res> {
  _$LockRecordDtoCopyWithImpl(this._self, this._then);

  final LockRecordDto _self;
  final $Res Function(LockRecordDto) _then;

/// Create a copy of LockRecordDto
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


/// Adds pattern-matching-related methods to [LockRecordDto].
extension LockRecordDtoPatterns on LockRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _LockRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _LockRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate, @JsonKey(name: 'subRecordType', fromJson: intFromDynamic)  int subRecordType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockRecordDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate, @JsonKey(name: 'subRecordType', fromJson: intFromDynamic)  int subRecordType)  $default,) {final _that = this;
switch (_that) {
case _LockRecordDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyboardPwd')  String keyboardPwd, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate, @JsonKey(name: 'subRecordType', fromJson: intFromDynamic)  int subRecordType)?  $default,) {final _that = this;
switch (_that) {
case _LockRecordDto() when $default != null:
return $default(_that.recordId,_that.lockId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.username,_that.keyboardPwd,_that.lockDate,_that.serverDate,_that.subRecordType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockRecordDto extends LockRecordDto {
  const _LockRecordDto({@JsonKey(name: 'recordId', fromJson: intFromDynamic) this.recordId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) this.recordTypeFromLock = 0, @JsonKey(name: 'recordType', fromJson: intFromDynamic) this.recordType = 0, @JsonKey(name: 'success', fromJson: boolFromDynamic) this.success = false, @JsonKey(name: 'username') this.username = '', @JsonKey(name: 'keyboardPwd') this.keyboardPwd = '', @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.serverDate, @JsonKey(name: 'subRecordType', fromJson: intFromDynamic) this.subRecordType = 0}): super._();
  factory _LockRecordDto.fromJson(Map<String, dynamic> json) => _$LockRecordDtoFromJson(json);

@override@JsonKey(name: 'recordId', fromJson: intFromDynamic) final  int recordId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) final  int recordTypeFromLock;
@override@JsonKey(name: 'recordType', fromJson: intFromDynamic) final  int recordType;
@override@JsonKey(name: 'success', fromJson: boolFromDynamic) final  bool success;
@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'keyboardPwd') final  String keyboardPwd;
@override@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? lockDate;
@override@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? serverDate;
@override@JsonKey(name: 'subRecordType', fromJson: intFromDynamic) final  int subRecordType;

/// Create a copy of LockRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockRecordDtoCopyWith<_LockRecordDto> get copyWith => __$LockRecordDtoCopyWithImpl<_LockRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockRecordDto&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyboardPwd, keyboardPwd) || other.keyboardPwd == keyboardPwd)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate)&&(identical(other.subRecordType, subRecordType) || other.subRecordType == subRecordType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordId,lockId,recordTypeFromLock,recordType,success,username,keyboardPwd,lockDate,serverDate,subRecordType);

@override
String toString() {
  return 'LockRecordDto(recordId: $recordId, lockId: $lockId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, username: $username, keyboardPwd: $keyboardPwd, lockDate: $lockDate, serverDate: $serverDate, subRecordType: $subRecordType)';
}


}

/// @nodoc
abstract mixin class _$LockRecordDtoCopyWith<$Res> implements $LockRecordDtoCopyWith<$Res> {
  factory _$LockRecordDtoCopyWith(_LockRecordDto value, $Res Function(_LockRecordDto) _then) = __$LockRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recordId', fromJson: intFromDynamic) int recordId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int recordTypeFromLock,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType,@JsonKey(name: 'success', fromJson: boolFromDynamic) bool success,@JsonKey(name: 'username') String username,@JsonKey(name: 'keyboardPwd') String keyboardPwd,@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? lockDate,@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? serverDate,@JsonKey(name: 'subRecordType', fromJson: intFromDynamic) int subRecordType
});




}
/// @nodoc
class __$LockRecordDtoCopyWithImpl<$Res>
    implements _$LockRecordDtoCopyWith<$Res> {
  __$LockRecordDtoCopyWithImpl(this._self, this._then);

  final _LockRecordDto _self;
  final $Res Function(_LockRecordDto) _then;

/// Create a copy of LockRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordId = null,Object? lockId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? username = null,Object? keyboardPwd = null,Object? lockDate = freezed,Object? serverDate = freezed,Object? subRecordType = null,}) {
  return _then(_LockRecordDto(
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
