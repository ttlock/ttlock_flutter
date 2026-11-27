// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_cat_one_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterCatOneStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterMeterCatOneStep()';
}


}

/// @nodoc
class $WaterMeterCatOneStepCopyWith<$Res>  {
$WaterMeterCatOneStepCopyWith(WaterMeterCatOneStep _, $Res Function(WaterMeterCatOneStep) __);
}


/// Adds pattern-matching-related methods to [WaterMeterCatOneStep].
extension WaterMeterCatOneStepPatterns on WaterMeterCatOneStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WaterMeterCatOneStepUnavailable value)?  unavailable,TResult Function( WaterMeterCatOneStepUnconfigured value)?  unconfigured,TResult Function( WaterMeterCatOneStepConfigured value)?  configured,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that);case WaterMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured(_that);case WaterMeterCatOneStepConfigured() when configured != null:
return configured(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WaterMeterCatOneStepUnavailable value)  unavailable,required TResult Function( WaterMeterCatOneStepUnconfigured value)  unconfigured,required TResult Function( WaterMeterCatOneStepConfigured value)  configured,}){
final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable():
return unavailable(_that);case WaterMeterCatOneStepUnconfigured():
return unconfigured(_that);case WaterMeterCatOneStepConfigured():
return configured(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WaterMeterCatOneStepUnavailable value)?  unavailable,TResult? Function( WaterMeterCatOneStepUnconfigured value)?  unconfigured,TResult? Function( WaterMeterCatOneStepConfigured value)?  configured,}){
final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that);case WaterMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured(_that);case WaterMeterCatOneStepConfigured() when configured != null:
return configured(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppException error)?  unavailable,TResult Function()?  unconfigured,TResult Function( MeterCatOneInfoEntity info)?  configured,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that.error);case WaterMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured();case WaterMeterCatOneStepConfigured() when configured != null:
return configured(_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppException error)  unavailable,required TResult Function()  unconfigured,required TResult Function( MeterCatOneInfoEntity info)  configured,}) {final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable():
return unavailable(_that.error);case WaterMeterCatOneStepUnconfigured():
return unconfigured();case WaterMeterCatOneStepConfigured():
return configured(_that.info);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppException error)?  unavailable,TResult? Function()?  unconfigured,TResult? Function( MeterCatOneInfoEntity info)?  configured,}) {final _that = this;
switch (_that) {
case WaterMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that.error);case WaterMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured();case WaterMeterCatOneStepConfigured() when configured != null:
return configured(_that.info);case _:
  return null;

}
}

}

/// @nodoc


class WaterMeterCatOneStepUnavailable implements WaterMeterCatOneStep {
  const WaterMeterCatOneStepUnavailable({required this.error});
  

 final  AppException error;

/// Create a copy of WaterMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterCatOneStepUnavailableCopyWith<WaterMeterCatOneStepUnavailable> get copyWith => _$WaterMeterCatOneStepUnavailableCopyWithImpl<WaterMeterCatOneStepUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneStepUnavailable&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'WaterMeterCatOneStep.unavailable(error: $error)';
}


}

/// @nodoc
abstract mixin class $WaterMeterCatOneStepUnavailableCopyWith<$Res> implements $WaterMeterCatOneStepCopyWith<$Res> {
  factory $WaterMeterCatOneStepUnavailableCopyWith(WaterMeterCatOneStepUnavailable value, $Res Function(WaterMeterCatOneStepUnavailable) _then) = _$WaterMeterCatOneStepUnavailableCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$WaterMeterCatOneStepUnavailableCopyWithImpl<$Res>
    implements $WaterMeterCatOneStepUnavailableCopyWith<$Res> {
  _$WaterMeterCatOneStepUnavailableCopyWithImpl(this._self, this._then);

  final WaterMeterCatOneStepUnavailable _self;
  final $Res Function(WaterMeterCatOneStepUnavailable) _then;

/// Create a copy of WaterMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(WaterMeterCatOneStepUnavailable(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of WaterMeterCatOneStep
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


class WaterMeterCatOneStepUnconfigured implements WaterMeterCatOneStep {
  const WaterMeterCatOneStepUnconfigured();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneStepUnconfigured);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WaterMeterCatOneStep.unconfigured()';
}


}




/// @nodoc


class WaterMeterCatOneStepConfigured implements WaterMeterCatOneStep {
  const WaterMeterCatOneStepConfigured({required this.info});
  

 final  MeterCatOneInfoEntity info;

/// Create a copy of WaterMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterCatOneStepConfiguredCopyWith<WaterMeterCatOneStepConfigured> get copyWith => _$WaterMeterCatOneStepConfiguredCopyWithImpl<WaterMeterCatOneStepConfigured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneStepConfigured&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'WaterMeterCatOneStep.configured(info: $info)';
}


}

/// @nodoc
abstract mixin class $WaterMeterCatOneStepConfiguredCopyWith<$Res> implements $WaterMeterCatOneStepCopyWith<$Res> {
  factory $WaterMeterCatOneStepConfiguredCopyWith(WaterMeterCatOneStepConfigured value, $Res Function(WaterMeterCatOneStepConfigured) _then) = _$WaterMeterCatOneStepConfiguredCopyWithImpl;
@useResult
$Res call({
 MeterCatOneInfoEntity info
});


$MeterCatOneInfoEntityCopyWith<$Res> get info;

}
/// @nodoc
class _$WaterMeterCatOneStepConfiguredCopyWithImpl<$Res>
    implements $WaterMeterCatOneStepConfiguredCopyWith<$Res> {
  _$WaterMeterCatOneStepConfiguredCopyWithImpl(this._self, this._then);

  final WaterMeterCatOneStepConfigured _self;
  final $Res Function(WaterMeterCatOneStepConfigured) _then;

/// Create a copy of WaterMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(WaterMeterCatOneStepConfigured(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as MeterCatOneInfoEntity,
  ));
}

/// Create a copy of WaterMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeterCatOneInfoEntityCopyWith<$Res> get info {
  
  return $MeterCatOneInfoEntityCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc
mixin _$WaterMeterCatOneState {

 WaterMeterCatOneStep get step;/// 是否为海外站点 —— 决定「配置服务器」前是否先弹 APN sheet。
 bool get needsApn; bool get configuring; AppException? get error;
/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterCatOneStateCopyWith<WaterMeterCatOneState> get copyWith => _$WaterMeterCatOneStateCopyWithImpl<WaterMeterCatOneState>(this as WaterMeterCatOneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneState&&(identical(other.step, step) || other.step == step)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn)&&(identical(other.configuring, configuring) || other.configuring == configuring)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,needsApn,configuring,error);

@override
String toString() {
  return 'WaterMeterCatOneState(step: $step, needsApn: $needsApn, configuring: $configuring, error: $error)';
}


}

/// @nodoc
abstract mixin class $WaterMeterCatOneStateCopyWith<$Res>  {
  factory $WaterMeterCatOneStateCopyWith(WaterMeterCatOneState value, $Res Function(WaterMeterCatOneState) _then) = _$WaterMeterCatOneStateCopyWithImpl;
@useResult
$Res call({
 WaterMeterCatOneStep step, bool needsApn, bool configuring, AppException? error
});


$WaterMeterCatOneStepCopyWith<$Res> get step;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$WaterMeterCatOneStateCopyWithImpl<$Res>
    implements $WaterMeterCatOneStateCopyWith<$Res> {
  _$WaterMeterCatOneStateCopyWithImpl(this._self, this._then);

  final WaterMeterCatOneState _self;
  final $Res Function(WaterMeterCatOneState) _then;

/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? needsApn = null,Object? configuring = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as WaterMeterCatOneStep,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,configuring: null == configuring ? _self.configuring : configuring // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterCatOneStepCopyWith<$Res> get step {
  
  return $WaterMeterCatOneStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [WaterMeterCatOneState].
extension WaterMeterCatOneStatePatterns on WaterMeterCatOneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterCatOneState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterCatOneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterCatOneState value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterCatOneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterCatOneState value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterCatOneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaterMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterCatOneState() when $default != null:
return $default(_that.step,_that.needsApn,_that.configuring,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaterMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterCatOneState():
return $default(_that.step,_that.needsApn,_that.configuring,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaterMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterCatOneState() when $default != null:
return $default(_that.step,_that.needsApn,_that.configuring,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterCatOneState extends WaterMeterCatOneState {
  const _WaterMeterCatOneState({required this.step, this.needsApn = false, this.configuring = false, this.error}): super._();
  

@override final  WaterMeterCatOneStep step;
/// 是否为海外站点 —— 决定「配置服务器」前是否先弹 APN sheet。
@override@JsonKey() final  bool needsApn;
@override@JsonKey() final  bool configuring;
@override final  AppException? error;

/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterCatOneStateCopyWith<_WaterMeterCatOneState> get copyWith => __$WaterMeterCatOneStateCopyWithImpl<_WaterMeterCatOneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterCatOneState&&(identical(other.step, step) || other.step == step)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn)&&(identical(other.configuring, configuring) || other.configuring == configuring)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,needsApn,configuring,error);

@override
String toString() {
  return 'WaterMeterCatOneState(step: $step, needsApn: $needsApn, configuring: $configuring, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterCatOneStateCopyWith<$Res> implements $WaterMeterCatOneStateCopyWith<$Res> {
  factory _$WaterMeterCatOneStateCopyWith(_WaterMeterCatOneState value, $Res Function(_WaterMeterCatOneState) _then) = __$WaterMeterCatOneStateCopyWithImpl;
@override @useResult
$Res call({
 WaterMeterCatOneStep step, bool needsApn, bool configuring, AppException? error
});


@override $WaterMeterCatOneStepCopyWith<$Res> get step;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$WaterMeterCatOneStateCopyWithImpl<$Res>
    implements _$WaterMeterCatOneStateCopyWith<$Res> {
  __$WaterMeterCatOneStateCopyWithImpl(this._self, this._then);

  final _WaterMeterCatOneState _self;
  final $Res Function(_WaterMeterCatOneState) _then;

/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? needsApn = null,Object? configuring = null,Object? error = freezed,}) {
  return _then(_WaterMeterCatOneState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as WaterMeterCatOneStep,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,configuring: null == configuring ? _self.configuring : configuring // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterCatOneStepCopyWith<$Res> get step {
  
  return $WaterMeterCatOneStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}/// Create a copy of WaterMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
