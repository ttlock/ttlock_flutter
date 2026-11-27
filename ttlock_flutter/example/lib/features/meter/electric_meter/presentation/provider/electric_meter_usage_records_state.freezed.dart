// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_usage_records_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterUsageRecordsState {

 List<ElectricMeterUsageRecordEntity> get records; MeterDateType get dateType;
/// Create a copy of ElectricMeterUsageRecordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterUsageRecordsStateCopyWith<ElectricMeterUsageRecordsState> get copyWith => _$ElectricMeterUsageRecordsStateCopyWithImpl<ElectricMeterUsageRecordsState>(this as ElectricMeterUsageRecordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterUsageRecordsState&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.dateType, dateType) || other.dateType == dateType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records),dateType);

@override
String toString() {
  return 'ElectricMeterUsageRecordsState(records: $records, dateType: $dateType)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterUsageRecordsStateCopyWith<$Res>  {
  factory $ElectricMeterUsageRecordsStateCopyWith(ElectricMeterUsageRecordsState value, $Res Function(ElectricMeterUsageRecordsState) _then) = _$ElectricMeterUsageRecordsStateCopyWithImpl;
@useResult
$Res call({
 List<ElectricMeterUsageRecordEntity> records, MeterDateType dateType
});




}
/// @nodoc
class _$ElectricMeterUsageRecordsStateCopyWithImpl<$Res>
    implements $ElectricMeterUsageRecordsStateCopyWith<$Res> {
  _$ElectricMeterUsageRecordsStateCopyWithImpl(this._self, this._then);

  final ElectricMeterUsageRecordsState _self;
  final $Res Function(ElectricMeterUsageRecordsState) _then;

/// Create a copy of ElectricMeterUsageRecordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? dateType = null,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<ElectricMeterUsageRecordEntity>,dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as MeterDateType,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterUsageRecordsState].
extension ElectricMeterUsageRecordsStatePatterns on ElectricMeterUsageRecordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordsState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterUsageRecordsState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ElectricMeterUsageRecordEntity> records,  MeterDateType dateType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState() when $default != null:
return $default(_that.records,_that.dateType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ElectricMeterUsageRecordEntity> records,  MeterDateType dateType)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState():
return $default(_that.records,_that.dateType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ElectricMeterUsageRecordEntity> records,  MeterDateType dateType)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordsState() when $default != null:
return $default(_that.records,_that.dateType);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterUsageRecordsState implements ElectricMeterUsageRecordsState {
  const _ElectricMeterUsageRecordsState({final  List<ElectricMeterUsageRecordEntity> records = const <ElectricMeterUsageRecordEntity>[], this.dateType = MeterDateType.day}): _records = records;
  

 final  List<ElectricMeterUsageRecordEntity> _records;
@override@JsonKey() List<ElectricMeterUsageRecordEntity> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

@override@JsonKey() final  MeterDateType dateType;

/// Create a copy of ElectricMeterUsageRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterUsageRecordsStateCopyWith<_ElectricMeterUsageRecordsState> get copyWith => __$ElectricMeterUsageRecordsStateCopyWithImpl<_ElectricMeterUsageRecordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterUsageRecordsState&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.dateType, dateType) || other.dateType == dateType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),dateType);

@override
String toString() {
  return 'ElectricMeterUsageRecordsState(records: $records, dateType: $dateType)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterUsageRecordsStateCopyWith<$Res> implements $ElectricMeterUsageRecordsStateCopyWith<$Res> {
  factory _$ElectricMeterUsageRecordsStateCopyWith(_ElectricMeterUsageRecordsState value, $Res Function(_ElectricMeterUsageRecordsState) _then) = __$ElectricMeterUsageRecordsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ElectricMeterUsageRecordEntity> records, MeterDateType dateType
});




}
/// @nodoc
class __$ElectricMeterUsageRecordsStateCopyWithImpl<$Res>
    implements _$ElectricMeterUsageRecordsStateCopyWith<$Res> {
  __$ElectricMeterUsageRecordsStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterUsageRecordsState _self;
  final $Res Function(_ElectricMeterUsageRecordsState) _then;

/// Create a copy of ElectricMeterUsageRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? dateType = null,}) {
  return _then(_ElectricMeterUsageRecordsState(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<ElectricMeterUsageRecordEntity>,dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as MeterDateType,
  ));
}


}

// dart format on
