// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palm_vein_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PalmVeinListState {

 List<PalmVeinEntity> get items;
/// Create a copy of PalmVeinListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PalmVeinListStateCopyWith<PalmVeinListState> get copyWith => _$PalmVeinListStateCopyWithImpl<PalmVeinListState>(this as PalmVeinListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PalmVeinListState&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PalmVeinListState(items: $items)';
}


}

/// @nodoc
abstract mixin class $PalmVeinListStateCopyWith<$Res>  {
  factory $PalmVeinListStateCopyWith(PalmVeinListState value, $Res Function(PalmVeinListState) _then) = _$PalmVeinListStateCopyWithImpl;
@useResult
$Res call({
 List<PalmVeinEntity> items
});




}
/// @nodoc
class _$PalmVeinListStateCopyWithImpl<$Res>
    implements $PalmVeinListStateCopyWith<$Res> {
  _$PalmVeinListStateCopyWithImpl(this._self, this._then);

  final PalmVeinListState _self;
  final $Res Function(PalmVeinListState) _then;

/// Create a copy of PalmVeinListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PalmVeinEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [PalmVeinListState].
extension PalmVeinListStatePatterns on PalmVeinListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PalmVeinListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PalmVeinListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PalmVeinListState value)  $default,){
final _that = this;
switch (_that) {
case _PalmVeinListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PalmVeinListState value)?  $default,){
final _that = this;
switch (_that) {
case _PalmVeinListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PalmVeinEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PalmVeinListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PalmVeinEntity> items)  $default,) {final _that = this;
switch (_that) {
case _PalmVeinListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PalmVeinEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _PalmVeinListState() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _PalmVeinListState extends PalmVeinListState {
  const _PalmVeinListState({final  List<PalmVeinEntity> items = const []}): _items = items,super._();
  

 final  List<PalmVeinEntity> _items;
@override@JsonKey() List<PalmVeinEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PalmVeinListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PalmVeinListStateCopyWith<_PalmVeinListState> get copyWith => __$PalmVeinListStateCopyWithImpl<_PalmVeinListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PalmVeinListState&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PalmVeinListState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$PalmVeinListStateCopyWith<$Res> implements $PalmVeinListStateCopyWith<$Res> {
  factory _$PalmVeinListStateCopyWith(_PalmVeinListState value, $Res Function(_PalmVeinListState) _then) = __$PalmVeinListStateCopyWithImpl;
@override @useResult
$Res call({
 List<PalmVeinEntity> items
});




}
/// @nodoc
class __$PalmVeinListStateCopyWithImpl<$Res>
    implements _$PalmVeinListStateCopyWith<$Res> {
  __$PalmVeinListStateCopyWithImpl(this._self, this._then);

  final _PalmVeinListState _self;
  final $Res Function(_PalmVeinListState) _then;

/// Create a copy of PalmVeinListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_PalmVeinListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PalmVeinEntity>,
  ));
}


}

// dart format on
