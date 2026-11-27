// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_records_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockRecordsState {

 PageState<LockRecordEntity> get pageState; int? get recordTypeFilter;
/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockRecordsStateCopyWith<LockRecordsState> get copyWith => _$LockRecordsStateCopyWithImpl<LockRecordsState>(this as LockRecordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.recordTypeFilter, recordTypeFilter) || other.recordTypeFilter == recordTypeFilter));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,recordTypeFilter);

@override
String toString() {
  return 'LockRecordsState(pageState: $pageState, recordTypeFilter: $recordTypeFilter)';
}


}

/// @nodoc
abstract mixin class $LockRecordsStateCopyWith<$Res>  {
  factory $LockRecordsStateCopyWith(LockRecordsState value, $Res Function(LockRecordsState) _then) = _$LockRecordsStateCopyWithImpl;
@useResult
$Res call({
 PageState<LockRecordEntity> pageState, int? recordTypeFilter
});


$PageStateCopyWith<LockRecordEntity, $Res> get pageState;

}
/// @nodoc
class _$LockRecordsStateCopyWithImpl<$Res>
    implements $LockRecordsStateCopyWith<$Res> {
  _$LockRecordsStateCopyWithImpl(this._self, this._then);

  final LockRecordsState _self;
  final $Res Function(LockRecordsState) _then;

/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? recordTypeFilter = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<LockRecordEntity>,recordTypeFilter: freezed == recordTypeFilter ? _self.recordTypeFilter : recordTypeFilter // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<LockRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<LockRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockRecordsState].
extension LockRecordsStatePatterns on LockRecordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockRecordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockRecordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockRecordsState value)  $default,){
final _that = this;
switch (_that) {
case _LockRecordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockRecordsState value)?  $default,){
final _that = this;
switch (_that) {
case _LockRecordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<LockRecordEntity> pageState,  int? recordTypeFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockRecordsState() when $default != null:
return $default(_that.pageState,_that.recordTypeFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<LockRecordEntity> pageState,  int? recordTypeFilter)  $default,) {final _that = this;
switch (_that) {
case _LockRecordsState():
return $default(_that.pageState,_that.recordTypeFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<LockRecordEntity> pageState,  int? recordTypeFilter)?  $default,) {final _that = this;
switch (_that) {
case _LockRecordsState() when $default != null:
return $default(_that.pageState,_that.recordTypeFilter);case _:
  return null;

}
}

}

/// @nodoc


class _LockRecordsState extends LockRecordsState {
  const _LockRecordsState({this.pageState = const PageState<LockRecordEntity>(), this.recordTypeFilter}): super._();
  

@override@JsonKey() final  PageState<LockRecordEntity> pageState;
@override final  int? recordTypeFilter;

/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockRecordsStateCopyWith<_LockRecordsState> get copyWith => __$LockRecordsStateCopyWithImpl<_LockRecordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.recordTypeFilter, recordTypeFilter) || other.recordTypeFilter == recordTypeFilter));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,recordTypeFilter);

@override
String toString() {
  return 'LockRecordsState(pageState: $pageState, recordTypeFilter: $recordTypeFilter)';
}


}

/// @nodoc
abstract mixin class _$LockRecordsStateCopyWith<$Res> implements $LockRecordsStateCopyWith<$Res> {
  factory _$LockRecordsStateCopyWith(_LockRecordsState value, $Res Function(_LockRecordsState) _then) = __$LockRecordsStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<LockRecordEntity> pageState, int? recordTypeFilter
});


@override $PageStateCopyWith<LockRecordEntity, $Res> get pageState;

}
/// @nodoc
class __$LockRecordsStateCopyWithImpl<$Res>
    implements _$LockRecordsStateCopyWith<$Res> {
  __$LockRecordsStateCopyWithImpl(this._self, this._then);

  final _LockRecordsState _self;
  final $Res Function(_LockRecordsState) _then;

/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? recordTypeFilter = freezed,}) {
  return _then(_LockRecordsState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<LockRecordEntity>,recordTypeFilter: freezed == recordTypeFilter ? _self.recordTypeFilter : recordTypeFilter // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of LockRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<LockRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<LockRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
