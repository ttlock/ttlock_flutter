// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_api_page_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenApiPageDto<T> {

@JsonKey(name: 'list') List<T> get list;@JsonKey(name: 'pageNo') int get pageNo;@JsonKey(name: 'pageSize') int get pageSize;@JsonKey(name: 'pages') int get pages;@JsonKey(name: 'total') int get total;
/// Create a copy of OpenApiPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenApiPageDtoCopyWith<T, OpenApiPageDto<T>> get copyWith => _$OpenApiPageDtoCopyWithImpl<T, OpenApiPageDto<T>>(this as OpenApiPageDto<T>, _$identity);

  /// Serializes this OpenApiPageDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenApiPageDto<T>&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'OpenApiPageDto<$T>(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class $OpenApiPageDtoCopyWith<T,$Res>  {
  factory $OpenApiPageDtoCopyWith(OpenApiPageDto<T> value, $Res Function(OpenApiPageDto<T>) _then) = _$OpenApiPageDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'list') List<T> list,@JsonKey(name: 'pageNo') int pageNo,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'pages') int pages,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class _$OpenApiPageDtoCopyWithImpl<T,$Res>
    implements $OpenApiPageDtoCopyWith<T, $Res> {
  _$OpenApiPageDtoCopyWithImpl(this._self, this._then);

  final OpenApiPageDto<T> _self;
  final $Res Function(OpenApiPageDto<T>) _then;

/// Create a copy of OpenApiPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<T>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenApiPageDto].
extension OpenApiPageDtoPatterns<T> on OpenApiPageDto<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenApiPageDto<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenApiPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenApiPageDto<T> value)  $default,){
final _that = this;
switch (_that) {
case _OpenApiPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenApiPageDto<T> value)?  $default,){
final _that = this;
switch (_that) {
case _OpenApiPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<T> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenApiPageDto() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<T> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)  $default,) {final _that = this;
switch (_that) {
case _OpenApiPageDto():
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'list')  List<T> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)?  $default,) {final _that = this;
switch (_that) {
case _OpenApiPageDto() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _OpenApiPageDto<T> extends OpenApiPageDto<T> {
  const _OpenApiPageDto({@JsonKey(name: 'list') final  List<T> list = const [], @JsonKey(name: 'pageNo') this.pageNo = 1, @JsonKey(name: 'pageSize') this.pageSize = 20, @JsonKey(name: 'pages') this.pages = 0, @JsonKey(name: 'total') this.total = 0}): _list = list,super._();
  factory _OpenApiPageDto.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$OpenApiPageDtoFromJson(json,fromJsonT);

 final  List<T> _list;
@override@JsonKey(name: 'list') List<T> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey(name: 'pageNo') final  int pageNo;
@override@JsonKey(name: 'pageSize') final  int pageSize;
@override@JsonKey(name: 'pages') final  int pages;
@override@JsonKey(name: 'total') final  int total;

/// Create a copy of OpenApiPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenApiPageDtoCopyWith<T, _OpenApiPageDto<T>> get copyWith => __$OpenApiPageDtoCopyWithImpl<T, _OpenApiPageDto<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$OpenApiPageDtoToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenApiPageDto<T>&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'OpenApiPageDto<$T>(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OpenApiPageDtoCopyWith<T,$Res> implements $OpenApiPageDtoCopyWith<T, $Res> {
  factory _$OpenApiPageDtoCopyWith(_OpenApiPageDto<T> value, $Res Function(_OpenApiPageDto<T>) _then) = __$OpenApiPageDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'list') List<T> list,@JsonKey(name: 'pageNo') int pageNo,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'pages') int pages,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class __$OpenApiPageDtoCopyWithImpl<T,$Res>
    implements _$OpenApiPageDtoCopyWith<T, $Res> {
  __$OpenApiPageDtoCopyWithImpl(this._self, this._then);

  final _OpenApiPageDto<T> _self;
  final $Res Function(_OpenApiPageDto<T>) _then;

/// Create a copy of OpenApiPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_OpenApiPageDto<T>(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<T>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
