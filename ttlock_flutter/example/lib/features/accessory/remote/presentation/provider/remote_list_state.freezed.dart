// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteListState {

 List<RemoteEntity> get items;
/// Create a copy of RemoteListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteListStateCopyWith<RemoteListState> get copyWith => _$RemoteListStateCopyWithImpl<RemoteListState>(this as RemoteListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteListState&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'RemoteListState(items: $items)';
}


}

/// @nodoc
abstract mixin class $RemoteListStateCopyWith<$Res>  {
  factory $RemoteListStateCopyWith(RemoteListState value, $Res Function(RemoteListState) _then) = _$RemoteListStateCopyWithImpl;
@useResult
$Res call({
 List<RemoteEntity> items
});




}
/// @nodoc
class _$RemoteListStateCopyWithImpl<$Res>
    implements $RemoteListStateCopyWith<$Res> {
  _$RemoteListStateCopyWithImpl(this._self, this._then);

  final RemoteListState _self;
  final $Res Function(RemoteListState) _then;

/// Create a copy of RemoteListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RemoteEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteListState].
extension RemoteListStatePatterns on RemoteListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteListState value)  $default,){
final _that = this;
switch (_that) {
case _RemoteListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteListState value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RemoteEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RemoteEntity> items)  $default,) {final _that = this;
switch (_that) {
case _RemoteListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RemoteEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _RemoteListState() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteListState extends RemoteListState {
  const _RemoteListState({final  List<RemoteEntity> items = const []}): _items = items,super._();
  

 final  List<RemoteEntity> _items;
@override@JsonKey() List<RemoteEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of RemoteListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteListStateCopyWith<_RemoteListState> get copyWith => __$RemoteListStateCopyWithImpl<_RemoteListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteListState&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'RemoteListState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$RemoteListStateCopyWith<$Res> implements $RemoteListStateCopyWith<$Res> {
  factory _$RemoteListStateCopyWith(_RemoteListState value, $Res Function(_RemoteListState) _then) = __$RemoteListStateCopyWithImpl;
@override @useResult
$Res call({
 List<RemoteEntity> items
});




}
/// @nodoc
class __$RemoteListStateCopyWithImpl<$Res>
    implements _$RemoteListStateCopyWith<$Res> {
  __$RemoteListStateCopyWithImpl(this._self, this._then);

  final _RemoteListState _self;
  final $Res Function(_RemoteListState) _then;

/// Create a copy of RemoteListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_RemoteListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RemoteEntity>,
  ));
}


}

// dart format on
