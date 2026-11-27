// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrCodeDto {

@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic) int get qrCodeId;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'type', fromJson: intFromDynamic) int get type;@JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic) String get qrCodeNumber;@JsonKey(name: 'name') String get name;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? get endDate;@JsonKey(name: 'refreshTime', fromJson: intFromDynamic) int get refreshTime;@JsonKey(name: 'cyclicConfig') List<CyclicConfig> get cyclicConfig;@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? get createDate;@JsonKey(name: 'status', fromJson: intFromDynamic) int get status;@JsonKey(name: 'creator') String get creator;@JsonKey(name: 'link', fromJson: stringFromDynamic) String get link;@JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic) int get qrCodeVersion;@JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic) String get qrCodeContent;
/// Create a copy of QrCodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrCodeDtoCopyWith<QrCodeDto> get copyWith => _$QrCodeDtoCopyWithImpl<QrCodeDto>(this as QrCodeDto, _$identity);

  /// Serializes this QrCodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrCodeDto&&(identical(other.qrCodeId, qrCodeId) || other.qrCodeId == qrCodeId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.type, type) || other.type == type)&&(identical(other.qrCodeNumber, qrCodeNumber) || other.qrCodeNumber == qrCodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.refreshTime, refreshTime) || other.refreshTime == refreshTime)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.link, link) || other.link == link)&&(identical(other.qrCodeVersion, qrCodeVersion) || other.qrCodeVersion == qrCodeVersion)&&(identical(other.qrCodeContent, qrCodeContent) || other.qrCodeContent == qrCodeContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrCodeId,lockId,type,qrCodeNumber,name,startDate,endDate,refreshTime,const DeepCollectionEquality().hash(cyclicConfig),createDate,status,creator,link,qrCodeVersion,qrCodeContent);

@override
String toString() {
  return 'QrCodeDto(qrCodeId: $qrCodeId, lockId: $lockId, type: $type, qrCodeNumber: $qrCodeNumber, name: $name, startDate: $startDate, endDate: $endDate, refreshTime: $refreshTime, cyclicConfig: $cyclicConfig, createDate: $createDate, status: $status, creator: $creator, link: $link, qrCodeVersion: $qrCodeVersion, qrCodeContent: $qrCodeContent)';
}


}

/// @nodoc
abstract mixin class $QrCodeDtoCopyWith<$Res>  {
  factory $QrCodeDtoCopyWith(QrCodeDto value, $Res Function(QrCodeDto) _then) = _$QrCodeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic) int qrCodeId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'type', fromJson: intFromDynamic) int type,@JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic) String qrCodeNumber,@JsonKey(name: 'name') String name,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'refreshTime', fromJson: intFromDynamic) int refreshTime,@JsonKey(name: 'cyclicConfig') List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate,@JsonKey(name: 'status', fromJson: intFromDynamic) int status,@JsonKey(name: 'creator') String creator,@JsonKey(name: 'link', fromJson: stringFromDynamic) String link,@JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic) int qrCodeVersion,@JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic) String qrCodeContent
});




}
/// @nodoc
class _$QrCodeDtoCopyWithImpl<$Res>
    implements $QrCodeDtoCopyWith<$Res> {
  _$QrCodeDtoCopyWithImpl(this._self, this._then);

  final QrCodeDto _self;
  final $Res Function(QrCodeDto) _then;

/// Create a copy of QrCodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrCodeId = null,Object? lockId = null,Object? type = null,Object? qrCodeNumber = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? refreshTime = null,Object? cyclicConfig = null,Object? createDate = freezed,Object? status = null,Object? creator = null,Object? link = null,Object? qrCodeVersion = null,Object? qrCodeContent = null,}) {
  return _then(_self.copyWith(
qrCodeId: null == qrCodeId ? _self.qrCodeId : qrCodeId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,qrCodeNumber: null == qrCodeNumber ? _self.qrCodeNumber : qrCodeNumber // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [QrCodeDto].
extension QrCodeDtoPatterns on QrCodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrCodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrCodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrCodeDto value)  $default,){
final _that = this;
switch (_that) {
case _QrCodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrCodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _QrCodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic)  int qrCodeId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'type', fromJson: intFromDynamic)  int type, @JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic)  String qrCodeNumber, @JsonKey(name: 'name')  String name, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'refreshTime', fromJson: intFromDynamic)  int refreshTime, @JsonKey(name: 'cyclicConfig')  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'status', fromJson: intFromDynamic)  int status, @JsonKey(name: 'creator')  String creator, @JsonKey(name: 'link', fromJson: stringFromDynamic)  String link, @JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic)  int qrCodeVersion, @JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic)  String qrCodeContent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrCodeDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic)  int qrCodeId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'type', fromJson: intFromDynamic)  int type, @JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic)  String qrCodeNumber, @JsonKey(name: 'name')  String name, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'refreshTime', fromJson: intFromDynamic)  int refreshTime, @JsonKey(name: 'cyclicConfig')  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'status', fromJson: intFromDynamic)  int status, @JsonKey(name: 'creator')  String creator, @JsonKey(name: 'link', fromJson: stringFromDynamic)  String link, @JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic)  int qrCodeVersion, @JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic)  String qrCodeContent)  $default,) {final _that = this;
switch (_that) {
case _QrCodeDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic)  int qrCodeId, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'type', fromJson: intFromDynamic)  int type, @JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic)  String qrCodeNumber, @JsonKey(name: 'name')  String name, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)  DateTime? endDate, @JsonKey(name: 'refreshTime', fromJson: intFromDynamic)  int refreshTime, @JsonKey(name: 'cyclicConfig')  List<CyclicConfig> cyclicConfig, @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)  DateTime? createDate, @JsonKey(name: 'status', fromJson: intFromDynamic)  int status, @JsonKey(name: 'creator')  String creator, @JsonKey(name: 'link', fromJson: stringFromDynamic)  String link, @JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic)  int qrCodeVersion, @JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic)  String qrCodeContent)?  $default,) {final _that = this;
switch (_that) {
case _QrCodeDto() when $default != null:
return $default(_that.qrCodeId,_that.lockId,_that.type,_that.qrCodeNumber,_that.name,_that.startDate,_that.endDate,_that.refreshTime,_that.cyclicConfig,_that.createDate,_that.status,_that.creator,_that.link,_that.qrCodeVersion,_that.qrCodeContent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrCodeDto extends QrCodeDto {
  const _QrCodeDto({@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic) this.qrCodeId = 0, @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'type', fromJson: intFromDynamic) this.type = 1, @JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic) this.qrCodeNumber = '', @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) this.endDate, @JsonKey(name: 'refreshTime', fromJson: intFromDynamic) this.refreshTime = 0, @JsonKey(name: 'cyclicConfig') final  List<CyclicConfig> cyclicConfig = const [], @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) this.createDate, @JsonKey(name: 'status', fromJson: intFromDynamic) this.status = 0, @JsonKey(name: 'creator') this.creator = '', @JsonKey(name: 'link', fromJson: stringFromDynamic) this.link = '', @JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic) this.qrCodeVersion = 0, @JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic) this.qrCodeContent = ''}): _cyclicConfig = cyclicConfig,super._();
  factory _QrCodeDto.fromJson(Map<String, dynamic> json) => _$QrCodeDtoFromJson(json);

@override@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic) final  int qrCodeId;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'type', fromJson: intFromDynamic) final  int type;
@override@JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic) final  String qrCodeNumber;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? endDate;
@override@JsonKey(name: 'refreshTime', fromJson: intFromDynamic) final  int refreshTime;
 final  List<CyclicConfig> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig') List<CyclicConfig> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}

@override@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) final  DateTime? createDate;
@override@JsonKey(name: 'status', fromJson: intFromDynamic) final  int status;
@override@JsonKey(name: 'creator') final  String creator;
@override@JsonKey(name: 'link', fromJson: stringFromDynamic) final  String link;
@override@JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic) final  int qrCodeVersion;
@override@JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic) final  String qrCodeContent;

/// Create a copy of QrCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrCodeDtoCopyWith<_QrCodeDto> get copyWith => __$QrCodeDtoCopyWithImpl<_QrCodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrCodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrCodeDto&&(identical(other.qrCodeId, qrCodeId) || other.qrCodeId == qrCodeId)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.type, type) || other.type == type)&&(identical(other.qrCodeNumber, qrCodeNumber) || other.qrCodeNumber == qrCodeNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.refreshTime, refreshTime) || other.refreshTime == refreshTime)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.link, link) || other.link == link)&&(identical(other.qrCodeVersion, qrCodeVersion) || other.qrCodeVersion == qrCodeVersion)&&(identical(other.qrCodeContent, qrCodeContent) || other.qrCodeContent == qrCodeContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrCodeId,lockId,type,qrCodeNumber,name,startDate,endDate,refreshTime,const DeepCollectionEquality().hash(_cyclicConfig),createDate,status,creator,link,qrCodeVersion,qrCodeContent);

@override
String toString() {
  return 'QrCodeDto(qrCodeId: $qrCodeId, lockId: $lockId, type: $type, qrCodeNumber: $qrCodeNumber, name: $name, startDate: $startDate, endDate: $endDate, refreshTime: $refreshTime, cyclicConfig: $cyclicConfig, createDate: $createDate, status: $status, creator: $creator, link: $link, qrCodeVersion: $qrCodeVersion, qrCodeContent: $qrCodeContent)';
}


}

/// @nodoc
abstract mixin class _$QrCodeDtoCopyWith<$Res> implements $QrCodeDtoCopyWith<$Res> {
  factory _$QrCodeDtoCopyWith(_QrCodeDto value, $Res Function(_QrCodeDto) _then) = __$QrCodeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'qrCodeId', fromJson: intFromDynamic) int qrCodeId,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'type', fromJson: intFromDynamic) int type,@JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic) String qrCodeNumber,@JsonKey(name: 'name') String name,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson) DateTime? endDate,@JsonKey(name: 'refreshTime', fromJson: intFromDynamic) int refreshTime,@JsonKey(name: 'cyclicConfig') List<CyclicConfig> cyclicConfig,@JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson) DateTime? createDate,@JsonKey(name: 'status', fromJson: intFromDynamic) int status,@JsonKey(name: 'creator') String creator,@JsonKey(name: 'link', fromJson: stringFromDynamic) String link,@JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic) int qrCodeVersion,@JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic) String qrCodeContent
});




}
/// @nodoc
class __$QrCodeDtoCopyWithImpl<$Res>
    implements _$QrCodeDtoCopyWith<$Res> {
  __$QrCodeDtoCopyWithImpl(this._self, this._then);

  final _QrCodeDto _self;
  final $Res Function(_QrCodeDto) _then;

/// Create a copy of QrCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrCodeId = null,Object? lockId = null,Object? type = null,Object? qrCodeNumber = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? refreshTime = null,Object? cyclicConfig = null,Object? createDate = freezed,Object? status = null,Object? creator = null,Object? link = null,Object? qrCodeVersion = null,Object? qrCodeContent = null,}) {
  return _then(_QrCodeDto(
qrCodeId: null == qrCodeId ? _self.qrCodeId : qrCodeId // ignore: cast_nullable_to_non_nullable
as int,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,qrCodeNumber: null == qrCodeNumber ? _self.qrCodeNumber : qrCodeNumber // ignore: cast_nullable_to_non_nullable
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
