// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fingerprint_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FingerprintDto {

@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic) int get fingerprintId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic) String get fingerprintNumber;@JsonKey(name: 'fingerprintType', fromJson: intFromDynamic) int get fingerprintType;@JsonKey(name: 'fingerprintName') String get fingerprintName;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? get endDate;@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> get cyclicConfig;@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? get createDate;@JsonKey(name: 'senderUsername') String get senderUsername;
/// Create a copy of FingerprintDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerprintDtoCopyWith<FingerprintDto> get copyWith => _$FingerprintDtoCopyWithImpl<FingerprintDto>(this as FingerprintDto, _$identity);

  /// Serializes this FingerprintDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FingerprintDto&&(identical(other.fingerprintId, fingerprintId) || other.fingerprintId == fingerprintId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.fingerprintNumber, fingerprintNumber) || other.fingerprintNumber == fingerprintNumber)&&(identical(other.fingerprintType, fingerprintType) || other.fingerprintType == fingerprintType)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fingerprintId,lockId,fingerprintNumber,fingerprintType,fingerprintName,startDate,endDate,const DeepCollectionEquality().hash(cyclicConfig),createDate,senderUsername);

@override
String toString() {
  return 'FingerprintDto(fingerprintId: $fingerprintId, lockId: $lockId, fingerprintNumber: $fingerprintNumber, fingerprintType: $fingerprintType, fingerprintName: $fingerprintName, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class $FingerprintDtoCopyWith<$Res>  {
  factory $FingerprintDtoCopyWith(FingerprintDto value, $Res Function(FingerprintDto) _then) = _$FingerprintDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic) int fingerprintId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic) String fingerprintNumber,@JsonKey(name: 'fingerprintType', fromJson: intFromDynamic) int fingerprintType,@JsonKey(name: 'fingerprintName') String fingerprintName,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate,@JsonKey(name: 'senderUsername') String senderUsername
});




}
/// @nodoc
class _$FingerprintDtoCopyWithImpl<$Res>
    implements $FingerprintDtoCopyWith<$Res> {
  _$FingerprintDtoCopyWithImpl(this._self, this._then);

  final FingerprintDto _self;
  final $Res Function(FingerprintDto) _then;

/// Create a copy of FingerprintDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fingerprintId = null,Object? lockId = null,Object? fingerprintNumber = null,Object? fingerprintType = null,Object? fingerprintName = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,Object? senderUsername = null,}) {
  return _then(_self.copyWith(
fingerprintId: null == fingerprintId ? _self.fingerprintId : fingerprintId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,fingerprintNumber: null == fingerprintNumber ? _self.fingerprintNumber : fingerprintNumber // ignore: cast_nullable_to_non_nullable
as String,fingerprintType: null == fingerprintType ? _self.fingerprintType : fingerprintType // ignore: cast_nullable_to_non_nullable
as int,fingerprintName: null == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FingerprintDto].
extension FingerprintDtoPatterns on FingerprintDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FingerprintDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FingerprintDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FingerprintDto value)  $default,){
final _that = this;
switch (_that) {
case _FingerprintDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FingerprintDto value)?  $default,){
final _that = this;
switch (_that) {
case _FingerprintDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic)  int fingerprintId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic)  String fingerprintNumber, @JsonKey(name: 'fingerprintType', fromJson: intFromDynamic)  int fingerprintType, @JsonKey(name: 'fingerprintName')  String fingerprintName, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FingerprintDto() when $default != null:
return $default(_that.fingerprintId,_that.lockId,_that.fingerprintNumber,_that.fingerprintType,_that.fingerprintName,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate,_that.senderUsername);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic)  int fingerprintId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic)  String fingerprintNumber, @JsonKey(name: 'fingerprintType', fromJson: intFromDynamic)  int fingerprintType, @JsonKey(name: 'fingerprintName')  String fingerprintName, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername)  $default,) {final _that = this;
switch (_that) {
case _FingerprintDto():
return $default(_that.fingerprintId,_that.lockId,_that.fingerprintNumber,_that.fingerprintType,_that.fingerprintName,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate,_that.senderUsername);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic)  int fingerprintId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic)  String fingerprintNumber, @JsonKey(name: 'fingerprintType', fromJson: intFromDynamic)  int fingerprintType, @JsonKey(name: 'fingerprintName')  String fingerprintName, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername)?  $default,) {final _that = this;
switch (_that) {
case _FingerprintDto() when $default != null:
return $default(_that.fingerprintId,_that.lockId,_that.fingerprintNumber,_that.fingerprintType,_that.fingerprintName,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate,_that.senderUsername);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FingerprintDto extends FingerprintDto {
  const _FingerprintDto({@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic) this.fingerprintId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic) this.fingerprintNumber = '', @JsonKey(name: 'fingerprintType', fromJson: intFromDynamic) this.fingerprintType = 1, @JsonKey(name: 'fingerprintName') this.fingerprintName = '', @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) this.endDate, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) final  List<CyclicConfig> cyclicConfig = const [], @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) this.createDate, @JsonKey(name: 'senderUsername') this.senderUsername = ''}): _cyclicConfig = cyclicConfig,super._();
  factory _FingerprintDto.fromJson(Map<String, dynamic> json) => _$FingerprintDtoFromJson(json);

@override@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic) final  int fingerprintId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic) final  String fingerprintNumber;
@override@JsonKey(name: 'fingerprintType', fromJson: intFromDynamic) final  int fingerprintType;
@override@JsonKey(name: 'fingerprintName') final  String fingerprintName;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? endDate;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? createDate;
@override@JsonKey(name: 'senderUsername') final  String senderUsername;

/// Create a copy of FingerprintDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FingerprintDtoCopyWith<_FingerprintDto> get copyWith => __$FingerprintDtoCopyWithImpl<_FingerprintDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FingerprintDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FingerprintDto&&(identical(other.fingerprintId, fingerprintId) || other.fingerprintId == fingerprintId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.fingerprintNumber, fingerprintNumber) || other.fingerprintNumber == fingerprintNumber)&&(identical(other.fingerprintType, fingerprintType) || other.fingerprintType == fingerprintType)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fingerprintId,lockId,fingerprintNumber,fingerprintType,fingerprintName,startDate,endDate,const DeepCollectionEquality().hash(_cyclicConfig),createDate,senderUsername);

@override
String toString() {
  return 'FingerprintDto(fingerprintId: $fingerprintId, lockId: $lockId, fingerprintNumber: $fingerprintNumber, fingerprintType: $fingerprintType, fingerprintName: $fingerprintName, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class _$FingerprintDtoCopyWith<$Res> implements $FingerprintDtoCopyWith<$Res> {
  factory _$FingerprintDtoCopyWith(_FingerprintDto value, $Res Function(_FingerprintDto) _then) = __$FingerprintDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'fingerprintId', fromJson: intFromDynamic) int fingerprintId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic) String fingerprintNumber,@JsonKey(name: 'fingerprintType', fromJson: intFromDynamic) int fingerprintType,@JsonKey(name: 'fingerprintName') String fingerprintName,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate,@JsonKey(name: 'senderUsername') String senderUsername
});




}
/// @nodoc
class __$FingerprintDtoCopyWithImpl<$Res>
    implements _$FingerprintDtoCopyWith<$Res> {
  __$FingerprintDtoCopyWithImpl(this._self, this._then);

  final _FingerprintDto _self;
  final $Res Function(_FingerprintDto) _then;

/// Create a copy of FingerprintDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fingerprintId = null,Object? lockId = null,Object? fingerprintNumber = null,Object? fingerprintType = null,Object? fingerprintName = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,Object? senderUsername = null,}) {
  return _then(_FingerprintDto(
fingerprintId: null == fingerprintId ? _self.fingerprintId : fingerprintId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,fingerprintNumber: null == fingerprintNumber ? _self.fingerprintNumber : fingerprintNumber // ignore: cast_nullable_to_non_nullable
as String,fingerprintType: null == fingerprintType ? _self.fingerprintType : fingerprintType // ignore: cast_nullable_to_non_nullable
as int,fingerprintName: null == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
