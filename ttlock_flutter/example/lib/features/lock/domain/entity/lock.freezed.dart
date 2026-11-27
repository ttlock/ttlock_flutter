// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockEntity {

 int get lockId; String get lockName; String get lockAlias; String get lockMac; int get electricQuantity; String get featureValue; bool get hasGateway; String get lockData; int get groupId; String get groupName; DateTime? get initDate;
/// Create a copy of LockEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockEntityCopyWith<LockEntity> get copyWith => _$LockEntityCopyWithImpl<LockEntity>(this as LockEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockEntity&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,groupId,groupName,initDate);

@override
String toString() {
  return 'LockEntity(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class $LockEntityCopyWith<$Res>  {
  factory $LockEntityCopyWith(LockEntity value, $Res Function(LockEntity) _then) = _$LockEntityCopyWithImpl;
@useResult
$Res call({
 int lockId, String lockName, String lockAlias, String lockMac, int electricQuantity, String featureValue, bool hasGateway, String lockData, int groupId, String groupName, DateTime? initDate
});




}
/// @nodoc
class _$LockEntityCopyWithImpl<$Res>
    implements $LockEntityCopyWith<$Res> {
  _$LockEntityCopyWithImpl(this._self, this._then);

  final LockEntity _self;
  final $Res Function(LockEntity) _then;

/// Create a copy of LockEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as bool,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LockEntity].
extension LockEntityPatterns on LockEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockEntity value)  $default,){
final _that = this;
switch (_that) {
case _LockEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LockEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  int groupId,  String groupName,  DateTime? initDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockEntity() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  int groupId,  String groupName,  DateTime? initDate)  $default,) {final _that = this;
switch (_that) {
case _LockEntity():
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  int groupId,  String groupName,  DateTime? initDate)?  $default,) {final _that = this;
switch (_that) {
case _LockEntity() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate);case _:
  return null;

}
}

}

/// @nodoc


class _LockEntity extends LockEntity {
  const _LockEntity({this.lockId = 0, this.lockName = '', this.lockAlias = '', this.lockMac = '', this.electricQuantity = 0, this.featureValue = '', this.hasGateway = false, this.lockData = '', this.groupId = 0, this.groupName = '', this.initDate}): super._();
  

@override@JsonKey() final  int lockId;
@override@JsonKey() final  String lockName;
@override@JsonKey() final  String lockAlias;
@override@JsonKey() final  String lockMac;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  bool hasGateway;
@override@JsonKey() final  String lockData;
@override@JsonKey() final  int groupId;
@override@JsonKey() final  String groupName;
@override final  DateTime? initDate;

/// Create a copy of LockEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockEntityCopyWith<_LockEntity> get copyWith => __$LockEntityCopyWithImpl<_LockEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockEntity&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,groupId,groupName,initDate);

@override
String toString() {
  return 'LockEntity(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class _$LockEntityCopyWith<$Res> implements $LockEntityCopyWith<$Res> {
  factory _$LockEntityCopyWith(_LockEntity value, $Res Function(_LockEntity) _then) = __$LockEntityCopyWithImpl;
@override @useResult
$Res call({
 int lockId, String lockName, String lockAlias, String lockMac, int electricQuantity, String featureValue, bool hasGateway, String lockData, int groupId, String groupName, DateTime? initDate
});




}
/// @nodoc
class __$LockEntityCopyWithImpl<$Res>
    implements _$LockEntityCopyWith<$Res> {
  __$LockEntityCopyWithImpl(this._self, this._then);

  final _LockEntity _self;
  final $Res Function(_LockEntity) _then;

/// Create a copy of LockEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_LockEntity(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as bool,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$LockInitializeResult {

 int get lockId; String get keyId;
/// Create a copy of LockInitializeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockInitializeResultCopyWith<LockInitializeResult> get copyWith => _$LockInitializeResultCopyWithImpl<LockInitializeResult>(this as LockInitializeResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockInitializeResult&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyId, keyId) || other.keyId == keyId));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,keyId);

@override
String toString() {
  return 'LockInitializeResult(lockId: $lockId, keyId: $keyId)';
}


}

/// @nodoc
abstract mixin class $LockInitializeResultCopyWith<$Res>  {
  factory $LockInitializeResultCopyWith(LockInitializeResult value, $Res Function(LockInitializeResult) _then) = _$LockInitializeResultCopyWithImpl;
@useResult
$Res call({
 int lockId, String keyId
});




}
/// @nodoc
class _$LockInitializeResultCopyWithImpl<$Res>
    implements $LockInitializeResultCopyWith<$Res> {
  _$LockInitializeResultCopyWithImpl(this._self, this._then);

  final LockInitializeResult _self;
  final $Res Function(LockInitializeResult) _then;

/// Create a copy of LockInitializeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? keyId = null,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LockInitializeResult].
extension LockInitializeResultPatterns on LockInitializeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockInitializeResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockInitializeResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockInitializeResult value)  $default,){
final _that = this;
switch (_that) {
case _LockInitializeResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockInitializeResult value)?  $default,){
final _that = this;
switch (_that) {
case _LockInitializeResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int lockId,  String keyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockInitializeResult() when $default != null:
return $default(_that.lockId,_that.keyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int lockId,  String keyId)  $default,) {final _that = this;
switch (_that) {
case _LockInitializeResult():
return $default(_that.lockId,_that.keyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int lockId,  String keyId)?  $default,) {final _that = this;
switch (_that) {
case _LockInitializeResult() when $default != null:
return $default(_that.lockId,_that.keyId);case _:
  return null;

}
}

}

/// @nodoc


class _LockInitializeResult implements LockInitializeResult {
  const _LockInitializeResult({this.lockId = 0, this.keyId = ''});
  

@override@JsonKey() final  int lockId;
@override@JsonKey() final  String keyId;

/// Create a copy of LockInitializeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockInitializeResultCopyWith<_LockInitializeResult> get copyWith => __$LockInitializeResultCopyWithImpl<_LockInitializeResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockInitializeResult&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyId, keyId) || other.keyId == keyId));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,keyId);

@override
String toString() {
  return 'LockInitializeResult(lockId: $lockId, keyId: $keyId)';
}


}

/// @nodoc
abstract mixin class _$LockInitializeResultCopyWith<$Res> implements $LockInitializeResultCopyWith<$Res> {
  factory _$LockInitializeResultCopyWith(_LockInitializeResult value, $Res Function(_LockInitializeResult) _then) = __$LockInitializeResultCopyWithImpl;
@override @useResult
$Res call({
 int lockId, String keyId
});




}
/// @nodoc
class __$LockInitializeResultCopyWithImpl<$Res>
    implements _$LockInitializeResultCopyWith<$Res> {
  __$LockInitializeResultCopyWithImpl(this._self, this._then);

  final _LockInitializeResult _self;
  final $Res Function(_LockInitializeResult) _then;

/// Create a copy of LockInitializeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? keyId = null,}) {
  return _then(_LockInitializeResult(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LockSystemInfoResult {

 LockEntity get lock; String get modelNum; String get hardwareRevision; String get firmwareRevision; String get nbOperator; String get nbNodeId; String get nbCardNumber; String get nbRssi;
/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockSystemInfoResultCopyWith<LockSystemInfoResult> get copyWith => _$LockSystemInfoResultCopyWithImpl<LockSystemInfoResult>(this as LockSystemInfoResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockSystemInfoResult&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi));
}


@override
int get hashCode => Object.hash(runtimeType,lock,modelNum,hardwareRevision,firmwareRevision,nbOperator,nbNodeId,nbCardNumber,nbRssi);

@override
String toString() {
  return 'LockSystemInfoResult(lock: $lock, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, nbOperator: $nbOperator, nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbRssi: $nbRssi)';
}


}

/// @nodoc
abstract mixin class $LockSystemInfoResultCopyWith<$Res>  {
  factory $LockSystemInfoResultCopyWith(LockSystemInfoResult value, $Res Function(LockSystemInfoResult) _then) = _$LockSystemInfoResultCopyWithImpl;
@useResult
$Res call({
 LockEntity lock, String modelNum, String hardwareRevision, String firmwareRevision, String nbOperator, String nbNodeId, String nbCardNumber, String nbRssi
});


$LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class _$LockSystemInfoResultCopyWithImpl<$Res>
    implements $LockSystemInfoResultCopyWith<$Res> {
  _$LockSystemInfoResultCopyWithImpl(this._self, this._then);

  final LockSystemInfoResult _self;
  final $Res Function(LockSystemInfoResult) _then;

/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? nbOperator = null,Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbRssi = null,}) {
  return _then(_self.copyWith(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res> get lock {
  
  return $LockEntityCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockSystemInfoResult].
extension LockSystemInfoResultPatterns on LockSystemInfoResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockSystemInfoResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockSystemInfoResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockSystemInfoResult value)  $default,){
final _that = this;
switch (_that) {
case _LockSystemInfoResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockSystemInfoResult value)?  $default,){
final _that = this;
switch (_that) {
case _LockSystemInfoResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LockEntity lock,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String nbOperator,  String nbNodeId,  String nbCardNumber,  String nbRssi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockSystemInfoResult() when $default != null:
return $default(_that.lock,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.nbOperator,_that.nbNodeId,_that.nbCardNumber,_that.nbRssi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LockEntity lock,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String nbOperator,  String nbNodeId,  String nbCardNumber,  String nbRssi)  $default,) {final _that = this;
switch (_that) {
case _LockSystemInfoResult():
return $default(_that.lock,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.nbOperator,_that.nbNodeId,_that.nbCardNumber,_that.nbRssi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LockEntity lock,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String nbOperator,  String nbNodeId,  String nbCardNumber,  String nbRssi)?  $default,) {final _that = this;
switch (_that) {
case _LockSystemInfoResult() when $default != null:
return $default(_that.lock,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.nbOperator,_that.nbNodeId,_that.nbCardNumber,_that.nbRssi);case _:
  return null;

}
}

}

/// @nodoc


class _LockSystemInfoResult implements LockSystemInfoResult {
  const _LockSystemInfoResult({required this.lock, this.modelNum = '', this.hardwareRevision = '', this.firmwareRevision = '', this.nbOperator = '', this.nbNodeId = '', this.nbCardNumber = '', this.nbRssi = ''});
  

@override final  LockEntity lock;
@override@JsonKey() final  String modelNum;
@override@JsonKey() final  String hardwareRevision;
@override@JsonKey() final  String firmwareRevision;
@override@JsonKey() final  String nbOperator;
@override@JsonKey() final  String nbNodeId;
@override@JsonKey() final  String nbCardNumber;
@override@JsonKey() final  String nbRssi;

/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockSystemInfoResultCopyWith<_LockSystemInfoResult> get copyWith => __$LockSystemInfoResultCopyWithImpl<_LockSystemInfoResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockSystemInfoResult&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi));
}


@override
int get hashCode => Object.hash(runtimeType,lock,modelNum,hardwareRevision,firmwareRevision,nbOperator,nbNodeId,nbCardNumber,nbRssi);

@override
String toString() {
  return 'LockSystemInfoResult(lock: $lock, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, nbOperator: $nbOperator, nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbRssi: $nbRssi)';
}


}

/// @nodoc
abstract mixin class _$LockSystemInfoResultCopyWith<$Res> implements $LockSystemInfoResultCopyWith<$Res> {
  factory _$LockSystemInfoResultCopyWith(_LockSystemInfoResult value, $Res Function(_LockSystemInfoResult) _then) = __$LockSystemInfoResultCopyWithImpl;
@override @useResult
$Res call({
 LockEntity lock, String modelNum, String hardwareRevision, String firmwareRevision, String nbOperator, String nbNodeId, String nbCardNumber, String nbRssi
});


@override $LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class __$LockSystemInfoResultCopyWithImpl<$Res>
    implements _$LockSystemInfoResultCopyWith<$Res> {
  __$LockSystemInfoResultCopyWithImpl(this._self, this._then);

  final _LockSystemInfoResult _self;
  final $Res Function(_LockSystemInfoResult) _then;

/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? nbOperator = null,Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbRssi = null,}) {
  return _then(_LockSystemInfoResult(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LockSystemInfoResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res> get lock {
  
  return $LockEntityCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}

// dart format on
