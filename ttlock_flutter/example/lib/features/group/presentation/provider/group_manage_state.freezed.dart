// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_manage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupManageState {

 List<GroupEntity> get groups; bool get loading;
/// Create a copy of GroupManageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupManageStateCopyWith<GroupManageState> get copyWith => _$GroupManageStateCopyWithImpl<GroupManageState>(this as GroupManageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupManageState&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups),loading);

@override
String toString() {
  return 'GroupManageState(groups: $groups, loading: $loading)';
}


}

/// @nodoc
abstract mixin class $GroupManageStateCopyWith<$Res>  {
  factory $GroupManageStateCopyWith(GroupManageState value, $Res Function(GroupManageState) _then) = _$GroupManageStateCopyWithImpl;
@useResult
$Res call({
 List<GroupEntity> groups, bool loading
});




}
/// @nodoc
class _$GroupManageStateCopyWithImpl<$Res>
    implements $GroupManageStateCopyWith<$Res> {
  _$GroupManageStateCopyWithImpl(this._self, this._then);

  final GroupManageState _self;
  final $Res Function(GroupManageState) _then;

/// Create a copy of GroupManageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,Object? loading = null,}) {
  return _then(_self.copyWith(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupEntity>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupManageState].
extension GroupManageStatePatterns on GroupManageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupManageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupManageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupManageState value)  $default,){
final _that = this;
switch (_that) {
case _GroupManageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupManageState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupManageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GroupEntity> groups,  bool loading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupManageState() when $default != null:
return $default(_that.groups,_that.loading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GroupEntity> groups,  bool loading)  $default,) {final _that = this;
switch (_that) {
case _GroupManageState():
return $default(_that.groups,_that.loading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GroupEntity> groups,  bool loading)?  $default,) {final _that = this;
switch (_that) {
case _GroupManageState() when $default != null:
return $default(_that.groups,_that.loading);case _:
  return null;

}
}

}

/// @nodoc


class _GroupManageState extends GroupManageState {
  const _GroupManageState({final  List<GroupEntity> groups = const [], this.loading = false}): _groups = groups,super._();
  

 final  List<GroupEntity> _groups;
@override@JsonKey() List<GroupEntity> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override@JsonKey() final  bool loading;

/// Create a copy of GroupManageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupManageStateCopyWith<_GroupManageState> get copyWith => __$GroupManageStateCopyWithImpl<_GroupManageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupManageState&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups),loading);

@override
String toString() {
  return 'GroupManageState(groups: $groups, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$GroupManageStateCopyWith<$Res> implements $GroupManageStateCopyWith<$Res> {
  factory _$GroupManageStateCopyWith(_GroupManageState value, $Res Function(_GroupManageState) _then) = __$GroupManageStateCopyWithImpl;
@override @useResult
$Res call({
 List<GroupEntity> groups, bool loading
});




}
/// @nodoc
class __$GroupManageStateCopyWithImpl<$Res>
    implements _$GroupManageStateCopyWith<$Res> {
  __$GroupManageStateCopyWithImpl(this._self, this._then);

  final _GroupManageState _self;
  final $Res Function(_GroupManageState) _then;

/// Create a copy of GroupManageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,Object? loading = null,}) {
  return _then(_GroupManageState(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<GroupEntity>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
