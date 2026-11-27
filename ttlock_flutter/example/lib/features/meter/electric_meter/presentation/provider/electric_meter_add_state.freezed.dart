// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterAddStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ElectricMeterAddStep()';
}


}

/// @nodoc
class $ElectricMeterAddStepCopyWith<$Res>  {
$ElectricMeterAddStepCopyWith(ElectricMeterAddStep _, $Res Function(ElectricMeterAddStep) __);
}


/// Adds pattern-matching-related methods to [ElectricMeterAddStep].
extension ElectricMeterAddStepPatterns on ElectricMeterAddStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ElectricMeterAddStepForm value)?  form,TResult Function( ElectricMeterAddStepScanning value)?  scanning,TResult Function( ElectricMeterAddStepConnecting value)?  connecting,TResult Function( ElectricMeterAddStepConfirmConnection value)?  confirmConnection,TResult Function( ElectricMeterAddStepSubmitting value)?  submitting,TResult Function( ElectricMeterAddStepSuccess value)?  success,TResult Function( ElectricMeterAddStepConfiguring value)?  configuring,TResult Function( ElectricMeterAddStepDone value)?  done,TResult Function( ElectricMeterAddStepFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ElectricMeterAddStepForm() when form != null:
return form(_that);case ElectricMeterAddStepScanning() when scanning != null:
return scanning(_that);case ElectricMeterAddStepConnecting() when connecting != null:
return connecting(_that);case ElectricMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that);case ElectricMeterAddStepSubmitting() when submitting != null:
return submitting(_that);case ElectricMeterAddStepSuccess() when success != null:
return success(_that);case ElectricMeterAddStepConfiguring() when configuring != null:
return configuring(_that);case ElectricMeterAddStepDone() when done != null:
return done(_that);case ElectricMeterAddStepFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ElectricMeterAddStepForm value)  form,required TResult Function( ElectricMeterAddStepScanning value)  scanning,required TResult Function( ElectricMeterAddStepConnecting value)  connecting,required TResult Function( ElectricMeterAddStepConfirmConnection value)  confirmConnection,required TResult Function( ElectricMeterAddStepSubmitting value)  submitting,required TResult Function( ElectricMeterAddStepSuccess value)  success,required TResult Function( ElectricMeterAddStepConfiguring value)  configuring,required TResult Function( ElectricMeterAddStepDone value)  done,required TResult Function( ElectricMeterAddStepFailure value)  failure,}){
final _that = this;
switch (_that) {
case ElectricMeterAddStepForm():
return form(_that);case ElectricMeterAddStepScanning():
return scanning(_that);case ElectricMeterAddStepConnecting():
return connecting(_that);case ElectricMeterAddStepConfirmConnection():
return confirmConnection(_that);case ElectricMeterAddStepSubmitting():
return submitting(_that);case ElectricMeterAddStepSuccess():
return success(_that);case ElectricMeterAddStepConfiguring():
return configuring(_that);case ElectricMeterAddStepDone():
return done(_that);case ElectricMeterAddStepFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ElectricMeterAddStepForm value)?  form,TResult? Function( ElectricMeterAddStepScanning value)?  scanning,TResult? Function( ElectricMeterAddStepConnecting value)?  connecting,TResult? Function( ElectricMeterAddStepConfirmConnection value)?  confirmConnection,TResult? Function( ElectricMeterAddStepSubmitting value)?  submitting,TResult? Function( ElectricMeterAddStepSuccess value)?  success,TResult? Function( ElectricMeterAddStepConfiguring value)?  configuring,TResult? Function( ElectricMeterAddStepDone value)?  done,TResult? Function( ElectricMeterAddStepFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ElectricMeterAddStepForm() when form != null:
return form(_that);case ElectricMeterAddStepScanning() when scanning != null:
return scanning(_that);case ElectricMeterAddStepConnecting() when connecting != null:
return connecting(_that);case ElectricMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that);case ElectricMeterAddStepSubmitting() when submitting != null:
return submitting(_that);case ElectricMeterAddStepSuccess() when success != null:
return success(_that);case ElectricMeterAddStepConfiguring() when configuring != null:
return configuring(_that);case ElectricMeterAddStepDone() when done != null:
return done(_that);case ElectricMeterAddStepFailure() when failure != null:
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
case ElectricMeterAddStepForm() when form != null:
return form();case ElectricMeterAddStepScanning() when scanning != null:
return scanning(_that.devices);case ElectricMeterAddStepConnecting() when connecting != null:
return connecting(_that.scan);case ElectricMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that.scan);case ElectricMeterAddStepSubmitting() when submitting != null:
return submitting(_that.scan);case ElectricMeterAddStepSuccess() when success != null:
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case ElectricMeterAddStepConfiguring() when configuring != null:
return configuring(_that.scan,_that.meterId);case ElectricMeterAddStepDone() when done != null:
return done(_that.meterId,_that.catOneFailed);case ElectricMeterAddStepFailure() when failure != null:
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
case ElectricMeterAddStepForm():
return form();case ElectricMeterAddStepScanning():
return scanning(_that.devices);case ElectricMeterAddStepConnecting():
return connecting(_that.scan);case ElectricMeterAddStepConfirmConnection():
return confirmConnection(_that.scan);case ElectricMeterAddStepSubmitting():
return submitting(_that.scan);case ElectricMeterAddStepSuccess():
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case ElectricMeterAddStepConfiguring():
return configuring(_that.scan,_that.meterId);case ElectricMeterAddStepDone():
return done(_that.meterId,_that.catOneFailed);case ElectricMeterAddStepFailure():
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
case ElectricMeterAddStepForm() when form != null:
return form();case ElectricMeterAddStepScanning() when scanning != null:
return scanning(_that.devices);case ElectricMeterAddStepConnecting() when connecting != null:
return connecting(_that.scan);case ElectricMeterAddStepConfirmConnection() when confirmConnection != null:
return confirmConnection(_that.scan);case ElectricMeterAddStepSubmitting() when submitting != null:
return submitting(_that.scan);case ElectricMeterAddStepSuccess() when success != null:
return success(_that.scan,_that.meterId,_that.isCatOne,_that.needsApn);case ElectricMeterAddStepConfiguring() when configuring != null:
return configuring(_that.scan,_that.meterId);case ElectricMeterAddStepDone() when done != null:
return done(_that.meterId,_that.catOneFailed);case ElectricMeterAddStepFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ElectricMeterAddStepForm implements ElectricMeterAddStep {
  const ElectricMeterAddStepForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ElectricMeterAddStep.form()';
}


}




/// @nodoc


class ElectricMeterAddStepScanning implements ElectricMeterAddStep {
  const ElectricMeterAddStepScanning({final  Map<String, TTMeterScanModel> devices = const <String, TTMeterScanModel>{}}): _devices = devices;
  

 final  Map<String, TTMeterScanModel> _devices;
@JsonKey() Map<String, TTMeterScanModel> get devices {
  if (_devices is EqualUnmodifiableMapView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_devices);
}


/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepScanningCopyWith<ElectricMeterAddStepScanning> get copyWith => _$ElectricMeterAddStepScanningCopyWithImpl<ElectricMeterAddStepScanning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepScanning&&const DeepCollectionEquality().equals(other._devices, _devices));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices));

@override
String toString() {
  return 'ElectricMeterAddStep.scanning(devices: $devices)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepScanningCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepScanningCopyWith(ElectricMeterAddStepScanning value, $Res Function(ElectricMeterAddStepScanning) _then) = _$ElectricMeterAddStepScanningCopyWithImpl;
@useResult
$Res call({
 Map<String, TTMeterScanModel> devices
});




}
/// @nodoc
class _$ElectricMeterAddStepScanningCopyWithImpl<$Res>
    implements $ElectricMeterAddStepScanningCopyWith<$Res> {
  _$ElectricMeterAddStepScanningCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepScanning _self;
  final $Res Function(ElectricMeterAddStepScanning) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,}) {
  return _then(ElectricMeterAddStepScanning(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as Map<String, TTMeterScanModel>,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepConnecting implements ElectricMeterAddStep {
  const ElectricMeterAddStepConnecting({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepConnectingCopyWith<ElectricMeterAddStepConnecting> get copyWith => _$ElectricMeterAddStepConnectingCopyWithImpl<ElectricMeterAddStepConnecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepConnecting&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'ElectricMeterAddStep.connecting(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepConnectingCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepConnectingCopyWith(ElectricMeterAddStepConnecting value, $Res Function(ElectricMeterAddStepConnecting) _then) = _$ElectricMeterAddStepConnectingCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$ElectricMeterAddStepConnectingCopyWithImpl<$Res>
    implements $ElectricMeterAddStepConnectingCopyWith<$Res> {
  _$ElectricMeterAddStepConnectingCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepConnecting _self;
  final $Res Function(ElectricMeterAddStepConnecting) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(ElectricMeterAddStepConnecting(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepConfirmConnection implements ElectricMeterAddStep {
  const ElectricMeterAddStepConfirmConnection({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepConfirmConnectionCopyWith<ElectricMeterAddStepConfirmConnection> get copyWith => _$ElectricMeterAddStepConfirmConnectionCopyWithImpl<ElectricMeterAddStepConfirmConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepConfirmConnection&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'ElectricMeterAddStep.confirmConnection(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepConfirmConnectionCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepConfirmConnectionCopyWith(ElectricMeterAddStepConfirmConnection value, $Res Function(ElectricMeterAddStepConfirmConnection) _then) = _$ElectricMeterAddStepConfirmConnectionCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$ElectricMeterAddStepConfirmConnectionCopyWithImpl<$Res>
    implements $ElectricMeterAddStepConfirmConnectionCopyWith<$Res> {
  _$ElectricMeterAddStepConfirmConnectionCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepConfirmConnection _self;
  final $Res Function(ElectricMeterAddStepConfirmConnection) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(ElectricMeterAddStepConfirmConnection(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepSubmitting implements ElectricMeterAddStep {
  const ElectricMeterAddStepSubmitting({required this.scan});
  

 final  TTMeterScanModel scan;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepSubmittingCopyWith<ElectricMeterAddStepSubmitting> get copyWith => _$ElectricMeterAddStepSubmittingCopyWithImpl<ElectricMeterAddStepSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepSubmitting&&(identical(other.scan, scan) || other.scan == scan));
}


@override
int get hashCode => Object.hash(runtimeType,scan);

@override
String toString() {
  return 'ElectricMeterAddStep.submitting(scan: $scan)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepSubmittingCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepSubmittingCopyWith(ElectricMeterAddStepSubmitting value, $Res Function(ElectricMeterAddStepSubmitting) _then) = _$ElectricMeterAddStepSubmittingCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan
});




}
/// @nodoc
class _$ElectricMeterAddStepSubmittingCopyWithImpl<$Res>
    implements $ElectricMeterAddStepSubmittingCopyWith<$Res> {
  _$ElectricMeterAddStepSubmittingCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepSubmitting _self;
  final $Res Function(ElectricMeterAddStepSubmitting) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,}) {
  return _then(ElectricMeterAddStepSubmitting(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepSuccess implements ElectricMeterAddStep {
  const ElectricMeterAddStepSuccess({required this.scan, required this.meterId, required this.isCatOne, required this.needsApn});
  

 final  TTMeterScanModel scan;
 final  int meterId;
 final  bool isCatOne;
 final  bool needsApn;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepSuccessCopyWith<ElectricMeterAddStepSuccess> get copyWith => _$ElectricMeterAddStepSuccessCopyWithImpl<ElectricMeterAddStepSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepSuccess&&(identical(other.scan, scan) || other.scan == scan)&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn));
}


@override
int get hashCode => Object.hash(runtimeType,scan,meterId,isCatOne,needsApn);

@override
String toString() {
  return 'ElectricMeterAddStep.success(scan: $scan, meterId: $meterId, isCatOne: $isCatOne, needsApn: $needsApn)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepSuccessCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepSuccessCopyWith(ElectricMeterAddStepSuccess value, $Res Function(ElectricMeterAddStepSuccess) _then) = _$ElectricMeterAddStepSuccessCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan, int meterId, bool isCatOne, bool needsApn
});




}
/// @nodoc
class _$ElectricMeterAddStepSuccessCopyWithImpl<$Res>
    implements $ElectricMeterAddStepSuccessCopyWith<$Res> {
  _$ElectricMeterAddStepSuccessCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepSuccess _self;
  final $Res Function(ElectricMeterAddStepSuccess) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,Object? meterId = null,Object? isCatOne = null,Object? needsApn = null,}) {
  return _then(ElectricMeterAddStepSuccess(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepConfiguring implements ElectricMeterAddStep {
  const ElectricMeterAddStepConfiguring({required this.scan, required this.meterId});
  

 final  TTMeterScanModel scan;
 final  int meterId;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepConfiguringCopyWith<ElectricMeterAddStepConfiguring> get copyWith => _$ElectricMeterAddStepConfiguringCopyWithImpl<ElectricMeterAddStepConfiguring>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepConfiguring&&(identical(other.scan, scan) || other.scan == scan)&&(identical(other.meterId, meterId) || other.meterId == meterId));
}


@override
int get hashCode => Object.hash(runtimeType,scan,meterId);

@override
String toString() {
  return 'ElectricMeterAddStep.configuring(scan: $scan, meterId: $meterId)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepConfiguringCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepConfiguringCopyWith(ElectricMeterAddStepConfiguring value, $Res Function(ElectricMeterAddStepConfiguring) _then) = _$ElectricMeterAddStepConfiguringCopyWithImpl;
@useResult
$Res call({
 TTMeterScanModel scan, int meterId
});




}
/// @nodoc
class _$ElectricMeterAddStepConfiguringCopyWithImpl<$Res>
    implements $ElectricMeterAddStepConfiguringCopyWith<$Res> {
  _$ElectricMeterAddStepConfiguringCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepConfiguring _self;
  final $Res Function(ElectricMeterAddStepConfiguring) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scan = null,Object? meterId = null,}) {
  return _then(ElectricMeterAddStepConfiguring(
scan: null == scan ? _self.scan : scan // ignore: cast_nullable_to_non_nullable
as TTMeterScanModel,meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepDone implements ElectricMeterAddStep {
  const ElectricMeterAddStepDone({required this.meterId, this.catOneFailed = false});
  

 final  int meterId;
@JsonKey() final  bool catOneFailed;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepDoneCopyWith<ElectricMeterAddStepDone> get copyWith => _$ElectricMeterAddStepDoneCopyWithImpl<ElectricMeterAddStepDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepDone&&(identical(other.meterId, meterId) || other.meterId == meterId)&&(identical(other.catOneFailed, catOneFailed) || other.catOneFailed == catOneFailed));
}


@override
int get hashCode => Object.hash(runtimeType,meterId,catOneFailed);

@override
String toString() {
  return 'ElectricMeterAddStep.done(meterId: $meterId, catOneFailed: $catOneFailed)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepDoneCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepDoneCopyWith(ElectricMeterAddStepDone value, $Res Function(ElectricMeterAddStepDone) _then) = _$ElectricMeterAddStepDoneCopyWithImpl;
@useResult
$Res call({
 int meterId, bool catOneFailed
});




}
/// @nodoc
class _$ElectricMeterAddStepDoneCopyWithImpl<$Res>
    implements $ElectricMeterAddStepDoneCopyWith<$Res> {
  _$ElectricMeterAddStepDoneCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepDone _self;
  final $Res Function(ElectricMeterAddStepDone) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meterId = null,Object? catOneFailed = null,}) {
  return _then(ElectricMeterAddStepDone(
meterId: null == meterId ? _self.meterId : meterId // ignore: cast_nullable_to_non_nullable
as int,catOneFailed: null == catOneFailed ? _self.catOneFailed : catOneFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ElectricMeterAddStepFailure implements ElectricMeterAddStep {
  const ElectricMeterAddStepFailure({required this.error});
  

 final  AppException error;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStepFailureCopyWith<ElectricMeterAddStepFailure> get copyWith => _$ElectricMeterAddStepFailureCopyWithImpl<ElectricMeterAddStepFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddStepFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ElectricMeterAddStep.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStepFailureCopyWith<$Res> implements $ElectricMeterAddStepCopyWith<$Res> {
  factory $ElectricMeterAddStepFailureCopyWith(ElectricMeterAddStepFailure value, $Res Function(ElectricMeterAddStepFailure) _then) = _$ElectricMeterAddStepFailureCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$ElectricMeterAddStepFailureCopyWithImpl<$Res>
    implements $ElectricMeterAddStepFailureCopyWith<$Res> {
  _$ElectricMeterAddStepFailureCopyWithImpl(this._self, this._then);

  final ElectricMeterAddStepFailure _self;
  final $Res Function(ElectricMeterAddStepFailure) _then;

/// Create a copy of ElectricMeterAddStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ElectricMeterAddStepFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of ElectricMeterAddStep
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
mixin _$ElectricMeterAddState {

 ElectricMeterAddStep get step;
/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterAddStateCopyWith<ElectricMeterAddState> get copyWith => _$ElectricMeterAddStateCopyWithImpl<ElectricMeterAddState>(this as ElectricMeterAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'ElectricMeterAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterAddStateCopyWith<$Res>  {
  factory $ElectricMeterAddStateCopyWith(ElectricMeterAddState value, $Res Function(ElectricMeterAddState) _then) = _$ElectricMeterAddStateCopyWithImpl;
@useResult
$Res call({
 ElectricMeterAddStep step
});


$ElectricMeterAddStepCopyWith<$Res> get step;

}
/// @nodoc
class _$ElectricMeterAddStateCopyWithImpl<$Res>
    implements $ElectricMeterAddStateCopyWith<$Res> {
  _$ElectricMeterAddStateCopyWithImpl(this._self, this._then);

  final ElectricMeterAddState _self;
  final $Res Function(ElectricMeterAddState) _then;

/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ElectricMeterAddStep,
  ));
}
/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterAddStepCopyWith<$Res> get step {
  
  return $ElectricMeterAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}


/// Adds pattern-matching-related methods to [ElectricMeterAddState].
extension ElectricMeterAddStatePatterns on ElectricMeterAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterAddState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterAddState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ElectricMeterAddStep step)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterAddState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ElectricMeterAddStep step)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterAddState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ElectricMeterAddStep step)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterAddState() when $default != null:
return $default(_that.step);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterAddState extends ElectricMeterAddState {
  const _ElectricMeterAddState({this.step = const ElectricMeterAddStep.form()}): super._();
  

@override@JsonKey() final  ElectricMeterAddStep step;

/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterAddStateCopyWith<_ElectricMeterAddState> get copyWith => __$ElectricMeterAddStateCopyWithImpl<_ElectricMeterAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterAddState&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'ElectricMeterAddState(step: $step)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterAddStateCopyWith<$Res> implements $ElectricMeterAddStateCopyWith<$Res> {
  factory _$ElectricMeterAddStateCopyWith(_ElectricMeterAddState value, $Res Function(_ElectricMeterAddState) _then) = __$ElectricMeterAddStateCopyWithImpl;
@override @useResult
$Res call({
 ElectricMeterAddStep step
});


@override $ElectricMeterAddStepCopyWith<$Res> get step;

}
/// @nodoc
class __$ElectricMeterAddStateCopyWithImpl<$Res>
    implements _$ElectricMeterAddStateCopyWith<$Res> {
  __$ElectricMeterAddStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterAddState _self;
  final $Res Function(_ElectricMeterAddState) _then;

/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(_ElectricMeterAddState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ElectricMeterAddStep,
  ));
}

/// Create a copy of ElectricMeterAddState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterAddStepCopyWith<$Res> get step {
  
  return $ElectricMeterAddStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

// dart format on
