// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standalone_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StandaloneDoorSensorAddStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorAddStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StandaloneDoorSensorAddStep()';
}


}

/// @nodoc
class $StandaloneDoorSensorAddStepCopyWith<$Res>  {
$StandaloneDoorSensorAddStepCopyWith(StandaloneDoorSensorAddStep _, $Res Function(StandaloneDoorSensorAddStep) __);
}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorAddStep].
extension StandaloneDoorSensorAddStepPatterns on StandaloneDoorSensorAddStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StandaloneAddStepScanning value)?  scanning,TResult Function( StandaloneAddStepCredential value)?  credential,TResult Function( StandaloneAddStepInitializing value)?  initializing,TResult Function( StandaloneAddStepDone value)?  done,TResult Function( StandaloneAddStepFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StandaloneAddStepScanning() when scanning != null:
return scanning(_that);case StandaloneAddStepCredential() when credential != null:
return credential(_that);case StandaloneAddStepInitializing() when initializing != null:
return initializing(_that);case StandaloneAddStepDone() when done != null:
return done(_that);case StandaloneAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StandaloneAddStepScanning value)  scanning,required TResult Function( StandaloneAddStepCredential value)  credential,required TResult Function( StandaloneAddStepInitializing value)  initializing,required TResult Function( StandaloneAddStepDone value)  done,required TResult Function( StandaloneAddStepFailure value)  failure,}){
final _that = this;
switch (_that) {
case StandaloneAddStepScanning():
return scanning(_that);case StandaloneAddStepCredential():
return credential(_that);case StandaloneAddStepInitializing():
return initializing(_that);case StandaloneAddStepDone():
return done(_that);case StandaloneAddStepFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StandaloneAddStepScanning value)?  scanning,TResult? Function( StandaloneAddStepCredential value)?  credential,TResult? Function( StandaloneAddStepInitializing value)?  initializing,TResult? Function( StandaloneAddStepDone value)?  done,TResult? Function( StandaloneAddStepFailure value)?  failure,}){
final _that = this;
switch (_that) {
case StandaloneAddStepScanning() when scanning != null:
return scanning(_that);case StandaloneAddStepCredential() when credential != null:
return credential(_that);case StandaloneAddStepInitializing() when initializing != null:
return initializing(_that);case StandaloneAddStepDone() when done != null:
return done(_that);case StandaloneAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, TTStandaloneDoorSensorScanModel> devices)?  scanning,TResult Function( String mac)?  credential,TResult Function( String mac)?  initializing,TResult Function( int doorSensorId)?  done,TResult Function( AppException error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StandaloneAddStepScanning() when scanning != null:
return scanning(_that.devices);case StandaloneAddStepCredential() when credential != null:
return credential(_that.mac);case StandaloneAddStepInitializing() when initializing != null:
return initializing(_that.mac);case StandaloneAddStepDone() when done != null:
return done(_that.doorSensorId);case StandaloneAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, TTStandaloneDoorSensorScanModel> devices)  scanning,required TResult Function( String mac)  credential,required TResult Function( String mac)  initializing,required TResult Function( int doorSensorId)  done,required TResult Function( AppException error)  failure,}) {final _that = this;
switch (_that) {
case StandaloneAddStepScanning():
return scanning(_that.devices);case StandaloneAddStepCredential():
return credential(_that.mac);case StandaloneAddStepInitializing():
return initializing(_that.mac);case StandaloneAddStepDone():
return done(_that.doorSensorId);case StandaloneAddStepFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, TTStandaloneDoorSensorScanModel> devices)?  scanning,TResult? Function( String mac)?  credential,TResult? Function( String mac)?  initializing,TResult? Function( int doorSensorId)?  done,TResult? Function( AppException error)?  failure,}) {final _that = this;
switch (_that) {
case StandaloneAddStepScanning() when scanning != null:
return scanning(_that.devices);case StandaloneAddStepCredential() when credential != null:
return credential(_that.mac);case StandaloneAddStepInitializing() when initializing != null:
return initializing(_that.mac);case StandaloneAddStepDone() when done != null:
return done(_that.doorSensorId);case StandaloneAddStepFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class StandaloneAddStepScanning implements StandaloneDoorSensorAddStep {
  const StandaloneAddStepScanning({final  Map<String, TTStandaloneDoorSensorScanModel> devices = const <String, TTStandaloneDoorSensorScanModel>{}}): _devices = devices;
  

 final  Map<String, TTStandaloneDoorSensorScanModel> _devices;
@JsonKey() Map<String, TTStandaloneDoorSensorScanModel> get devices {
  if (_devices is EqualUnmodifiableMapView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_devices);
}


/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneAddStepScanningCopyWith<StandaloneAddStepScanning> get copyWith => _$StandaloneAddStepScanningCopyWithImpl<StandaloneAddStepScanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneAddStepScanning&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'StandaloneDoorSensorAddStep.scanning(devices: $devices)';
}


}

/// @nodoc
abstract mixin class $StandaloneAddStepScanningCopyWith<$Res> implements $StandaloneDoorSensorAddStepCopyWith<$Res> {
  factory $StandaloneAddStepScanningCopyWith(StandaloneAddStepScanning value, $Res Function(StandaloneAddStepScanning) _then) = _$StandaloneAddStepScanningCopyWithImpl;
@useResult
$Res call({
 Map<String, TTStandaloneDoorSensorScanModel> devices
});




}
/// @nodoc
class _$StandaloneAddStepScanningCopyWithImpl<$Res>
    implements $StandaloneAddStepScanningCopyWith<$Res> {
  _$StandaloneAddStepScanningCopyWithImpl(this._self, this._then);

  final StandaloneAddStepScanning _self;
  final $Res Function(StandaloneAddStepScanning) _then;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(StandaloneAddStepScanning(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as Map<String, TTStandaloneDoorSensorScanModel>,
  ));
}


}

/// @nodoc


class StandaloneAddStepCredential implements StandaloneDoorSensorAddStep {
  const StandaloneAddStepCredential({required this.mac});
  

 final  String mac;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneAddStepCredentialCopyWith<StandaloneAddStepCredential> get copyWith => _$StandaloneAddStepCredentialCopyWithImpl<StandaloneAddStepCredential>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneAddStepCredential&&(identical(other.mac, mac) || other.mac == mac));
}


@override
int get hashCode => Object.hash(runtimeType,mac);

@override
String toString() {
  return 'StandaloneDoorSensorAddStep.credential(mac: $mac)';
}


}

/// @nodoc
abstract mixin class $StandaloneAddStepCredentialCopyWith<$Res> implements $StandaloneDoorSensorAddStepCopyWith<$Res> {
  factory $StandaloneAddStepCredentialCopyWith(StandaloneAddStepCredential value, $Res Function(StandaloneAddStepCredential) _then) = _$StandaloneAddStepCredentialCopyWithImpl;
@useResult
$Res call({
 String mac
});




}
/// @nodoc
class _$StandaloneAddStepCredentialCopyWithImpl<$Res>
    implements $StandaloneAddStepCredentialCopyWith<$Res> {
  _$StandaloneAddStepCredentialCopyWithImpl(this._self, this._then);

  final StandaloneAddStepCredential _self;
  final $Res Function(StandaloneAddStepCredential) _then;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,}) {
  return _then(StandaloneAddStepCredential(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StandaloneAddStepInitializing implements StandaloneDoorSensorAddStep {
  const StandaloneAddStepInitializing({required this.mac});
  

 final  String mac;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneAddStepInitializingCopyWith<StandaloneAddStepInitializing> get copyWith => _$StandaloneAddStepInitializingCopyWithImpl<StandaloneAddStepInitializing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneAddStepInitializing&&(identical(other.mac, mac) || other.mac == mac));
}


@override
int get hashCode => Object.hash(runtimeType,mac);

@override
String toString() {
  return 'StandaloneDoorSensorAddStep.initializing(mac: $mac)';
}


}

/// @nodoc
abstract mixin class $StandaloneAddStepInitializingCopyWith<$Res> implements $StandaloneDoorSensorAddStepCopyWith<$Res> {
  factory $StandaloneAddStepInitializingCopyWith(StandaloneAddStepInitializing value, $Res Function(StandaloneAddStepInitializing) _then) = _$StandaloneAddStepInitializingCopyWithImpl;
@useResult
$Res call({
 String mac
});




}
/// @nodoc
class _$StandaloneAddStepInitializingCopyWithImpl<$Res>
    implements $StandaloneAddStepInitializingCopyWith<$Res> {
  _$StandaloneAddStepInitializingCopyWithImpl(this._self, this._then);

  final StandaloneAddStepInitializing _self;
  final $Res Function(StandaloneAddStepInitializing) _then;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mac = null,}) {
  return _then(StandaloneAddStepInitializing(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StandaloneAddStepDone implements StandaloneDoorSensorAddStep {
  const StandaloneAddStepDone({required this.doorSensorId});
  

 final  int doorSensorId;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneAddStepDoneCopyWith<StandaloneAddStepDone> get copyWith => _$StandaloneAddStepDoneCopyWithImpl<StandaloneAddStepDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneAddStepDone&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId));
}


@override
int get hashCode => Object.hash(runtimeType,doorSensorId);

@override
String toString() {
  return 'StandaloneDoorSensorAddStep.done(doorSensorId: $doorSensorId)';
}


}

/// @nodoc
abstract mixin class $StandaloneAddStepDoneCopyWith<$Res> implements $StandaloneDoorSensorAddStepCopyWith<$Res> {
  factory $StandaloneAddStepDoneCopyWith(StandaloneAddStepDone value, $Res Function(StandaloneAddStepDone) _then) = _$StandaloneAddStepDoneCopyWithImpl;
@useResult
$Res call({
 int doorSensorId
});




}
/// @nodoc
class _$StandaloneAddStepDoneCopyWithImpl<$Res>
    implements $StandaloneAddStepDoneCopyWith<$Res> {
  _$StandaloneAddStepDoneCopyWithImpl(this._self, this._then);

  final StandaloneAddStepDone _self;
  final $Res Function(StandaloneAddStepDone) _then;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doorSensorId = null,}) {
  return _then(StandaloneAddStepDone(
doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StandaloneAddStepFailure implements StandaloneDoorSensorAddStep {
  const StandaloneAddStepFailure({required this.error});
  

 final  AppException error;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneAddStepFailureCopyWith<StandaloneAddStepFailure> get copyWith => _$StandaloneAddStepFailureCopyWithImpl<StandaloneAddStepFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneAddStepFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'StandaloneDoorSensorAddStep.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $StandaloneAddStepFailureCopyWith<$Res> implements $StandaloneDoorSensorAddStepCopyWith<$Res> {
  factory $StandaloneAddStepFailureCopyWith(StandaloneAddStepFailure value, $Res Function(StandaloneAddStepFailure) _then) = _$StandaloneAddStepFailureCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$StandaloneAddStepFailureCopyWithImpl<$Res>
    implements $StandaloneAddStepFailureCopyWith<$Res> {
  _$StandaloneAddStepFailureCopyWithImpl(this._self, this._then);

  final StandaloneAddStepFailure _self;
  final $Res Function(StandaloneAddStepFailure) _then;

/// Create a copy of StandaloneDoorSensorAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(StandaloneAddStepFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of StandaloneDoorSensorAddStep
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
mixin _$StandaloneDoorSensorAddState {

 StandaloneDoorSensorAddStep get step;
/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorAddStateCopyWith<StandaloneDoorSensorAddState> get copyWith => _$StandaloneDoorSensorAddStateCopyWithImpl<StandaloneDoorSensorAddState>(this as StandaloneDoorSensorAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'StandaloneDoorSensorAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorAddStateCopyWith<$Res>  {
  factory $StandaloneDoorSensorAddStateCopyWith(StandaloneDoorSensorAddState value, $Res Function(StandaloneDoorSensorAddState) _then) = _$StandaloneDoorSensorAddStateCopyWithImpl;
@useResult
$Res call({
 StandaloneDoorSensorAddStep step
});


$StandaloneDoorSensorAddStepCopyWith<$Res> get step;

}
/// @nodoc
class _$StandaloneDoorSensorAddStateCopyWithImpl<$Res>
    implements $StandaloneDoorSensorAddStateCopyWith<$Res> {
  _$StandaloneDoorSensorAddStateCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorAddState _self;
  final $Res Function(StandaloneDoorSensorAddState) _then;

/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as StandaloneDoorSensorAddStep,
  ));
}
/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StandaloneDoorSensorAddStepCopyWith<$Res> get step {
  
  return $StandaloneDoorSensorAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorAddState].
extension StandaloneDoorSensorAddStatePatterns on StandaloneDoorSensorAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAddState value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorAddState value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StandaloneDoorSensorAddStep step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState() when $default != null:
return $default(_that.step);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StandaloneDoorSensorAddStep step)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState():
return $default(_that.step);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StandaloneDoorSensorAddStep step)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAddState() when $default != null:
return $default(_that.step);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorAddState implements StandaloneDoorSensorAddState {
  const _StandaloneDoorSensorAddState({this.step = const StandaloneDoorSensorAddStep.scanning()});
  

@override@JsonKey() final  StandaloneDoorSensorAddStep step;

/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorAddStateCopyWith<_StandaloneDoorSensorAddState> get copyWith => __$StandaloneDoorSensorAddStateCopyWithImpl<_StandaloneDoorSensorAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'StandaloneDoorSensorAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorAddStateCopyWith<$Res> implements $StandaloneDoorSensorAddStateCopyWith<$Res> {
  factory _$StandaloneDoorSensorAddStateCopyWith(_StandaloneDoorSensorAddState value, $Res Function(_StandaloneDoorSensorAddState) _then) = __$StandaloneDoorSensorAddStateCopyWithImpl;
@override @useResult
$Res call({
 StandaloneDoorSensorAddStep step
});


@override $StandaloneDoorSensorAddStepCopyWith<$Res> get step;

}
/// @nodoc
class __$StandaloneDoorSensorAddStateCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorAddStateCopyWith<$Res> {
  __$StandaloneDoorSensorAddStateCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorAddState _self;
  final $Res Function(_StandaloneDoorSensorAddState) _then;

/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_StandaloneDoorSensorAddState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as StandaloneDoorSensorAddStep,
  ));
}

/// Create a copy of StandaloneDoorSensorAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StandaloneDoorSensorAddStepCopyWith<$Res> get step {
  
  return $StandaloneDoorSensorAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

// dart format on
