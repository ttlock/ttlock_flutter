// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardListState {

 List<IdentityCardEntity> get items;
/// Create a copy of CardListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardListStateCopyWith<CardListState> get copyWith => _$CardListStateCopyWithImpl<CardListState>(this as CardListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardListState&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CardListState(items: $items)';
}


}

/// @nodoc
abstract mixin class $CardListStateCopyWith<$Res>  {
  factory $CardListStateCopyWith(CardListState value, $Res Function(CardListState) _then) = _$CardListStateCopyWithImpl;
@useResult
$Res call({
 List<IdentityCardEntity> items
});




}
/// @nodoc
class _$CardListStateCopyWithImpl<$Res>
    implements $CardListStateCopyWith<$Res> {
  _$CardListStateCopyWithImpl(this._self, this._then);

  final CardListState _self;
  final $Res Function(CardListState) _then;

/// Create a copy of CardListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<IdentityCardEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [CardListState].
extension CardListStatePatterns on CardListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardListState value)  $default,){
final _that = this;
switch (_that) {
case _CardListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardListState value)?  $default,){
final _that = this;
switch (_that) {
case _CardListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IdentityCardEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IdentityCardEntity> items)  $default,) {final _that = this;
switch (_that) {
case _CardListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IdentityCardEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _CardListState() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _CardListState extends CardListState {
  const _CardListState({final  List<IdentityCardEntity> items = const []}): _items = items,super._();
  

 final  List<IdentityCardEntity> _items;
@override@JsonKey() List<IdentityCardEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CardListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardListStateCopyWith<_CardListState> get copyWith => __$CardListStateCopyWithImpl<_CardListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardListState&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CardListState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CardListStateCopyWith<$Res> implements $CardListStateCopyWith<$Res> {
  factory _$CardListStateCopyWith(_CardListState value, $Res Function(_CardListState) _then) = __$CardListStateCopyWithImpl;
@override @useResult
$Res call({
 List<IdentityCardEntity> items
});




}
/// @nodoc
class __$CardListStateCopyWithImpl<$Res>
    implements _$CardListStateCopyWith<$Res> {
  __$CardListStateCopyWithImpl(this._self, this._then);

  final _CardListState _self;
  final $Res Function(_CardListState) _then;

/// Create a copy of CardListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CardListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<IdentityCardEntity>,
  ));
}


}

// dart format on
