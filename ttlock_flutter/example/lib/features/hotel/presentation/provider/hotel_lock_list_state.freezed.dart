// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_lock_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelLockListState {

 PageState<HotelLockEntity> get pageState;/// 锁类型：1-酒店锁、2-梯控、3-取电。
///
/// **没有「全部」**——开放平台 `type` 不传即 1，不存在表示全部的取值。
 int get type;/// 别名模糊搜索词；空串表示不筛。
 String get lockAlias;
/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelLockListStateCopyWith<HotelLockListState> get copyWith => _$HotelLockListStateCopyWithImpl<HotelLockListState>(this as HotelLockListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelLockListState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.type, type) || other.type == type)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,type,lockAlias);

@override
String toString() {
  return 'HotelLockListState(pageState: $pageState, type: $type, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class $HotelLockListStateCopyWith<$Res>  {
  factory $HotelLockListStateCopyWith(HotelLockListState value, $Res Function(HotelLockListState) _then) = _$HotelLockListStateCopyWithImpl;
@useResult
$Res call({
 PageState<HotelLockEntity> pageState, int type, String lockAlias
});


$PageStateCopyWith<HotelLockEntity, $Res> get pageState;

}
/// @nodoc
class _$HotelLockListStateCopyWithImpl<$Res>
    implements $HotelLockListStateCopyWith<$Res> {
  _$HotelLockListStateCopyWithImpl(this._self, this._then);

  final HotelLockListState _self;
  final $Res Function(HotelLockListState) _then;

/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? type = null,Object? lockAlias = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<HotelLockEntity>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<HotelLockEntity, $Res> get pageState {
  
  return $PageStateCopyWith<HotelLockEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HotelLockListState].
extension HotelLockListStatePatterns on HotelLockListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelLockListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelLockListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelLockListState value)  $default,){
final _that = this;
switch (_that) {
case _HotelLockListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelLockListState value)?  $default,){
final _that = this;
switch (_that) {
case _HotelLockListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<HotelLockEntity> pageState,  int type,  String lockAlias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelLockListState() when $default != null:
return $default(_that.pageState,_that.type,_that.lockAlias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<HotelLockEntity> pageState,  int type,  String lockAlias)  $default,) {final _that = this;
switch (_that) {
case _HotelLockListState():
return $default(_that.pageState,_that.type,_that.lockAlias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<HotelLockEntity> pageState,  int type,  String lockAlias)?  $default,) {final _that = this;
switch (_that) {
case _HotelLockListState() when $default != null:
return $default(_that.pageState,_that.type,_that.lockAlias);case _:
  return null;

}
}

}

/// @nodoc


class _HotelLockListState extends HotelLockListState {
  const _HotelLockListState({this.pageState = const PageState<HotelLockEntity>(), this.type = 1, this.lockAlias = ''}): super._();
  

@override@JsonKey() final  PageState<HotelLockEntity> pageState;
/// 锁类型：1-酒店锁、2-梯控、3-取电。
///
/// **没有「全部」**——开放平台 `type` 不传即 1，不存在表示全部的取值。
@override@JsonKey() final  int type;
/// 别名模糊搜索词；空串表示不筛。
@override@JsonKey() final  String lockAlias;

/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelLockListStateCopyWith<_HotelLockListState> get copyWith => __$HotelLockListStateCopyWithImpl<_HotelLockListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelLockListState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.type, type) || other.type == type)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}


@override
int get hashCode => Object.hash(runtimeType,pageState,type,lockAlias);

@override
String toString() {
  return 'HotelLockListState(pageState: $pageState, type: $type, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class _$HotelLockListStateCopyWith<$Res> implements $HotelLockListStateCopyWith<$Res> {
  factory _$HotelLockListStateCopyWith(_HotelLockListState value, $Res Function(_HotelLockListState) _then) = __$HotelLockListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<HotelLockEntity> pageState, int type, String lockAlias
});


@override $PageStateCopyWith<HotelLockEntity, $Res> get pageState;

}
/// @nodoc
class __$HotelLockListStateCopyWithImpl<$Res>
    implements _$HotelLockListStateCopyWith<$Res> {
  __$HotelLockListStateCopyWithImpl(this._self, this._then);

  final _HotelLockListState _self;
  final $Res Function(_HotelLockListState) _then;

/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? type = null,Object? lockAlias = null,}) {
  return _then(_HotelLockListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<HotelLockEntity>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HotelLockListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<HotelLockEntity, $Res> get pageState {
  
  return $PageStateCopyWith<HotelLockEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
