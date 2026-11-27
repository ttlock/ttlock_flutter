// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteAddState {

 CredentialValidityKind get kind;/// 遥控器始终展示循环选项，不探测能力位。
 bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule; bool get submitting; bool get scanning; List<TTRemoteAccessoryScanModel> get scanned; String? get selectedMac; AppException? get error;
/// Create a copy of RemoteAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteAddStateCopyWith<RemoteAddState> get copyWith => _$RemoteAddStateCopyWithImpl<RemoteAddState>(this as RemoteAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.scanning, scanning) || other.scanning == scanning)&&const DeepCollectionEquality().equals(other.scanned, scanned)&&(identical(other.selectedMac, selectedMac) || other.selectedMac == selectedMac)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,submitting,scanning,const DeepCollectionEquality().hash(scanned),selectedMac,error);

@override
String toString() {
  return 'RemoteAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, submitting: $submitting, scanning: $scanning, scanned: $scanned, selectedMac: $selectedMac, error: $error)';
}


}

/// @nodoc
abstract mixin class $RemoteAddStateCopyWith<$Res>  {
  factory $RemoteAddStateCopyWith(RemoteAddState value, $Res Function(RemoteAddState) _then) = _$RemoteAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool submitting, bool scanning, List<TTRemoteAccessoryScanModel> scanned, String? selectedMac, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$RemoteAddStateCopyWithImpl<$Res>
    implements $RemoteAddStateCopyWith<$Res> {
  _$RemoteAddStateCopyWithImpl(this._self, this._then);

  final RemoteAddState _self;
  final $Res Function(RemoteAddState) _then;

/// Create a copy of RemoteAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? submitting = null,Object? scanning = null,Object? scanned = null,Object? selectedMac = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,scanning: null == scanning ? _self.scanning : scanning // ignore: cast_nullable_to_non_nullable
as bool,scanned: null == scanned ? _self.scanned : scanned // ignore: cast_nullable_to_non_nullable
as List<TTRemoteAccessoryScanModel>,selectedMac: freezed == selectedMac ? _self.selectedMac : selectedMac // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of RemoteAddState
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


/// Adds pattern-matching-related methods to [RemoteAddState].
extension RemoteAddStatePatterns on RemoteAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteAddState value)  $default,){
final _that = this;
switch (_that) {
case _RemoteAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteAddState value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool submitting,  bool scanning,  List<TTRemoteAccessoryScanModel> scanned,  String? selectedMac,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.submitting,_that.scanning,_that.scanned,_that.selectedMac,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool submitting,  bool scanning,  List<TTRemoteAccessoryScanModel> scanned,  String? selectedMac,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _RemoteAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.submitting,_that.scanning,_that.scanned,_that.selectedMac,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool submitting,  bool scanning,  List<TTRemoteAccessoryScanModel> scanned,  String? selectedMac,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _RemoteAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.submitting,_that.scanning,_that.scanned,_that.selectedMac,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteAddState extends RemoteAddState {
  const _RemoteAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = true, this.startDate, this.endDate, this.schedule, this.submitting = false, this.scanning = false, final  List<TTRemoteAccessoryScanModel> scanned = const <TTRemoteAccessoryScanModel>[], this.selectedMac, this.error}): _scanned = scanned,super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
/// 遥控器始终展示循环选项，不探测能力位。
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
@override@JsonKey() final  bool submitting;
@override@JsonKey() final  bool scanning;
 final  List<TTRemoteAccessoryScanModel> _scanned;
@override@JsonKey() List<TTRemoteAccessoryScanModel> get scanned {
  if (_scanned is EqualUnmodifiableListView) return _scanned;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanned);
}

@override final  String? selectedMac;
@override final  AppException? error;

/// Create a copy of RemoteAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteAddStateCopyWith<_RemoteAddState> get copyWith => __$RemoteAddStateCopyWithImpl<_RemoteAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.scanning, scanning) || other.scanning == scanning)&&const DeepCollectionEquality().equals(other._scanned, _scanned)&&(identical(other.selectedMac, selectedMac) || other.selectedMac == selectedMac)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,submitting,scanning,const DeepCollectionEquality().hash(_scanned),selectedMac,error);

@override
String toString() {
  return 'RemoteAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, submitting: $submitting, scanning: $scanning, scanned: $scanned, selectedMac: $selectedMac, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RemoteAddStateCopyWith<$Res> implements $RemoteAddStateCopyWith<$Res> {
  factory _$RemoteAddStateCopyWith(_RemoteAddState value, $Res Function(_RemoteAddState) _then) = __$RemoteAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool submitting, bool scanning, List<TTRemoteAccessoryScanModel> scanned, String? selectedMac, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$RemoteAddStateCopyWithImpl<$Res>
    implements _$RemoteAddStateCopyWith<$Res> {
  __$RemoteAddStateCopyWithImpl(this._self, this._then);

  final _RemoteAddState _self;
  final $Res Function(_RemoteAddState) _then;

/// Create a copy of RemoteAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? submitting = null,Object? scanning = null,Object? scanned = null,Object? selectedMac = freezed,Object? error = freezed,}) {
  return _then(_RemoteAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,scanning: null == scanning ? _self.scanning : scanning // ignore: cast_nullable_to_non_nullable
as bool,scanned: null == scanned ? _self._scanned : scanned // ignore: cast_nullable_to_non_nullable
as List<TTRemoteAccessoryScanModel>,selectedMac: freezed == selectedMac ? _self.selectedMac : selectedMac // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of RemoteAddState
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
