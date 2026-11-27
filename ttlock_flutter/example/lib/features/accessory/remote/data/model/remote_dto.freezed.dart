// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteDto {

@JsonKey(name: 'remoteId', fromJson: intFromDynamic) int get remoteId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'mac') String get mac;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'status', fromJson: entityStatusFromJson) EntityStatus get status;@JsonKey(name: 'nickname') String get nickname;@JsonKey(name: 'userId', readValue: _readUserId) String get userId;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? get endDate;@JsonKey(name: 'type', fromJson: credentialTypeFromJson) CredentialType get type;@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> get cyclicConfig;@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? get createDate;
/// Create a copy of RemoteDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteDtoCopyWith<RemoteDto> get copyWith => _$RemoteDtoCopyWithImpl<RemoteDto>(this as RemoteDto, _$identity);

  /// Serializes this RemoteDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteDto&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteId,name,mac,electricQuantity,status,nickname,userId,startDate,endDate,type,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'RemoteDto(remoteId: $remoteId, name: $name, mac: $mac, electricQuantity: $electricQuantity, status: $status, nickname: $nickname, userId: $userId, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $RemoteDtoCopyWith<$Res>  {
  factory $RemoteDtoCopyWith(RemoteDto value, $Res Function(RemoteDto) _then) = _$RemoteDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'remoteId', fromJson: intFromDynamic) int remoteId,@JsonKey(name: 'name') String name,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'status', fromJson: entityStatusFromJson) EntityStatus status,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'userId', readValue: _readUserId) String userId,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'type', fromJson: credentialTypeFromJson) CredentialType type,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate
});




}
/// @nodoc
class _$RemoteDtoCopyWithImpl<$Res>
    implements $RemoteDtoCopyWith<$Res> {
  _$RemoteDtoCopyWithImpl(this._self, this._then);

  final RemoteDto _self;
  final $Res Function(RemoteDto) _then;

/// Create a copy of RemoteDto
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


/// Adds pattern-matching-related methods to [RemoteDto].
extension RemoteDtoPatterns on RemoteDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteDto value)  $default,){
final _that = this;
switch (_that) {
case _RemoteDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteDto value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'remoteId', fromJson: intFromDynamic)  int remoteId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'status', fromJson: entityStatusFromJson)  EntityStatus status, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'userId', readValue: _readUserId)  String userId, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'type', fromJson: credentialTypeFromJson)  CredentialType type, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'remoteId', fromJson: intFromDynamic)  int remoteId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'status', fromJson: entityStatusFromJson)  EntityStatus status, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'userId', readValue: _readUserId)  String userId, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'type', fromJson: credentialTypeFromJson)  CredentialType type, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _RemoteDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'remoteId', fromJson: intFromDynamic)  int remoteId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'status', fromJson: entityStatusFromJson)  EntityStatus status, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'userId', readValue: _readUserId)  String userId, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'type', fromJson: credentialTypeFromJson)  CredentialType type, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _RemoteDto() when $default != null:
return $default(_that.remoteId,_that.name,_that.mac,_that.electricQuantity,_that.status,_that.nickname,_that.userId,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteDto extends RemoteDto {
  const _RemoteDto({@JsonKey(name: 'remoteId', fromJson: intFromDynamic) this.remoteId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'mac') this.mac = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'status', fromJson: entityStatusFromJson) this.status = EntityStatus.normal, @JsonKey(name: 'nickname') this.nickname = '', @JsonKey(name: 'userId', readValue: _readUserId) this.userId = '', @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) this.endDate, @JsonKey(name: 'type', fromJson: credentialTypeFromJson) this.type = CredentialType.normal, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) final  List<CyclicConfig> cyclicConfig = const [], @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) this.createDate}): _cyclicConfig = cyclicConfig,super._();
  factory _RemoteDto.fromJson(Map<String, dynamic> json) => _$RemoteDtoFromJson(json);

@override@JsonKey(name: 'remoteId', fromJson: intFromDynamic) final  int remoteId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'mac') final  String mac;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'status', fromJson: entityStatusFromJson) final  EntityStatus status;
@override@JsonKey(name: 'nickname') final  String nickname;
@override@JsonKey(name: 'userId', readValue: _readUserId) final  String userId;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? endDate;
@override@JsonKey(name: 'type', fromJson: credentialTypeFromJson) final  CredentialType type;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? createDate;

/// Create a copy of RemoteDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteDtoCopyWith<_RemoteDto> get copyWith => __$RemoteDtoCopyWithImpl<_RemoteDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteDto&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteId,name,mac,electricQuantity,status,nickname,userId,startDate,endDate,type,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'RemoteDto(remoteId: $remoteId, name: $name, mac: $mac, electricQuantity: $electricQuantity, status: $status, nickname: $nickname, userId: $userId, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$RemoteDtoCopyWith<$Res> implements $RemoteDtoCopyWith<$Res> {
  factory _$RemoteDtoCopyWith(_RemoteDto value, $Res Function(_RemoteDto) _then) = __$RemoteDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'remoteId', fromJson: intFromDynamic) int remoteId,@JsonKey(name: 'name') String name,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'status', fromJson: entityStatusFromJson) EntityStatus status,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'userId', readValue: _readUserId) String userId,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'type', fromJson: credentialTypeFromJson) CredentialType type,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate
});




}
/// @nodoc
class __$RemoteDtoCopyWithImpl<$Res>
    implements _$RemoteDtoCopyWith<$Res> {
  __$RemoteDtoCopyWithImpl(this._self, this._then);

  final _RemoteDto _self;
  final $Res Function(_RemoteDto) _then;

/// Create a copy of RemoteDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteId = null,Object? name = null,Object? mac = null,Object? electricQuantity = null,Object? status = null,Object? nickname = null,Object? userId = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_RemoteDto(
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
