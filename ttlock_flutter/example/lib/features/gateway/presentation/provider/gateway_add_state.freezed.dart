// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GatewayAddStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GatewayAddStep()';
}


}

/// @nodoc
class $GatewayAddStepCopyWith<$Res>  {
$GatewayAddStepCopyWith(GatewayAddStep _, $Res Function(GatewayAddStep) __);
}


/// Adds pattern-matching-related methods to [GatewayAddStep].
extension GatewayAddStepPatterns on GatewayAddStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GatewayAddStepScanning value)?  scanning,TResult Function( GatewayAddStepConnecting value)?  connecting,TResult Function( GatewayAddStepWifi value)?  wifi,TResult Function( GatewayAddStepCredential value)?  credential,TResult Function( GatewayAddStepInitializing value)?  initializing,TResult Function( GatewayAddStepConfirming value)?  confirming,TResult Function( GatewayAddStepDone value)?  done,TResult Function( GatewayAddStepFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GatewayAddStepScanning() when scanning != null:
return scanning(_that);case GatewayAddStepConnecting() when connecting != null:
return connecting(_that);case GatewayAddStepWifi() when wifi != null:
return wifi(_that);case GatewayAddStepCredential() when credential != null:
return credential(_that);case GatewayAddStepInitializing() when initializing != null:
return initializing(_that);case GatewayAddStepConfirming() when confirming != null:
return confirming(_that);case GatewayAddStepDone() when done != null:
return done(_that);case GatewayAddStepFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GatewayAddStepScanning value)  scanning,required TResult Function( GatewayAddStepConnecting value)  connecting,required TResult Function( GatewayAddStepWifi value)  wifi,required TResult Function( GatewayAddStepCredential value)  credential,required TResult Function( GatewayAddStepInitializing value)  initializing,required TResult Function( GatewayAddStepConfirming value)  confirming,required TResult Function( GatewayAddStepDone value)  done,required TResult Function( GatewayAddStepFailure value)  failure,}){
final _that = this;
switch (_that) {
case GatewayAddStepScanning():
return scanning(_that);case GatewayAddStepConnecting():
return connecting(_that);case GatewayAddStepWifi():
return wifi(_that);case GatewayAddStepCredential():
return credential(_that);case GatewayAddStepInitializing():
return initializing(_that);case GatewayAddStepConfirming():
return confirming(_that);case GatewayAddStepDone():
return done(_that);case GatewayAddStepFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GatewayAddStepScanning value)?  scanning,TResult? Function( GatewayAddStepConnecting value)?  connecting,TResult? Function( GatewayAddStepWifi value)?  wifi,TResult? Function( GatewayAddStepCredential value)?  credential,TResult? Function( GatewayAddStepInitializing value)?  initializing,TResult? Function( GatewayAddStepConfirming value)?  confirming,TResult? Function( GatewayAddStepDone value)?  done,TResult? Function( GatewayAddStepFailure value)?  failure,}){
final _that = this;
switch (_that) {
case GatewayAddStepScanning() when scanning != null:
return scanning(_that);case GatewayAddStepConnecting() when connecting != null:
return connecting(_that);case GatewayAddStepWifi() when wifi != null:
return wifi(_that);case GatewayAddStepCredential() when credential != null:
return credential(_that);case GatewayAddStepInitializing() when initializing != null:
return initializing(_that);case GatewayAddStepConfirming() when confirming != null:
return confirming(_that);case GatewayAddStepDone() when done != null:
return done(_that);case GatewayAddStepFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, TTGatewayScanModel> devices)?  scanning,TResult Function( String mac)?  connecting,TResult Function( String mac)?  wifi,TResult Function( String mac,  GatewayWifi? wifi)?  credential,TResult Function( String mac,  GatewayWifi? wifi)?  initializing,TResult Function( String networkMac)?  confirming,TResult Function( int gatewayId)?  done,TResult Function( AppException error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GatewayAddStepScanning() when scanning != null:
return scanning(_that.devices);case GatewayAddStepConnecting() when connecting != null:
return connecting(_that.mac);case GatewayAddStepWifi() when wifi != null:
return wifi(_that.mac);case GatewayAddStepCredential() when credential != null:
return credential(_that.mac,_that.wifi);case GatewayAddStepInitializing() when initializing != null:
return initializing(_that.mac,_that.wifi);case GatewayAddStepConfirming() when confirming != null:
return confirming(_that.networkMac);case GatewayAddStepDone() when done != null:
return done(_that.gatewayId);case GatewayAddStepFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, TTGatewayScanModel> devices)  scanning,required TResult Function( String mac)  connecting,required TResult Function( String mac)  wifi,required TResult Function( String mac,  GatewayWifi? wifi)  credential,required TResult Function( String mac,  GatewayWifi? wifi)  initializing,required TResult Function( String networkMac)  confirming,required TResult Function( int gatewayId)  done,required TResult Function( AppException error)  failure,}) {final _that = this;
switch (_that) {
case GatewayAddStepScanning():
return scanning(_that.devices);case GatewayAddStepConnecting():
return connecting(_that.mac);case GatewayAddStepWifi():
return wifi(_that.mac);case GatewayAddStepCredential():
return credential(_that.mac,_that.wifi);case GatewayAddStepInitializing():
return initializing(_that.mac,_that.wifi);case GatewayAddStepConfirming():
return confirming(_that.networkMac);case GatewayAddStepDone():
return done(_that.gatewayId);case GatewayAddStepFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, TTGatewayScanModel> devices)?  scanning,TResult? Function( String mac)?  connecting,TResult? Function( String mac)?  wifi,TResult? Function( String mac,  GatewayWifi? wifi)?  credential,TResult? Function( String mac,  GatewayWifi? wifi)?  initializing,TResult? Function( String networkMac)?  confirming,TResult? Function( int gatewayId)?  done,TResult? Function( AppException error)?  failure,}) {final _that = this;
switch (_that) {
case GatewayAddStepScanning() when scanning != null:
return scanning(_that.devices);case GatewayAddStepConnecting() when connecting != null:
return connecting(_that.mac);case GatewayAddStepWifi() when wifi != null:
return wifi(_that.mac);case GatewayAddStepCredential() when credential != null:
return credential(_that.mac,_that.wifi);case GatewayAddStepInitializing() when initializing != null:
return initializing(_that.mac,_that.wifi);case GatewayAddStepConfirming() when confirming != null:
return confirming(_that.networkMac);case GatewayAddStepDone() when done != null:
return done(_that.gatewayId);case GatewayAddStepFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class GatewayAddStepScanning implements GatewayAddStep {
  const GatewayAddStepScanning({final  Map<String, TTGatewayScanModel> devices = const <String, TTGatewayScanModel>{}}): _devices = devices;
  

 final  Map<String, TTGatewayScanModel> _devices;
@JsonKey() Map<String, TTGatewayScanModel> get devices {
  if (_devices is EqualUnmodifiableMapView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_devices);
}


/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepScanningCopyWith<GatewayAddStepScanning> get copyWith => _$GatewayAddStepScanningCopyWithImpl<GatewayAddStepScanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepScanning&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'GatewayAddStep.scanning(devices: $devices)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepScanningCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepScanningCopyWith(GatewayAddStepScanning value, $Res Function(GatewayAddStepScanning) _then) = _$GatewayAddStepScanningCopyWithImpl;
@useResult
$Res call({
 Map<String, TTGatewayScanModel> devices
});




}
/// @nodoc
class _$GatewayAddStepScanningCopyWithImpl<$Res>
    implements $GatewayAddStepScanningCopyWith<$Res> {
  _$GatewayAddStepScanningCopyWithImpl(this._self, this._then);

  final GatewayAddStepScanning _self;
  final $Res Function(GatewayAddStepScanning) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(GatewayAddStepScanning(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as Map<String, TTGatewayScanModel>,
  ));
}


}

/// @nodoc


class GatewayAddStepConnecting implements GatewayAddStep {
  const GatewayAddStepConnecting({required this.mac});
  

 final  String mac;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepConnectingCopyWith<GatewayAddStepConnecting> get copyWith => _$GatewayAddStepConnectingCopyWithImpl<GatewayAddStepConnecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepConnecting&&(identical(other.mac, mac) || other.mac == mac));
}


@override
int get hashCode => Object.hash(runtimeType,mac);

@override
String toString() {
  return 'GatewayAddStep.connecting(mac: $mac)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepConnectingCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepConnectingCopyWith(GatewayAddStepConnecting value, $Res Function(GatewayAddStepConnecting) _then) = _$GatewayAddStepConnectingCopyWithImpl;
@useResult
$Res call({
 String mac
});




}
/// @nodoc
class _$GatewayAddStepConnectingCopyWithImpl<$Res>
    implements $GatewayAddStepConnectingCopyWith<$Res> {
  _$GatewayAddStepConnectingCopyWithImpl(this._self, this._then);

  final GatewayAddStepConnecting _self;
  final $Res Function(GatewayAddStepConnecting) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,}) {
  return _then(GatewayAddStepConnecting(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GatewayAddStepWifi implements GatewayAddStep {
  const GatewayAddStepWifi({required this.mac});
  

 final  String mac;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepWifiCopyWith<GatewayAddStepWifi> get copyWith => _$GatewayAddStepWifiCopyWithImpl<GatewayAddStepWifi>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepWifi&&(identical(other.mac, mac) || other.mac == mac));
}


@override
int get hashCode => Object.hash(runtimeType,mac);

@override
String toString() {
  return 'GatewayAddStep.wifi(mac: $mac)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepWifiCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepWifiCopyWith(GatewayAddStepWifi value, $Res Function(GatewayAddStepWifi) _then) = _$GatewayAddStepWifiCopyWithImpl;
@useResult
$Res call({
 String mac
});




}
/// @nodoc
class _$GatewayAddStepWifiCopyWithImpl<$Res>
    implements $GatewayAddStepWifiCopyWith<$Res> {
  _$GatewayAddStepWifiCopyWithImpl(this._self, this._then);

  final GatewayAddStepWifi _self;
  final $Res Function(GatewayAddStepWifi) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,}) {
  return _then(GatewayAddStepWifi(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GatewayAddStepCredential implements GatewayAddStep {
  const GatewayAddStepCredential({required this.mac, this.wifi});
  

 final  String mac;
 final  GatewayWifi? wifi;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepCredentialCopyWith<GatewayAddStepCredential> get copyWith => _$GatewayAddStepCredentialCopyWithImpl<GatewayAddStepCredential>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepCredential&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.wifi, wifi) || other.wifi == wifi));
}


@override
int get hashCode => Object.hash(runtimeType,mac,wifi);

@override
String toString() {
  return 'GatewayAddStep.credential(mac: $mac, wifi: $wifi)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepCredentialCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepCredentialCopyWith(GatewayAddStepCredential value, $Res Function(GatewayAddStepCredential) _then) = _$GatewayAddStepCredentialCopyWithImpl;
@useResult
$Res call({
 String mac, GatewayWifi? wifi
});




}
/// @nodoc
class _$GatewayAddStepCredentialCopyWithImpl<$Res>
    implements $GatewayAddStepCredentialCopyWith<$Res> {
  _$GatewayAddStepCredentialCopyWithImpl(this._self, this._then);

  final GatewayAddStepCredential _self;
  final $Res Function(GatewayAddStepCredential) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,Object? wifi = freezed,}) {
  return _then(GatewayAddStepCredential(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,wifi: freezed == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as GatewayWifi?,
  ));
}


}

/// @nodoc


class GatewayAddStepInitializing implements GatewayAddStep {
  const GatewayAddStepInitializing({required this.mac, this.wifi});
  

 final  String mac;
 final  GatewayWifi? wifi;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepInitializingCopyWith<GatewayAddStepInitializing> get copyWith => _$GatewayAddStepInitializingCopyWithImpl<GatewayAddStepInitializing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepInitializing&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.wifi, wifi) || other.wifi == wifi));
}


@override
int get hashCode => Object.hash(runtimeType,mac,wifi);

@override
String toString() {
  return 'GatewayAddStep.initializing(mac: $mac, wifi: $wifi)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepInitializingCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepInitializingCopyWith(GatewayAddStepInitializing value, $Res Function(GatewayAddStepInitializing) _then) = _$GatewayAddStepInitializingCopyWithImpl;
@useResult
$Res call({
 String mac, GatewayWifi? wifi
});




}
/// @nodoc
class _$GatewayAddStepInitializingCopyWithImpl<$Res>
    implements $GatewayAddStepInitializingCopyWith<$Res> {
  _$GatewayAddStepInitializingCopyWithImpl(this._self, this._then);

  final GatewayAddStepInitializing _self;
  final $Res Function(GatewayAddStepInitializing) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,Object? wifi = freezed,}) {
  return _then(GatewayAddStepInitializing(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,wifi: freezed == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as GatewayWifi?,
  ));
}


}

/// @nodoc


class GatewayAddStepConfirming implements GatewayAddStep {
  const GatewayAddStepConfirming({required this.networkMac});
  

 final  String networkMac;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepConfirmingCopyWith<GatewayAddStepConfirming> get copyWith => _$GatewayAddStepConfirmingCopyWithImpl<GatewayAddStepConfirming>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepConfirming&&(identical(other.networkMac, networkMac) || other.networkMac == networkMac));
}


@override
int get hashCode => Object.hash(runtimeType,networkMac);

@override
String toString() {
  return 'GatewayAddStep.confirming(networkMac: $networkMac)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepConfirmingCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepConfirmingCopyWith(GatewayAddStepConfirming value, $Res Function(GatewayAddStepConfirming) _then) = _$GatewayAddStepConfirmingCopyWithImpl;
@useResult
$Res call({
 String networkMac
});




}
/// @nodoc
class _$GatewayAddStepConfirmingCopyWithImpl<$Res>
    implements $GatewayAddStepConfirmingCopyWith<$Res> {
  _$GatewayAddStepConfirmingCopyWithImpl(this._self, this._then);

  final GatewayAddStepConfirming _self;
  final $Res Function(GatewayAddStepConfirming) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? networkMac = null,}) {
  return _then(GatewayAddStepConfirming(
networkMac: null == networkMac ? _self.networkMac : networkMac // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GatewayAddStepDone implements GatewayAddStep {
  const GatewayAddStepDone({required this.gatewayId});
  

 final  int gatewayId;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepDoneCopyWith<GatewayAddStepDone> get copyWith => _$GatewayAddStepDoneCopyWithImpl<GatewayAddStepDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepDone&&(identical(other.gatewayId, gatewayId) || other.gatewayId == gatewayId));
}


@override
int get hashCode => Object.hash(runtimeType,gatewayId);

@override
String toString() {
  return 'GatewayAddStep.done(gatewayId: $gatewayId)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepDoneCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepDoneCopyWith(GatewayAddStepDone value, $Res Function(GatewayAddStepDone) _then) = _$GatewayAddStepDoneCopyWithImpl;
@useResult
$Res call({
 int gatewayId
});




}
/// @nodoc
class _$GatewayAddStepDoneCopyWithImpl<$Res>
    implements $GatewayAddStepDoneCopyWith<$Res> {
  _$GatewayAddStepDoneCopyWithImpl(this._self, this._then);

  final GatewayAddStepDone _self;
  final $Res Function(GatewayAddStepDone) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gatewayId = null,}) {
  return _then(GatewayAddStepDone(
gatewayId: null == gatewayId ? _self.gatewayId : gatewayId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GatewayAddStepFailure implements GatewayAddStep {
  const GatewayAddStepFailure({required this.error});
  

 final  AppException error;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStepFailureCopyWith<GatewayAddStepFailure> get copyWith => _$GatewayAddStepFailureCopyWithImpl<GatewayAddStepFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddStepFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GatewayAddStep.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStepFailureCopyWith<$Res> implements $GatewayAddStepCopyWith<$Res> {
  factory $GatewayAddStepFailureCopyWith(GatewayAddStepFailure value, $Res Function(GatewayAddStepFailure) _then) = _$GatewayAddStepFailureCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$GatewayAddStepFailureCopyWithImpl<$Res>
    implements $GatewayAddStepFailureCopyWith<$Res> {
  _$GatewayAddStepFailureCopyWithImpl(this._self, this._then);

  final GatewayAddStepFailure _self;
  final $Res Function(GatewayAddStepFailure) _then;

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GatewayAddStepFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of GatewayAddStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res> get error {
  
  return $AppExceptionCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$GatewayAddState {

 GatewayAddStep get step;/// 当前选中的网关类型（connect 成功后写入，供 UI 按类型显隐字段）。
 TTGatewayType? get gatewayType;/// wifi 步骤：附近 WiFi 列表（经 gatewayGetNearbyWifi 累积）。
 List<GatewayWifi> get wifiList; bool get wifiScanning;
/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayAddStateCopyWith<GatewayAddState> get copyWith => _$GatewayAddStateCopyWithImpl<GatewayAddState>(this as GatewayAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayAddState&&(identical(other.step, step) || other.step == step)&&(identical(other.gatewayType, gatewayType) || other.gatewayType == gatewayType)&&const DeepCollectionEquality().equals(other.wifiList, wifiList)&&(identical(other.wifiScanning, wifiScanning) || other.wifiScanning == wifiScanning));
}


@override
int get hashCode => Object.hash(runtimeType,step,gatewayType,const DeepCollectionEquality().hash(wifiList),wifiScanning);

@override
String toString() {
  return 'GatewayAddState(step: $step, gatewayType: $gatewayType, wifiList: $wifiList, wifiScanning: $wifiScanning)';
}


}

/// @nodoc
abstract mixin class $GatewayAddStateCopyWith<$Res>  {
  factory $GatewayAddStateCopyWith(GatewayAddState value, $Res Function(GatewayAddState) _then) = _$GatewayAddStateCopyWithImpl;
@useResult
$Res call({
 GatewayAddStep step, TTGatewayType? gatewayType, List<GatewayWifi> wifiList, bool wifiScanning
});


$GatewayAddStepCopyWith<$Res> get step;

}
/// @nodoc
class _$GatewayAddStateCopyWithImpl<$Res>
    implements $GatewayAddStateCopyWith<$Res> {
  _$GatewayAddStateCopyWithImpl(this._self, this._then);

  final GatewayAddState _self;
  final $Res Function(GatewayAddState) _then;

/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? gatewayType = freezed,Object? wifiList = null,Object? wifiScanning = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as GatewayAddStep,gatewayType: freezed == gatewayType ? _self.gatewayType : gatewayType // ignore: cast_nullable_to_non_nullable
as TTGatewayType?,wifiList: null == wifiList ? _self.wifiList : wifiList // ignore: cast_nullable_to_non_nullable
as List<GatewayWifi>,wifiScanning: null == wifiScanning ? _self.wifiScanning : wifiScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayAddStepCopyWith<$Res> get step {
  
  return $GatewayAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [GatewayAddState].
extension GatewayAddStatePatterns on GatewayAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayAddState value)  $default,){
final _that = this;
switch (_that) {
case _GatewayAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayAddState value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GatewayAddStep step,  TTGatewayType? gatewayType,  List<GatewayWifi> wifiList,  bool wifiScanning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayAddState() when $default != null:
return $default(_that.step,_that.gatewayType,_that.wifiList,_that.wifiScanning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GatewayAddStep step,  TTGatewayType? gatewayType,  List<GatewayWifi> wifiList,  bool wifiScanning)  $default,) {final _that = this;
switch (_that) {
case _GatewayAddState():
return $default(_that.step,_that.gatewayType,_that.wifiList,_that.wifiScanning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GatewayAddStep step,  TTGatewayType? gatewayType,  List<GatewayWifi> wifiList,  bool wifiScanning)?  $default,) {final _that = this;
switch (_that) {
case _GatewayAddState() when $default != null:
return $default(_that.step,_that.gatewayType,_that.wifiList,_that.wifiScanning);case _:
  return null;

}
}

}

/// @nodoc


class _GatewayAddState implements GatewayAddState {
  const _GatewayAddState({this.step = const GatewayAddStep.scanning(), this.gatewayType, final  List<GatewayWifi> wifiList = const <GatewayWifi>[], this.wifiScanning = false}): _wifiList = wifiList;
  

@override@JsonKey() final  GatewayAddStep step;
/// 当前选中的网关类型（connect 成功后写入，供 UI 按类型显隐字段）。
@override final  TTGatewayType? gatewayType;
/// wifi 步骤：附近 WiFi 列表（经 gatewayGetNearbyWifi 累积）。
 final  List<GatewayWifi> _wifiList;
/// wifi 步骤：附近 WiFi 列表（经 gatewayGetNearbyWifi 累积）。
@override@JsonKey() List<GatewayWifi> get wifiList {
  if (_wifiList is EqualUnmodifiableListView) return _wifiList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wifiList);
}

@override@JsonKey() final  bool wifiScanning;

/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayAddStateCopyWith<_GatewayAddState> get copyWith => __$GatewayAddStateCopyWithImpl<_GatewayAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayAddState&&(identical(other.step, step) || other.step == step)&&(identical(other.gatewayType, gatewayType) || other.gatewayType == gatewayType)&&const DeepCollectionEquality().equals(other._wifiList, _wifiList)&&(identical(other.wifiScanning, wifiScanning) || other.wifiScanning == wifiScanning));
}


@override
int get hashCode => Object.hash(runtimeType,step,gatewayType,const DeepCollectionEquality().hash(_wifiList),wifiScanning);

@override
String toString() {
  return 'GatewayAddState(step: $step, gatewayType: $gatewayType, wifiList: $wifiList, wifiScanning: $wifiScanning)';
}


}

/// @nodoc
abstract mixin class _$GatewayAddStateCopyWith<$Res> implements $GatewayAddStateCopyWith<$Res> {
  factory _$GatewayAddStateCopyWith(_GatewayAddState value, $Res Function(_GatewayAddState) _then) = __$GatewayAddStateCopyWithImpl;
@override @useResult
$Res call({
 GatewayAddStep step, TTGatewayType? gatewayType, List<GatewayWifi> wifiList, bool wifiScanning
});


@override $GatewayAddStepCopyWith<$Res> get step;

}
/// @nodoc
class __$GatewayAddStateCopyWithImpl<$Res>
    implements _$GatewayAddStateCopyWith<$Res> {
  __$GatewayAddStateCopyWithImpl(this._self, this._then);

  final _GatewayAddState _self;
  final $Res Function(_GatewayAddState) _then;

/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? gatewayType = freezed,Object? wifiList = null,Object? wifiScanning = null,}) {
  return _then(_GatewayAddState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as GatewayAddStep,gatewayType: freezed == gatewayType ? _self.gatewayType : gatewayType // ignore: cast_nullable_to_non_nullable
as TTGatewayType?,wifiList: null == wifiList ? _self._wifiList : wifiList // ignore: cast_nullable_to_non_nullable
as List<GatewayWifi>,wifiScanning: null == wifiScanning ? _self.wifiScanning : wifiScanning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GatewayAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayAddStepCopyWith<$Res> get step {
  
  return $GatewayAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

// dart format on
