// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_operation_records_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterOperationRecordsState {

 PageState<MeterOperationRecordEntity> get pageState;/// null ⇒ 「全部」（请求侧不传 `recordType`）。
 MeterOperationRecordFilter? get filter;
/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterOperationRecordsStateCopyWith<ElectricMeterOperationRecordsState> get copyWith => _$ElectricMeterOperationRecordsStateCopyWithImpl<ElectricMeterOperationRecordsState>(this as ElectricMeterOperationRecordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterOperationRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,filter);

@override
String toString() {
  return 'ElectricMeterOperationRecordsState(pageState: $pageState, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterOperationRecordsStateCopyWith<$Res>  {
  factory $ElectricMeterOperationRecordsStateCopyWith(ElectricMeterOperationRecordsState value, $Res Function(ElectricMeterOperationRecordsState) _then) = _$ElectricMeterOperationRecordsStateCopyWithImpl;
@useResult
$Res call({
 PageState<MeterOperationRecordEntity> pageState, MeterOperationRecordFilter? filter
});


$PageStateCopyWith<MeterOperationRecordEntity, $Res> get pageState;

}
/// @nodoc
class _$ElectricMeterOperationRecordsStateCopyWithImpl<$Res>
    implements $ElectricMeterOperationRecordsStateCopyWith<$Res> {
  _$ElectricMeterOperationRecordsStateCopyWithImpl(this._self, this._then);

  final ElectricMeterOperationRecordsState _self;
  final $Res Function(ElectricMeterOperationRecordsState) _then;

/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? filter = freezed,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<MeterOperationRecordEntity>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MeterOperationRecordFilter?,
  ));
}
/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<MeterOperationRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<MeterOperationRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ElectricMeterOperationRecordsState].
extension ElectricMeterOperationRecordsStatePatterns on ElectricMeterOperationRecordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterOperationRecordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterOperationRecordsState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterOperationRecordsState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<MeterOperationRecordEntity> pageState,  MeterOperationRecordFilter? filter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState() when $default != null:
return $default(_that.pageState,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<MeterOperationRecordEntity> pageState,  MeterOperationRecordFilter? filter)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState():
return $default(_that.pageState,_that.filter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<MeterOperationRecordEntity> pageState,  MeterOperationRecordFilter? filter)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordsState() when $default != null:
return $default(_that.pageState,_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterOperationRecordsState implements ElectricMeterOperationRecordsState {
  const _ElectricMeterOperationRecordsState({this.pageState = const PageState<MeterOperationRecordEntity>(), this.filter});
  

@override@JsonKey() final  PageState<MeterOperationRecordEntity> pageState;
/// null ⇒ 「全部」（请求侧不传 `recordType`）。
@override final  MeterOperationRecordFilter? filter;

/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterOperationRecordsStateCopyWith<_ElectricMeterOperationRecordsState> get copyWith => __$ElectricMeterOperationRecordsStateCopyWithImpl<_ElectricMeterOperationRecordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterOperationRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,filter);

@override
String toString() {
  return 'ElectricMeterOperationRecordsState(pageState: $pageState, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterOperationRecordsStateCopyWith<$Res> implements $ElectricMeterOperationRecordsStateCopyWith<$Res> {
  factory _$ElectricMeterOperationRecordsStateCopyWith(_ElectricMeterOperationRecordsState value, $Res Function(_ElectricMeterOperationRecordsState) _then) = __$ElectricMeterOperationRecordsStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<MeterOperationRecordEntity> pageState, MeterOperationRecordFilter? filter
});


@override $PageStateCopyWith<MeterOperationRecordEntity, $Res> get pageState;

}
/// @nodoc
class __$ElectricMeterOperationRecordsStateCopyWithImpl<$Res>
    implements _$ElectricMeterOperationRecordsStateCopyWith<$Res> {
  __$ElectricMeterOperationRecordsStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterOperationRecordsState _self;
  final $Res Function(_ElectricMeterOperationRecordsState) _then;

/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? filter = freezed,}) {
  return _then(_ElectricMeterOperationRecordsState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<MeterOperationRecordEntity>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MeterOperationRecordFilter?,
  ));
}

/// Create a copy of ElectricMeterOperationRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<MeterOperationRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<MeterOperationRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
