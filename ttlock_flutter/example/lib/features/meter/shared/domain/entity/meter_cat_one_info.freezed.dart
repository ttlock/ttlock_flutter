// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_cat_one_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeterCatOneInfoEntity {

 int get rssiGrade; String get catOneNodeId; String get catOneCardNumber; String get catOneOperator; String get catOneImsi; String get catOneApn; bool get overseaCard;
/// Create a copy of MeterCatOneInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterCatOneInfoEntityCopyWith<MeterCatOneInfoEntity> get copyWith => _$MeterCatOneInfoEntityCopyWithImpl<MeterCatOneInfoEntity>(this as MeterCatOneInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterCatOneInfoEntity&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}


@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'MeterCatOneInfoEntity(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class $MeterCatOneInfoEntityCopyWith<$Res>  {
  factory $MeterCatOneInfoEntityCopyWith(MeterCatOneInfoEntity value, $Res Function(MeterCatOneInfoEntity) _then) = _$MeterCatOneInfoEntityCopyWithImpl;
@useResult
$Res call({
 int rssiGrade, String catOneNodeId, String catOneCardNumber, String catOneOperator, String catOneImsi, String catOneApn, bool overseaCard
});




}
/// @nodoc
class _$MeterCatOneInfoEntityCopyWithImpl<$Res>
    implements $MeterCatOneInfoEntityCopyWith<$Res> {
  _$MeterCatOneInfoEntityCopyWithImpl(this._self, this._then);

  final MeterCatOneInfoEntity _self;
  final $Res Function(MeterCatOneInfoEntity) _then;

/// Create a copy of MeterCatOneInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rssiGrade = null,Object? catOneNodeId = null,Object? catOneCardNumber = null,Object? catOneOperator = null,Object? catOneImsi = null,Object? catOneApn = null,Object? overseaCard = null,}) {
  return _then(_self.copyWith(
rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,catOneNodeId: null == catOneNodeId ? _self.catOneNodeId : catOneNodeId // ignore: cast_nullable_to_non_nullable
as String,catOneCardNumber: null == catOneCardNumber ? _self.catOneCardNumber : catOneCardNumber // ignore: cast_nullable_to_non_nullable
as String,catOneOperator: null == catOneOperator ? _self.catOneOperator : catOneOperator // ignore: cast_nullable_to_non_nullable
as String,catOneImsi: null == catOneImsi ? _self.catOneImsi : catOneImsi // ignore: cast_nullable_to_non_nullable
as String,catOneApn: null == catOneApn ? _self.catOneApn : catOneApn // ignore: cast_nullable_to_non_nullable
as String,overseaCard: null == overseaCard ? _self.overseaCard : overseaCard // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MeterCatOneInfoEntity].
extension MeterCatOneInfoEntityPatterns on MeterCatOneInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterCatOneInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterCatOneInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterCatOneInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rssiGrade,  String catOneNodeId,  String catOneCardNumber,  String catOneOperator,  String catOneImsi,  String catOneApn,  bool overseaCard)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity() when $default != null:
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rssiGrade,  String catOneNodeId,  String catOneCardNumber,  String catOneOperator,  String catOneImsi,  String catOneApn,  bool overseaCard)  $default,) {final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity():
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rssiGrade,  String catOneNodeId,  String catOneCardNumber,  String catOneOperator,  String catOneImsi,  String catOneApn,  bool overseaCard)?  $default,) {final _that = this;
switch (_that) {
case _MeterCatOneInfoEntity() when $default != null:
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
  return null;

}
}

}

/// @nodoc


class _MeterCatOneInfoEntity extends MeterCatOneInfoEntity {
  const _MeterCatOneInfoEntity({this.rssiGrade = 0, this.catOneNodeId = '', this.catOneCardNumber = '', this.catOneOperator = '', this.catOneImsi = '', this.catOneApn = '', this.overseaCard = false}): super._();
  

@override@JsonKey() final  int rssiGrade;
@override@JsonKey() final  String catOneNodeId;
@override@JsonKey() final  String catOneCardNumber;
@override@JsonKey() final  String catOneOperator;
@override@JsonKey() final  String catOneImsi;
@override@JsonKey() final  String catOneApn;
@override@JsonKey() final  bool overseaCard;

/// Create a copy of MeterCatOneInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterCatOneInfoEntityCopyWith<_MeterCatOneInfoEntity> get copyWith => __$MeterCatOneInfoEntityCopyWithImpl<_MeterCatOneInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterCatOneInfoEntity&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}


@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'MeterCatOneInfoEntity(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class _$MeterCatOneInfoEntityCopyWith<$Res> implements $MeterCatOneInfoEntityCopyWith<$Res> {
  factory _$MeterCatOneInfoEntityCopyWith(_MeterCatOneInfoEntity value, $Res Function(_MeterCatOneInfoEntity) _then) = __$MeterCatOneInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 int rssiGrade, String catOneNodeId, String catOneCardNumber, String catOneOperator, String catOneImsi, String catOneApn, bool overseaCard
});




}
/// @nodoc
class __$MeterCatOneInfoEntityCopyWithImpl<$Res>
    implements _$MeterCatOneInfoEntityCopyWith<$Res> {
  __$MeterCatOneInfoEntityCopyWithImpl(this._self, this._then);

  final _MeterCatOneInfoEntity _self;
  final $Res Function(_MeterCatOneInfoEntity) _then;

/// Create a copy of MeterCatOneInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rssiGrade = null,Object? catOneNodeId = null,Object? catOneCardNumber = null,Object? catOneOperator = null,Object? catOneImsi = null,Object? catOneApn = null,Object? overseaCard = null,}) {
  return _then(_MeterCatOneInfoEntity(
rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,catOneNodeId: null == catOneNodeId ? _self.catOneNodeId : catOneNodeId // ignore: cast_nullable_to_non_nullable
as String,catOneCardNumber: null == catOneCardNumber ? _self.catOneCardNumber : catOneCardNumber // ignore: cast_nullable_to_non_nullable
as String,catOneOperator: null == catOneOperator ? _self.catOneOperator : catOneOperator // ignore: cast_nullable_to_non_nullable
as String,catOneImsi: null == catOneImsi ? _self.catOneImsi : catOneImsi // ignore: cast_nullable_to_non_nullable
as String,catOneApn: null == catOneApn ? _self.catOneApn : catOneApn // ignore: cast_nullable_to_non_nullable
as String,overseaCard: null == overseaCard ? _self.overseaCard : overseaCard // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
