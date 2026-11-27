// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdentityCardDto {

@JsonKey(name: 'cardId', fromJson: intFromDynamic) int get cardId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'cardNumber', fromJson: stringFromDynamic) String get cardNumber;@JsonKey(name: 'cardName') String get cardName;@JsonKey(name: 'cardType', fromJson: intFromDynamic) int get cardType;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get endDate;@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get createDate;@JsonKey(name: 'senderUsername') String get senderUsername;@JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson) List<CyclicConfig> get cyclicConfig;
/// Create a copy of IdentityCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityCardDtoCopyWith<IdentityCardDto> get copyWith => _$IdentityCardDtoCopyWithImpl<IdentityCardDto>(this as IdentityCardDto, _$identity);

  /// Serializes this IdentityCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityCardDto&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,lockId,cardNumber,cardName,cardType,startDate,endDate,createDate,senderUsername,const DeepCollectionEquality().hash(cyclicConfig));

@override
String toString() {
  return 'IdentityCardDto(cardId: $cardId, lockId: $lockId, cardNumber: $cardNumber, cardName: $cardName, cardType: $cardType, startDate: $startDate, endDate: $endDate, createDate: $createDate, senderUsername: $senderUsername, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class $IdentityCardDtoCopyWith<$Res>  {
  factory $IdentityCardDtoCopyWith(IdentityCardDto value, $Res Function(IdentityCardDto) _then) = _$IdentityCardDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cardId', fromJson: intFromDynamic) int cardId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'cardNumber', fromJson: stringFromDynamic) String cardNumber,@JsonKey(name: 'cardName') String cardName,@JsonKey(name: 'cardType', fromJson: intFromDynamic) int cardType,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? createDate,@JsonKey(name: 'senderUsername') String senderUsername,@JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson) List<CyclicConfig> cyclicConfig
});




}
/// @nodoc
class _$IdentityCardDtoCopyWithImpl<$Res>
    implements $IdentityCardDtoCopyWith<$Res> {
  _$IdentityCardDtoCopyWithImpl(this._self, this._then);

  final IdentityCardDto _self;
  final $Res Function(IdentityCardDto) _then;

/// Create a copy of IdentityCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? lockId = null,Object? cardNumber = null,Object? cardName = null,Object? cardType = null,Object? startDate = freezed,Object? endDate = freezed,Object? createDate = freezed,Object? senderUsername = null,Object? cyclicConfig = null,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardName: null == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,
  ));
}

}


/// Adds pattern-matching-related methods to [IdentityCardDto].
extension IdentityCardDtoPatterns on IdentityCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityCardDto value)  $default,){
final _that = this;
switch (_that) {
case _IdentityCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cardId', fromJson: intFromDynamic)  int cardId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'cardNumber', fromJson: stringFromDynamic)  String cardNumber, @JsonKey(name: 'cardName')  String cardName, @JsonKey(name: 'cardType', fromJson: intFromDynamic)  int cardType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson)  List<CyclicConfig> cyclicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityCardDto() when $default != null:
return $default(_that.cardId,_that.lockId,_that.cardNumber,_that.cardName,_that.cardType,_that.startDate,_that.endDate,_that.createDate,_that.senderUsername,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cardId', fromJson: intFromDynamic)  int cardId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'cardNumber', fromJson: stringFromDynamic)  String cardNumber, @JsonKey(name: 'cardName')  String cardName, @JsonKey(name: 'cardType', fromJson: intFromDynamic)  int cardType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson)  List<CyclicConfig> cyclicConfig)  $default,) {final _that = this;
switch (_that) {
case _IdentityCardDto():
return $default(_that.cardId,_that.lockId,_that.cardNumber,_that.cardName,_that.cardType,_that.startDate,_that.endDate,_that.createDate,_that.senderUsername,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cardId', fromJson: intFromDynamic)  int cardId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'cardNumber', fromJson: stringFromDynamic)  String cardNumber, @JsonKey(name: 'cardName')  String cardName, @JsonKey(name: 'cardType', fromJson: intFromDynamic)  int cardType, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? createDate, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson)  List<CyclicConfig> cyclicConfig)?  $default,) {final _that = this;
switch (_that) {
case _IdentityCardDto() when $default != null:
return $default(_that.cardId,_that.lockId,_that.cardNumber,_that.cardName,_that.cardType,_that.startDate,_that.endDate,_that.createDate,_that.senderUsername,_that.cyclicConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdentityCardDto extends IdentityCardDto {
  const _IdentityCardDto({@JsonKey(name: 'cardId', fromJson: intFromDynamic) this.cardId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'cardNumber', fromJson: stringFromDynamic) this.cardNumber = '', @JsonKey(name: 'cardName') this.cardName = '', @JsonKey(name: 'cardType', fromJson: intFromDynamic) this.cardType = 1, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.endDate, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.createDate, @JsonKey(name: 'senderUsername') this.senderUsername = '', @JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson) final  List<CyclicConfig> cyclicConfig = const []}): _cyclicConfig = cyclicConfig,super._();
  factory _IdentityCardDto.fromJson(Map<String, dynamic> json) => _$IdentityCardDtoFromJson(json);

@override@JsonKey(name: 'cardId', fromJson: intFromDynamic) final  int cardId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'cardNumber', fromJson: stringFromDynamic) final  String cardNumber;
@override@JsonKey(name: 'cardName') final  String cardName;
@override@JsonKey(name: 'cardType', fromJson: intFromDynamic) final  int cardType;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? endDate;
@override@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? createDate;
@override@JsonKey(name: 'senderUsername') final  String senderUsername;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson) List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}


/// Create a copy of IdentityCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityCardDtoCopyWith<_IdentityCardDto> get copyWith => __$IdentityCardDtoCopyWithImpl<_IdentityCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdentityCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityCardDto&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardId,lockId,cardNumber,cardName,cardType,startDate,endDate,createDate,senderUsername,const DeepCollectionEquality().hash(_cyclicConfig));

@override
String toString() {
  return 'IdentityCardDto(cardId: $cardId, lockId: $lockId, cardNumber: $cardNumber, cardName: $cardName, cardType: $cardType, startDate: $startDate, endDate: $endDate, createDate: $createDate, senderUsername: $senderUsername, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class _$IdentityCardDtoCopyWith<$Res> implements $IdentityCardDtoCopyWith<$Res> {
  factory _$IdentityCardDtoCopyWith(_IdentityCardDto value, $Res Function(_IdentityCardDto) _then) = __$IdentityCardDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cardId', fromJson: intFromDynamic) int cardId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'cardNumber', fromJson: stringFromDynamic) String cardNumber,@JsonKey(name: 'cardName') String cardName,@JsonKey(name: 'cardType', fromJson: intFromDynamic) int cardType,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? createDate,@JsonKey(name: 'senderUsername') String senderUsername,@JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson) List<CyclicConfig> cyclicConfig
});




}
/// @nodoc
class __$IdentityCardDtoCopyWithImpl<$Res>
    implements _$IdentityCardDtoCopyWith<$Res> {
  __$IdentityCardDtoCopyWithImpl(this._self, this._then);

  final _IdentityCardDto _self;
  final $Res Function(_IdentityCardDto) _then;

/// Create a copy of IdentityCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? lockId = null,Object? cardNumber = null,Object? cardName = null,Object? cardType = null,Object? startDate = freezed,Object? endDate = freezed,Object? createDate = freezed,Object? senderUsername = null,Object? cyclicConfig = null,}) {
  return _then(_IdentityCardDto(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardName: null == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,
  ));
}


}

// dart format on
