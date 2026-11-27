// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palm_vein_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PalmVeinDto {

@JsonKey(fromJson: intFromDynamic) int get id; String get name;@JsonKey(fromJson: stringFromDynamic) String get number;@JsonKey(fromJson: _entityStatusFromJson) EntityStatus get status; String get nickname;@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? get startDate;@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? get endDate;@JsonKey(fromJson: _credentialTypeFromJson) CredentialType get type;@JsonKey(fromJson: _cyclicConfigFromJson) List<CyclicConfig> get cyclicConfig;@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? get createDate;
/// Create a copy of PalmVeinDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PalmVeinDtoCopyWith<PalmVeinDto> get copyWith => _$PalmVeinDtoCopyWithImpl<PalmVeinDto>(this as PalmVeinDto, _$identity);

  /// Serializes this PalmVeinDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PalmVeinDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,number,status,nickname,startDate,endDate,type,const DeepCollectionEquality().hash(cyclicConfig),createDate);

@override
String toString() {
  return 'PalmVeinDto(id: $id, name: $name, number: $number, status: $status, nickname: $nickname, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $PalmVeinDtoCopyWith<$Res>  {
  factory $PalmVeinDtoCopyWith(PalmVeinDto value, $Res Function(PalmVeinDto) _then) = _$PalmVeinDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: intFromDynamic) int id, String name,@JsonKey(fromJson: stringFromDynamic) String number,@JsonKey(fromJson: _entityStatusFromJson) EntityStatus status, String nickname,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(fromJson: _credentialTypeFromJson) CredentialType type,@JsonKey(fromJson: _cyclicConfigFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? createDate
});




}
/// @nodoc
class _$PalmVeinDtoCopyWithImpl<$Res>
    implements $PalmVeinDtoCopyWith<$Res> {
  _$PalmVeinDtoCopyWithImpl(this._self, this._then);

  final PalmVeinDto _self;
  final $Res Function(PalmVeinDto) _then;

/// Create a copy of PalmVeinDto
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


/// Adds pattern-matching-related methods to [PalmVeinDto].
extension PalmVeinDtoPatterns on PalmVeinDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PalmVeinDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PalmVeinDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PalmVeinDto value)  $default,){
final _that = this;
switch (_that) {
case _PalmVeinDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PalmVeinDto value)?  $default,){
final _that = this;
switch (_that) {
case _PalmVeinDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: intFromDynamic)  int id,  String name, @JsonKey(fromJson: stringFromDynamic)  String number, @JsonKey(fromJson: _entityStatusFromJson)  EntityStatus status,  String nickname, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(fromJson: _credentialTypeFromJson)  CredentialType type, @JsonKey(fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PalmVeinDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: intFromDynamic)  int id,  String name, @JsonKey(fromJson: stringFromDynamic)  String number, @JsonKey(fromJson: _entityStatusFromJson)  EntityStatus status,  String nickname, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(fromJson: _credentialTypeFromJson)  CredentialType type, @JsonKey(fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)  $default,) {final _that = this;
switch (_that) {
case _PalmVeinDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: intFromDynamic)  int id,  String name, @JsonKey(fromJson: stringFromDynamic)  String number, @JsonKey(fromJson: _entityStatusFromJson)  EntityStatus status,  String nickname, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(fromJson: _credentialTypeFromJson)  CredentialType type, @JsonKey(fromJson: _cyclicConfigFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(fromJson: nullableDateTimeMsFromJson)  DateTime? createDate)?  $default,) {final _that = this;
switch (_that) {
case _PalmVeinDto() when $default != null:
return $default(_that.id,_that.name,_that.number,_that.status,_that.nickname,_that.startDate,_that.endDate,_that.type,_that.cyclicConfig,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PalmVeinDto extends PalmVeinDto {
  const _PalmVeinDto({@JsonKey(fromJson: intFromDynamic) this.id = 0, this.name = '', @JsonKey(fromJson: stringFromDynamic) this.number = '', @JsonKey(fromJson: _entityStatusFromJson) this.status = EntityStatus.normal, this.nickname = '', @JsonKey(fromJson: nullableDateTimeMsFromJson) this.startDate, @JsonKey(fromJson: nullableDateTimeMsFromJson) this.endDate, @JsonKey(fromJson: _credentialTypeFromJson) this.type = CredentialType.normal, @JsonKey(fromJson: _cyclicConfigFromJson) final  List<CyclicConfig> cyclicConfig = const [], @JsonKey(fromJson: nullableDateTimeMsFromJson) this.createDate}): _cyclicConfig = cyclicConfig,super._();
  factory _PalmVeinDto.fromJson(Map<String, dynamic> json) => _$PalmVeinDtoFromJson(json);

@override@JsonKey(fromJson: intFromDynamic) final  int id;
@override@JsonKey() final  String name;
@override@JsonKey(fromJson: stringFromDynamic) final  String number;
@override@JsonKey(fromJson: _entityStatusFromJson) final  EntityStatus status;
@override@JsonKey() final  String nickname;
@override@JsonKey(fromJson: nullableDateTimeMsFromJson) final  DateTime? startDate;
@override@JsonKey(fromJson: nullableDateTimeMsFromJson) final  DateTime? endDate;
@override@JsonKey(fromJson: _credentialTypeFromJson) final  CredentialType type;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(fromJson: _cyclicConfigFromJson) List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override@JsonKey(fromJson: nullableDateTimeMsFromJson) final  DateTime? createDate;

/// Create a copy of PalmVeinDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PalmVeinDtoCopyWith<_PalmVeinDto> get copyWith => __$PalmVeinDtoCopyWithImpl<_PalmVeinDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PalmVeinDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PalmVeinDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.status, status) || other.status == status)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,number,status,nickname,startDate,endDate,type,const DeepCollectionEquality().hash(_cyclicConfig),createDate);

@override
String toString() {
  return 'PalmVeinDto(id: $id, name: $name, number: $number, status: $status, nickname: $nickname, startDate: $startDate, endDate: $endDate, type: $type, cyclicConfig: $cyclicConfig, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$PalmVeinDtoCopyWith<$Res> implements $PalmVeinDtoCopyWith<$Res> {
  factory _$PalmVeinDtoCopyWith(_PalmVeinDto value, $Res Function(_PalmVeinDto) _then) = __$PalmVeinDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: intFromDynamic) int id, String name,@JsonKey(fromJson: stringFromDynamic) String number,@JsonKey(fromJson: _entityStatusFromJson) EntityStatus status, String nickname,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(fromJson: _credentialTypeFromJson) CredentialType type,@JsonKey(fromJson: _cyclicConfigFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? createDate
});




}
/// @nodoc
class __$PalmVeinDtoCopyWithImpl<$Res>
    implements _$PalmVeinDtoCopyWith<$Res> {
  __$PalmVeinDtoCopyWithImpl(this._self, this._then);

  final _PalmVeinDto _self;
  final $Res Function(_PalmVeinDto) _then;

/// Create a copy of PalmVeinDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? number = null,Object? status = null,Object? nickname = null,Object? startDate = freezed,Object? endDate = freezed,Object? type = null,Object? cyclicConfig = null,Object? createDate = freezed,}) {
  return _then(_PalmVeinDto(
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
