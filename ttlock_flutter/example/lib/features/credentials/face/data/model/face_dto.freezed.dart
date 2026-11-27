// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaceDto {

@JsonKey(name: 'faceId', fromJson: intFromDynamic) int get faceId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic) String get name;@JsonKey(name: 'faceNumber', fromJson: stringFromDynamic) String get faceNumber;@JsonKey(name: 'status', fromJson: _statusFromJson) EntityStatus get status;@JsonKey(readValue: _readNickname, fromJson: stringFromDynamic) String get nickname;@JsonKey(name: 'userid', fromJson: stringFromDynamic) String get userid;@JsonKey(readValue: _readFaceType, fromJson: _typeFromJson) CredentialType get type;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get endDate;@JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson) List<CyclicConfig> get cyclicConfig;@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get createDate;
/// Create a copy of FaceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceDtoCopyWith<FaceDto> get copyWith => _$FaceDtoCopyWithImpl<FaceDto>(this as FaceDto, _$identity);

  /// Serializes this FaceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceDto&&(identical(other.faceId, faceId) || other.faceId == faceId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.name, name) || other.name == name)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faceId,lockId,name,faceNumber,status,nickname,userid,type,startDate,endDate,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'FaceDto(faceId: $faceId, lockId: $lockId, name: $name, faceNumber: $faceNumber, status: $status, nickname: $nickname, userid: $userid, type: $type, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $FaceDtoCopyWith<$Res>  {
  factory $FaceDtoCopyWith(FaceDto value, $Res Function(FaceDto) _then) = _$FaceDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'faceId', fromJson: intFromDynamic) int faceId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic) String name,@JsonKey(name: 'faceNumber', fromJson: stringFromDynamic) String faceNumber,@JsonKey(name: 'status', fromJson: _statusFromJson) EntityStatus status,@JsonKey(readValue: _readNickname, fromJson: stringFromDynamic) String nickname,@JsonKey(name: 'userid', fromJson: stringFromDynamic) String userid,@JsonKey(readValue: _readFaceType, fromJson: _typeFromJson) CredentialType type,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? createDate
});




}
/// @nodoc
class _$FaceDtoCopyWithImpl<$Res>
    implements $FaceDtoCopyWith<$Res> {
  _$FaceDtoCopyWithImpl(this._self, this._then);

  final FaceDto _self;
  final $Res Function(FaceDto) _then;

/// Create a copy of FaceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? faceId = null,Object? lockId = null,Object? name = null,Object? faceNumber = null,Object? status = null,Object? nickname = null,Object? userid = null,Object? type = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_self.copyWith(
faceId: null == faceId ? _self.faceId : faceId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,faceNumber: null == faceNumber ? _self.faceNumber : faceNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceDto].
extension FaceDtoPatterns on FaceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceDto value)  $default,){
final _that = this;
switch (_that) {
case _FaceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceDto value)?  $default,){
final _that = this;
switch (_that) {
case _FaceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'faceId', fromJson: intFromDynamic)  int faceId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic)  String name, @JsonKey(name: 'faceNumber', fromJson: stringFromDynamic)  String faceNumber, @JsonKey(name: 'status', fromJson: _statusFromJson)  EntityStatus status, @JsonKey(readValue: _readNickname, fromJson: stringFromDynamic)  String nickname, @JsonKey(name: 'userid', fromJson: stringFromDynamic)  String userid, @JsonKey(readValue: _readFaceType, fromJson: _typeFromJson)  CredentialType type, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceDto() when $default != null:
return $default(_that.faceId,_that.lockId,_that.name,_that.faceNumber,_that.status,_that.nickname,_that.userid,_that.type,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'faceId', fromJson: intFromDynamic)  int faceId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic)  String name, @JsonKey(name: 'faceNumber', fromJson: stringFromDynamic)  String faceNumber, @JsonKey(name: 'status', fromJson: _statusFromJson)  EntityStatus status, @JsonKey(readValue: _readNickname, fromJson: stringFromDynamic)  String nickname, @JsonKey(name: 'userid', fromJson: stringFromDynamic)  String userid, @JsonKey(readValue: _readFaceType, fromJson: _typeFromJson)  CredentialType type, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _FaceDto():
return $default(_that.faceId,_that.lockId,_that.name,_that.faceNumber,_that.status,_that.nickname,_that.userid,_that.type,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'faceId', fromJson: intFromDynamic)  int faceId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic)  String name, @JsonKey(name: 'faceNumber', fromJson: stringFromDynamic)  String faceNumber, @JsonKey(name: 'status', fromJson: _statusFromJson)  EntityStatus status, @JsonKey(readValue: _readNickname, fromJson: stringFromDynamic)  String nickname, @JsonKey(name: 'userid', fromJson: stringFromDynamic)  String userid, @JsonKey(readValue: _readFaceType, fromJson: _typeFromJson)  CredentialType type, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _FaceDto() when $default != null:
return $default(_that.faceId,_that.lockId,_that.name,_that.faceNumber,_that.status,_that.nickname,_that.userid,_that.type,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaceDto extends FaceDto {
  const _FaceDto({@JsonKey(name: 'faceId', fromJson: intFromDynamic) this.faceId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic) this.name = '', @JsonKey(name: 'faceNumber', fromJson: stringFromDynamic) this.faceNumber = '', @JsonKey(name: 'status', fromJson: _statusFromJson) this.status = EntityStatus.normal, @JsonKey(readValue: _readNickname, fromJson: stringFromDynamic) this.nickname = '', @JsonKey(name: 'userid', fromJson: stringFromDynamic) this.userid = '', @JsonKey(readValue: _readFaceType, fromJson: _typeFromJson) this.type = CredentialType.normal, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.endDate, @JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson) final  List<CyclicConfig> cyclicConfig = const [], @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.createDate}): _cyclicConfig = cyclicConfig,super._();
  factory _FaceDto.fromJson(Map<String, dynamic> json) => _$FaceDtoFromJson(json);

@override@JsonKey(name: 'faceId', fromJson: intFromDynamic) final  int faceId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic) final  String name;
@override@JsonKey(name: 'faceNumber', fromJson: stringFromDynamic) final  String faceNumber;
@override@JsonKey(name: 'status', fromJson: _statusFromJson) final  EntityStatus status;
@override@JsonKey(readValue: _readNickname, fromJson: stringFromDynamic) final  String nickname;
@override@JsonKey(name: 'userid', fromJson: stringFromDynamic) final  String userid;
@override@JsonKey(readValue: _readFaceType, fromJson: _typeFromJson) final  CredentialType type;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? endDate;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson) List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? createDate;

/// Create a copy of FaceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceDtoCopyWith<_FaceDto> get copyWith => __$FaceDtoCopyWithImpl<_FaceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceDto&&(identical(other.faceId, faceId) || other.faceId == faceId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.name, name) || other.name == name)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faceId,lockId,name,faceNumber,status,nickname,userid,type,startDate,endDate,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'FaceDto(faceId: $faceId, lockId: $lockId, name: $name, faceNumber: $faceNumber, status: $status, nickname: $nickname, userid: $userid, type: $type, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$FaceDtoCopyWith<$Res> implements $FaceDtoCopyWith<$Res> {
  factory _$FaceDtoCopyWith(_FaceDto value, $Res Function(_FaceDto) _then) = __$FaceDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'faceId', fromJson: intFromDynamic) int faceId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic) String name,@JsonKey(name: 'faceNumber', fromJson: stringFromDynamic) String faceNumber,@JsonKey(name: 'status', fromJson: _statusFromJson) EntityStatus status,@JsonKey(readValue: _readNickname, fromJson: stringFromDynamic) String nickname,@JsonKey(name: 'userid', fromJson: stringFromDynamic) String userid,@JsonKey(readValue: _readFaceType, fromJson: _typeFromJson) CredentialType type,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? createDate
});




}
/// @nodoc
class __$FaceDtoCopyWithImpl<$Res>
    implements _$FaceDtoCopyWith<$Res> {
  __$FaceDtoCopyWithImpl(this._self, this._then);

  final _FaceDto _self;
  final $Res Function(_FaceDto) _then;

/// Create a copy of FaceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faceId = null,Object? lockId = null,Object? name = null,Object? faceNumber = null,Object? status = null,Object? nickname = null,Object? userid = null,Object? type = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_FaceDto(
faceId: null == faceId ? _self.faceId : faceId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,faceNumber: null == faceNumber ? _self.faceNumber : faceNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
