// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageState<T> {

 List<T> get data; int get currentPage; int get pageSize; int get total;
/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageStateCopyWith<T, PageState<T>> get copyWith => _$PageStateCopyWithImpl<T, PageState<T>>(this as PageState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageState<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),currentPage,pageSize,total);

@override
String toString() {
  return 'PageState<$T>(data: $data, currentPage: $currentPage, pageSize: $pageSize, total: $total)';
}


}

/// @nodoc
abstract mixin class $PageStateCopyWith<T,$Res>  {
  factory $PageStateCopyWith(PageState<T> value, $Res Function(PageState<T>) _then) = _$PageStateCopyWithImpl;
@useResult
$Res call({
 List<T> data, int currentPage, int pageSize, int total
});




}
/// @nodoc
class _$PageStateCopyWithImpl<T,$Res>
    implements $PageStateCopyWith<T, $Res> {
  _$PageStateCopyWithImpl(this._self, this._then);

  final PageState<T> _self;
  final $Res Function(PageState<T>) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? currentPage = null,Object? pageSize = null,Object? total = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PageState].
extension PageStatePatterns<T> on PageState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageState<T> value)  $default,){
final _that = this;
switch (_that) {
case _PageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  int currentPage,  int pageSize,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageState() when $default != null:
return $default(_that.data,_that.currentPage,_that.pageSize,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  int currentPage,  int pageSize,  int total)  $default,) {final _that = this;
switch (_that) {
case _PageState():
return $default(_that.data,_that.currentPage,_that.pageSize,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  int currentPage,  int pageSize,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PageState() when $default != null:
return $default(_that.data,_that.currentPage,_that.pageSize,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _PageState<T> extends PageState<T> {
  const _PageState({final  List<T> data = const [], this.currentPage = 1, this.pageSize = 20, this.total = 0}): _data = data,super._();
  

 final  List<T> _data;
@override@JsonKey() List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int total;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageStateCopyWith<T, _PageState<T>> get copyWith => __$PageStateCopyWithImpl<T, _PageState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageState<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),currentPage,pageSize,total);

@override
String toString() {
  return 'PageState<$T>(data: $data, currentPage: $currentPage, pageSize: $pageSize, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PageStateCopyWith<T,$Res> implements $PageStateCopyWith<T, $Res> {
  factory _$PageStateCopyWith(_PageState<T> value, $Res Function(_PageState<T>) _then) = __$PageStateCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, int currentPage, int pageSize, int total
});




}
/// @nodoc
class __$PageStateCopyWithImpl<T,$Res>
    implements _$PageStateCopyWith<T, $Res> {
  __$PageStateCopyWithImpl(this._self, this._then);

  final _PageState<T> _self;
  final $Res Function(_PageState<T>) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? currentPage = null,Object? pageSize = null,Object? total = null,}) {
  return _then(_PageState<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
