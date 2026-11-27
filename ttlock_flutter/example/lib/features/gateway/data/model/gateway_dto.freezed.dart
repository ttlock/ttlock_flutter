// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GatewayDto {

@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int get gatewayId;@JsonKey(name: 'gatewayMac') String get gatewayMac;@JsonKey(name: 'gatewayName') String get gatewayName;@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int get gatewayVersion;@JsonKey(name: 'networkName') String get networkName;@JsonKey(name: 'networkMac') String get networkMac;@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int get lockNum;@JsonKey(name: 'isOnline', fromJson: intFromDynamic) int get isOnline;
/// Create a copy of GatewayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayDtoCopyWith<GatewayDto> get copyWith => _$GatewayDtoCopyWithImpl<GatewayDto>(this as GatewayDto, _$identity);

  /// Serializes this GatewayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayDto&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.networkMac, networkMac) || other.networkMac == networkMac)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,gatewayVersion,networkName,networkMac,lockNum,isOnline);

@override
String toString() {
  return 'GatewayDto(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion, networkName: $networkName, networkMac: $networkMac, lockNum: $lockNum, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $GatewayDtoCopyWith<$Res>  {
  factory $GatewayDtoCopyWith(GatewayDto value, $Res Function(GatewayDto) _then) = _$GatewayDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int gatewayId,@JsonKey(name: 'gatewayMac') String gatewayMac,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion,@JsonKey(name: 'networkName') String networkName,@JsonKey(name: 'networkMac') String networkMac,@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int lockNum,@JsonKey(name: 'isOnline', fromJson: intFromDynamic) int isOnline
});




}
/// @nodoc
class _$GatewayDtoCopyWithImpl<$Res>
    implements $GatewayDtoCopyWith<$Res> {
  _$GatewayDtoCopyWithImpl(this._self, this._then);

  final GatewayDto _self;
  final $Res Function(GatewayDto) _then;

/// Create a copy of GatewayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? gatewayVersion = null,Object? networkName = null,Object? networkMac = null,Object? lockNum = null,Object? isOnline = null,}) {
  return _then(_self.copyWith(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as int,networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,networkMac: null == networkMac ? _self.networkMac : networkMac // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayDto].
extension GatewayDtoPatterns on GatewayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion, @JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'networkMac')  String networkMac, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum, @JsonKey(name: 'isOnline', fromJson: intFromDynamic)  int isOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayDto() when $default != null:
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.gatewayVersion,_that.networkName,_that.networkMac,_that.lockNum,_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion, @JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'networkMac')  String networkMac, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum, @JsonKey(name: 'isOnline', fromJson: intFromDynamic)  int isOnline)  $default,) {final _that = this;
switch (_that) {
case _GatewayDto():
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.gatewayVersion,_that.networkName,_that.networkMac,_that.lockNum,_that.isOnline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion, @JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'networkMac')  String networkMac, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum, @JsonKey(name: 'isOnline', fromJson: intFromDynamic)  int isOnline)?  $default,) {final _that = this;
switch (_that) {
case _GatewayDto() when $default != null:
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.gatewayVersion,_that.networkName,_that.networkMac,_that.lockNum,_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayDto extends GatewayDto {
  const _GatewayDto({@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) this.gatewayId = 0, @JsonKey(name: 'gatewayMac') this.gatewayMac = '', @JsonKey(name: 'gatewayName') this.gatewayName = '', @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) this.gatewayVersion = 2, @JsonKey(name: 'networkName') this.networkName = '', @JsonKey(name: 'networkMac') this.networkMac = '', @JsonKey(name: 'lockNum', fromJson: intFromDynamic) this.lockNum = 0, @JsonKey(name: 'isOnline', fromJson: intFromDynamic) this.isOnline = 0}): super._();
  factory _GatewayDto.fromJson(Map<String, dynamic> json) => _$GatewayDtoFromJson(json);

@override@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) final  int gatewayId;
@override@JsonKey(name: 'gatewayMac') final  String gatewayMac;
@override@JsonKey(name: 'gatewayName') final  String gatewayName;
@override@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) final  int gatewayVersion;
@override@JsonKey(name: 'networkName') final  String networkName;
@override@JsonKey(name: 'networkMac') final  String networkMac;
@override@JsonKey(name: 'lockNum', fromJson: intFromDynamic) final  int lockNum;
@override@JsonKey(name: 'isOnline', fromJson: intFromDynamic) final  int isOnline;

/// Create a copy of GatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayDtoCopyWith<_GatewayDto> get copyWith => __$GatewayDtoCopyWithImpl<_GatewayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayDto&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.networkMac, networkMac) || other.networkMac == networkMac)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,gatewayVersion,networkName,networkMac,lockNum,isOnline);

@override
String toString() {
  return 'GatewayDto(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion, networkName: $networkName, networkMac: $networkMac, lockNum: $lockNum, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$GatewayDtoCopyWith<$Res> implements $GatewayDtoCopyWith<$Res> {
  factory _$GatewayDtoCopyWith(_GatewayDto value, $Res Function(_GatewayDto) _then) = __$GatewayDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int gatewayId,@JsonKey(name: 'gatewayMac') String gatewayMac,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion,@JsonKey(name: 'networkName') String networkName,@JsonKey(name: 'networkMac') String networkMac,@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int lockNum,@JsonKey(name: 'isOnline', fromJson: intFromDynamic) int isOnline
});




}
/// @nodoc
class __$GatewayDtoCopyWithImpl<$Res>
    implements _$GatewayDtoCopyWith<$Res> {
  __$GatewayDtoCopyWithImpl(this._self, this._then);

  final _GatewayDto _self;
  final $Res Function(_GatewayDto) _then;

/// Create a copy of GatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? gatewayVersion = null,Object? networkName = null,Object? networkMac = null,Object? lockNum = null,Object? isOnline = null,}) {
  return _then(_GatewayDto(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as int,networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,networkMac: null == networkMac ? _self.networkMac : networkMac // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GatewayByLockDto {

@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int get gatewayId;@JsonKey(name: 'gatewayMac') String get gatewayMac;@JsonKey(name: 'gatewayName') String get gatewayName;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson) DateTime? get rssiUpdateDate;
/// Create a copy of GatewayByLockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayByLockDtoCopyWith<GatewayByLockDto> get copyWith => _$GatewayByLockDtoCopyWithImpl<GatewayByLockDto>(this as GatewayByLockDto, _$identity);

  /// Serializes this GatewayByLockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayByLockDto&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rssiUpdateDate, rssiUpdateDate) || other.rssiUpdateDate == rssiUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,rssi,rssiUpdateDate);

@override
String toString() {
  return 'GatewayByLockDto(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, rssi: $rssi, rssiUpdateDate: $rssiUpdateDate)';
}


}

/// @nodoc
abstract mixin class $GatewayByLockDtoCopyWith<$Res>  {
  factory $GatewayByLockDtoCopyWith(GatewayByLockDto value, $Res Function(GatewayByLockDto) _then) = _$GatewayByLockDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int gatewayId,@JsonKey(name: 'gatewayMac') String gatewayMac,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson) DateTime? rssiUpdateDate
});




}
/// @nodoc
class _$GatewayByLockDtoCopyWithImpl<$Res>
    implements $GatewayByLockDtoCopyWith<$Res> {
  _$GatewayByLockDtoCopyWithImpl(this._self, this._then);

  final GatewayByLockDto _self;
  final $Res Function(GatewayByLockDto) _then;

/// Create a copy of GatewayByLockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? rssi = null,Object? rssiUpdateDate = freezed,}) {
  return _then(_self.copyWith(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rssiUpdateDate: freezed == rssiUpdateDate ? _self.rssiUpdateDate : rssiUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayByLockDto].
extension GatewayByLockDtoPatterns on GatewayByLockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayByLockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayByLockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayByLockDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayByLockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayByLockDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayByLockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? rssiUpdateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayByLockDto() when $default != null:
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.rssi,_that.rssiUpdateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? rssiUpdateDate)  $default,) {final _that = this;
switch (_that) {
case _GatewayByLockDto():
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.rssi,_that.rssiUpdateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'gatewayId', fromJson: intFromDynamic)  int gatewayId, @JsonKey(name: 'gatewayMac')  String gatewayMac, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? rssiUpdateDate)?  $default,) {final _that = this;
switch (_that) {
case _GatewayByLockDto() when $default != null:
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.rssi,_that.rssiUpdateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayByLockDto extends GatewayByLockDto {
  const _GatewayByLockDto({@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) this.gatewayId = 0, @JsonKey(name: 'gatewayMac') this.gatewayMac = '', @JsonKey(name: 'gatewayName') this.gatewayName = '', @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson) this.rssiUpdateDate}): super._();
  factory _GatewayByLockDto.fromJson(Map<String, dynamic> json) => _$GatewayByLockDtoFromJson(json);

@override@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) final  int gatewayId;
@override@JsonKey(name: 'gatewayMac') final  String gatewayMac;
@override@JsonKey(name: 'gatewayName') final  String gatewayName;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? rssiUpdateDate;

/// Create a copy of GatewayByLockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayByLockDtoCopyWith<_GatewayByLockDto> get copyWith => __$GatewayByLockDtoCopyWithImpl<_GatewayByLockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayByLockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayByLockDto&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rssiUpdateDate, rssiUpdateDate) || other.rssiUpdateDate == rssiUpdateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,rssi,rssiUpdateDate);

@override
String toString() {
  return 'GatewayByLockDto(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, rssi: $rssi, rssiUpdateDate: $rssiUpdateDate)';
}


}

/// @nodoc
abstract mixin class _$GatewayByLockDtoCopyWith<$Res> implements $GatewayByLockDtoCopyWith<$Res> {
  factory _$GatewayByLockDtoCopyWith(_GatewayByLockDto value, $Res Function(_GatewayByLockDto) _then) = __$GatewayByLockDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'gatewayId', fromJson: intFromDynamic) int gatewayId,@JsonKey(name: 'gatewayMac') String gatewayMac,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson) DateTime? rssiUpdateDate
});




}
/// @nodoc
class __$GatewayByLockDtoCopyWithImpl<$Res>
    implements _$GatewayByLockDtoCopyWith<$Res> {
  __$GatewayByLockDtoCopyWithImpl(this._self, this._then);

  final _GatewayByLockDto _self;
  final $Res Function(_GatewayByLockDto) _then;

/// Create a copy of GatewayByLockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? rssi = null,Object? rssiUpdateDate = freezed,}) {
  return _then(_GatewayByLockDto(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rssiUpdateDate: freezed == rssiUpdateDate ? _self.rssiUpdateDate : rssiUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$GatewayLockDto {

@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'lockMac') String get lockMac;@JsonKey(name: 'lockName') String get lockName;@JsonKey(name: 'lockAlias') String get lockAlias;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? get updateDate;
/// Create a copy of GatewayLockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayLockDtoCopyWith<GatewayLockDto> get copyWith => _$GatewayLockDtoCopyWithImpl<GatewayLockDto>(this as GatewayLockDto, _$identity);

  /// Serializes this GatewayLockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayLockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,lockMac,lockName,lockAlias,rssi,updateDate);

@override
String toString() {
  return 'GatewayLockDto(lockId: $lockId, lockMac: $lockMac, lockName: $lockName, lockAlias: $lockAlias, rssi: $rssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $GatewayLockDtoCopyWith<$Res>  {
  factory $GatewayLockDtoCopyWith(GatewayLockDto value, $Res Function(GatewayLockDto) _then) = _$GatewayLockDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? updateDate
});




}
/// @nodoc
class _$GatewayLockDtoCopyWithImpl<$Res>
    implements $GatewayLockDtoCopyWith<$Res> {
  _$GatewayLockDtoCopyWithImpl(this._self, this._then);

  final GatewayLockDto _self;
  final $Res Function(GatewayLockDto) _then;

/// Create a copy of GatewayLockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? lockMac = null,Object? lockName = null,Object? lockAlias = null,Object? rssi = null,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayLockDto].
extension GatewayLockDtoPatterns on GatewayLockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayLockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayLockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayLockDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayLockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayLockDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayLockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayLockDto() when $default != null:
return $default(_that.lockId,_that.lockMac,_that.lockName,_that.lockAlias,_that.rssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _GatewayLockDto():
return $default(_that.lockId,_that.lockMac,_that.lockName,_that.lockAlias,_that.rssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _GatewayLockDto() when $default != null:
return $default(_that.lockId,_that.lockMac,_that.lockName,_that.lockAlias,_that.rssi,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayLockDto extends GatewayLockDto {
  const _GatewayLockDto({@JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'lockMac') this.lockMac = '', @JsonKey(name: 'lockName') this.lockName = '', @JsonKey(name: 'lockAlias') this.lockAlias = '', @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) this.updateDate}): super._();
  factory _GatewayLockDto.fromJson(Map<String, dynamic> json) => _$GatewayLockDtoFromJson(json);

@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'lockMac') final  String lockMac;
@override@JsonKey(name: 'lockName') final  String lockName;
@override@JsonKey(name: 'lockAlias') final  String lockAlias;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? updateDate;

/// Create a copy of GatewayLockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayLockDtoCopyWith<_GatewayLockDto> get copyWith => __$GatewayLockDtoCopyWithImpl<_GatewayLockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayLockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayLockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,lockMac,lockName,lockAlias,rssi,updateDate);

@override
String toString() {
  return 'GatewayLockDto(lockId: $lockId, lockMac: $lockMac, lockName: $lockName, lockAlias: $lockAlias, rssi: $rssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$GatewayLockDtoCopyWith<$Res> implements $GatewayLockDtoCopyWith<$Res> {
  factory _$GatewayLockDtoCopyWith(_GatewayLockDto value, $Res Function(_GatewayLockDto) _then) = __$GatewayLockDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? updateDate
});




}
/// @nodoc
class __$GatewayLockDtoCopyWithImpl<$Res>
    implements _$GatewayLockDtoCopyWith<$Res> {
  __$GatewayLockDtoCopyWithImpl(this._self, this._then);

  final _GatewayLockDto _self;
  final $Res Function(_GatewayLockDto) _then;

/// Create a copy of GatewayLockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? lockMac = null,Object? lockName = null,Object? lockAlias = null,Object? rssi = null,Object? updateDate = freezed,}) {
  return _then(_GatewayLockDto(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$GatewayDeviceDto {

@JsonKey(name: 'deviceType', fromJson: intFromDynamic) int get deviceType;@JsonKey(name: 'deviceId', fromJson: intFromDynamic) int get deviceId;@JsonKey(name: 'deviceMac') String get deviceMac;@JsonKey(name: 'deviceName') String get deviceName;@JsonKey(name: 'deviceAlias') String get deviceAlias;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? get updateDate;
/// Create a copy of GatewayDeviceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayDeviceDtoCopyWith<GatewayDeviceDto> get copyWith => _$GatewayDeviceDtoCopyWithImpl<GatewayDeviceDto>(this as GatewayDeviceDto, _$identity);

  /// Serializes this GatewayDeviceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayDeviceDto&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceMac, deviceMac) || other.deviceMac == deviceMac)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceAlias, deviceAlias) || other.deviceAlias == deviceAlias)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceType,deviceId,deviceMac,deviceName,deviceAlias,rssi,updateDate);

@override
String toString() {
  return 'GatewayDeviceDto(deviceType: $deviceType, deviceId: $deviceId, deviceMac: $deviceMac, deviceName: $deviceName, deviceAlias: $deviceAlias, rssi: $rssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $GatewayDeviceDtoCopyWith<$Res>  {
  factory $GatewayDeviceDtoCopyWith(GatewayDeviceDto value, $Res Function(GatewayDeviceDto) _then) = _$GatewayDeviceDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'deviceType', fromJson: intFromDynamic) int deviceType,@JsonKey(name: 'deviceId', fromJson: intFromDynamic) int deviceId,@JsonKey(name: 'deviceMac') String deviceMac,@JsonKey(name: 'deviceName') String deviceName,@JsonKey(name: 'deviceAlias') String deviceAlias,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? updateDate
});




}
/// @nodoc
class _$GatewayDeviceDtoCopyWithImpl<$Res>
    implements $GatewayDeviceDtoCopyWith<$Res> {
  _$GatewayDeviceDtoCopyWithImpl(this._self, this._then);

  final GatewayDeviceDto _self;
  final $Res Function(GatewayDeviceDto) _then;

/// Create a copy of GatewayDeviceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceType = null,Object? deviceId = null,Object? deviceMac = null,Object? deviceName = null,Object? deviceAlias = null,Object? rssi = null,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,deviceMac: null == deviceMac ? _self.deviceMac : deviceMac // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceAlias: null == deviceAlias ? _self.deviceAlias : deviceAlias // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayDeviceDto].
extension GatewayDeviceDtoPatterns on GatewayDeviceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayDeviceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayDeviceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayDeviceDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayDeviceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayDeviceDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayDeviceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'deviceType', fromJson: intFromDynamic)  int deviceType, @JsonKey(name: 'deviceId', fromJson: intFromDynamic)  int deviceId, @JsonKey(name: 'deviceMac')  String deviceMac, @JsonKey(name: 'deviceName')  String deviceName, @JsonKey(name: 'deviceAlias')  String deviceAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayDeviceDto() when $default != null:
return $default(_that.deviceType,_that.deviceId,_that.deviceMac,_that.deviceName,_that.deviceAlias,_that.rssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'deviceType', fromJson: intFromDynamic)  int deviceType, @JsonKey(name: 'deviceId', fromJson: intFromDynamic)  int deviceId, @JsonKey(name: 'deviceMac')  String deviceMac, @JsonKey(name: 'deviceName')  String deviceName, @JsonKey(name: 'deviceAlias')  String deviceAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _GatewayDeviceDto():
return $default(_that.deviceType,_that.deviceId,_that.deviceMac,_that.deviceName,_that.deviceAlias,_that.rssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'deviceType', fromJson: intFromDynamic)  int deviceType, @JsonKey(name: 'deviceId', fromJson: intFromDynamic)  int deviceId, @JsonKey(name: 'deviceMac')  String deviceMac, @JsonKey(name: 'deviceName')  String deviceName, @JsonKey(name: 'deviceAlias')  String deviceAlias, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _GatewayDeviceDto() when $default != null:
return $default(_that.deviceType,_that.deviceId,_that.deviceMac,_that.deviceName,_that.deviceAlias,_that.rssi,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayDeviceDto extends GatewayDeviceDto {
  const _GatewayDeviceDto({@JsonKey(name: 'deviceType', fromJson: intFromDynamic) this.deviceType = 0, @JsonKey(name: 'deviceId', fromJson: intFromDynamic) this.deviceId = 0, @JsonKey(name: 'deviceMac') this.deviceMac = '', @JsonKey(name: 'deviceName') this.deviceName = '', @JsonKey(name: 'deviceAlias') this.deviceAlias = '', @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) this.updateDate}): super._();
  factory _GatewayDeviceDto.fromJson(Map<String, dynamic> json) => _$GatewayDeviceDtoFromJson(json);

@override@JsonKey(name: 'deviceType', fromJson: intFromDynamic) final  int deviceType;
@override@JsonKey(name: 'deviceId', fromJson: intFromDynamic) final  int deviceId;
@override@JsonKey(name: 'deviceMac') final  String deviceMac;
@override@JsonKey(name: 'deviceName') final  String deviceName;
@override@JsonKey(name: 'deviceAlias') final  String deviceAlias;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? updateDate;

/// Create a copy of GatewayDeviceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayDeviceDtoCopyWith<_GatewayDeviceDto> get copyWith => __$GatewayDeviceDtoCopyWithImpl<_GatewayDeviceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayDeviceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayDeviceDto&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceMac, deviceMac) || other.deviceMac == deviceMac)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceAlias, deviceAlias) || other.deviceAlias == deviceAlias)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceType,deviceId,deviceMac,deviceName,deviceAlias,rssi,updateDate);

@override
String toString() {
  return 'GatewayDeviceDto(deviceType: $deviceType, deviceId: $deviceId, deviceMac: $deviceMac, deviceName: $deviceName, deviceAlias: $deviceAlias, rssi: $rssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$GatewayDeviceDtoCopyWith<$Res> implements $GatewayDeviceDtoCopyWith<$Res> {
  factory _$GatewayDeviceDtoCopyWith(_GatewayDeviceDto value, $Res Function(_GatewayDeviceDto) _then) = __$GatewayDeviceDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'deviceType', fromJson: intFromDynamic) int deviceType,@JsonKey(name: 'deviceId', fromJson: intFromDynamic) int deviceId,@JsonKey(name: 'deviceMac') String deviceMac,@JsonKey(name: 'deviceName') String deviceName,@JsonKey(name: 'deviceAlias') String deviceAlias,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson) DateTime? updateDate
});




}
/// @nodoc
class __$GatewayDeviceDtoCopyWithImpl<$Res>
    implements _$GatewayDeviceDtoCopyWith<$Res> {
  __$GatewayDeviceDtoCopyWithImpl(this._self, this._then);

  final _GatewayDeviceDto _self;
  final $Res Function(_GatewayDeviceDto) _then;

/// Create a copy of GatewayDeviceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceType = null,Object? deviceId = null,Object? deviceMac = null,Object? deviceName = null,Object? deviceAlias = null,Object? rssi = null,Object? updateDate = freezed,}) {
  return _then(_GatewayDeviceDto(
deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as int,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int,deviceMac: null == deviceMac ? _self.deviceMac : deviceMac // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceAlias: null == deviceAlias ? _self.deviceAlias : deviceAlias // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$GatewayFirmwareInfoDto {

@JsonKey(name: 'modelNum') String get modelNum;@JsonKey(name: 'hardwareRevision') String get hardwareRevision;@JsonKey(name: 'firmwareRevision') String get firmwareRevision;
/// Create a copy of GatewayFirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayFirmwareInfoDtoCopyWith<GatewayFirmwareInfoDto> get copyWith => _$GatewayFirmwareInfoDtoCopyWithImpl<GatewayFirmwareInfoDto>(this as GatewayFirmwareInfoDto, _$identity);

  /// Serializes this GatewayFirmwareInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayFirmwareInfoDto&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'GatewayFirmwareInfoDto(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class $GatewayFirmwareInfoDtoCopyWith<$Res>  {
  factory $GatewayFirmwareInfoDtoCopyWith(GatewayFirmwareInfoDto value, $Res Function(GatewayFirmwareInfoDto) _then) = _$GatewayFirmwareInfoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class _$GatewayFirmwareInfoDtoCopyWithImpl<$Res>
    implements $GatewayFirmwareInfoDtoCopyWith<$Res> {
  _$GatewayFirmwareInfoDtoCopyWithImpl(this._self, this._then);

  final GatewayFirmwareInfoDto _self;
  final $Res Function(GatewayFirmwareInfoDto) _then;

/// Create a copy of GatewayFirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_self.copyWith(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayFirmwareInfoDto].
extension GatewayFirmwareInfoDtoPatterns on GatewayFirmwareInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayFirmwareInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayFirmwareInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayFirmwareInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)  $default,) {final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto():
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,) {final _that = this;
switch (_that) {
case _GatewayFirmwareInfoDto() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayFirmwareInfoDto implements GatewayFirmwareInfoDto {
  const _GatewayFirmwareInfoDto({@JsonKey(name: 'modelNum') this.modelNum = '', @JsonKey(name: 'hardwareRevision') this.hardwareRevision = '', @JsonKey(name: 'firmwareRevision') this.firmwareRevision = ''});
  factory _GatewayFirmwareInfoDto.fromJson(Map<String, dynamic> json) => _$GatewayFirmwareInfoDtoFromJson(json);

@override@JsonKey(name: 'modelNum') final  String modelNum;
@override@JsonKey(name: 'hardwareRevision') final  String hardwareRevision;
@override@JsonKey(name: 'firmwareRevision') final  String firmwareRevision;

/// Create a copy of GatewayFirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayFirmwareInfoDtoCopyWith<_GatewayFirmwareInfoDto> get copyWith => __$GatewayFirmwareInfoDtoCopyWithImpl<_GatewayFirmwareInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayFirmwareInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayFirmwareInfoDto&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'GatewayFirmwareInfoDto(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class _$GatewayFirmwareInfoDtoCopyWith<$Res> implements $GatewayFirmwareInfoDtoCopyWith<$Res> {
  factory _$GatewayFirmwareInfoDtoCopyWith(_GatewayFirmwareInfoDto value, $Res Function(_GatewayFirmwareInfoDto) _then) = __$GatewayFirmwareInfoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class __$GatewayFirmwareInfoDtoCopyWithImpl<$Res>
    implements _$GatewayFirmwareInfoDtoCopyWith<$Res> {
  __$GatewayFirmwareInfoDtoCopyWithImpl(this._self, this._then);

  final _GatewayFirmwareInfoDto _self;
  final $Res Function(_GatewayFirmwareInfoDto) _then;

/// Create a copy of GatewayFirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_GatewayFirmwareInfoDto(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GatewayUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? get firmwareInfo;@JsonKey(name: 'version') String get version;
/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayUpgradeCheckDtoCopyWith<GatewayUpgradeCheckDto> get copyWith => _$GatewayUpgradeCheckDtoCopyWithImpl<GatewayUpgradeCheckDto>(this as GatewayUpgradeCheckDto, _$identity);

  /// Serializes this GatewayUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,version);

@override
String toString() {
  return 'GatewayUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, version: $version)';
}


}

/// @nodoc
abstract mixin class $GatewayUpgradeCheckDtoCopyWith<$Res>  {
  factory $GatewayUpgradeCheckDtoCopyWith(GatewayUpgradeCheckDto value, $Res Function(GatewayUpgradeCheckDto) _then) = _$GatewayUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,@JsonKey(name: 'version') String version
});


$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class _$GatewayUpgradeCheckDtoCopyWithImpl<$Res>
    implements $GatewayUpgradeCheckDtoCopyWith<$Res> {
  _$GatewayUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final GatewayUpgradeCheckDto _self;
  final $Res Function(GatewayUpgradeCheckDto) _then;

/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as GatewayFirmwareInfoDto?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $GatewayFirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [GatewayUpgradeCheckDto].
extension GatewayUpgradeCheckDtoPatterns on GatewayUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'version')  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'version')  String version)  $default,) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto():
return $default(_that.needUpgrade,_that.firmwareInfo,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'version')  String version)?  $default,) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayUpgradeCheckDto extends GatewayUpgradeCheckDto {
  const _GatewayUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') this.firmwareInfo, @JsonKey(name: 'version') this.version = ''}): super._();
  factory _GatewayUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$GatewayUpgradeCheckDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
@override@JsonKey(name: 'firmwareInfo') final  GatewayFirmwareInfoDto? firmwareInfo;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayUpgradeCheckDtoCopyWith<_GatewayUpgradeCheckDto> get copyWith => __$GatewayUpgradeCheckDtoCopyWithImpl<_GatewayUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,version);

@override
String toString() {
  return 'GatewayUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, version: $version)';
}


}

/// @nodoc
abstract mixin class _$GatewayUpgradeCheckDtoCopyWith<$Res> implements $GatewayUpgradeCheckDtoCopyWith<$Res> {
  factory _$GatewayUpgradeCheckDtoCopyWith(_GatewayUpgradeCheckDto value, $Res Function(_GatewayUpgradeCheckDto) _then) = __$GatewayUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,@JsonKey(name: 'version') String version
});


@override $GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class __$GatewayUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$GatewayUpgradeCheckDtoCopyWith<$Res> {
  __$GatewayUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _GatewayUpgradeCheckDto _self;
  final $Res Function(_GatewayUpgradeCheckDto) _then;

/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? version = null,}) {
  return _then(_GatewayUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as GatewayFirmwareInfoDto?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of GatewayUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $GatewayFirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// @nodoc
mixin _$GatewayUpgradeCheckOnPremiseDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayUpgradeCheckOnPremiseDtoCopyWith<GatewayUpgradeCheckOnPremiseDto> get copyWith => _$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl<GatewayUpgradeCheckOnPremiseDto>(this as GatewayUpgradeCheckOnPremiseDto, _$identity);

  /// Serializes this GatewayUpgradeCheckOnPremiseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayUpgradeCheckOnPremiseDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'GatewayUpgradeCheckOnPremiseDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $GatewayUpgradeCheckOnPremiseDtoCopyWith<$Res>  {
  factory $GatewayUpgradeCheckOnPremiseDtoCopyWith(GatewayUpgradeCheckOnPremiseDto value, $Res Function(GatewayUpgradeCheckOnPremiseDto) _then) = _$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});


$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class _$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl<$Res>
    implements $GatewayUpgradeCheckOnPremiseDtoCopyWith<$Res> {
  _$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl(this._self, this._then);

  final GatewayUpgradeCheckOnPremiseDto _self;
  final $Res Function(GatewayUpgradeCheckOnPremiseDto) _then;

/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as GatewayFirmwareInfoDto?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $GatewayFirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [GatewayUpgradeCheckOnPremiseDto].
extension GatewayUpgradeCheckOnPremiseDtoPatterns on GatewayUpgradeCheckOnPremiseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayUpgradeCheckOnPremiseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayUpgradeCheckOnPremiseDto value)  $default,){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayUpgradeCheckOnPremiseDto value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)  $default,) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto():
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  GatewayFirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,) {final _that = this;
switch (_that) {
case _GatewayUpgradeCheckOnPremiseDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GatewayUpgradeCheckOnPremiseDto extends GatewayUpgradeCheckOnPremiseDto {
  const _GatewayUpgradeCheckOnPremiseDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') this.firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): super._();
  factory _GatewayUpgradeCheckOnPremiseDto.fromJson(Map<String, dynamic> json) => _$GatewayUpgradeCheckOnPremiseDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
@override@JsonKey(name: 'firmwareInfo') final  GatewayFirmwareInfoDto? firmwareInfo;
@override@JsonKey(name: 'firmwarePackage') final  String firmwarePackage;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayUpgradeCheckOnPremiseDtoCopyWith<_GatewayUpgradeCheckOnPremiseDto> get copyWith => __$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl<_GatewayUpgradeCheckOnPremiseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GatewayUpgradeCheckOnPremiseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayUpgradeCheckOnPremiseDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'GatewayUpgradeCheckOnPremiseDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$GatewayUpgradeCheckOnPremiseDtoCopyWith<$Res> implements $GatewayUpgradeCheckOnPremiseDtoCopyWith<$Res> {
  factory _$GatewayUpgradeCheckOnPremiseDtoCopyWith(_GatewayUpgradeCheckOnPremiseDto value, $Res Function(_GatewayUpgradeCheckOnPremiseDto) _then) = __$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});


@override $GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class __$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl<$Res>
    implements _$GatewayUpgradeCheckOnPremiseDtoCopyWith<$Res> {
  __$GatewayUpgradeCheckOnPremiseDtoCopyWithImpl(this._self, this._then);

  final _GatewayUpgradeCheckOnPremiseDto _self;
  final $Res Function(_GatewayUpgradeCheckOnPremiseDto) _then;

/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_GatewayUpgradeCheckOnPremiseDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as GatewayFirmwareInfoDto?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of GatewayUpgradeCheckOnPremiseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayFirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $GatewayFirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}

// dart format on
