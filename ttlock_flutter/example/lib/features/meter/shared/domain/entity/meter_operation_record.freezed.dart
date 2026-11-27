// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_operation_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeterOperationRecordEntity {

 int get id; String get recordType; String get title; String get content; String get date; String get headUrl;
/// Create a copy of MeterOperationRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterOperationRecordEntityCopyWith<MeterOperationRecordEntity> get copyWith => _$MeterOperationRecordEntityCopyWithImpl<MeterOperationRecordEntity>(this as MeterOperationRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterOperationRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'MeterOperationRecordEntity(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class $MeterOperationRecordEntityCopyWith<$Res>  {
  factory $MeterOperationRecordEntityCopyWith(MeterOperationRecordEntity value, $Res Function(MeterOperationRecordEntity) _then) = _$MeterOperationRecordEntityCopyWithImpl;
@useResult
$Res call({
 int id, String recordType, String title, String content, String date, String headUrl
});




}
/// @nodoc
class _$MeterOperationRecordEntityCopyWithImpl<$Res>
    implements $MeterOperationRecordEntityCopyWith<$Res> {
  _$MeterOperationRecordEntityCopyWithImpl(this._self, this._then);

  final MeterOperationRecordEntity _self;
  final $Res Function(MeterOperationRecordEntity) _then;

/// Create a copy of MeterOperationRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recordType = null,Object? title = null,Object? content = null,Object? date = null,Object? headUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,headUrl: null == headUrl ? _self.headUrl : headUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MeterOperationRecordEntity].
extension MeterOperationRecordEntityPatterns on MeterOperationRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterOperationRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterOperationRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterOperationRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeterOperationRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterOperationRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeterOperationRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String recordType,  String title,  String content,  String date,  String headUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeterOperationRecordEntity() when $default != null:
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String recordType,  String title,  String content,  String date,  String headUrl)  $default,) {final _that = this;
switch (_that) {
case _MeterOperationRecordEntity():
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String recordType,  String title,  String content,  String date,  String headUrl)?  $default,) {final _that = this;
switch (_that) {
case _MeterOperationRecordEntity() when $default != null:
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
  return null;

}
}

}

/// @nodoc


class _MeterOperationRecordEntity extends MeterOperationRecordEntity {
  const _MeterOperationRecordEntity({this.id = 0, this.recordType = '', this.title = '', this.content = '', this.date = '', this.headUrl = ''}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String recordType;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  String date;
@override@JsonKey() final  String headUrl;

/// Create a copy of MeterOperationRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterOperationRecordEntityCopyWith<_MeterOperationRecordEntity> get copyWith => __$MeterOperationRecordEntityCopyWithImpl<_MeterOperationRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterOperationRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'MeterOperationRecordEntity(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class _$MeterOperationRecordEntityCopyWith<$Res> implements $MeterOperationRecordEntityCopyWith<$Res> {
  factory _$MeterOperationRecordEntityCopyWith(_MeterOperationRecordEntity value, $Res Function(_MeterOperationRecordEntity) _then) = __$MeterOperationRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String recordType, String title, String content, String date, String headUrl
});




}
/// @nodoc
class __$MeterOperationRecordEntityCopyWithImpl<$Res>
    implements _$MeterOperationRecordEntityCopyWith<$Res> {
  __$MeterOperationRecordEntityCopyWithImpl(this._self, this._then);

  final _MeterOperationRecordEntity _self;
  final $Res Function(_MeterOperationRecordEntity) _then;

/// Create a copy of MeterOperationRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recordType = null,Object? title = null,Object? content = null,Object? date = null,Object? headUrl = null,}) {
  return _then(_MeterOperationRecordEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,headUrl: null == headUrl ? _self.headUrl : headUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PaginatedOperationRecords {

 List<MeterOperationRecordEntity> get list; int get total; int get pageNo; int get pageSize;
/// Create a copy of PaginatedOperationRecords
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedOperationRecordsCopyWith<PaginatedOperationRecords> get copyWith => _$PaginatedOperationRecordsCopyWithImpl<PaginatedOperationRecords>(this as PaginatedOperationRecords, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedOperationRecords&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,pageNo,pageSize);

@override
String toString() {
  return 'PaginatedOperationRecords(list: $list, total: $total, pageNo: $pageNo, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $PaginatedOperationRecordsCopyWith<$Res>  {
  factory $PaginatedOperationRecordsCopyWith(PaginatedOperationRecords value, $Res Function(PaginatedOperationRecords) _then) = _$PaginatedOperationRecordsCopyWithImpl;
@useResult
$Res call({
 List<MeterOperationRecordEntity> list, int total, int pageNo, int pageSize
});




}
/// @nodoc
class _$PaginatedOperationRecordsCopyWithImpl<$Res>
    implements $PaginatedOperationRecordsCopyWith<$Res> {
  _$PaginatedOperationRecordsCopyWithImpl(this._self, this._then);

  final PaginatedOperationRecords _self;
  final $Res Function(PaginatedOperationRecords) _then;

/// Create a copy of PaginatedOperationRecords
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? pageNo = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<MeterOperationRecordEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedOperationRecords].
extension PaginatedOperationRecordsPatterns on PaginatedOperationRecords {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedOperationRecords value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedOperationRecords() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedOperationRecords value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedOperationRecords():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedOperationRecords value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedOperationRecords() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MeterOperationRecordEntity> list,  int total,  int pageNo,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedOperationRecords() when $default != null:
return $default(_that.list,_that.total,_that.pageNo,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MeterOperationRecordEntity> list,  int total,  int pageNo,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _PaginatedOperationRecords():
return $default(_that.list,_that.total,_that.pageNo,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MeterOperationRecordEntity> list,  int total,  int pageNo,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedOperationRecords() when $default != null:
return $default(_that.list,_that.total,_that.pageNo,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedOperationRecords extends PaginatedOperationRecords {
  const _PaginatedOperationRecords({final  List<MeterOperationRecordEntity> list = const <MeterOperationRecordEntity>[], this.total = 0, this.pageNo = 1, this.pageSize = 20}): _list = list,super._();
  

 final  List<MeterOperationRecordEntity> _list;
@override@JsonKey() List<MeterOperationRecordEntity> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int pageNo;
@override@JsonKey() final  int pageSize;

/// Create a copy of PaginatedOperationRecords
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedOperationRecordsCopyWith<_PaginatedOperationRecords> get copyWith => __$PaginatedOperationRecordsCopyWithImpl<_PaginatedOperationRecords>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedOperationRecords&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,pageNo,pageSize);

@override
String toString() {
  return 'PaginatedOperationRecords(list: $list, total: $total, pageNo: $pageNo, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$PaginatedOperationRecordsCopyWith<$Res> implements $PaginatedOperationRecordsCopyWith<$Res> {
  factory _$PaginatedOperationRecordsCopyWith(_PaginatedOperationRecords value, $Res Function(_PaginatedOperationRecords) _then) = __$PaginatedOperationRecordsCopyWithImpl;
@override @useResult
$Res call({
 List<MeterOperationRecordEntity> list, int total, int pageNo, int pageSize
});




}
/// @nodoc
class __$PaginatedOperationRecordsCopyWithImpl<$Res>
    implements _$PaginatedOperationRecordsCopyWith<$Res> {
  __$PaginatedOperationRecordsCopyWithImpl(this._self, this._then);

  final _PaginatedOperationRecords _self;
  final $Res Function(_PaginatedOperationRecords) _then;

/// Create a copy of PaginatedOperationRecords
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? pageNo = null,Object? pageSize = null,}) {
  return _then(_PaginatedOperationRecords(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<MeterOperationRecordEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
