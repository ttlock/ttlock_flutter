// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceListState {

 List<FaceEntity> get items;
/// Create a copy of FaceListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceListStateCopyWith<FaceListState> get copyWith => _$FaceListStateCopyWithImpl<FaceListState>(this as FaceListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceListState&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'FaceListState(items: $items)';
}


}

/// @nodoc
abstract mixin class $FaceListStateCopyWith<$Res>  {
  factory $FaceListStateCopyWith(FaceListState value, $Res Function(FaceListState) _then) = _$FaceListStateCopyWithImpl;
@useResult
$Res call({
 List<FaceEntity> items
});




}
/// @nodoc
class _$FaceListStateCopyWithImpl<$Res>
    implements $FaceListStateCopyWith<$Res> {
  _$FaceListStateCopyWithImpl(this._self, this._then);

  final FaceListState _self;
  final $Res Function(FaceListState) _then;

/// Create a copy of FaceListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FaceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceListState].
extension FaceListStatePatterns on FaceListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceListState value)  $default,){
final _that = this;
switch (_that) {
case _FaceListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceListState value)?  $default,){
final _that = this;
switch (_that) {
case _FaceListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FaceEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceListState() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FaceEntity> items)  $default,) {final _that = this;
switch (_that) {
case _FaceListState():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FaceEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _FaceListState() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _FaceListState extends FaceListState {
  const _FaceListState({final  List<FaceEntity> items = const []}): _items = items,super._();
  

 final  List<FaceEntity> _items;
@override@JsonKey() List<FaceEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FaceListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceListStateCopyWith<_FaceListState> get copyWith => __$FaceListStateCopyWithImpl<_FaceListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceListState&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'FaceListState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$FaceListStateCopyWith<$Res> implements $FaceListStateCopyWith<$Res> {
  factory _$FaceListStateCopyWith(_FaceListState value, $Res Function(_FaceListState) _then) = __$FaceListStateCopyWithImpl;
@override @useResult
$Res call({
 List<FaceEntity> items
});




}
/// @nodoc
class __$FaceListStateCopyWithImpl<$Res>
    implements _$FaceListStateCopyWith<$Res> {
  __$FaceListStateCopyWithImpl(this._self, this._then);

  final _FaceListState _self;
  final $Res Function(_FaceListState) _then;

/// Create a copy of FaceListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_FaceListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FaceEntity>,
  ));
}


}

// dart format on
