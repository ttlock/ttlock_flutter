// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterAddStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterMeterAddStep()';
}


}

/// @nodoc
class $WaterMeterAddStepCopyWith<$Res>  {
$WaterMeterAddStepCopyWith(WaterMeterAddStep _, $Res Function(WaterMeterAddStep) __);
}


/// Adds pattern-matching-related methods to [WaterMeterAddStep].
extension WaterMeterAddStepPatterns on WaterMeterAddStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WaterMeterAddStepForm value)?  form,TResult Function( WaterMeterAddStepScanning value)?  scanning,TResult Function( WaterMeterAddStepConnecting value)?  connecting,TResult Function( WaterMeterAddStepConfirmConnection value)?  confirmConnection,TResult Function( WaterMeterAddStepSubmitting value)?  submitting,TResult Function( WaterMeterAddStepSuccess value)?  success,TResult Function( WaterMeterAddStepConfiguring value)?  configuring,TResult Function( WaterMeterAddStepDone value)?  done,TResult Function( WaterMeterAddStepFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WaterMeterAddStepForm() when form != null:
return form(_that);case WaterMeterAddStepScanning() when scanning != null:
return scanning(_that);case WaterMeterAddStepConnecting() when connecting != null:
return connecting(_that);case WaterMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that);case WaterMeterAddStepSubmitting() when submitting != null:
return submitting(_that);case WaterMeterAddStepSuccess() when success != null:
return success(_that);case WaterMeterAddStepConfiguring() when configuring != null:
return configuring(_that);case WaterMeterAddStepDone() when done != null:
return done(_that);case WaterMeterAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WaterMeterAddStepForm value)  form,required TResult Function( WaterMeterAddStepScanning value)  scanning,required TResult Function( WaterMeterAddStepConnecting value)  connecting,required TResult Function( WaterMeterAddStepConfirmConnection value)  confirmConnection,required TResult Function( WaterMeterAddStepSubmitting value)  submitting,required TResult Function( WaterMeterAddStepSuccess value)  success,required TResult Function( WaterMeterAddStepConfiguring value)  configuring,required TResult Function( WaterMeterAddStepDone value)  done,required TResult Function( WaterMeterAddStepFailure value)  failure,}){
final _that = this;
switch (_that) {
case WaterMeterAddStepForm():
return form(_that);case WaterMeterAddStepScanning():
return scanning(_that);case WaterMeterAddStepConnecting():
return connecting(_that);case WaterMeterAddStepConfirmConnection():
return confirmConnection(_that);case WaterMeterAddStepSubmitting():
return submitting(_that);case WaterMeterAddStepSuccess():
return success(_that);case WaterMeterAddStepConfiguring():
return configuring(_that);case WaterMeterAddStepDone():
return done(_that);case WaterMeterAddStepFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WaterMeterAddStepForm value)?  form,TResult? Function( WaterMeterAddStepScanning value)?  scanning,TResult? Function( WaterMeterAddStepConnecting value)?  connecting,TResult? Function( WaterMeterAddStepConfirmConnection value)?  confirmConnection,TResult? Function( WaterMeterAddStepSubmitting value)?  submitting,TResult? Function( WaterMeterAddStepSuccess value)?  success,TResult? Function( WaterMeterAddStepConfiguring value)?  configuring,TResult? Function( WaterMeterAddStepDone value)?  done,TResult? Function( WaterMeterAddStepFailure value)?  failure,}){
final _that = this;
switch (_that) {
case WaterMeterAddStepForm() when form != null:
return form(_that);case WaterMeterAddStepScanning() when scanning != null:
return scanning(_that);case WaterMeterAddStepConnecting() when connecting != null:
return connecting(_that);case WaterMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that);case WaterMeterAddStepSubmitting() when submitting != null:
return submitting(_that);case WaterMeterAddStepSuccess() when success != null:
return success(_that);case WaterMeterAddStepConfiguring() when configuring != null:
return configuring(_that);case WaterMeterAddStepDone() when done != null:
return done(_that);case WaterMeterAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  form,TResult Function( Map<String, TTMeterScanModel> devices)?  scanning,TResult Function( TTMeterScanModel scan)?  connecting,TResult Function( TTMeterScanModel scan)?  confirmConnection,TResult Function( TTMeterScanModel scan)?  submitting,TResult Function( TTMeterScanModel scan,  int meterId,  bool isCatOne,  bool needsApn)?  success,TResult Function( TTMeterScanModel scan,  int meterId)?  configuring,TResult Function( int meterId,  bool catOneFailed)?  done,TResult Function( AppException error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WaterMeterAddStepForm() when form != null:
return form();case WaterMeterAddStepScanning() when scanning != null:
return scanning(_that.devices);case WaterMeterAddStepConnecting() when connecting != null:
return connecting(_that.scan);case WaterMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that.scan);case WaterMeterAddStepSubmitting() when submitting != null:
return submitting(_that.scan);case WaterMeterAddStepSuccess() when success != null:
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case WaterMeterAddStepConfiguring() when configuring != null:
return configuring(_that.scan,_that.meterId);case WaterMeterAddStepDone() when done != null:
return done(_that.meterId,_that.catOneFailed);case WaterMeterAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  form,required TResult Function( Map<String, TTMeterScanModel> devices)  scanning,required TResult Function( TTMeterScanModel scan)  connecting,required TResult Function( TTMeterScanModel scan)  confirmConnection,required TResult Function( TTMeterScanModel scan)  submitting,required TResult Function( TTMeterScanModel scan,  int meterId,  bool isCatOne,  bool needsApn)  success,required TResult Function( TTMeterScanModel scan,  int meterId)  configuring,required TResult Function( int meterId,  bool catOneFailed)  done,required TResult Function( AppException error)  failure,}) {final _that = this;
switch (_that) {
case WaterMeterAddStepForm():
return form();case WaterMeterAddStepScanning():
return scanning(_that.devices);case WaterMeterAddStepConnecting():
return connecting(_that.scan);case WaterMeterAddStepConfirmConnection():
return confirmConnection(_that.scan);case WaterMeterAddStepSubmitting():
return submitting(_that.scan);case WaterMeterAddStepSuccess():
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case WaterMeterAddStepConfiguring():
return configuring(_that.scan,_that.meterId);case WaterMeterAddStepDone():
return done(_that.meterId,_that.catOneFailed);case WaterMeterAddStepFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  form,TResult? Function( Map<String, TTMeterScanModel> devices)?  scanning,TResult? Function( TTMeterScanModel scan)?  connecting,TResult? Function( TTMeterScanModel scan)?  confirmConnection,TResult? Function( TTMeterScanModel scan)?  submitting,TResult? Function( TTMeterScanModel scan,  int meterId,  bool isCatOne,  bool needsApn)?  success,TResult? Function( TTMeterScanModel scan,  int meterId)?  configuring,TResult? Function( int meterId,  bool catOneFailed)?  done,TResult? Function( AppException error)?  failure,}) {final _that = this;
switch (_that) {
case WaterMeterAddStepForm() when form != null:
return form();case WaterMeterAddStepScanning() when scanning != null:
return scanning(_that.devices);case WaterMeterAddStepConnecting() when connecting != null:
return connecting(_that.scan);case WaterMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that.scan);case WaterMeterAddStepSubmitting() when submitting != null:
return submitting(_that.scan);case WaterMeterAddStepSuccess() when success != null:
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case WaterMeterAddStepConfiguring() when configuring != null:
return configuring(_that.scan,_that.meterId);case WaterMeterAddStepDone() when done != null:
return done(_that.meterId,_that.catOneFailed);case WaterMeterAddStepFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class WaterMeterAddStepForm implements WaterMeterAddStep {
  const WaterMeterAddStepForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterMeterAddStep.form()';
}


}




/// @nodoc


class WaterMeterAddStepScanning implements WaterMeterAddStep {
  const WaterMeterAddStepScanning({final  Map<String, TTMeterScanModel> devices = const <String, TTMeterScanModel>{}}): _devices = devices;
  

 final  Map<String, TTMeterScanModel> _devices;
@JsonKey() Map<String, TTMeterScanModel> get devices {
  if (_devices is EqualUnmodifiableMapView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_devices);
}


/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepScanningCopyWith<WaterMeterAddStepScanning> get copyWith => _$WaterMeterAddStepScanningCopyWithImpl<WaterMeterAddStepScanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepScanning&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'WaterMeterAddStep.scanning(devices: $devices)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepScanningCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepScanningCopyWith(WaterMeterAddStepScanning value, $Res Function(WaterMeterAddStepScanning) _then) = _$WaterMeterAddStepScanningCopyWithImpl;
@useResult
$Res call({
 Map<String, TTMeterScanModel> devices
});




}
/// @nodoc
class _$WaterMeterAddStepScanningCopyWithImpl<$Res>
    implements $WaterMeterAddStepScanningCopyWith<$Res> {
  _$WaterMeterAddStepScanningCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepScanning _self;
  final $Res Function(WaterMeterAddStepScanning) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(WaterMeterAddStepScanning(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as Map<String, TTMeterScanModel>,
  ));
}


}

/// @nodoc


class WaterMeterAddStepConnecting implements WaterMeterAddStep {
  const WaterMeterAddStepConnecting({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepConnectingCopyWith<WaterMeterAddStepConnecting> get copyWith => _$WaterMeterAddStepConnectingCopyWithImpl<WaterMeterAddStepConnecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepConnecting&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'WaterMeterAddStep.connecting(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepConnectingCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepConnectingCopyWith(WaterMeterAddStepConnecting value, $Res Function(WaterMeterAddStepConnecting) _then) = _$WaterMeterAddStepConnectingCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$WaterMeterAddStepConnectingCopyWithImpl<$Res>
    implements $WaterMeterAddStepConnectingCopyWith<$Res> {
  _$WaterMeterAddStepConnectingCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepConnecting _self;
  final $Res Function(WaterMeterAddStepConnecting) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(WaterMeterAddStepConnecting(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class WaterMeterAddStepConfirmConnection implements WaterMeterAddStep {
  const WaterMeterAddStepConfirmConnection({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepConfirmConnectionCopyWith<WaterMeterAddStepConfirmConnection> get copyWith => _$WaterMeterAddStepConfirmConnectionCopyWithImpl<WaterMeterAddStepConfirmConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepConfirmConnection&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'WaterMeterAddStep.confirmConnection(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepConfirmConnectionCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepConfirmConnectionCopyWith(WaterMeterAddStepConfirmConnection value, $Res Function(WaterMeterAddStepConfirmConnection) _then) = _$WaterMeterAddStepConfirmConnectionCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$WaterMeterAddStepConfirmConnectionCopyWithImpl<$Res>
    implements $WaterMeterAddStepConfirmConnectionCopyWith<$Res> {
  _$WaterMeterAddStepConfirmConnectionCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepConfirmConnection _self;
  final $Res Function(WaterMeterAddStepConfirmConnection) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(WaterMeterAddStepConfirmConnection(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class WaterMeterAddStepSubmitting implements WaterMeterAddStep {
  const WaterMeterAddStepSubmitting({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepSubmittingCopyWith<WaterMeterAddStepSubmitting> get copyWith => _$WaterMeterAddStepSubmittingCopyWithImpl<WaterMeterAddStepSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepSubmitting&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'WaterMeterAddStep.submitting(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepSubmittingCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepSubmittingCopyWith(WaterMeterAddStepSubmitting value, $Res Function(WaterMeterAddStepSubmitting) _then) = _$WaterMeterAddStepSubmittingCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$WaterMeterAddStepSubmittingCopyWithImpl<$Res>
    implements $WaterMeterAddStepSubmittingCopyWith<$Res> {
  _$WaterMeterAddStepSubmittingCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepSubmitting _self;
  final $Res Function(WaterMeterAddStepSubmitting) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(WaterMeterAddStepSubmitting(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class WaterMeterAddStepSuccess implements WaterMeterAddStep {
  const WaterMeterAddStepSuccess({required this.scan, required this.meterId, required this.isCatOne, required this.needsApn});
  

 final  TTMeterScanModel scan;
 final  int meterId;
 final  bool isCatOne;
 final  bool needsApn;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepSuccessCopyWith<WaterMeterAddStepSuccess> get copyWith => _$WaterMeterAddStepSuccessCopyWithImpl<WaterMeterAddStepSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepSuccess&&(identical(other.scan, scan) || other.scan == scan)&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn));
}


@override
int get hashCode => Object.hash(runtimeType,scan,meterId,isCatOne,needsApn);

@override
String toString() {
  return 'WaterMeterAddStep.success(scan: $scan, meterId: $meterId, isCatOne: $isCatOne, needsApn: $needsApn)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepSuccessCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepSuccessCopyWith(WaterMeterAddStepSuccess value, $Res Function(WaterMeterAddStepSuccess) _then) = _$WaterMeterAddStepSuccessCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan, int meterId, bool isCatOne, bool needsApn
});




}
/// @nodoc
class _$WaterMeterAddStepSuccessCopyWithImpl<$Res>
    implements $WaterMeterAddStepSuccessCopyWith<$Res> {
  _$WaterMeterAddStepSuccessCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepSuccess _self;
  final $Res Function(WaterMeterAddStepSuccess) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,Object? meterId = null,Object? isCatOne = null,Object? needsApn = null,}) {
  return _then(WaterMeterAddStepSuccess(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WaterMeterAddStepConfiguring implements WaterMeterAddStep {
  const WaterMeterAddStepConfiguring({required this.scan, required this.meterId});
  

 final  TTMeterScanModel scan;
 final  int meterId;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepConfiguringCopyWith<WaterMeterAddStepConfiguring> get copyWith => _$WaterMeterAddStepConfiguringCopyWithImpl<WaterMeterAddStepConfiguring>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepConfiguring&&(identical(other.scan, scan) || other.scan == scan)&&(identical(other.meterId, meterId) || other.meterId == meterId));
}


@override
int get hashCode => Object.hash(runtimeType,scan,meterId);

@override
String toString() {
  return 'WaterMeterAddStep.configuring(scan: $scan, meterId: $meterId)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepConfiguringCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepConfiguringCopyWith(WaterMeterAddStepConfiguring value, $Res Function(WaterMeterAddStepConfiguring) _then) = _$WaterMeterAddStepConfiguringCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan, int meterId
});




}
/// @nodoc
class _$WaterMeterAddStepConfiguringCopyWithImpl<$Res>
    implements $WaterMeterAddStepConfiguringCopyWith<$Res> {
  _$WaterMeterAddStepConfiguringCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepConfiguring _self;
  final $Res Function(WaterMeterAddStepConfiguring) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,Object? meterId = null,}) {
  return _then(WaterMeterAddStepConfiguring(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class WaterMeterAddStepDone implements WaterMeterAddStep {
  const WaterMeterAddStepDone({required this.meterId, this.catOneFailed = false});
  

 final  int meterId;
@JsonKey() final  bool catOneFailed;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepDoneCopyWith<WaterMeterAddStepDone> get copyWith => _$WaterMeterAddStepDoneCopyWithImpl<WaterMeterAddStepDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepDone&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.catOneFailed, catOneFailed) || other.catOneFailed == catOneFailed));
}


@override
int get hashCode => Object.hash(runtimeType,meterId,catOneFailed);

@override
String toString() {
  return 'WaterMeterAddStep.done(meterId: $meterId, catOneFailed: $catOneFailed)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepDoneCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepDoneCopyWith(WaterMeterAddStepDone value, $Res Function(WaterMeterAddStepDone) _then) = _$WaterMeterAddStepDoneCopyWithImpl;
@useResult
$Res call({
 int meterId, bool catOneFailed
});




}
/// @nodoc
class _$WaterMeterAddStepDoneCopyWithImpl<$Res>
    implements $WaterMeterAddStepDoneCopyWith<$Res> {
  _$WaterMeterAddStepDoneCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepDone _self;
  final $Res Function(WaterMeterAddStepDone) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meterId = null,Object? catOneFailed = null,}) {
  return _then(WaterMeterAddStepDone(
meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,catOneFailed: null == catOneFailed ? _self.catOneFailed : catOneFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WaterMeterAddStepFailure implements WaterMeterAddStep {
  const WaterMeterAddStepFailure({required this.error});
  

 final  AppException error;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStepFailureCopyWith<WaterMeterAddStepFailure> get copyWith => _$WaterMeterAddStepFailureCopyWithImpl<WaterMeterAddStepFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddStepFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WaterMeterAddStep.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStepFailureCopyWith<$Res> implements $WaterMeterAddStepCopyWith<$Res> {
  factory $WaterMeterAddStepFailureCopyWith(WaterMeterAddStepFailure value, $Res Function(WaterMeterAddStepFailure) _then) = _$WaterMeterAddStepFailureCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$WaterMeterAddStepFailureCopyWithImpl<$Res>
    implements $WaterMeterAddStepFailureCopyWith<$Res> {
  _$WaterMeterAddStepFailureCopyWithImpl(this._self, this._then);

  final WaterMeterAddStepFailure _self;
  final $Res Function(WaterMeterAddStepFailure) _then;

/// Create a copy of WaterMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(WaterMeterAddStepFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of WaterMeterAddStep
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
mixin _$WaterMeterAddState {

 WaterMeterAddStep get step;
/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterAddStateCopyWith<WaterMeterAddState> get copyWith => _$WaterMeterAddStateCopyWithImpl<WaterMeterAddState>(this as WaterMeterAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'WaterMeterAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class $WaterMeterAddStateCopyWith<$Res>  {
  factory $WaterMeterAddStateCopyWith(WaterMeterAddState value, $Res Function(WaterMeterAddState) _then) = _$WaterMeterAddStateCopyWithImpl;
@useResult
$Res call({
 WaterMeterAddStep step
});


$WaterMeterAddStepCopyWith<$Res> get step;

}
/// @nodoc
class _$WaterMeterAddStateCopyWithImpl<$Res>
    implements $WaterMeterAddStateCopyWith<$Res> {
  _$WaterMeterAddStateCopyWithImpl(this._self, this._then);

  final WaterMeterAddState _self;
  final $Res Function(WaterMeterAddState) _then;

/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as WaterMeterAddStep,
  ));
}
/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterAddStepCopyWith<$Res> get step {
  
  return $WaterMeterAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [WaterMeterAddState].
extension WaterMeterAddStatePatterns on WaterMeterAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterAddState value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterAddState value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaterMeterAddStep step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterAddState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaterMeterAddStep step)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterAddState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaterMeterAddStep step)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterAddState() when $default != null:
return $default(_that.step);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterAddState extends WaterMeterAddState {
  const _WaterMeterAddState({this.step = const WaterMeterAddStep.form()}): super._();
  

@override@JsonKey() final  WaterMeterAddStep step;

/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterAddStateCopyWith<_WaterMeterAddState> get copyWith => __$WaterMeterAddStateCopyWithImpl<_WaterMeterAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'WaterMeterAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterAddStateCopyWith<$Res> implements $WaterMeterAddStateCopyWith<$Res> {
  factory _$WaterMeterAddStateCopyWith(_WaterMeterAddState value, $Res Function(_WaterMeterAddState) _then) = __$WaterMeterAddStateCopyWithImpl;
@override @useResult
$Res call({
 WaterMeterAddStep step
});


@override $WaterMeterAddStepCopyWith<$Res> get step;

}
/// @nodoc
class __$WaterMeterAddStateCopyWithImpl<$Res>
    implements _$WaterMeterAddStateCopyWith<$Res> {
  __$WaterMeterAddStateCopyWithImpl(this._self, this._then);

  final _WaterMeterAddState _self;
  final $Res Function(_WaterMeterAddState) _then;

/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_WaterMeterAddState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as WaterMeterAddStep,
  ));
}

/// Create a copy of WaterMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterAddStepCopyWith<$Res> get step {
  
  return $WaterMeterAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

// dart format on
