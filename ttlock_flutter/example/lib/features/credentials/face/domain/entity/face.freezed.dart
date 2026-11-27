// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceEntity {

 int get faceId; int get lockId; String get name; String get faceNumber; EntityStatus get status; String get nickname; String get userid; CredentialType get type; DateTime? get startDate; DateTime? get endDate; List<CyclicConfig> get cyclicConfig; DateTime? get createDate;
/// Create a copy of FaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceEntityCopyWith<FaceEntity> get copyWith => _$FaceEntityCopyWithImpl<FaceEntity>(this as FaceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceEntity&&(identical(other.faceId, faceId) || other.faceId == faceId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.name, name) || other.name == name)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,faceId,lockId,name,faceNumber,status,nickname,userid,type,startDate,endDate,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'FaceEntity(faceId: $faceId, lockId: $lockId, name: $name, faceNumber: $faceNumber, status: $status, nickname: $nickname, userid: $userid, type: $type, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $FaceEntityCopyWith<$Res>  {
  factory $FaceEntityCopyWith(FaceEntity value, $Res Function(FaceEntity) _then) = _$FaceEntityCopyWithImpl;
@useResult
$Res call({
 int faceId, int lockId, String name, String faceNumber, EntityStatus status, String nickname, String userid, CredentialType type, DateTime? startDate, DateTime? endDate, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class _$FaceEntityCopyWithImpl<$Res>
    implements $FaceEntityCopyWith<$Res> {
  _$FaceEntityCopyWithImpl(this._self, this._then);

  final FaceEntity _self;
  final $Res Function(FaceEntity) _then;

/// Create a copy of FaceEntity
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


/// Adds pattern-matching-related methods to [FaceEntity].
extension FaceEntityPatterns on FaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _FaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int faceId,  int lockId,  String name,  String faceNumber,  EntityStatus status,  String nickname,  String userid,  CredentialType type,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int faceId,  int lockId,  String name,  String faceNumber,  EntityStatus status,  String nickname,  String userid,  CredentialType type,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _FaceEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int faceId,  int lockId,  String name,  String faceNumber,  EntityStatus status,  String nickname,  String userid,  CredentialType type,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _FaceEntity() when $default != null:
return $default(_that.faceId,_that.lockId,_that.name,_that.faceNumber,_that.status,_that.nickname,_that.userid,_that.type,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc


class _FaceEntity extends FaceEntity {
  const _FaceEntity({this.faceId = 0, this.lockId = 0, this.name = '', this.faceNumber = '', this.status = EntityStatus.normal, this.nickname = '', this.userid = '', this.type = CredentialType.normal, this.startDate, this.endDate, final  List<CyclicConfig> cyclicConfig = const [], this.createDate}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int faceId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String faceNumber;
@override@JsonKey() final  EntityStatus status;
@override@JsonKey() final  String nickname;
@override@JsonKey() final  String userid;
@override@JsonKey() final  CredentialType type;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override final  DateTime? createDate;

/// Create a copy of FaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceEntityCopyWith<_FaceEntity> get copyWith => __$FaceEntityCopyWithImpl<_FaceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceEntity&&(identical(other.faceId, faceId) || other.faceId == faceId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.name, name) || other.name == name)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,faceId,lockId,name,faceNumber,status,nickname,userid,type,startDate,endDate,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'FaceEntity(faceId: $faceId, lockId: $lockId, name: $name, faceNumber: $faceNumber, status: $status, nickname: $nickname, userid: $userid, type: $type, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$FaceEntityCopyWith<$Res> implements $FaceEntityCopyWith<$Res> {
  factory _$FaceEntityCopyWith(_FaceEntity value, $Res Function(_FaceEntity) _then) = __$FaceEntityCopyWithImpl;
@override @useResult
$Res call({
 int faceId, int lockId, String name, String faceNumber, EntityStatus status, String nickname, String userid, CredentialType type, DateTime? startDate, DateTime? endDate, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class __$FaceEntityCopyWithImpl<$Res>
    implements _$FaceEntityCopyWith<$Res> {
  __$FaceEntityCopyWithImpl(this._self, this._then);

  final _FaceEntity _self;
  final $Res Function(_FaceEntity) _then;

/// Create a copy of FaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faceId = null,Object? lockId = null,Object? name = null,Object? faceNumber = null,Object? status = null,Object? nickname = null,Object? userid = null,Object? type = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_FaceEntity(
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
