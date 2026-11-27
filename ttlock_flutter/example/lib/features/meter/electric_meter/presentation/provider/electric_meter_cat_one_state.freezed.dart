// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_cat_one_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterCatOneStep {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneStep);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ElectricMeterCatOneStep()';
}


}

/// @nodoc
class $ElectricMeterCatOneStepCopyWith<$Res>  {
$ElectricMeterCatOneStepCopyWith(ElectricMeterCatOneStep _, $Res Function(ElectricMeterCatOneStep) __);
}


/// Adds pattern-matching-related methods to [ElectricMeterCatOneStep].
extension ElectricMeterCatOneStepPatterns on ElectricMeterCatOneStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ElectricMeterCatOneStepUnavailable value)?  unavailable,TResult Function( ElectricMeterCatOneStepUnconfigured value)?  unconfigured,TResult Function( ElectricMeterCatOneStepConfigured value)?  configured,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ElectricMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that);case ElectricMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured(_that);case ElectricMeterCatOneStepConfigured() when configured != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ElectricMeterCatOneStepUnavailable value)  unavailable,required TResult Function( ElectricMeterCatOneStepUnconfigured value)  unconfigured,required TResult Function( ElectricMeterCatOneStepConfigured value)  configured,}){
final _that = this;
switch (_that) {
case ElectricMeterCatOneStepUnavailable():
return unavailable(_that);case ElectricMeterCatOneStepUnconfigured():
return unconfigured(_that);case ElectricMeterCatOneStepConfigured():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ElectricMeterCatOneStepUnavailable value)?  unavailable,TResult? Function( ElectricMeterCatOneStepUnconfigured value)?  unconfigured,TResult? Function( ElectricMeterCatOneStepConfigured value)?  configured,}){
final _that = this;
switch (_that) {
case ElectricMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that);case ElectricMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured(_that);case ElectricMeterCatOneStepConfigured() when configured != null:
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
case ElectricMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that.error);case ElectricMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured();case ElectricMeterCatOneStepConfigured() when configured != null:
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
case ElectricMeterCatOneStepUnavailable():
return unavailable(_that.error);case ElectricMeterCatOneStepUnconfigured():
return unconfigured();case ElectricMeterCatOneStepConfigured():
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
case ElectricMeterCatOneStepUnavailable() when unavailable != null:
return unavailable(_that.error);case ElectricMeterCatOneStepUnconfigured() when unconfigured != null:
return unconfigured();case ElectricMeterCatOneStepConfigured() when configured != null:
return configured(_that.info);case _:
  return null;

}
}

}

/// @nodoc


class ElectricMeterCatOneStepUnavailable implements ElectricMeterCatOneStep {
  const ElectricMeterCatOneStepUnavailable({required this.error});
  

 final  AppException error;

/// Create a copy of ElectricMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterCatOneStepUnavailableCopyWith<ElectricMeterCatOneStepUnavailable> get copyWith => _$ElectricMeterCatOneStepUnavailableCopyWithImpl<ElectricMeterCatOneStepUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneStepUnavailable&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ElectricMeterCatOneStep.unavailable(error: $error)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterCatOneStepUnavailableCopyWith<$Res> implements $ElectricMeterCatOneStepCopyWith<$Res> {
  factory $ElectricMeterCatOneStepUnavailableCopyWith(ElectricMeterCatOneStepUnavailable value, $Res Function(ElectricMeterCatOneStepUnavailable) _then) = _$ElectricMeterCatOneStepUnavailableCopyWithImpl;
@useResult
$Res call({
 AppException error
});


$AppExceptionCopyWith<$Res> get error;

}
/// @nodoc
class _$ElectricMeterCatOneStepUnavailableCopyWithImpl<$Res>
    implements $ElectricMeterCatOneStepUnavailableCopyWith<$Res> {
  _$ElectricMeterCatOneStepUnavailableCopyWithImpl(this._self, this._then);

  final ElectricMeterCatOneStepUnavailable _self;
  final $Res Function(ElectricMeterCatOneStepUnavailable) _then;

/// Create a copy of ElectricMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ElectricMeterCatOneStepUnavailable(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of ElectricMeterCatOneStep
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


class ElectricMeterCatOneStepUnconfigured implements ElectricMeterCatOneStep {
  const ElectricMeterCatOneStepUnconfigured();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneStepUnconfigured);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ElectricMeterCatOneStep.unconfigured()';
}


}




/// @nodoc


class ElectricMeterCatOneStepConfigured implements ElectricMeterCatOneStep {
  const ElectricMeterCatOneStepConfigured({required this.info});
  

 final  MeterCatOneInfoEntity info;

/// Create a copy of ElectricMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterCatOneStepConfiguredCopyWith<ElectricMeterCatOneStepConfigured> get copyWith => _$ElectricMeterCatOneStepConfiguredCopyWithImpl<ElectricMeterCatOneStepConfigured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneStepConfigured&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'ElectricMeterCatOneStep.configured(info: $info)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterCatOneStepConfiguredCopyWith<$Res> implements $ElectricMeterCatOneStepCopyWith<$Res> {
  factory $ElectricMeterCatOneStepConfiguredCopyWith(ElectricMeterCatOneStepConfigured value, $Res Function(ElectricMeterCatOneStepConfigured) _then) = _$ElectricMeterCatOneStepConfiguredCopyWithImpl;
@useResult
$Res call({
 MeterCatOneInfoEntity info
});


$MeterCatOneInfoEntityCopyWith<$Res> get info;

}
/// @nodoc
class _$ElectricMeterCatOneStepConfiguredCopyWithImpl<$Res>
    implements $ElectricMeterCatOneStepConfiguredCopyWith<$Res> {
  _$ElectricMeterCatOneStepConfiguredCopyWithImpl(this._self, this._then);

  final ElectricMeterCatOneStepConfigured _self;
  final $Res Function(ElectricMeterCatOneStepConfigured) _then;

/// Create a copy of ElectricMeterCatOneStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(ElectricMeterCatOneStepConfigured(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as MeterCatOneInfoEntity,
  ));
}

/// Create a copy of ElectricMeterCatOneStep
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
mixin _$ElectricMeterCatOneState {

 ElectricMeterCatOneStep get step;/// 是否为海外站点 —— 决定「配置服务器」前是否先弹 APN sheet。
 bool get needsApn; bool get configuring; AppException? get error;
/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterCatOneStateCopyWith<ElectricMeterCatOneState> get copyWith => _$ElectricMeterCatOneStateCopyWithImpl<ElectricMeterCatOneState>(this as ElectricMeterCatOneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneState&&(identical(other.step, step) || other.step == step)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn)&&(identical(other.configuring, configuring) || other.configuring == configuring)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,needsApn,configuring,error);

@override
String toString() {
  return 'ElectricMeterCatOneState(step: $step, needsApn: $needsApn, configuring: $configuring, error: $error)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterCatOneStateCopyWith<$Res>  {
  factory $ElectricMeterCatOneStateCopyWith(ElectricMeterCatOneState value, $Res Function(ElectricMeterCatOneState) _then) = _$ElectricMeterCatOneStateCopyWithImpl;
@useResult
$Res call({
 ElectricMeterCatOneStep step, bool needsApn, bool configuring, AppException? error
});


$ElectricMeterCatOneStepCopyWith<$Res> get step;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$ElectricMeterCatOneStateCopyWithImpl<$Res>
    implements $ElectricMeterCatOneStateCopyWith<$Res> {
  _$ElectricMeterCatOneStateCopyWithImpl(this._self, this._then);

  final ElectricMeterCatOneState _self;
  final $Res Function(ElectricMeterCatOneState) _then;

/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? needsApn = null,Object? configuring = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ElectricMeterCatOneStep,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,configuring: null == configuring ? _self.configuring : configuring // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterCatOneStepCopyWith<$Res> get step {
  
  return $ElectricMeterCatOneStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}/// Create a copy of ElectricMeterCatOneState
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


/// Adds pattern-matching-related methods to [ElectricMeterCatOneState].
extension ElectricMeterCatOneStatePatterns on ElectricMeterCatOneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterCatOneState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterCatOneState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterCatOneState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ElectricMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterCatOneState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ElectricMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterCatOneState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ElectricMeterCatOneStep step,  bool needsApn,  bool configuring,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterCatOneState() when $default != null:
return $default(_that.step,_that.needsApn,_that.configuring,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterCatOneState extends ElectricMeterCatOneState {
  const _ElectricMeterCatOneState({required this.step, this.needsApn = false, this.configuring = false, this.error}): super._();
  

@override final  ElectricMeterCatOneStep step;
/// 是否为海外站点 —— 决定「配置服务器」前是否先弹 APN sheet。
@override@JsonKey() final  bool needsApn;
@override@JsonKey() final  bool configuring;
@override final  AppException? error;

/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterCatOneStateCopyWith<_ElectricMeterCatOneState> get copyWith => __$ElectricMeterCatOneStateCopyWithImpl<_ElectricMeterCatOneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterCatOneState&&(identical(other.step, step) || other.step == step)&&(identical(other.needsApn, needsApn) || other.needsApn == needsApn)&&(identical(other.configuring, configuring) || other.configuring == configuring)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,step,needsApn,configuring,error);

@override
String toString() {
  return 'ElectricMeterCatOneState(step: $step, needsApn: $needsApn, configuring: $configuring, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterCatOneStateCopyWith<$Res> implements $ElectricMeterCatOneStateCopyWith<$Res> {
  factory _$ElectricMeterCatOneStateCopyWith(_ElectricMeterCatOneState value, $Res Function(_ElectricMeterCatOneState) _then) = __$ElectricMeterCatOneStateCopyWithImpl;
@override @useResult
$Res call({
 ElectricMeterCatOneStep step, bool needsApn, bool configuring, AppException? error
});


@override $ElectricMeterCatOneStepCopyWith<$Res> get step;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$ElectricMeterCatOneStateCopyWithImpl<$Res>
    implements _$ElectricMeterCatOneStateCopyWith<$Res> {
  __$ElectricMeterCatOneStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterCatOneState _self;
  final $Res Function(_ElectricMeterCatOneState) _then;

/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? needsApn = null,Object? configuring = null,Object? error = freezed,}) {
  return _then(_ElectricMeterCatOneState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ElectricMeterCatOneStep,needsApn: null == needsApn ? _self.needsApn : needsApn // ignore: cast_nullable_to_non_nullable
as bool,configuring: null == configuring ? _self.configuring : configuring // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of ElectricMeterCatOneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterCatOneStepCopyWith<$Res> get step {
  
  return $ElectricMeterCatOneStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}/// Create a copy of ElectricMeterCatOneState
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
