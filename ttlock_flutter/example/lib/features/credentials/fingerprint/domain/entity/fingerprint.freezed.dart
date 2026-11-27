// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fingerprint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FingerprintEntity {

 int get fingerprintId; int get lockId; String get fingerprintNumber; CredentialType get fingerprintType; String get fingerprintName; DateTime? get startDate; DateTime? get endDate; List<CyclicConfig> get cyclicConfig; DateTime? get createDate; String get senderUsername;
/// Create a copy of FingerprintEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerprintEntityCopyWith<FingerprintEntity> get copyWith => _$FingerprintEntityCopyWithImpl<FingerprintEntity>(this as FingerprintEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FingerprintEntity&&(identical(other.fingerprintId, fingerprintId) || other.fingerprintId == fingerprintId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.fingerprintNumber, fingerprintNumber) || other.fingerprintNumber == fingerprintNumber)&&(identical(other.fingerprintType, fingerprintType) || other.fingerprintType == fingerprintType)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}


@override
int get hashCode => Object.hash(runtimeType,fingerprintId,lockId,fingerprintNumber,fingerprintType,fingerprintName,startDate,endDate,const DeepCollectionEquality().hash(cyclicConfig),createDate,senderUsername);

@override
String toString() {
  return 'FingerprintEntity(fingerprintId: $fingerprintId, lockId: $lockId, fingerprintNumber: $fingerprintNumber, fingerprintType: $fingerprintType, fingerprintName: $fingerprintName, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class $FingerprintEntityCopyWith<$Res>  {
  factory $FingerprintEntityCopyWith(FingerprintEntity value, $Res Function(FingerprintEntity) _then) = _$FingerprintEntityCopyWithImpl;
@useResult
$Res call({
 int fingerprintId, int lockId, String fingerprintNumber, CredentialType fingerprintType, String fingerprintName, DateTime? startDate, DateTime? endDate, List<CyclicConfig> cyclicConfig, DateTime? createDate, String senderUsername
});




}
/// @nodoc
class _$FingerprintEntityCopyWithImpl<$Res>
    implements $FingerprintEntityCopyWith<$Res> {
  _$FingerprintEntityCopyWithImpl(this._self, this._then);

  final FingerprintEntity _self;
  final $Res Function(FingerprintEntity) _then;

/// Create a copy of FingerprintEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fingerprintId = null,Object? lockId = null,Object? fingerprintNumber = null,Object? fingerprintType = null,Object? fingerprintName = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,Object? senderUsername = null,}) {
  return _then(_self.copyWith(
fingerprintId: null == fingerprintId ? _self.fingerprintId : fingerprintId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,fingerprintNumber: null == fingerprintNumber ? _self.fingerprintNumber : fingerprintNumber // ignore: cast_nullable_to_non_nullable
as String,fingerprintType: null == fingerprintType ? _self.fingerprintType : fingerprintType // ignore: cast_nullable_to_non_nullable
as CredentialType,fingerprintName: null == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FingerprintEntity].
extension FingerprintEntityPatterns on FingerprintEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FingerprintEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FingerprintEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FingerprintEntity value)  $default,){
final _that = this;
switch (_that) {
case _FingerprintEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FingerprintEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FingerprintEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int fingerprintId,  int lockId,  String fingerprintNumber,  CredentialType fingerprintType,  String fingerprintName,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  String senderUsername)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FingerprintEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int fingerprintId,  int lockId,  String fingerprintNumber,  CredentialType fingerprintType,  String fingerprintName,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  String senderUsername)  $default,) {final _that = this;
switch (_that) {
case _FingerprintEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int fingerprintId,  int lockId,  String fingerprintNumber,  CredentialType fingerprintType,  String fingerprintName,  DateTime? startDate,  DateTime? endDate,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  String senderUsername)?  $default,) {final _that = this;
switch (_that) {
case _FingerprintEntity() when $default != null:
return $default(_that.fingerprintId,_that.lockId,_that.fingerprintNumber,_that.fingerprintType,_that.fingerprintName,_that.startDate,_that.endDate,_that.cyclicConfig,_that.createDate,_that.senderUsername);case _:
  return null;

}
}

}

/// @nodoc


class _FingerprintEntity extends FingerprintEntity {
  const _FingerprintEntity({this.fingerprintId = 0, this.lockId = 0, this.fingerprintNumber = '', this.fingerprintType = CredentialType.normal, this.fingerprintName = '', this.startDate, this.endDate, final  List<CyclicConfig> cyclicConfig = const [], this.createDate, this.senderUsername = ''}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int fingerprintId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  String fingerprintNumber;
@override@JsonKey() final  CredentialType fingerprintType;
@override@JsonKey() final  String fingerprintName;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override final  DateTime? createDate;
@override@JsonKey() final  String senderUsername;

/// Create a copy of FingerprintEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FingerprintEntityCopyWith<_FingerprintEntity> get copyWith => __$FingerprintEntityCopyWithImpl<_FingerprintEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FingerprintEntity&&(identical(other.fingerprintId, fingerprintId) || other.fingerprintId == fingerprintId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.fingerprintNumber, fingerprintNumber) || other.fingerprintNumber == fingerprintNumber)&&(identical(other.fingerprintType, fingerprintType) || other.fingerprintType == fingerprintType)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername));
}


@override
int get hashCode => Object.hash(runtimeType,fingerprintId,lockId,fingerprintNumber,fingerprintType,fingerprintName,startDate,endDate,const DeepCollectionEquality().hash(_cyclicConfig),createDate,senderUsername);

@override
String toString() {
  return 'FingerprintEntity(fingerprintId: $fingerprintId, lockId: $lockId, fingerprintNumber: $fingerprintNumber, fingerprintType: $fingerprintType, fingerprintName: $fingerprintName, startDate: $startDate, endDate: $endDate, cyclicConfig: $cyclicConfig, createDate: $createDate, senderUsername: $senderUsername)';
}


}

/// @nodoc
abstract mixin class _$FingerprintEntityCopyWith<$Res> implements $FingerprintEntityCopyWith<$Res> {
  factory _$FingerprintEntityCopyWith(_FingerprintEntity value, $Res Function(_FingerprintEntity) _then) = __$FingerprintEntityCopyWithImpl;
@override @useResult
$Res call({
 int fingerprintId, int lockId, String fingerprintNumber, CredentialType fingerprintType, String fingerprintName, DateTime? startDate, DateTime? endDate, List<CyclicConfig> cyclicConfig, DateTime? createDate, String senderUsername
});




}
/// @nodoc
class __$FingerprintEntityCopyWithImpl<$Res>
    implements _$FingerprintEntityCopyWith<$Res> {
  __$FingerprintEntityCopyWithImpl(this._self, this._then);

  final _FingerprintEntity _self;
  final $Res Function(_FingerprintEntity) _then;

/// Create a copy of FingerprintEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fingerprintId = null,Object? lockId = null,Object? fingerprintNumber = null,Object? fingerprintType = null,Object? fingerprintName = null,Object? startDate = freezed,Object? endDate = freezed,Object? cyclicConfig = null,Object? createDate = freezed,Object? senderUsername = null,}) {
  return _then(_FingerprintEntity(
fingerprintId: null == fingerprintId ? _self.fingerprintId : fingerprintId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,fingerprintNumber: null == fingerprintNumber ? _self.fingerprintNumber : fingerprintNumber // ignore: cast_nullable_to_non_nullable
as String,fingerprintType: null == fingerprintType ? _self.fingerprintType : fingerprintType // ignore: cast_nullable_to_non_nullable
as CredentialType,fingerprintName: null == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
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
