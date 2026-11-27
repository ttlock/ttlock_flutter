// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_photo_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacePhotoAddState {

 CredentialValidityKind get kind;/// 人脸始终展示循环选项（对齐开源），不探测能力位。
 bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule; List<int>? get imageBytes; bool get photoTooLarge; bool get submitting; AppException? get error;
/// Create a copy of FacePhotoAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacePhotoAddStateCopyWith<FacePhotoAddState> get copyWith => _$FacePhotoAddStateCopyWithImpl<FacePhotoAddState>(this as FacePhotoAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacePhotoAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.photoTooLarge, photoTooLarge) || other.photoTooLarge == photoTooLarge)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,const DeepCollectionEquality().hash(imageBytes),photoTooLarge,submitting,error);

@override
String toString() {
  return 'FacePhotoAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, imageBytes: $imageBytes, photoTooLarge: $photoTooLarge, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class $FacePhotoAddStateCopyWith<$Res>  {
  factory $FacePhotoAddStateCopyWith(FacePhotoAddState value, $Res Function(FacePhotoAddState) _then) = _$FacePhotoAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, List<int>? imageBytes, bool photoTooLarge, bool submitting, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$FacePhotoAddStateCopyWithImpl<$Res>
    implements $FacePhotoAddStateCopyWith<$Res> {
  _$FacePhotoAddStateCopyWithImpl(this._self, this._then);

  final FacePhotoAddState _self;
  final $Res Function(FacePhotoAddState) _then;

/// Create a copy of FacePhotoAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? imageBytes = freezed,Object? photoTooLarge = null,Object? submitting = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as List<int>?,photoTooLarge: null == photoTooLarge ? _self.photoTooLarge : photoTooLarge // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of FacePhotoAddState
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


/// Adds pattern-matching-related methods to [FacePhotoAddState].
extension FacePhotoAddStatePatterns on FacePhotoAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacePhotoAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacePhotoAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacePhotoAddState value)  $default,){
final _that = this;
switch (_that) {
case _FacePhotoAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacePhotoAddState value)?  $default,){
final _that = this;
switch (_that) {
case _FacePhotoAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  List<int>? imageBytes,  bool photoTooLarge,  bool submitting,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacePhotoAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.imageBytes,_that.photoTooLarge,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  List<int>? imageBytes,  bool photoTooLarge,  bool submitting,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _FacePhotoAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.imageBytes,_that.photoTooLarge,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  List<int>? imageBytes,  bool photoTooLarge,  bool submitting,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _FacePhotoAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.imageBytes,_that.photoTooLarge,_that.submitting,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FacePhotoAddState extends FacePhotoAddState {
  const _FacePhotoAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = true, this.startDate, this.endDate, this.schedule, final  List<int>? imageBytes, this.photoTooLarge = false, this.submitting = false, this.error}): _imageBytes = imageBytes,super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
/// 人脸始终展示循环选项（对齐开源），不探测能力位。
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
 final  List<int>? _imageBytes;
@override List<int>? get imageBytes {
  final value = _imageBytes;
  if (value == null) return null;
  if (_imageBytes is EqualUnmodifiableListView) return _imageBytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool photoTooLarge;
@override@JsonKey() final  bool submitting;
@override final  AppException? error;

/// Create a copy of FacePhotoAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacePhotoAddStateCopyWith<_FacePhotoAddState> get copyWith => __$FacePhotoAddStateCopyWithImpl<_FacePhotoAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacePhotoAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&const DeepCollectionEquality().equals(other._imageBytes, _imageBytes)&&(identical(other.photoTooLarge, photoTooLarge) || other.photoTooLarge == photoTooLarge)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,const DeepCollectionEquality().hash(_imageBytes),photoTooLarge,submitting,error);

@override
String toString() {
  return 'FacePhotoAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, imageBytes: $imageBytes, photoTooLarge: $photoTooLarge, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FacePhotoAddStateCopyWith<$Res> implements $FacePhotoAddStateCopyWith<$Res> {
  factory _$FacePhotoAddStateCopyWith(_FacePhotoAddState value, $Res Function(_FacePhotoAddState) _then) = __$FacePhotoAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, List<int>? imageBytes, bool photoTooLarge, bool submitting, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$FacePhotoAddStateCopyWithImpl<$Res>
    implements _$FacePhotoAddStateCopyWith<$Res> {
  __$FacePhotoAddStateCopyWithImpl(this._self, this._then);

  final _FacePhotoAddState _self;
  final $Res Function(_FacePhotoAddState) _then;

/// Create a copy of FacePhotoAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? imageBytes = freezed,Object? photoTooLarge = null,Object? submitting = null,Object? error = freezed,}) {
  return _then(_FacePhotoAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,imageBytes: freezed == imageBytes ? _self._imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as List<int>?,photoTooLarge: null == photoTooLarge ? _self.photoTooLarge : photoTooLarge // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of FacePhotoAddState
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
