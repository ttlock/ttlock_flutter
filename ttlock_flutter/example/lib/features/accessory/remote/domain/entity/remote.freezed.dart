// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteEntity {

 int get remoteId; String get name; String get mac; int get electricQuantity; EntityStatus get status; String get nickname; String get userId; DateTime? get startDate; DateTime? get endDate; CredentialType get type; List<CyclicConfig> get cyclicConfig; DateTime? get createDate;
/// Create a copy of RemoteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteEntityCopyWith<RemoteEntity> get copyWith => _$RemoteEntityCopyWithImpl<RemoteEntity>(this as RemoteEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteEntity&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,remoteId,name,mac,electricQuantity,status,nickname,userId,startDate,endDate,type,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'RemoteEntity(remoteId: $remoteId, name: $name, mac: $mac, electricQuantity: $electricQuantity, status: $status, nickname: $nickname, userId: $userId, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $RemoteEntityCopyWith<$Res>  {
  factory $RemoteEntityCopyWith(RemoteEntity value, $Res Function(RemoteEntity) _then) = _$RemoteEntityCopyWithImpl;
@useResult
$Res call({
 int remoteId, String name, String mac, int electricQuantity, EntityStatus status, String nickname, String userId, DateTime? startDate, DateTime? endDate, CredentialType type, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class _$RemoteEntityCopyWithImpl<$Res>
    implements $RemoteEntityCopyWith<$Res> {
  _$RemoteEntityCopyWithImpl(this._self, this._then);

  final RemoteEntity _self;
  final $Res Function(RemoteEntity) _then;

/// Create a copy of RemoteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteId = null,Object? name = null,Object? mac = null,Object? electricQuantity = null,Object? status = null,Object? nickname = null,Object? userId = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_self.copyWith(
remoteId: null == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteEntity].
extension RemoteEntityPatterns on RemoteEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteEntity value)  $default,){
final _that = this;
switch (_that) {
case _RemoteEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int remoteId,  String name,  String mac,  int electricQuantity,  EntityStatus status,  String nickname,  String userId,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteEntity() when $default != null:
return $default(_that.remoteId,_that.name,_that.mac,_that.electricQuantity,_that.status,_that.nickname,_that.userId,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int remoteId,  String name,  String mac,  int electricQuantity,  EntityStatus status,  String nickname,  String userId,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _RemoteEntity():
return $default(_that.remoteId,_that.name,_that.mac,_that.electricQuantity,_that.status,_that.nickname,_that.userId,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int remoteId,  String name,  String mac,  int electricQuantity,  EntityStatus status,  String nickname,  String userId,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _RemoteEntity() when $default != null:
return $default(_that.remoteId,_that.name,_that.mac,_that.electricQuantity,_that.status,_that.nickname,_that.userId,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteEntity extends RemoteEntity {
  const _RemoteEntity({this.remoteId = 0, this.name = '', this.mac = '', this.electricQuantity = 0, this.status = EntityStatus.normal, this.nickname = '', this.userId = '', this.startDate, this.endDate, this.type = CredentialType.normal, final  List<CyclicConfig> cyclicConfig = const [], this.createDate}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int remoteId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String mac;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  EntityStatus status;
@override@JsonKey() final  String nickname;
@override@JsonKey() final  String userId;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  CredentialType type;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override final  DateTime? createDate;

/// Create a copy of RemoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteEntityCopyWith<_RemoteEntity> get copyWith => __$RemoteEntityCopyWithImpl<_RemoteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteEntity&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,remoteId,name,mac,electricQuantity,status,nickname,userId,startDate,endDate,type,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'RemoteEntity(remoteId: $remoteId, name: $name, mac: $mac, electricQuantity: $electricQuantity, status: $status, nickname: $nickname, userId: $userId, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$RemoteEntityCopyWith<$Res> implements $RemoteEntityCopyWith<$Res> {
  factory _$RemoteEntityCopyWith(_RemoteEntity value, $Res Function(_RemoteEntity) _then) = __$RemoteEntityCopyWithImpl;
@override @useResult
$Res call({
 int remoteId, String name, String mac, int electricQuantity, EntityStatus status, String nickname, String userId, DateTime? startDate, DateTime? endDate, CredentialType type, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class __$RemoteEntityCopyWithImpl<$Res>
    implements _$RemoteEntityCopyWith<$Res> {
  __$RemoteEntityCopyWithImpl(this._self, this._then);

  final _RemoteEntity _self;
  final $Res Function(_RemoteEntity) _then;

/// Create a copy of RemoteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteId = null,Object? name = null,Object? mac = null,Object? electricQuantity = null,Object? status = null,Object? nickname = null,Object? userId = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_RemoteEntity(
remoteId: null == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
