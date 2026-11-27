// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palm_vein.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PalmVeinEntity {

 int get id; String get name; String get number; EntityStatus get status; String get nickname; DateTime? get startDate; DateTime? get endDate; CredentialType get type; List<CyclicConfig> get cyclicConfig; DateTime? get createDate;
/// Create a copy of PalmVeinEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PalmVeinEntityCopyWith<PalmVeinEntity> get copyWith => _$PalmVeinEntityCopyWithImpl<PalmVeinEntity>(this as PalmVeinEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PalmVeinEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,number,status,nickname,startDate,endDate,type,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'PalmVeinEntity(id: $id, name: $name, number: $number, status: $status, nickname: $nickname, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $PalmVeinEntityCopyWith<$Res>  {
  factory $PalmVeinEntityCopyWith(PalmVeinEntity value, $Res Function(PalmVeinEntity) _then) = _$PalmVeinEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String number, EntityStatus status, String nickname, DateTime? startDate, DateTime? endDate, CredentialType type, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class _$PalmVeinEntityCopyWithImpl<$Res>
    implements $PalmVeinEntityCopyWith<$Res> {
  _$PalmVeinEntityCopyWithImpl(this._self, this._then);

  final PalmVeinEntity _self;
  final $Res Function(PalmVeinEntity) _then;

/// Create a copy of PalmVeinEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? number = null,Object? status = null,Object? nickname = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PalmVeinEntity].
extension PalmVeinEntityPatterns on PalmVeinEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PalmVeinEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PalmVeinEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PalmVeinEntity value)  $default,){
final _that = this;
switch (_that) {
case _PalmVeinEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PalmVeinEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PalmVeinEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String number,  EntityStatus status,  String nickname,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PalmVeinEntity() when $default != null:
return $default(_that.id,_that.name,_that.number,_that.status,_that.nickname,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String number,  EntityStatus status,  String nickname,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _PalmVeinEntity():
return $default(_that.id,_that.name,_that.number,_that.status,_that.nickname,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String number,  EntityStatus status,  String nickname,  DateTime? startDate,  DateTime? endDate,  CredentialType type,  List<CyclicConfig> cyclicConfig,  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _PalmVeinEntity() when $default != null:
return $default(_that.id,_that.name,_that.number,_that.status,_that.nickname,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc


class _PalmVeinEntity extends PalmVeinEntity {
  const _PalmVeinEntity({this.id = 0, this.name = '', this.number = '', this.status = EntityStatus.normal, this.nickname = '', this.startDate, this.endDate, this.type = CredentialType.normal, final  List<CyclicConfig> cyclicConfig = const [], this.createDate}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String number;
@override@JsonKey() final  EntityStatus status;
@override@JsonKey() final  String nickname;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  CredentialType type;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override final  DateTime? createDate;

/// Create a copy of PalmVeinEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PalmVeinEntityCopyWith<_PalmVeinEntity> get copyWith => __$PalmVeinEntityCopyWithImpl<_PalmVeinEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PalmVeinEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,number,status,nickname,startDate,endDate,type,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'PalmVeinEntity(id: $id, name: $name, number: $number, status: $status, nickname: $nickname, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$PalmVeinEntityCopyWith<$Res> implements $PalmVeinEntityCopyWith<$Res> {
  factory _$PalmVeinEntityCopyWith(_PalmVeinEntity value, $Res Function(_PalmVeinEntity) _then) = __$PalmVeinEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String number, EntityStatus status, String nickname, DateTime? startDate, DateTime? endDate, CredentialType type, List<CyclicConfig> cyclicConfig, DateTime? createDate
});




}
/// @nodoc
class __$PalmVeinEntityCopyWithImpl<$Res>
    implements _$PalmVeinEntityCopyWith<$Res> {
  __$PalmVeinEntityCopyWithImpl(this._self, this._then);

  final _PalmVeinEntity _self;
  final $Res Function(_PalmVeinEntity) _then;

/// Create a copy of PalmVeinEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? number = null,Object? status = null,Object? nickname = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_PalmVeinEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EntityStatus,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CredentialType,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
