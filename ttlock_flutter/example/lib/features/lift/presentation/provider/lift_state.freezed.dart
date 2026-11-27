// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lift_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiftState {

 Set<int> get selectedFloors; bool get operating; AppException? get error; LiftActivateOutcome? get outcome; LiftConfigOutcome? get configOutcome;
/// Create a copy of LiftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiftStateCopyWith<LiftState> get copyWith => _$LiftStateCopyWithImpl<LiftState>(this as LiftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiftState&&const DeepCollectionEquality().equals(other.selectedFloors, selectedFloors)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.configOutcome, configOutcome) || other.configOutcome == configOutcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedFloors),operating,error,outcome,configOutcome);

@override
String toString() {
  return 'LiftState(selectedFloors: $selectedFloors, operating: $operating, error: $error, outcome: $outcome, configOutcome: $configOutcome)';
}


}

/// @nodoc
abstract mixin class $LiftStateCopyWith<$Res>  {
  factory $LiftStateCopyWith(LiftState value, $Res Function(LiftState) _then) = _$LiftStateCopyWithImpl;
@useResult
$Res call({
 Set<int> selectedFloors, bool operating, AppException? error, LiftActivateOutcome? outcome, LiftConfigOutcome? configOutcome
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$LiftStateCopyWithImpl<$Res>
    implements $LiftStateCopyWith<$Res> {
  _$LiftStateCopyWithImpl(this._self, this._then);

  final LiftState _self;
  final $Res Function(LiftState) _then;

/// Create a copy of LiftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedFloors = null,Object? operating = null,Object? error = freezed,Object? outcome = freezed,Object? configOutcome = freezed,}) {
  return _then(_self.copyWith(
selectedFloors: null == selectedFloors ? _self.selectedFloors : selectedFloors // ignore: cast_nullable_to_non_nullable
as Set<int>,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as LiftActivateOutcome?,configOutcome: freezed == configOutcome ? _self.configOutcome : configOutcome // ignore: cast_nullable_to_non_nullable
as LiftConfigOutcome?,
  ));
}
/// Create a copy of LiftState
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


/// Adds pattern-matching-related methods to [LiftState].
extension LiftStatePatterns on LiftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiftState value)  $default,){
final _that = this;
switch (_that) {
case _LiftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiftState value)?  $default,){
final _that = this;
switch (_that) {
case _LiftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<int> selectedFloors,  bool operating,  AppException? error,  LiftActivateOutcome? outcome,  LiftConfigOutcome? configOutcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiftState() when $default != null:
return $default(_that.selectedFloors,_that.operating,_that.error,_that.outcome,_that.configOutcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<int> selectedFloors,  bool operating,  AppException? error,  LiftActivateOutcome? outcome,  LiftConfigOutcome? configOutcome)  $default,) {final _that = this;
switch (_that) {
case _LiftState():
return $default(_that.selectedFloors,_that.operating,_that.error,_that.outcome,_that.configOutcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<int> selectedFloors,  bool operating,  AppException? error,  LiftActivateOutcome? outcome,  LiftConfigOutcome? configOutcome)?  $default,) {final _that = this;
switch (_that) {
case _LiftState() when $default != null:
return $default(_that.selectedFloors,_that.operating,_that.error,_that.outcome,_that.configOutcome);case _:
  return null;

}
}

}

/// @nodoc


class _LiftState extends LiftState {
  const _LiftState({final  Set<int> selectedFloors = const <int>{}, this.operating = false, this.error, this.outcome, this.configOutcome}): _selectedFloors = selectedFloors,super._();
  

 final  Set<int> _selectedFloors;
@override@JsonKey() Set<int> get selectedFloors {
  if (_selectedFloors is EqualUnmodifiableSetView) return _selectedFloors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFloors);
}

@override@JsonKey() final  bool operating;
@override final  AppException? error;
@override final  LiftActivateOutcome? outcome;
@override final  LiftConfigOutcome? configOutcome;

/// Create a copy of LiftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiftStateCopyWith<_LiftState> get copyWith => __$LiftStateCopyWithImpl<_LiftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiftState&&const DeepCollectionEquality().equals(other._selectedFloors, _selectedFloors)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.configOutcome, configOutcome) || other.configOutcome == configOutcome));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedFloors),operating,error,outcome,configOutcome);

@override
String toString() {
  return 'LiftState(selectedFloors: $selectedFloors, operating: $operating, error: $error, outcome: $outcome, configOutcome: $configOutcome)';
}


}

/// @nodoc
abstract mixin class _$LiftStateCopyWith<$Res> implements $LiftStateCopyWith<$Res> {
  factory _$LiftStateCopyWith(_LiftState value, $Res Function(_LiftState) _then) = __$LiftStateCopyWithImpl;
@override @useResult
$Res call({
 Set<int> selectedFloors, bool operating, AppException? error, LiftActivateOutcome? outcome, LiftConfigOutcome? configOutcome
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$LiftStateCopyWithImpl<$Res>
    implements _$LiftStateCopyWith<$Res> {
  __$LiftStateCopyWithImpl(this._self, this._then);

  final _LiftState _self;
  final $Res Function(_LiftState) _then;

/// Create a copy of LiftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedFloors = null,Object? operating = null,Object? error = freezed,Object? outcome = freezed,Object? configOutcome = freezed,}) {
  return _then(_LiftState(
selectedFloors: null == selectedFloors ? _self._selectedFloors : selectedFloors // ignore: cast_nullable_to_non_nullable
as Set<int>,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as LiftActivateOutcome?,configOutcome: freezed == configOutcome ? _self.configOutcome : configOutcome // ignore: cast_nullable_to_non_nullable
as LiftConfigOutcome?,
  ));
}

/// Create a copy of LiftState
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
