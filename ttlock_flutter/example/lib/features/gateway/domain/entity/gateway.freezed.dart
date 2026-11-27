// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GatewayEntity {

 int get gatewayId; String get gatewayMac; String get gatewayName; GatewayVersion get gatewayVersion; String get networkName; String get networkMac; int get lockNum; bool get isOnline;
/// Create a copy of GatewayEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayEntityCopyWith<GatewayEntity> get copyWith => _$GatewayEntityCopyWithImpl<GatewayEntity>(this as GatewayEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayEntity&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.networkMac, networkMac) || other.networkMac == networkMac)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,gatewayVersion,networkName,networkMac,lockNum,isOnline);

@override
String toString() {
  return 'GatewayEntity(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion, networkName: $networkName, networkMac: $networkMac, lockNum: $lockNum, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $GatewayEntityCopyWith<$Res>  {
  factory $GatewayEntityCopyWith(GatewayEntity value, $Res Function(GatewayEntity) _then) = _$GatewayEntityCopyWithImpl;
@useResult
$Res call({
 int gatewayId, String gatewayMac, String gatewayName, GatewayVersion gatewayVersion, String networkName, String networkMac, int lockNum, bool isOnline
});




}
/// @nodoc
class _$GatewayEntityCopyWithImpl<$Res>
    implements $GatewayEntityCopyWith<$Res> {
  _$GatewayEntityCopyWithImpl(this._self, this._then);

  final GatewayEntity _self;
  final $Res Function(GatewayEntity) _then;

/// Create a copy of GatewayEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? gatewayVersion = null,Object? networkName = null,Object? networkMac = null,Object? lockNum = null,Object? isOnline = null,}) {
  return _then(_self.copyWith(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as GatewayVersion,networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,networkMac: null == networkMac ? _self.networkMac : networkMac // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GatewayEntity].
extension GatewayEntityPatterns on GatewayEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayEntity value)  $default,){
final _that = this;
switch (_that) {
case _GatewayEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int gatewayId,  String gatewayMac,  String gatewayName,  GatewayVersion gatewayVersion,  String networkName,  String networkMac,  int lockNum,  bool isOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int gatewayId,  String gatewayMac,  String gatewayName,  GatewayVersion gatewayVersion,  String networkName,  String networkMac,  int lockNum,  bool isOnline)  $default,) {final _that = this;
switch (_that) {
case _GatewayEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int gatewayId,  String gatewayMac,  String gatewayName,  GatewayVersion gatewayVersion,  String networkName,  String networkMac,  int lockNum,  bool isOnline)?  $default,) {final _that = this;
switch (_that) {
case _GatewayEntity() when $default != null:
return $default(_that.gatewayId,_that.gatewayMac,_that.gatewayName,_that.gatewayVersion,_that.networkName,_that.networkMac,_that.lockNum,_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc


class _GatewayEntity extends GatewayEntity {
  const _GatewayEntity({this.gatewayId = 0, this.gatewayMac = '', this.gatewayName = '', this.gatewayVersion = GatewayVersion.g2, this.networkName = '', this.networkMac = '', this.lockNum = 0, this.isOnline = false}): super._();
  

@override@JsonKey() final  int gatewayId;
@override@JsonKey() final  String gatewayMac;
@override@JsonKey() final  String gatewayName;
@override@JsonKey() final  GatewayVersion gatewayVersion;
@override@JsonKey() final  String networkName;
@override@JsonKey() final  String networkMac;
@override@JsonKey() final  int lockNum;
@override@JsonKey() final  bool isOnline;

/// Create a copy of GatewayEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayEntityCopyWith<_GatewayEntity> get copyWith => __$GatewayEntityCopyWithImpl<_GatewayEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayEntity&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId)&&(identical(other.gatewayMac, gatewayMac) || other.gatewayMac == gatewayMac)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion)&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.networkMac, networkMac) || other.networkMac == networkMac)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,gatewayId,gatewayMac,gatewayName,gatewayVersion,networkName,networkMac,lockNum,isOnline);

@override
String toString() {
  return 'GatewayEntity(gatewayId: $gatewayId, gatewayMac: $gatewayMac, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion, networkName: $networkName, networkMac: $networkMac, lockNum: $lockNum, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$GatewayEntityCopyWith<$Res> implements $GatewayEntityCopyWith<$Res> {
  factory _$GatewayEntityCopyWith(_GatewayEntity value, $Res Function(_GatewayEntity) _then) = __$GatewayEntityCopyWithImpl;
@override @useResult
$Res call({
 int gatewayId, String gatewayMac, String gatewayName, GatewayVersion gatewayVersion, String networkName, String networkMac, int lockNum, bool isOnline
});




}
/// @nodoc
class __$GatewayEntityCopyWithImpl<$Res>
    implements _$GatewayEntityCopyWith<$Res> {
  __$GatewayEntityCopyWithImpl(this._self, this._then);

  final _GatewayEntity _self;
  final $Res Function(_GatewayEntity) _then;

/// Create a copy of GatewayEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gatewayId = null,Object? gatewayMac = null,Object? gatewayName = null,Object? gatewayVersion = null,Object? networkName = null,Object? networkMac = null,Object? lockNum = null,Object? isOnline = null,}) {
  return _then(_GatewayEntity(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,gatewayMac: null == gatewayMac ? _self.gatewayMac : gatewayMac // ignore: cast_nullable_to_non_nullable
as String,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as GatewayVersion,networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,networkMac: null == networkMac ? _self.networkMac : networkMac // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
