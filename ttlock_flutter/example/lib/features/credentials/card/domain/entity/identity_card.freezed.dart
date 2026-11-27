// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identity_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IdentityCardEntity {

 int get cardId; int get lockId; String get cardNumber; String get cardName; CredentialType get cardType; DateTime? get startDate; DateTime? get endDate; DateTime? get createDate; String get senderUsername; List<CyclicConfig> get cyclicConfig;
/// Create a copy of IdentityCardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityCardEntityCopyWith<IdentityCardEntity> get copyWith => _$IdentityCardEntityCopyWithImpl<IdentityCardEntity>(this as IdentityCardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityCardEntity&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig));
}


@override
int get hashCode => Object.hash(runtimeType,cardId,lockId,cardNumber,cardName,cardType,startDate,endDate,createDate,senderUsername,const DeepCollectionEquality().hash(cyclicConfig));

@override
String toString() {
  return 'IdentityCardEntity(cardId: $cardId, lockId: $lockId, cardNumber: $cardNumber, cardName: $cardName, cardType: $cardType, startDate: $startDate, endDate: $endDate, createDate: $createDate, senderUsername: $senderUsername, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class $IdentityCardEntityCopyWith<$Res>  {
  factory $IdentityCardEntityCopyWith(IdentityCardEntity value, $Res Function(IdentityCardEntity) _then) = _$IdentityCardEntityCopyWithImpl;
@useResult
$Res call({
 int cardId, int lockId, String cardNumber, String cardName, CredentialType cardType, DateTime? startDate, DateTime? endDate, DateTime? createDate, String senderUsername, List<CyclicConfig> cyclicConfig
});




}
/// @nodoc
class _$IdentityCardEntityCopyWithImpl<$Res>
    implements $IdentityCardEntityCopyWith<$Res> {
  _$IdentityCardEntityCopyWithImpl(this._self, this._then);

  final IdentityCardEntity _self;
  final $Res Function(IdentityCardEntity) _then;

/// Create a copy of IdentityCardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardId = null,Object? lockId = null,Object? cardNumber = null,Object? cardName = null,Object? cardType = null,Object? startDate = freezed,Object? endDate = freezed,Object? createDate = freezed,Object? senderUsername = null,Object? cyclicConfig = null,}) {
  return _then(_self.copyWith(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardName: null == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as CredentialType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,
  ));
}

}


/// Adds pattern-matching-related methods to [IdentityCardEntity].
extension IdentityCardEntityPatterns on IdentityCardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityCardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityCardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityCardEntity value)  $default,){
final _that = this;
switch (_that) {
case _IdentityCardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityCardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityCardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cardId,  int lockId,  String cardNumber,  String cardName,  CredentialType cardType,  DateTime? startDate,  DateTime? endDate,  DateTime? createDate,  String senderUsername,  List<CyclicConfig> cyclicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityCardEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cardId,  int lockId,  String cardNumber,  String cardName,  CredentialType cardType,  DateTime? startDate,  DateTime? endDate,  DateTime? createDate,  String senderUsername,  List<CyclicConfig> cyclicConfig)  $default,) {final _that = this;
switch (_that) {
case _IdentityCardEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cardId,  int lockId,  String cardNumber,  String cardName,  CredentialType cardType,  DateTime? startDate,  DateTime? endDate,  DateTime? createDate,  String senderUsername,  List<CyclicConfig> cyclicConfig)?  $default,) {final _that = this;
switch (_that) {
case _IdentityCardEntity() when $default != null:
return $default(_that.cardId,_that.lockId,_that.cardNumber,_that.cardName,_that.cardType,_that.startDate,_that.endDate,_that.createDate,_that.senderUsername,_that.cyclicConfig);case _:
  return null;

}
}

}

/// @nodoc


class _IdentityCardEntity extends IdentityCardEntity {
  const _IdentityCardEntity({this.cardId = 0, this.lockId = 0, this.cardNumber = '', this.cardName = '', this.cardType = CredentialType.normal, this.startDate, this.endDate, this.createDate, this.senderUsername = '', final  List<CyclicConfig> cyclicConfig = const []}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int cardId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  String cardNumber;
@override@JsonKey() final  String cardName;
@override@JsonKey() final  CredentialType cardType;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? createDate;
@override@JsonKey() final  String senderUsername;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}


/// Create a copy of IdentityCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityCardEntityCopyWith<_IdentityCardEntity> get copyWith => __$IdentityCardEntityCopyWithImpl<_IdentityCardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityCardEntity&&(identical(other.cardId, cardId) || other.cardId == cardId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.cardType, cardType) || other.cardType == cardType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig));
}


@override
int get hashCode => Object.hash(runtimeType,cardId,lockId,cardNumber,cardName,cardType,startDate,endDate,createDate,senderUsername,const DeepCollectionEquality().hash(_cyclicConfig));

@override
String toString() {
  return 'IdentityCardEntity(cardId: $cardId, lockId: $lockId, cardNumber: $cardNumber, cardName: $cardName, cardType: $cardType, startDate: $startDate, endDate: $endDate, createDate: $createDate, senderUsername: $senderUsername, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class _$IdentityCardEntityCopyWith<$Res> implements $IdentityCardEntityCopyWith<$Res> {
  factory _$IdentityCardEntityCopyWith(_IdentityCardEntity value, $Res Function(_IdentityCardEntity) _then) = __$IdentityCardEntityCopyWithImpl;
@override @useResult
$Res call({
 int cardId, int lockId, String cardNumber, String cardName, CredentialType cardType, DateTime? startDate, DateTime? endDate, DateTime? createDate, String senderUsername, List<CyclicConfig> cyclicConfig
});




}
/// @nodoc
class __$IdentityCardEntityCopyWithImpl<$Res>
    implements _$IdentityCardEntityCopyWith<$Res> {
  __$IdentityCardEntityCopyWithImpl(this._self, this._then);

  final _IdentityCardEntity _self;
  final $Res Function(_IdentityCardEntity) _then;

/// Create a copy of IdentityCardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardId = null,Object? lockId = null,Object? cardNumber = null,Object? cardName = null,Object? cardType = null,Object? startDate = freezed,Object? endDate = freezed,Object? createDate = freezed,Object? senderUsername = null,Object? cyclicConfig = null,}) {
  return _then(_IdentityCardEntity(
cardId: null == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardName: null == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String,cardType: null == cardType ? _self.cardType : cardType // ignore: cast_nullable_to_non_nullable
as CredentialType,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,
  ));
}


}

// dart format on
