// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keypad_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KeypadSlot {

 int get slotNumber; String get lockAlias;
/// Create a copy of KeypadSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeypadSlotCopyWith<KeypadSlot> get copyWith => _$KeypadSlotCopyWithImpl<KeypadSlot>(this as KeypadSlot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeypadSlot&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}


@override
int get hashCode => Object.hash(runtimeType,slotNumber,lockAlias);

@override
String toString() {
  return 'KeypadSlot(slotNumber: $slotNumber, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class $KeypadSlotCopyWith<$Res>  {
  factory $KeypadSlotCopyWith(KeypadSlot value, $Res Function(KeypadSlot) _then) = _$KeypadSlotCopyWithImpl;
@useResult
$Res call({
 int slotNumber, String lockAlias
});




}
/// @nodoc
class _$KeypadSlotCopyWithImpl<$Res>
    implements $KeypadSlotCopyWith<$Res> {
  _$KeypadSlotCopyWithImpl(this._self, this._then);

  final KeypadSlot _self;
  final $Res Function(KeypadSlot) _then;

/// Create a copy of KeypadSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotNumber = null,Object? lockAlias = null,}) {
  return _then(_self.copyWith(
slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KeypadSlot].
extension KeypadSlotPatterns on KeypadSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeypadSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeypadSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeypadSlot value)  $default,){
final _that = this;
switch (_that) {
case _KeypadSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeypadSlot value)?  $default,){
final _that = this;
switch (_that) {
case _KeypadSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int slotNumber,  String lockAlias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeypadSlot() when $default != null:
return $default(_that.slotNumber,_that.lockAlias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int slotNumber,  String lockAlias)  $default,) {final _that = this;
switch (_that) {
case _KeypadSlot():
return $default(_that.slotNumber,_that.lockAlias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int slotNumber,  String lockAlias)?  $default,) {final _that = this;
switch (_that) {
case _KeypadSlot() when $default != null:
return $default(_that.slotNumber,_that.lockAlias);case _:
  return null;

}
}

}

/// @nodoc


class _KeypadSlot extends KeypadSlot {
  const _KeypadSlot({required this.slotNumber, this.lockAlias = ''}): super._();
  

@override final  int slotNumber;
@override@JsonKey() final  String lockAlias;

/// Create a copy of KeypadSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeypadSlotCopyWith<_KeypadSlot> get copyWith => __$KeypadSlotCopyWithImpl<_KeypadSlot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeypadSlot&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}


@override
int get hashCode => Object.hash(runtimeType,slotNumber,lockAlias);

@override
String toString() {
  return 'KeypadSlot(slotNumber: $slotNumber, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class _$KeypadSlotCopyWith<$Res> implements $KeypadSlotCopyWith<$Res> {
  factory _$KeypadSlotCopyWith(_KeypadSlot value, $Res Function(_KeypadSlot) _then) = __$KeypadSlotCopyWithImpl;
@override @useResult
$Res call({
 int slotNumber, String lockAlias
});




}
/// @nodoc
class __$KeypadSlotCopyWithImpl<$Res>
    implements _$KeypadSlotCopyWith<$Res> {
  __$KeypadSlotCopyWithImpl(this._self, this._then);

  final _KeypadSlot _self;
  final $Res Function(_KeypadSlot) _then;

/// Create a copy of KeypadSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotNumber = null,Object? lockAlias = null,}) {
  return _then(_KeypadSlot(
slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
