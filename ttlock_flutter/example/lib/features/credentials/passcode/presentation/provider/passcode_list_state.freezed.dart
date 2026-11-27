// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passcode_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasscodeListState {

 List<KeyboardPwdEntity> get items; int get currentPage; bool get hasMore;
/// Create a copy of PasscodeListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasscodeListStateCopyWith<PasscodeListState> get copyWith => _$PasscodeListStateCopyWithImpl<PasscodeListState>(this as PasscodeListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasscodeListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),currentPage,hasMore);

@override
String toString() {
  return 'PasscodeListState(items: $items, currentPage: $currentPage, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PasscodeListStateCopyWith<$Res>  {
  factory $PasscodeListStateCopyWith(PasscodeListState value, $Res Function(PasscodeListState) _then) = _$PasscodeListStateCopyWithImpl;
@useResult
$Res call({
 List<KeyboardPwdEntity> items, int currentPage, bool hasMore
});




}
/// @nodoc
class _$PasscodeListStateCopyWithImpl<$Res>
    implements $PasscodeListStateCopyWith<$Res> {
  _$PasscodeListStateCopyWithImpl(this._self, this._then);

  final PasscodeListState _self;
  final $Res Function(PasscodeListState) _then;

/// Create a copy of PasscodeListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentPage = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<KeyboardPwdEntity>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PasscodeListState].
extension PasscodeListStatePatterns on PasscodeListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasscodeListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasscodeListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasscodeListState value)  $default,){
final _that = this;
switch (_that) {
case _PasscodeListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasscodeListState value)?  $default,){
final _that = this;
switch (_that) {
case _PasscodeListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<KeyboardPwdEntity> items,  int currentPage,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasscodeListState() when $default != null:
return $default(_that.items,_that.currentPage,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<KeyboardPwdEntity> items,  int currentPage,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _PasscodeListState():
return $default(_that.items,_that.currentPage,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<KeyboardPwdEntity> items,  int currentPage,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _PasscodeListState() when $default != null:
return $default(_that.items,_that.currentPage,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _PasscodeListState extends PasscodeListState {
  const _PasscodeListState({final  List<KeyboardPwdEntity> items = const [], this.currentPage = 1, this.hasMore = false}): _items = items,super._();
  

 final  List<KeyboardPwdEntity> _items;
@override@JsonKey() List<KeyboardPwdEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;

/// Create a copy of PasscodeListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasscodeListStateCopyWith<_PasscodeListState> get copyWith => __$PasscodeListStateCopyWithImpl<_PasscodeListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasscodeListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentPage,hasMore);

@override
String toString() {
  return 'PasscodeListState(items: $items, currentPage: $currentPage, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PasscodeListStateCopyWith<$Res> implements $PasscodeListStateCopyWith<$Res> {
  factory _$PasscodeListStateCopyWith(_PasscodeListState value, $Res Function(_PasscodeListState) _then) = __$PasscodeListStateCopyWithImpl;
@override @useResult
$Res call({
 List<KeyboardPwdEntity> items, int currentPage, bool hasMore
});




}
/// @nodoc
class __$PasscodeListStateCopyWithImpl<$Res>
    implements _$PasscodeListStateCopyWith<$Res> {
  __$PasscodeListStateCopyWithImpl(this._self, this._then);

  final _PasscodeListState _self;
  final $Res Function(_PasscodeListState) _then;

/// Create a copy of PasscodeListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentPage = null,Object? hasMore = null,}) {
  return _then(_PasscodeListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<KeyboardPwdEntity>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
