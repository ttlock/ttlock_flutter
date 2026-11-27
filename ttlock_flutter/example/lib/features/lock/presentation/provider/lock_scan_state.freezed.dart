// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockScanState {

 bool get scanning; List<TTLockScanModel> get locks; TTLockScanModel? get adding; LockEntity? get added; AppException? get error;
/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockScanStateCopyWith<LockScanState> get copyWith => _$LockScanStateCopyWithImpl<LockScanState>(this as LockScanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockScanState&&(identical(other.scanning, scanning) || other.scanning == scanning)&&const DeepCollectionEquality().equals(other.locks, locks)&&(identical(other.adding, adding) || other.adding == adding)&&(identical(other.added, added) || other.added == added)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,scanning,const DeepCollectionEquality().hash(locks),adding,added,error);

@override
String toString() {
  return 'LockScanState(scanning: $scanning, locks: $locks, adding: $adding, added: $added, error: $error)';
}


}

/// @nodoc
abstract mixin class $LockScanStateCopyWith<$Res>  {
  factory $LockScanStateCopyWith(LockScanState value, $Res Function(LockScanState) _then) = _$LockScanStateCopyWithImpl;
@useResult
$Res call({
 bool scanning, List<TTLockScanModel> locks, TTLockScanModel? adding, LockEntity? added, AppException? error
});


$LockEntityCopyWith<$Res>? get added;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$LockScanStateCopyWithImpl<$Res>
    implements $LockScanStateCopyWith<$Res> {
  _$LockScanStateCopyWithImpl(this._self, this._then);

  final LockScanState _self;
  final $Res Function(LockScanState) _then;

/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanning = null,Object? locks = null,Object? adding = freezed,Object? added = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
scanning: null == scanning ? _self.scanning : scanning // ignore: cast_nullable_to_non_nullable
as bool,locks: null == locks ? _self.locks : locks // ignore: cast_nullable_to_non_nullable
as List<TTLockScanModel>,adding: freezed == adding ? _self.adding : adding // ignore: cast_nullable_to_non_nullable
as TTLockScanModel?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as LockEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res>? get added {
    if (_self.added == null) {
    return null;
  }

  return $LockEntityCopyWith<$Res>(_self.added!, (value) {
    return _then(_self.copyWith(added: value));
  });
}/// Create a copy of LockScanState
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


/// Adds pattern-matching-related methods to [LockScanState].
extension LockScanStatePatterns on LockScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockScanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockScanState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockScanState value)  $default,){
final _that = this;
switch (_that) {
case _LockScanState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockScanState value)?  $default,){
final _that = this;
switch (_that) {
case _LockScanState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool scanning,  List<TTLockScanModel> locks,  TTLockScanModel? adding,  LockEntity? added,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockScanState() when $default != null:
return $default(_that.scanning,_that.locks,_that.adding,_that.added,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool scanning,  List<TTLockScanModel> locks,  TTLockScanModel? adding,  LockEntity? added,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _LockScanState():
return $default(_that.scanning,_that.locks,_that.adding,_that.added,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool scanning,  List<TTLockScanModel> locks,  TTLockScanModel? adding,  LockEntity? added,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _LockScanState() when $default != null:
return $default(_that.scanning,_that.locks,_that.adding,_that.added,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _LockScanState extends LockScanState {
  const _LockScanState({this.scanning = false, final  List<TTLockScanModel> locks = const [], this.adding, this.added, this.error}): _locks = locks,super._();
  

@override@JsonKey() final  bool scanning;
 final  List<TTLockScanModel> _locks;
@override@JsonKey() List<TTLockScanModel> get locks {
  if (_locks is EqualUnmodifiableListView) return _locks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locks);
}

@override final  TTLockScanModel? adding;
@override final  LockEntity? added;
@override final  AppException? error;

/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockScanStateCopyWith<_LockScanState> get copyWith => __$LockScanStateCopyWithImpl<_LockScanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockScanState&&(identical(other.scanning, scanning) || other.scanning == scanning)&&const DeepCollectionEquality().equals(other._locks, _locks)&&(identical(other.adding, adding) || other.adding == adding)&&(identical(other.added, added) || other.added == added)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,scanning,const DeepCollectionEquality().hash(_locks),adding,added,error);

@override
String toString() {
  return 'LockScanState(scanning: $scanning, locks: $locks, adding: $adding, added: $added, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LockScanStateCopyWith<$Res> implements $LockScanStateCopyWith<$Res> {
  factory _$LockScanStateCopyWith(_LockScanState value, $Res Function(_LockScanState) _then) = __$LockScanStateCopyWithImpl;
@override @useResult
$Res call({
 bool scanning, List<TTLockScanModel> locks, TTLockScanModel? adding, LockEntity? added, AppException? error
});


@override $LockEntityCopyWith<$Res>? get added;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$LockScanStateCopyWithImpl<$Res>
    implements _$LockScanStateCopyWith<$Res> {
  __$LockScanStateCopyWithImpl(this._self, this._then);

  final _LockScanState _self;
  final $Res Function(_LockScanState) _then;

/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanning = null,Object? locks = null,Object? adding = freezed,Object? added = freezed,Object? error = freezed,}) {
  return _then(_LockScanState(
scanning: null == scanning ? _self.scanning : scanning // ignore: cast_nullable_to_non_nullable
as bool,locks: null == locks ? _self._locks : locks // ignore: cast_nullable_to_non_nullable
as List<TTLockScanModel>,adding: freezed == adding ? _self.adding : adding // ignore: cast_nullable_to_non_nullable
as TTLockScanModel?,added: freezed == added ? _self.added : added // ignore: cast_nullable_to_non_nullable
as LockEntity?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of LockScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res>? get added {
    if (_self.added == null) {
    return null;
  }

  return $LockEntityCopyWith<$Res>(_self.added!, (value) {
    return _then(_self.copyWith(added: value));
  });
}/// Create a copy of LockScanState
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
