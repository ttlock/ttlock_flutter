// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrCodeEntity {

 int get qrCodeId; int get lockId; QrCodeType get type; String get qrCodeNumber; String get name; DateTime? get startDate; DateTime? get endDate; int get refreshTime; List<CyclicConfig> get cyclicConfig; DateTime? get createDate; int get status; String get creator; String get link; int get qrCodeVersion; String get qrCodeContent;
/// Create a copy of QrCodeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrCodeEntityCopyWith<QrCodeEntity> get copyWith => _$QrCodeEntityCopyWithImpl<QrCodeEntity>(this as QrCodeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrCodeEntity&&(identical(other.qrCodeId, qrCodeId) || other.qrCodeId == qrCodeId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.type, type) || other.type == type)&&(identical(other.qrCodeNumber, qrCodeNumber) || other.qrCodeNumber == qrCodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.refreshTime, refreshTime) || other.refreshTime == refreshTime)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.link, link) || other.link == link)&&(identical(other.qrCodeVersion, qrCodeVersion) || other.qrCodeVersion == qrCodeVersion)&&(identical(other.qrCodeContent, qrCodeContent) || other.qrCodeContent == qrCodeContent));
}


@override
int get hashCode => Object.hash(runtimeType,qrCodeId,lockId,type,qrCodeNumber,name,startDate,endDate,refreshTime,const DeepCollectionEquality().hash(cyclicConfig),createDate,status,creator,link,qrCodeVersion,qrCodeContent);

@override
String toString() {
  return 'QrCodeEntity(qrCodeId: $qrCodeId, lockId: $lockId, type: $type, qrCodeNumber: $qrCodeNumber, name: $name, startDate: $startDate, endDate: $endDate, refreshTime: $refreshTime, cyclicConfig: $cyclicConfig, createDate: $createDate, status: $status, creator: $creator, link: $link, qrCodeVersion: $qrCodeVersion, qrCodeContent: $qrCodeContent)';
}


}

/// @nodoc
abstract mixin class $QrCodeEntityCopyWith<$Res>  {
  factory $QrCodeEntityCopyWith(QrCodeEntity value, $Res Function(QrCodeEntity) _then) = _$QrCodeEntityCopyWithImpl;
@useResult
$Res call({
 int qrCodeId, int lockId, QrCodeType type, String qrCodeNumber, String name, DateTime? startDate, DateTime? endDate, int refreshTime, List<CyclicConfig> cyclicConfig, DateTime? createDate, int status, String creator, String link, int qrCodeVersion, String qrCodeContent
});




}
/// @nodoc
class _$QrCodeEntityCopyWithImpl<$Res>
    implements $QrCodeEntityCopyWith<$Res> {
  _$QrCodeEntityCopyWithImpl(this._self, this._then);

  final QrCodeEntity _self;
  final $Res Function(QrCodeEntity) _then;

/// Create a copy of QrCodeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrCodeId = null,Object? lockId = null,Object? type = null,Object? qrCodeNumber = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? refreshTime = null,Object? cyclicConfig = null,Object? createDate = freezed,Object? status = null,Object? creator = null,Object? link = null,Object? qrCodeVersion = null,Object? qrCodeContent = null,}) {
  return _then(_self.copyWith(
qrCodeId: null == qrCodeId ? _self.qrCodeId : qrCodeId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrCodeType,qrCodeNumber: null == qrCodeNumber ? _self.qrCodeNumber : qrCodeNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshTime: null == refreshTime ? _self.refreshTime : refreshTime // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,qrCodeVersion: null == qrCodeVersion ? _self.qrCodeVersion : qrCodeVersion // ignore: cast_nullable_to_non_nullable
as int,qrCodeContent: null == qrCodeContent ? _self.qrCodeContent : qrCodeContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QrCodeEntity].
extension QrCodeEntityPatterns on QrCodeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrCodeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrCodeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrCodeEntity value)  $default,){
final _that = this;
switch (_that) {
case _QrCodeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrCodeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _QrCodeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int qrCodeId,  int lockId,  QrCodeType type,  String qrCodeNumber,  String name,  DateTime? startDate,  DateTime? endDate,  int refreshTime,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  int status,  String creator,  String link,  int qrCodeVersion,  String qrCodeContent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrCodeEntity() when $default != null:
return $default(_that.qrCodeId,_that.lockId,_that.type,_that.qrCodeNumber,_that.name,_that.startDate,_that.endDate,_that.refreshTime,_that.cyclicConfig,_that.createDate,_that.status,_that.creator,_that.link,_that.qrCodeVersion,_that.qrCodeContent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int qrCodeId,  int lockId,  QrCodeType type,  String qrCodeNumber,  String name,  DateTime? startDate,  DateTime? endDate,  int refreshTime,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  int status,  String creator,  String link,  int qrCodeVersion,  String qrCodeContent)  $default,) {final _that = this;
switch (_that) {
case _QrCodeEntity():
return $default(_that.qrCodeId,_that.lockId,_that.type,_that.qrCodeNumber,_that.name,_that.startDate,_that.endDate,_that.refreshTime,_that.cyclicConfig,_that.createDate,_that.status,_that.creator,_that.link,_that.qrCodeVersion,_that.qrCodeContent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int qrCodeId,  int lockId,  QrCodeType type,  String qrCodeNumber,  String name,  DateTime? startDate,  DateTime? endDate,  int refreshTime,  List<CyclicConfig> cyclicConfig,  DateTime? createDate,  int status,  String creator,  String link,  int qrCodeVersion,  String qrCodeContent)?  $default,) {final _that = this;
switch (_that) {
case _QrCodeEntity() when $default != null:
return $default(_that.qrCodeId,_that.lockId,_that.type,_that.qrCodeNumber,_that.name,_that.startDate,_that.endDate,_that.refreshTime,_that.cyclicConfig,_that.createDate,_that.status,_that.creator,_that.link,_that.qrCodeVersion,_that.qrCodeContent);case _:
  return null;

}
}

}

/// @nodoc


class _QrCodeEntity extends QrCodeEntity {
  const _QrCodeEntity({this.qrCodeId = 0, this.lockId = 0, this.type = QrCodeType.limited, this.qrCodeNumber = '', this.name = '', this.startDate, this.endDate, this.refreshTime = 0, final  List<CyclicConfig> cyclicConfig = const [], this.createDate, this.status = 0, this.creator = '', this.link = '', this.qrCodeVersion = 0, this.qrCodeContent = ''}): _cyclicConfig = cyclicConfig,super._();
  

@override@JsonKey() final  int qrCodeId;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  QrCodeType type;
@override@JsonKey() final  String qrCodeNumber;
@override@JsonKey() final  String name;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  int refreshTime;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey() List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override final  DateTime? createDate;
@override@JsonKey() final  int status;
@override@JsonKey() final  String creator;
@override@JsonKey() final  String link;
@override@JsonKey() final  int qrCodeVersion;
@override@JsonKey() final  String qrCodeContent;

/// Create a copy of QrCodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrCodeEntityCopyWith<_QrCodeEntity> get copyWith => __$QrCodeEntityCopyWithImpl<_QrCodeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrCodeEntity&&(identical(other.qrCodeId, qrCodeId) || other.qrCodeId == qrCodeId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.type, type) || other.type == type)&&(identical(other.qrCodeNumber, qrCodeNumber) || other.qrCodeNumber == qrCodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.refreshTime, refreshTime) || other.refreshTime == refreshTime)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.link, link) || other.link == link)&&(identical(other.qrCodeVersion, qrCodeVersion) || other.qrCodeVersion == qrCodeVersion)&&(identical(other.qrCodeContent, qrCodeContent) || other.qrCodeContent == qrCodeContent));
}


@override
int get hashCode => Object.hash(runtimeType,qrCodeId,lockId,type,qrCodeNumber,name,startDate,endDate,refreshTime,const DeepCollectionEquality().hash(_cyclicConfig),createDate,status,creator,link,qrCodeVersion,qrCodeContent);

@override
String toString() {
  return 'QrCodeEntity(qrCodeId: $qrCodeId, lockId: $lockId, type: $type, qrCodeNumber: $qrCodeNumber, name: $name, startDate: $startDate, endDate: $endDate, refreshTime: $refreshTime, cyclicConfig: $cyclicConfig, createDate: $createDate, status: $status, creator: $creator, link: $link, qrCodeVersion: $qrCodeVersion, qrCodeContent: $qrCodeContent)';
}


}

/// @nodoc
abstract mixin class _$QrCodeEntityCopyWith<$Res> implements $QrCodeEntityCopyWith<$Res> {
  factory _$QrCodeEntityCopyWith(_QrCodeEntity value, $Res Function(_QrCodeEntity) _then) = __$QrCodeEntityCopyWithImpl;
@override @useResult
$Res call({
 int qrCodeId, int lockId, QrCodeType type, String qrCodeNumber, String name, DateTime? startDate, DateTime? endDate, int refreshTime, List<CyclicConfig> cyclicConfig, DateTime? createDate, int status, String creator, String link, int qrCodeVersion, String qrCodeContent
});




}
/// @nodoc
class __$QrCodeEntityCopyWithImpl<$Res>
    implements _$QrCodeEntityCopyWith<$Res> {
  __$QrCodeEntityCopyWithImpl(this._self, this._then);

  final _QrCodeEntity _self;
  final $Res Function(_QrCodeEntity) _then;

/// Create a copy of QrCodeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrCodeId = null,Object? lockId = null,Object? type = null,Object? qrCodeNumber = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? refreshTime = null,Object? cyclicConfig = null,Object? createDate = freezed,Object? status = null,Object? creator = null,Object? link = null,Object? qrCodeVersion = null,Object? qrCodeContent = null,}) {
  return _then(_QrCodeEntity(
qrCodeId: null == qrCodeId ? _self.qrCodeId : qrCodeId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QrCodeType,qrCodeNumber: null == qrCodeNumber ? _self.qrCodeNumber : qrCodeNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshTime: null == refreshTime ? _self.refreshTime : refreshTime // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<CyclicConfig>,createDate: freezed == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,qrCodeVersion: null == qrCodeVersion ? _self.qrCodeVersion : qrCodeVersion // ignore: cast_nullable_to_non_nullable
as int,qrCodeContent: null == qrCodeContent ? _self.qrCodeContent : qrCodeContent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
