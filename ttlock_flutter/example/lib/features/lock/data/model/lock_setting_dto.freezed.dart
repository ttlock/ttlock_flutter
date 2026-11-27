// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_setting_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExtraSettingDto {

@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic) int get flag;@JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic) int get count;@JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic) int get lockTime;@JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic) int get pwd;@JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic) int get card;@JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic) int get fingerprint;
/// Create a copy of ExtraSettingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraSettingDtoCopyWith<ExtraSettingDto> get copyWith => _$ExtraSettingDtoCopyWithImpl<ExtraSettingDto>(this as ExtraSettingDto, _$identity);

  /// Serializes this ExtraSettingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraSettingDto&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.count, count) || other.count == count)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.card, card) || other.card == card)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag,count,lockTime,pwd,card,fingerprint);

@override
String toString() {
  return 'ExtraSettingDto(flag: $flag, count: $count, lockTime: $lockTime, pwd: $pwd, card: $card, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class $ExtraSettingDtoCopyWith<$Res>  {
  factory $ExtraSettingDtoCopyWith(ExtraSettingDto value, $Res Function(ExtraSettingDto) _then) = _$ExtraSettingDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic) int flag,@JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic) int count,@JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic) int lockTime,@JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic) int pwd,@JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic) int card,@JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic) int fingerprint
});




}
/// @nodoc
class _$ExtraSettingDtoCopyWithImpl<$Res>
    implements $ExtraSettingDtoCopyWith<$Res> {
  _$ExtraSettingDtoCopyWithImpl(this._self, this._then);

  final ExtraSettingDto _self;
  final $Res Function(ExtraSettingDto) _then;

/// Create a copy of ExtraSettingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flag = null,Object? count = null,Object? lockTime = null,Object? pwd = null,Object? card = null,Object? fingerprint = null,}) {
  return _then(_self.copyWith(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as int,pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as int,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtraSettingDto].
extension ExtraSettingDtoPatterns on ExtraSettingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraSettingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraSettingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraSettingDto value)  $default,){
final _that = this;
switch (_that) {
case _ExtraSettingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraSettingDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraSettingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic)  int flag, @JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic)  int count, @JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic)  int lockTime, @JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic)  int pwd, @JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic)  int card, @JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic)  int fingerprint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraSettingDto() when $default != null:
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic)  int flag, @JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic)  int count, @JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic)  int lockTime, @JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic)  int pwd, @JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic)  int card, @JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic)  int fingerprint)  $default,) {final _that = this;
switch (_that) {
case _ExtraSettingDto():
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic)  int flag, @JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic)  int count, @JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic)  int lockTime, @JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic)  int pwd, @JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic)  int card, @JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic)  int fingerprint)?  $default,) {final _that = this;
switch (_that) {
case _ExtraSettingDto() when $default != null:
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtraSettingDto extends ExtraSettingDto {
  const _ExtraSettingDto({@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic) this.flag = 0, @JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic) this.count = 0, @JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic) this.lockTime = 0, @JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic) this.pwd = 0, @JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic) this.card = 0, @JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic) this.fingerprint = 0}): super._();
  factory _ExtraSettingDto.fromJson(Map<String, dynamic> json) => _$ExtraSettingDtoFromJson(json);

@override@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic) final  int flag;
@override@JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic) final  int count;
@override@JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic) final  int lockTime;
@override@JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic) final  int pwd;
@override@JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic) final  int card;
@override@JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic) final  int fingerprint;

/// Create a copy of ExtraSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraSettingDtoCopyWith<_ExtraSettingDto> get copyWith => __$ExtraSettingDtoCopyWithImpl<_ExtraSettingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtraSettingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraSettingDto&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.count, count) || other.count == count)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.card, card) || other.card == card)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flag,count,lockTime,pwd,card,fingerprint);

@override
String toString() {
  return 'ExtraSettingDto(flag: $flag, count: $count, lockTime: $lockTime, pwd: $pwd, card: $card, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class _$ExtraSettingDtoCopyWith<$Res> implements $ExtraSettingDtoCopyWith<$Res> {
  factory _$ExtraSettingDtoCopyWith(_ExtraSettingDto value, $Res Function(_ExtraSettingDto) _then) = __$ExtraSettingDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic) int flag,@JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic) int count,@JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic) int lockTime,@JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic) int pwd,@JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic) int card,@JsonKey(name: 'unauthorizedAttemptAlertFingerprint', fromJson: intFromDynamic) int fingerprint
});




}
/// @nodoc
class __$ExtraSettingDtoCopyWithImpl<$Res>
    implements _$ExtraSettingDtoCopyWith<$Res> {
  __$ExtraSettingDtoCopyWithImpl(this._self, this._then);

  final _ExtraSettingDto _self;
  final $Res Function(_ExtraSettingDto) _then;

/// Create a copy of ExtraSettingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flag = null,Object? count = null,Object? lockTime = null,Object? pwd = null,Object? card = null,Object? fingerprint = null,}) {
  return _then(_ExtraSettingDto(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as int,pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as int,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PassageModeConfigDto {

@JsonKey(name: 'passageMode', fromJson: intFromDynamic) int get passageMode;@JsonKey(name: 'startDate', fromJson: intFromDynamic) int get startDate;@JsonKey(name: 'endDate', fromJson: intFromDynamic) int get endDate;@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int get isAllDay;@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> get weekDays;@JsonKey(name: 'autoUnlock', fromJson: intFromDynamic) int get autoUnlock;
/// Create a copy of PassageModeConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassageModeConfigDtoCopyWith<PassageModeConfigDto> get copyWith => _$PassageModeConfigDtoCopyWithImpl<PassageModeConfigDto>(this as PassageModeConfigDto, _$identity);

  /// Serializes this PassageModeConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassageModeConfigDto&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&const DeepCollectionEquality().equals(other.weekDays, weekDays)&&(identical(other.autoUnlock, autoUnlock) || other.autoUnlock == autoUnlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passageMode,startDate,endDate,isAllDay,const DeepCollectionEquality().hash(weekDays),autoUnlock);

@override
String toString() {
  return 'PassageModeConfigDto(passageMode: $passageMode, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay, weekDays: $weekDays, autoUnlock: $autoUnlock)';
}


}

/// @nodoc
abstract mixin class $PassageModeConfigDtoCopyWith<$Res>  {
  factory $PassageModeConfigDtoCopyWith(PassageModeConfigDto value, $Res Function(PassageModeConfigDto) _then) = _$PassageModeConfigDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'passageMode', fromJson: intFromDynamic) int passageMode,@JsonKey(name: 'startDate', fromJson: intFromDynamic) int startDate,@JsonKey(name: 'endDate', fromJson: intFromDynamic) int endDate,@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int isAllDay,@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> weekDays,@JsonKey(name: 'autoUnlock', fromJson: intFromDynamic) int autoUnlock
});




}
/// @nodoc
class _$PassageModeConfigDtoCopyWithImpl<$Res>
    implements $PassageModeConfigDtoCopyWith<$Res> {
  _$PassageModeConfigDtoCopyWithImpl(this._self, this._then);

  final PassageModeConfigDto _self;
  final $Res Function(PassageModeConfigDto) _then;

/// Create a copy of PassageModeConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passageMode = null,Object? startDate = null,Object? endDate = null,Object? isAllDay = null,Object? weekDays = null,Object? autoUnlock = null,}) {
  return _then(_self.copyWith(
passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,autoUnlock: null == autoUnlock ? _self.autoUnlock : autoUnlock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PassageModeConfigDto].
extension PassageModeConfigDtoPatterns on PassageModeConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassageModeConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassageModeConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassageModeConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _PassageModeConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassageModeConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _PassageModeConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'passageMode', fromJson: intFromDynamic)  int passageMode, @JsonKey(name: 'startDate', fromJson: intFromDynamic)  int startDate, @JsonKey(name: 'endDate', fromJson: intFromDynamic)  int endDate, @JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays, @JsonKey(name: 'autoUnlock', fromJson: intFromDynamic)  int autoUnlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassageModeConfigDto() when $default != null:
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'passageMode', fromJson: intFromDynamic)  int passageMode, @JsonKey(name: 'startDate', fromJson: intFromDynamic)  int startDate, @JsonKey(name: 'endDate', fromJson: intFromDynamic)  int endDate, @JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays, @JsonKey(name: 'autoUnlock', fromJson: intFromDynamic)  int autoUnlock)  $default,) {final _that = this;
switch (_that) {
case _PassageModeConfigDto():
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'passageMode', fromJson: intFromDynamic)  int passageMode, @JsonKey(name: 'startDate', fromJson: intFromDynamic)  int startDate, @JsonKey(name: 'endDate', fromJson: intFromDynamic)  int endDate, @JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays, @JsonKey(name: 'autoUnlock', fromJson: intFromDynamic)  int autoUnlock)?  $default,) {final _that = this;
switch (_that) {
case _PassageModeConfigDto() when $default != null:
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassageModeConfigDto extends PassageModeConfigDto {
  const _PassageModeConfigDto({@JsonKey(name: 'passageMode', fromJson: intFromDynamic) this.passageMode = 2, @JsonKey(name: 'startDate', fromJson: intFromDynamic) this.startDate = 0, @JsonKey(name: 'endDate', fromJson: intFromDynamic) this.endDate = 0, @JsonKey(name: 'isAllDay', fromJson: intFromDynamic) this.isAllDay = 2, @JsonKey(name: 'weekDays', fromJson: intListFromJson) final  List<int> weekDays = const [], @JsonKey(name: 'autoUnlock', fromJson: intFromDynamic) this.autoUnlock = 2}): _weekDays = weekDays,super._();
  factory _PassageModeConfigDto.fromJson(Map<String, dynamic> json) => _$PassageModeConfigDtoFromJson(json);

@override@JsonKey(name: 'passageMode', fromJson: intFromDynamic) final  int passageMode;
@override@JsonKey(name: 'startDate', fromJson: intFromDynamic) final  int startDate;
@override@JsonKey(name: 'endDate', fromJson: intFromDynamic) final  int endDate;
@override@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) final  int isAllDay;
 final  List<int> _weekDays;
@override@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}

@override@JsonKey(name: 'autoUnlock', fromJson: intFromDynamic) final  int autoUnlock;

/// Create a copy of PassageModeConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassageModeConfigDtoCopyWith<_PassageModeConfigDto> get copyWith => __$PassageModeConfigDtoCopyWithImpl<_PassageModeConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassageModeConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassageModeConfigDto&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&const DeepCollectionEquality().equals(other._weekDays, _weekDays)&&(identical(other.autoUnlock, autoUnlock) || other.autoUnlock == autoUnlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passageMode,startDate,endDate,isAllDay,const DeepCollectionEquality().hash(_weekDays),autoUnlock);

@override
String toString() {
  return 'PassageModeConfigDto(passageMode: $passageMode, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay, weekDays: $weekDays, autoUnlock: $autoUnlock)';
}


}

/// @nodoc
abstract mixin class _$PassageModeConfigDtoCopyWith<$Res> implements $PassageModeConfigDtoCopyWith<$Res> {
  factory _$PassageModeConfigDtoCopyWith(_PassageModeConfigDto value, $Res Function(_PassageModeConfigDto) _then) = __$PassageModeConfigDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'passageMode', fromJson: intFromDynamic) int passageMode,@JsonKey(name: 'startDate', fromJson: intFromDynamic) int startDate,@JsonKey(name: 'endDate', fromJson: intFromDynamic) int endDate,@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int isAllDay,@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> weekDays,@JsonKey(name: 'autoUnlock', fromJson: intFromDynamic) int autoUnlock
});




}
/// @nodoc
class __$PassageModeConfigDtoCopyWithImpl<$Res>
    implements _$PassageModeConfigDtoCopyWith<$Res> {
  __$PassageModeConfigDtoCopyWithImpl(this._self, this._then);

  final _PassageModeConfigDto _self;
  final $Res Function(_PassageModeConfigDto) _then;

/// Create a copy of PassageModeConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passageMode = null,Object? startDate = null,Object? endDate = null,Object? isAllDay = null,Object? weekDays = null,Object? autoUnlock = null,}) {
  return _then(_PassageModeConfigDto(
passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,autoUnlock: null == autoUnlock ? _self.autoUnlock : autoUnlock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WorkingModeCyclicConfigDto {

@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int get isAllDay;@JsonKey(name: 'startTime', fromJson: intFromDynamic) int get startTime;@JsonKey(name: 'endTime', fromJson: intFromDynamic) int get endTime;@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> get weekDays;
/// Create a copy of WorkingModeCyclicConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingModeCyclicConfigDtoCopyWith<WorkingModeCyclicConfigDto> get copyWith => _$WorkingModeCyclicConfigDtoCopyWithImpl<WorkingModeCyclicConfigDto>(this as WorkingModeCyclicConfigDto, _$identity);

  /// Serializes this WorkingModeCyclicConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingModeCyclicConfigDto&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other.weekDays, weekDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllDay,startTime,endTime,const DeepCollectionEquality().hash(weekDays));

@override
String toString() {
  return 'WorkingModeCyclicConfigDto(isAllDay: $isAllDay, startTime: $startTime, endTime: $endTime, weekDays: $weekDays)';
}


}

/// @nodoc
abstract mixin class $WorkingModeCyclicConfigDtoCopyWith<$Res>  {
  factory $WorkingModeCyclicConfigDtoCopyWith(WorkingModeCyclicConfigDto value, $Res Function(WorkingModeCyclicConfigDto) _then) = _$WorkingModeCyclicConfigDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int isAllDay,@JsonKey(name: 'startTime', fromJson: intFromDynamic) int startTime,@JsonKey(name: 'endTime', fromJson: intFromDynamic) int endTime,@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> weekDays
});




}
/// @nodoc
class _$WorkingModeCyclicConfigDtoCopyWithImpl<$Res>
    implements $WorkingModeCyclicConfigDtoCopyWith<$Res> {
  _$WorkingModeCyclicConfigDtoCopyWithImpl(this._self, this._then);

  final WorkingModeCyclicConfigDto _self;
  final $Res Function(WorkingModeCyclicConfigDto) _then;

/// Create a copy of WorkingModeCyclicConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAllDay = null,Object? startTime = null,Object? endTime = null,Object? weekDays = null,}) {
  return _then(_self.copyWith(
isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingModeCyclicConfigDto].
extension WorkingModeCyclicConfigDtoPatterns on WorkingModeCyclicConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingModeCyclicConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingModeCyclicConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingModeCyclicConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'startTime', fromJson: intFromDynamic)  int startTime, @JsonKey(name: 'endTime', fromJson: intFromDynamic)  int endTime, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto() when $default != null:
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'startTime', fromJson: intFromDynamic)  int startTime, @JsonKey(name: 'endTime', fromJson: intFromDynamic)  int endTime, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays)  $default,) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto():
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'isAllDay', fromJson: intFromDynamic)  int isAllDay, @JsonKey(name: 'startTime', fromJson: intFromDynamic)  int startTime, @JsonKey(name: 'endTime', fromJson: intFromDynamic)  int endTime, @JsonKey(name: 'weekDays', fromJson: intListFromJson)  List<int> weekDays)?  $default,) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigDto() when $default != null:
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkingModeCyclicConfigDto extends WorkingModeCyclicConfigDto {
  const _WorkingModeCyclicConfigDto({@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) this.isAllDay = 2, @JsonKey(name: 'startTime', fromJson: intFromDynamic) this.startTime = 0, @JsonKey(name: 'endTime', fromJson: intFromDynamic) this.endTime = 0, @JsonKey(name: 'weekDays', fromJson: intListFromJson) final  List<int> weekDays = const []}): _weekDays = weekDays,super._();
  factory _WorkingModeCyclicConfigDto.fromJson(Map<String, dynamic> json) => _$WorkingModeCyclicConfigDtoFromJson(json);

@override@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) final  int isAllDay;
@override@JsonKey(name: 'startTime', fromJson: intFromDynamic) final  int startTime;
@override@JsonKey(name: 'endTime', fromJson: intFromDynamic) final  int endTime;
 final  List<int> _weekDays;
@override@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}


/// Create a copy of WorkingModeCyclicConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingModeCyclicConfigDtoCopyWith<_WorkingModeCyclicConfigDto> get copyWith => __$WorkingModeCyclicConfigDtoCopyWithImpl<_WorkingModeCyclicConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkingModeCyclicConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingModeCyclicConfigDto&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._weekDays, _weekDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAllDay,startTime,endTime,const DeepCollectionEquality().hash(_weekDays));

@override
String toString() {
  return 'WorkingModeCyclicConfigDto(isAllDay: $isAllDay, startTime: $startTime, endTime: $endTime, weekDays: $weekDays)';
}


}

/// @nodoc
abstract mixin class _$WorkingModeCyclicConfigDtoCopyWith<$Res> implements $WorkingModeCyclicConfigDtoCopyWith<$Res> {
  factory _$WorkingModeCyclicConfigDtoCopyWith(_WorkingModeCyclicConfigDto value, $Res Function(_WorkingModeCyclicConfigDto) _then) = __$WorkingModeCyclicConfigDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'isAllDay', fromJson: intFromDynamic) int isAllDay,@JsonKey(name: 'startTime', fromJson: intFromDynamic) int startTime,@JsonKey(name: 'endTime', fromJson: intFromDynamic) int endTime,@JsonKey(name: 'weekDays', fromJson: intListFromJson) List<int> weekDays
});




}
/// @nodoc
class __$WorkingModeCyclicConfigDtoCopyWithImpl<$Res>
    implements _$WorkingModeCyclicConfigDtoCopyWith<$Res> {
  __$WorkingModeCyclicConfigDtoCopyWithImpl(this._self, this._then);

  final _WorkingModeCyclicConfigDto _self;
  final $Res Function(_WorkingModeCyclicConfigDto) _then;

/// Create a copy of WorkingModeCyclicConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAllDay = null,Object? startTime = null,Object? endTime = null,Object? weekDays = null,}) {
  return _then(_WorkingModeCyclicConfigDto(
isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$WorkingModeDto {

@JsonKey(name: 'workingMode', fromJson: intFromDynamic) int get workingMode;@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<WorkingModeCyclicConfigDto> get cyclicConfig;
/// Create a copy of WorkingModeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingModeDtoCopyWith<WorkingModeDto> get copyWith => _$WorkingModeDtoCopyWithImpl<WorkingModeDto>(this as WorkingModeDto, _$identity);

  /// Serializes this WorkingModeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingModeDto&&(identical(other.workingMode, workingMode) || other.workingMode == workingMode)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workingMode,const DeepCollectionEquality().hash(cyclicConfig));

@override
String toString() {
  return 'WorkingModeDto(workingMode: $workingMode, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class $WorkingModeDtoCopyWith<$Res>  {
  factory $WorkingModeDtoCopyWith(WorkingModeDto value, $Res Function(WorkingModeDto) _then) = _$WorkingModeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'workingMode', fromJson: intFromDynamic) int workingMode,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<WorkingModeCyclicConfigDto> cyclicConfig
});




}
/// @nodoc
class _$WorkingModeDtoCopyWithImpl<$Res>
    implements $WorkingModeDtoCopyWith<$Res> {
  _$WorkingModeDtoCopyWithImpl(this._self, this._then);

  final WorkingModeDto _self;
  final $Res Function(WorkingModeDto) _then;

/// Create a copy of WorkingModeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workingMode = null,Object? cyclicConfig = null,}) {
  return _then(_self.copyWith(
workingMode: null == workingMode ? _self.workingMode : workingMode // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<WorkingModeCyclicConfigDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingModeDto].
extension WorkingModeDtoPatterns on WorkingModeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingModeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingModeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingModeDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkingModeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingModeDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingModeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'workingMode', fromJson: intFromDynamic)  int workingMode, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<WorkingModeCyclicConfigDto> cyclicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingModeDto() when $default != null:
return $default(_that.workingMode,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'workingMode', fromJson: intFromDynamic)  int workingMode, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<WorkingModeCyclicConfigDto> cyclicConfig)  $default,) {final _that = this;
switch (_that) {
case _WorkingModeDto():
return $default(_that.workingMode,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'workingMode', fromJson: intFromDynamic)  int workingMode, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)  List<WorkingModeCyclicConfigDto> cyclicConfig)?  $default,) {final _that = this;
switch (_that) {
case _WorkingModeDto() when $default != null:
return $default(_that.workingMode,_that.cyclicConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkingModeDto extends WorkingModeDto {
  const _WorkingModeDto({@JsonKey(name: 'workingMode', fromJson: intFromDynamic) this.workingMode = 1, @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) final  List<WorkingModeCyclicConfigDto> cyclicConfig = const []}): _cyclicConfig = cyclicConfig,super._();
  factory _WorkingModeDto.fromJson(Map<String, dynamic> json) => _$WorkingModeDtoFromJson(json);

@override@JsonKey(name: 'workingMode', fromJson: intFromDynamic) final  int workingMode;
 final  List<WorkingModeCyclicConfigDto> _cyclicConfig;
@override@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<WorkingModeCyclicConfigDto> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}


/// Create a copy of WorkingModeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingModeDtoCopyWith<_WorkingModeDto> get copyWith => __$WorkingModeDtoCopyWithImpl<_WorkingModeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkingModeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingModeDto&&(identical(other.workingMode, workingMode) || other.workingMode == workingMode)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workingMode,const DeepCollectionEquality().hash(_cyclicConfig));

@override
String toString() {
  return 'WorkingModeDto(workingMode: $workingMode, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class _$WorkingModeDtoCopyWith<$Res> implements $WorkingModeDtoCopyWith<$Res> {
  factory _$WorkingModeDtoCopyWith(_WorkingModeDto value, $Res Function(_WorkingModeDto) _then) = __$WorkingModeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'workingMode', fromJson: intFromDynamic) int workingMode,@JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson) List<WorkingModeCyclicConfigDto> cyclicConfig
});




}
/// @nodoc
class __$WorkingModeDtoCopyWithImpl<$Res>
    implements _$WorkingModeDtoCopyWith<$Res> {
  __$WorkingModeDtoCopyWithImpl(this._self, this._then);

  final _WorkingModeDto _self;
  final $Res Function(_WorkingModeDto) _then;

/// Create a copy of WorkingModeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workingMode = null,Object? cyclicConfig = null,}) {
  return _then(_WorkingModeDto(
workingMode: null == workingMode ? _self.workingMode : workingMode // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<WorkingModeCyclicConfigDto>,
  ));
}


}


/// @nodoc
mixin _$FirmwareInfoDto {

@JsonKey(name: 'modelNum') String get modelNum;@JsonKey(name: 'hardwareRevision') String get hardwareRevision;@JsonKey(name: 'firmwareRevision') String get firmwareRevision;
/// Create a copy of FirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmwareInfoDtoCopyWith<FirmwareInfoDto> get copyWith => _$FirmwareInfoDtoCopyWithImpl<FirmwareInfoDto>(this as FirmwareInfoDto, _$identity);

  /// Serializes this FirmwareInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmwareInfoDto&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'FirmwareInfoDto(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class $FirmwareInfoDtoCopyWith<$Res>  {
  factory $FirmwareInfoDtoCopyWith(FirmwareInfoDto value, $Res Function(FirmwareInfoDto) _then) = _$FirmwareInfoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class _$FirmwareInfoDtoCopyWithImpl<$Res>
    implements $FirmwareInfoDtoCopyWith<$Res> {
  _$FirmwareInfoDtoCopyWithImpl(this._self, this._then);

  final FirmwareInfoDto _self;
  final $Res Function(FirmwareInfoDto) _then;

/// Create a copy of FirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_self.copyWith(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FirmwareInfoDto].
extension FirmwareInfoDtoPatterns on FirmwareInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmwareInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmwareInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmwareInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmwareInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirmwareInfoDto() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfoDto():
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfoDto() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirmwareInfoDto extends FirmwareInfoDto {
  const _FirmwareInfoDto({@JsonKey(name: 'modelNum') this.modelNum = '', @JsonKey(name: 'hardwareRevision') this.hardwareRevision = '', @JsonKey(name: 'firmwareRevision') this.firmwareRevision = ''}): super._();
  factory _FirmwareInfoDto.fromJson(Map<String, dynamic> json) => _$FirmwareInfoDtoFromJson(json);

@override@JsonKey(name: 'modelNum') final  String modelNum;
@override@JsonKey(name: 'hardwareRevision') final  String hardwareRevision;
@override@JsonKey(name: 'firmwareRevision') final  String firmwareRevision;

/// Create a copy of FirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmwareInfoDtoCopyWith<_FirmwareInfoDto> get copyWith => __$FirmwareInfoDtoCopyWithImpl<_FirmwareInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirmwareInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmwareInfoDto&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'FirmwareInfoDto(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class _$FirmwareInfoDtoCopyWith<$Res> implements $FirmwareInfoDtoCopyWith<$Res> {
  factory _$FirmwareInfoDtoCopyWith(_FirmwareInfoDto value, $Res Function(_FirmwareInfoDto) _then) = __$FirmwareInfoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class __$FirmwareInfoDtoCopyWithImpl<$Res>
    implements _$FirmwareInfoDtoCopyWith<$Res> {
  __$FirmwareInfoDtoCopyWithImpl(this._self, this._then);

  final _FirmwareInfoDto _self;
  final $Res Function(_FirmwareInfoDto) _then;

/// Create a copy of FirmwareInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_FirmwareInfoDto(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LockUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson) FirmwareInfoDto? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockUpgradeCheckDtoCopyWith<LockUpgradeCheckDto> get copyWith => _$LockUpgradeCheckDtoCopyWithImpl<LockUpgradeCheckDto>(this as LockUpgradeCheckDto, _$identity);

  /// Serializes this LockUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'LockUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $LockUpgradeCheckDtoCopyWith<$Res>  {
  factory $LockUpgradeCheckDtoCopyWith(LockUpgradeCheckDto value, $Res Function(LockUpgradeCheckDto) _then) = _$LockUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson) FirmwareInfoDto? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});


$FirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class _$LockUpgradeCheckDtoCopyWithImpl<$Res>
    implements $LockUpgradeCheckDtoCopyWith<$Res> {
  _$LockUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final LockUpgradeCheckDto _self;
  final $Res Function(LockUpgradeCheckDto) _then;

/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as FirmwareInfoDto?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $FirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockUpgradeCheckDto].
extension LockUpgradeCheckDtoPatterns on LockUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _LockUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _LockUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson)  FirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson)  FirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)  $default,) {final _that = this;
switch (_that) {
case _LockUpgradeCheckDto():
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson)  FirmwareInfoDto? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,) {final _that = this;
switch (_that) {
case _LockUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockUpgradeCheckDto extends LockUpgradeCheckDto {
  const _LockUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 2, @JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson) this.firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): super._();
  factory _LockUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$LockUpgradeCheckDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
@override@JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson) final  FirmwareInfoDto? firmwareInfo;
@override@JsonKey(name: 'firmwarePackage') final  String firmwarePackage;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockUpgradeCheckDtoCopyWith<_LockUpgradeCheckDto> get copyWith => __$LockUpgradeCheckDtoCopyWithImpl<_LockUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'LockUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$LockUpgradeCheckDtoCopyWith<$Res> implements $LockUpgradeCheckDtoCopyWith<$Res> {
  factory _$LockUpgradeCheckDtoCopyWith(_LockUpgradeCheckDto value, $Res Function(_LockUpgradeCheckDto) _then) = __$LockUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson) FirmwareInfoDto? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});


@override $FirmwareInfoDtoCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class __$LockUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$LockUpgradeCheckDtoCopyWith<$Res> {
  __$LockUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _LockUpgradeCheckDto _self;
  final $Res Function(_LockUpgradeCheckDto) _then;

/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_LockUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as FirmwareInfoDto?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LockUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoDtoCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $FirmwareInfoDtoCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// @nodoc
mixin _$NbDeviceInfoDto {

@JsonKey(name: 'nbNodeId') String get nbNodeId;@JsonKey(name: 'nbCardNumber') String get nbCardNumber;@JsonKey(name: 'nbOperator') String get nbOperator;@JsonKey(name: 'nbOperatorName') String get nbOperatorName;@JsonKey(name: 'nbRssi', fromJson: intFromDynamic) int get nbRssi;@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get updateDate;
/// Create a copy of NbDeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbDeviceInfoDtoCopyWith<NbDeviceInfoDto> get copyWith => _$NbDeviceInfoDtoCopyWithImpl<NbDeviceInfoDto>(this as NbDeviceInfoDto, _$identity);

  /// Serializes this NbDeviceInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbDeviceInfoDto&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbOperatorName, nbOperatorName) || other.nbOperatorName == nbOperatorName)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nbNodeId,nbCardNumber,nbOperator,nbOperatorName,nbRssi,updateDate);

@override
String toString() {
  return 'NbDeviceInfoDto(nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbOperator: $nbOperator, nbOperatorName: $nbOperatorName, nbRssi: $nbRssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $NbDeviceInfoDtoCopyWith<$Res>  {
  factory $NbDeviceInfoDtoCopyWith(NbDeviceInfoDto value, $Res Function(NbDeviceInfoDto) _then) = _$NbDeviceInfoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nbNodeId') String nbNodeId,@JsonKey(name: 'nbCardNumber') String nbCardNumber,@JsonKey(name: 'nbOperator') String nbOperator,@JsonKey(name: 'nbOperatorName') String nbOperatorName,@JsonKey(name: 'nbRssi', fromJson: intFromDynamic) int nbRssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? updateDate
});




}
/// @nodoc
class _$NbDeviceInfoDtoCopyWithImpl<$Res>
    implements $NbDeviceInfoDtoCopyWith<$Res> {
  _$NbDeviceInfoDtoCopyWithImpl(this._self, this._then);

  final NbDeviceInfoDto _self;
  final $Res Function(NbDeviceInfoDto) _then;

/// Create a copy of NbDeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbOperator = null,Object? nbOperatorName = null,Object? nbRssi = null,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbOperatorName: null == nbOperatorName ? _self.nbOperatorName : nbOperatorName // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NbDeviceInfoDto].
extension NbDeviceInfoDtoPatterns on NbDeviceInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbDeviceInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbDeviceInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbDeviceInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _NbDeviceInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbDeviceInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _NbDeviceInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nbNodeId')  String nbNodeId, @JsonKey(name: 'nbCardNumber')  String nbCardNumber, @JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'nbOperatorName')  String nbOperatorName, @JsonKey(name: 'nbRssi', fromJson: intFromDynamic)  int nbRssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbDeviceInfoDto() when $default != null:
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nbNodeId')  String nbNodeId, @JsonKey(name: 'nbCardNumber')  String nbCardNumber, @JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'nbOperatorName')  String nbOperatorName, @JsonKey(name: 'nbRssi', fromJson: intFromDynamic)  int nbRssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _NbDeviceInfoDto():
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nbNodeId')  String nbNodeId, @JsonKey(name: 'nbCardNumber')  String nbCardNumber, @JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'nbOperatorName')  String nbOperatorName, @JsonKey(name: 'nbRssi', fromJson: intFromDynamic)  int nbRssi, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _NbDeviceInfoDto() when $default != null:
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NbDeviceInfoDto extends NbDeviceInfoDto {
  const _NbDeviceInfoDto({@JsonKey(name: 'nbNodeId') this.nbNodeId = '', @JsonKey(name: 'nbCardNumber') this.nbCardNumber = '', @JsonKey(name: 'nbOperator') this.nbOperator = '', @JsonKey(name: 'nbOperatorName') this.nbOperatorName = '', @JsonKey(name: 'nbRssi', fromJson: intFromDynamic) this.nbRssi = 0, @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.updateDate}): super._();
  factory _NbDeviceInfoDto.fromJson(Map<String, dynamic> json) => _$NbDeviceInfoDtoFromJson(json);

@override@JsonKey(name: 'nbNodeId') final  String nbNodeId;
@override@JsonKey(name: 'nbCardNumber') final  String nbCardNumber;
@override@JsonKey(name: 'nbOperator') final  String nbOperator;
@override@JsonKey(name: 'nbOperatorName') final  String nbOperatorName;
@override@JsonKey(name: 'nbRssi', fromJson: intFromDynamic) final  int nbRssi;
@override@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? updateDate;

/// Create a copy of NbDeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbDeviceInfoDtoCopyWith<_NbDeviceInfoDto> get copyWith => __$NbDeviceInfoDtoCopyWithImpl<_NbDeviceInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NbDeviceInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbDeviceInfoDto&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbOperatorName, nbOperatorName) || other.nbOperatorName == nbOperatorName)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nbNodeId,nbCardNumber,nbOperator,nbOperatorName,nbRssi,updateDate);

@override
String toString() {
  return 'NbDeviceInfoDto(nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbOperator: $nbOperator, nbOperatorName: $nbOperatorName, nbRssi: $nbRssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$NbDeviceInfoDtoCopyWith<$Res> implements $NbDeviceInfoDtoCopyWith<$Res> {
  factory _$NbDeviceInfoDtoCopyWith(_NbDeviceInfoDto value, $Res Function(_NbDeviceInfoDto) _then) = __$NbDeviceInfoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nbNodeId') String nbNodeId,@JsonKey(name: 'nbCardNumber') String nbCardNumber,@JsonKey(name: 'nbOperator') String nbOperator,@JsonKey(name: 'nbOperatorName') String nbOperatorName,@JsonKey(name: 'nbRssi', fromJson: intFromDynamic) int nbRssi,@JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? updateDate
});




}
/// @nodoc
class __$NbDeviceInfoDtoCopyWithImpl<$Res>
    implements _$NbDeviceInfoDtoCopyWith<$Res> {
  __$NbDeviceInfoDtoCopyWithImpl(this._self, this._then);

  final _NbDeviceInfoDto _self;
  final $Res Function(_NbDeviceInfoDto) _then;

/// Create a copy of NbDeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbOperator = null,Object? nbOperatorName = null,Object? nbRssi = null,Object? updateDate = freezed,}) {
  return _then(_NbDeviceInfoDto(
nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbOperatorName: null == nbOperatorName ? _self.nbOperatorName : nbOperatorName // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$NbPlatformEndpointDto {

@JsonKey(name: 'nbOperator') String get nbOperator;@JsonKey(name: 'ip') String get ip;@JsonKey(name: 'port', fromJson: intFromDynamic) int get port;
/// Create a copy of NbPlatformEndpointDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbPlatformEndpointDtoCopyWith<NbPlatformEndpointDto> get copyWith => _$NbPlatformEndpointDtoCopyWithImpl<NbPlatformEndpointDto>(this as NbPlatformEndpointDto, _$identity);

  /// Serializes this NbPlatformEndpointDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbPlatformEndpointDto&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nbOperator,ip,port);

@override
String toString() {
  return 'NbPlatformEndpointDto(nbOperator: $nbOperator, ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class $NbPlatformEndpointDtoCopyWith<$Res>  {
  factory $NbPlatformEndpointDtoCopyWith(NbPlatformEndpointDto value, $Res Function(NbPlatformEndpointDto) _then) = _$NbPlatformEndpointDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nbOperator') String nbOperator,@JsonKey(name: 'ip') String ip,@JsonKey(name: 'port', fromJson: intFromDynamic) int port
});




}
/// @nodoc
class _$NbPlatformEndpointDtoCopyWithImpl<$Res>
    implements $NbPlatformEndpointDtoCopyWith<$Res> {
  _$NbPlatformEndpointDtoCopyWithImpl(this._self, this._then);

  final NbPlatformEndpointDto _self;
  final $Res Function(NbPlatformEndpointDto) _then;

/// Create a copy of NbPlatformEndpointDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nbOperator = null,Object? ip = null,Object? port = null,}) {
  return _then(_self.copyWith(
nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NbPlatformEndpointDto].
extension NbPlatformEndpointDtoPatterns on NbPlatformEndpointDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbPlatformEndpointDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbPlatformEndpointDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbPlatformEndpointDto value)  $default,){
final _that = this;
switch (_that) {
case _NbPlatformEndpointDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbPlatformEndpointDto value)?  $default,){
final _that = this;
switch (_that) {
case _NbPlatformEndpointDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'port', fromJson: intFromDynamic)  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbPlatformEndpointDto() when $default != null:
return $default(_that.nbOperator,_that.ip,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'port', fromJson: intFromDynamic)  int port)  $default,) {final _that = this;
switch (_that) {
case _NbPlatformEndpointDto():
return $default(_that.nbOperator,_that.ip,_that.port);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nbOperator')  String nbOperator, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'port', fromJson: intFromDynamic)  int port)?  $default,) {final _that = this;
switch (_that) {
case _NbPlatformEndpointDto() when $default != null:
return $default(_that.nbOperator,_that.ip,_that.port);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NbPlatformEndpointDto extends NbPlatformEndpointDto {
  const _NbPlatformEndpointDto({@JsonKey(name: 'nbOperator') this.nbOperator = '', @JsonKey(name: 'ip') this.ip = '', @JsonKey(name: 'port', fromJson: intFromDynamic) this.port = 0}): super._();
  factory _NbPlatformEndpointDto.fromJson(Map<String, dynamic> json) => _$NbPlatformEndpointDtoFromJson(json);

@override@JsonKey(name: 'nbOperator') final  String nbOperator;
@override@JsonKey(name: 'ip') final  String ip;
@override@JsonKey(name: 'port', fromJson: intFromDynamic) final  int port;

/// Create a copy of NbPlatformEndpointDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbPlatformEndpointDtoCopyWith<_NbPlatformEndpointDto> get copyWith => __$NbPlatformEndpointDtoCopyWithImpl<_NbPlatformEndpointDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NbPlatformEndpointDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbPlatformEndpointDto&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nbOperator,ip,port);

@override
String toString() {
  return 'NbPlatformEndpointDto(nbOperator: $nbOperator, ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class _$NbPlatformEndpointDtoCopyWith<$Res> implements $NbPlatformEndpointDtoCopyWith<$Res> {
  factory _$NbPlatformEndpointDtoCopyWith(_NbPlatformEndpointDto value, $Res Function(_NbPlatformEndpointDto) _then) = __$NbPlatformEndpointDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nbOperator') String nbOperator,@JsonKey(name: 'ip') String ip,@JsonKey(name: 'port', fromJson: intFromDynamic) int port
});




}
/// @nodoc
class __$NbPlatformEndpointDtoCopyWithImpl<$Res>
    implements _$NbPlatformEndpointDtoCopyWith<$Res> {
  __$NbPlatformEndpointDtoCopyWithImpl(this._self, this._then);

  final _NbPlatformEndpointDto _self;
  final $Res Function(_NbPlatformEndpointDto) _then;

/// Create a copy of NbPlatformEndpointDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nbOperator = null,Object? ip = null,Object? port = null,}) {
  return _then(_NbPlatformEndpointDto(
nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HotelLockDto {

@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'lockName') String get lockName;@JsonKey(name: 'lockAlias') String get lockAlias;@JsonKey(name: 'lockMac') String get lockMac;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int get hasGateway;@JsonKey(name: 'lockData') String get lockData;@JsonKey(name: 'sector') String get sector;@JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get electricQuantityUpdateDate;@JsonKey(name: 'buildingName') String get buildingName;@JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic) int get buildingNumber;@JsonKey(name: 'floorName') String get floorName;@JsonKey(name: 'floorNumber', fromJson: intFromDynamic) int get floorNumber;@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get initDate;
/// Create a copy of HotelLockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelLockDtoCopyWith<HotelLockDto> get copyWith => _$HotelLockDtoCopyWithImpl<HotelLockDto>(this as HotelLockDto, _$identity);

  /// Serializes this HotelLockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelLockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.electricQuantityUpdateDate, electricQuantityUpdateDate) || other.electricQuantityUpdateDate == electricQuantityUpdateDate)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,sector,electricQuantityUpdateDate,buildingName,buildingNumber,floorName,floorNumber,groupId,groupName,initDate);

@override
String toString() {
  return 'HotelLockDto(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, sector: $sector, electricQuantityUpdateDate: $electricQuantityUpdateDate, buildingName: $buildingName, buildingNumber: $buildingNumber, floorName: $floorName, floorNumber: $floorNumber, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class $HotelLockDtoCopyWith<$Res>  {
  factory $HotelLockDtoCopyWith(HotelLockDto value, $Res Function(HotelLockDto) _then) = _$HotelLockDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int hasGateway,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'sector') String sector,@JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? electricQuantityUpdateDate,@JsonKey(name: 'buildingName') String buildingName,@JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic) int buildingNumber,@JsonKey(name: 'floorName') String floorName,@JsonKey(name: 'floorNumber', fromJson: intFromDynamic) int floorNumber,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? initDate
});




}
/// @nodoc
class _$HotelLockDtoCopyWithImpl<$Res>
    implements $HotelLockDtoCopyWith<$Res> {
  _$HotelLockDtoCopyWithImpl(this._self, this._then);

  final HotelLockDto _self;
  final $Res Function(HotelLockDto) _then;

/// Create a copy of HotelLockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? sector = null,Object? electricQuantityUpdateDate = freezed,Object? buildingName = null,Object? buildingNumber = null,Object? floorName = null,Object? floorNumber = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,electricQuantityUpdateDate: freezed == electricQuantityUpdateDate ? _self.electricQuantityUpdateDate : electricQuantityUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,buildingNumber: null == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelLockDto].
extension HotelLockDtoPatterns on HotelLockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelLockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelLockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelLockDto value)  $default,){
final _that = this;
switch (_that) {
case _HotelLockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelLockDto value)?  $default,){
final _that = this;
switch (_that) {
case _HotelLockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'sector')  String sector, @JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? electricQuantityUpdateDate, @JsonKey(name: 'buildingName')  String buildingName, @JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic)  int buildingNumber, @JsonKey(name: 'floorName')  String floorName, @JsonKey(name: 'floorNumber', fromJson: intFromDynamic)  int floorNumber, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelLockDto() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'sector')  String sector, @JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? electricQuantityUpdateDate, @JsonKey(name: 'buildingName')  String buildingName, @JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic)  int buildingNumber, @JsonKey(name: 'floorName')  String floorName, @JsonKey(name: 'floorNumber', fromJson: intFromDynamic)  int floorNumber, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate)  $default,) {final _that = this;
switch (_that) {
case _HotelLockDto():
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'sector')  String sector, @JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? electricQuantityUpdateDate, @JsonKey(name: 'buildingName')  String buildingName, @JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic)  int buildingNumber, @JsonKey(name: 'floorName')  String floorName, @JsonKey(name: 'floorNumber', fromJson: intFromDynamic)  int floorNumber, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate)?  $default,) {final _that = this;
switch (_that) {
case _HotelLockDto() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelLockDto extends HotelLockDto {
  const _HotelLockDto({@JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'lockName') this.lockName = '', @JsonKey(name: 'lockAlias') this.lockAlias = '', @JsonKey(name: 'lockMac') this.lockMac = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'hasGateway', fromJson: intFromDynamic) this.hasGateway = 0, @JsonKey(name: 'lockData') this.lockData = '', @JsonKey(name: 'sector') this.sector = '', @JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.electricQuantityUpdateDate, @JsonKey(name: 'buildingName') this.buildingName = '', @JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic) this.buildingNumber = 0, @JsonKey(name: 'floorName') this.floorName = '', @JsonKey(name: 'floorNumber', fromJson: intFromDynamic) this.floorNumber = 0, @JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.initDate}): super._();
  factory _HotelLockDto.fromJson(Map<String, dynamic> json) => _$HotelLockDtoFromJson(json);

@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'lockName') final  String lockName;
@override@JsonKey(name: 'lockAlias') final  String lockAlias;
@override@JsonKey(name: 'lockMac') final  String lockMac;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) final  int hasGateway;
@override@JsonKey(name: 'lockData') final  String lockData;
@override@JsonKey(name: 'sector') final  String sector;
@override@JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? electricQuantityUpdateDate;
@override@JsonKey(name: 'buildingName') final  String buildingName;
@override@JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic) final  int buildingNumber;
@override@JsonKey(name: 'floorName') final  String floorName;
@override@JsonKey(name: 'floorNumber', fromJson: intFromDynamic) final  int floorNumber;
@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? initDate;

/// Create a copy of HotelLockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelLockDtoCopyWith<_HotelLockDto> get copyWith => __$HotelLockDtoCopyWithImpl<_HotelLockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelLockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelLockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.electricQuantityUpdateDate, electricQuantityUpdateDate) || other.electricQuantityUpdateDate == electricQuantityUpdateDate)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,sector,electricQuantityUpdateDate,buildingName,buildingNumber,floorName,floorNumber,groupId,groupName,initDate);

@override
String toString() {
  return 'HotelLockDto(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, sector: $sector, electricQuantityUpdateDate: $electricQuantityUpdateDate, buildingName: $buildingName, buildingNumber: $buildingNumber, floorName: $floorName, floorNumber: $floorNumber, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class _$HotelLockDtoCopyWith<$Res> implements $HotelLockDtoCopyWith<$Res> {
  factory _$HotelLockDtoCopyWith(_HotelLockDto value, $Res Function(_HotelLockDto) _then) = __$HotelLockDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int hasGateway,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'sector') String sector,@JsonKey(name: 'electricQuantityUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? electricQuantityUpdateDate,@JsonKey(name: 'buildingName') String buildingName,@JsonKey(name: 'buildingNumber', readValue: _readBuildingNumber, fromJson: intFromDynamic) int buildingNumber,@JsonKey(name: 'floorName') String floorName,@JsonKey(name: 'floorNumber', fromJson: intFromDynamic) int floorNumber,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? initDate
});




}
/// @nodoc
class __$HotelLockDtoCopyWithImpl<$Res>
    implements _$HotelLockDtoCopyWith<$Res> {
  __$HotelLockDtoCopyWithImpl(this._self, this._then);

  final _HotelLockDto _self;
  final $Res Function(_HotelLockDto) _then;

/// Create a copy of HotelLockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? sector = null,Object? electricQuantityUpdateDate = freezed,Object? buildingName = null,Object? buildingNumber = null,Object? floorName = null,Object? floorNumber = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_HotelLockDto(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,electricQuantityUpdateDate: freezed == electricQuantityUpdateDate ? _self.electricQuantityUpdateDate : electricQuantityUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,buildingNumber: null == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$LockImportDataDto {

@JsonKey(name: 'keyNum', fromJson: intFromDynamic) int get keyNum;@JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic) int get keyboardPwdNum;@JsonKey(name: 'cardNum', fromJson: intFromDynamic) int get cardNum;@JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson) List<Map<String, dynamic>> get keyboardPwdList;@JsonKey(name: 'identityCardList', fromJson: mapListFromJson) List<Map<String, dynamic>> get identityCardList;
/// Create a copy of LockImportDataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockImportDataDtoCopyWith<LockImportDataDto> get copyWith => _$LockImportDataDtoCopyWithImpl<LockImportDataDto>(this as LockImportDataDto, _$identity);

  /// Serializes this LockImportDataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockImportDataDto&&(identical(other.keyNum, keyNum) || other.keyNum == keyNum)&&(identical(other.keyboardPwdNum, keyboardPwdNum) || other.keyboardPwdNum == keyboardPwdNum)&&(identical(other.cardNum, cardNum) || other.cardNum == cardNum)&&const DeepCollectionEquality().equals(other.keyboardPwdList, keyboardPwdList)&&const DeepCollectionEquality().equals(other.identityCardList, identityCardList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyNum,keyboardPwdNum,cardNum,const DeepCollectionEquality().hash(keyboardPwdList),const DeepCollectionEquality().hash(identityCardList));

@override
String toString() {
  return 'LockImportDataDto(keyNum: $keyNum, keyboardPwdNum: $keyboardPwdNum, cardNum: $cardNum, keyboardPwdList: $keyboardPwdList, identityCardList: $identityCardList)';
}


}

/// @nodoc
abstract mixin class $LockImportDataDtoCopyWith<$Res>  {
  factory $LockImportDataDtoCopyWith(LockImportDataDto value, $Res Function(LockImportDataDto) _then) = _$LockImportDataDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'keyNum', fromJson: intFromDynamic) int keyNum,@JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic) int keyboardPwdNum,@JsonKey(name: 'cardNum', fromJson: intFromDynamic) int cardNum,@JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson) List<Map<String, dynamic>> keyboardPwdList,@JsonKey(name: 'identityCardList', fromJson: mapListFromJson) List<Map<String, dynamic>> identityCardList
});




}
/// @nodoc
class _$LockImportDataDtoCopyWithImpl<$Res>
    implements $LockImportDataDtoCopyWith<$Res> {
  _$LockImportDataDtoCopyWithImpl(this._self, this._then);

  final LockImportDataDto _self;
  final $Res Function(LockImportDataDto) _then;

/// Create a copy of LockImportDataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyNum = null,Object? keyboardPwdNum = null,Object? cardNum = null,Object? keyboardPwdList = null,Object? identityCardList = null,}) {
  return _then(_self.copyWith(
keyNum: null == keyNum ? _self.keyNum : keyNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdNum: null == keyboardPwdNum ? _self.keyboardPwdNum : keyboardPwdNum // ignore: cast_nullable_to_non_nullable
as int,cardNum: null == cardNum ? _self.cardNum : cardNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdList: null == keyboardPwdList ? _self.keyboardPwdList : keyboardPwdList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,identityCardList: null == identityCardList ? _self.identityCardList : identityCardList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [LockImportDataDto].
extension LockImportDataDtoPatterns on LockImportDataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockImportDataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockImportDataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockImportDataDto value)  $default,){
final _that = this;
switch (_that) {
case _LockImportDataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockImportDataDto value)?  $default,){
final _that = this;
switch (_that) {
case _LockImportDataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyNum', fromJson: intFromDynamic)  int keyNum, @JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic)  int keyboardPwdNum, @JsonKey(name: 'cardNum', fromJson: intFromDynamic)  int cardNum, @JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson)  List<Map<String, dynamic>> keyboardPwdList, @JsonKey(name: 'identityCardList', fromJson: mapListFromJson)  List<Map<String, dynamic>> identityCardList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockImportDataDto() when $default != null:
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyNum', fromJson: intFromDynamic)  int keyNum, @JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic)  int keyboardPwdNum, @JsonKey(name: 'cardNum', fromJson: intFromDynamic)  int cardNum, @JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson)  List<Map<String, dynamic>> keyboardPwdList, @JsonKey(name: 'identityCardList', fromJson: mapListFromJson)  List<Map<String, dynamic>> identityCardList)  $default,) {final _that = this;
switch (_that) {
case _LockImportDataDto():
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'keyNum', fromJson: intFromDynamic)  int keyNum, @JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic)  int keyboardPwdNum, @JsonKey(name: 'cardNum', fromJson: intFromDynamic)  int cardNum, @JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson)  List<Map<String, dynamic>> keyboardPwdList, @JsonKey(name: 'identityCardList', fromJson: mapListFromJson)  List<Map<String, dynamic>> identityCardList)?  $default,) {final _that = this;
switch (_that) {
case _LockImportDataDto() when $default != null:
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockImportDataDto extends LockImportDataDto {
  const _LockImportDataDto({@JsonKey(name: 'keyNum', fromJson: intFromDynamic) this.keyNum = 0, @JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic) this.keyboardPwdNum = 0, @JsonKey(name: 'cardNum', fromJson: intFromDynamic) this.cardNum = 0, @JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson) final  List<Map<String, dynamic>> keyboardPwdList = const [], @JsonKey(name: 'identityCardList', fromJson: mapListFromJson) final  List<Map<String, dynamic>> identityCardList = const []}): _keyboardPwdList = keyboardPwdList,_identityCardList = identityCardList,super._();
  factory _LockImportDataDto.fromJson(Map<String, dynamic> json) => _$LockImportDataDtoFromJson(json);

@override@JsonKey(name: 'keyNum', fromJson: intFromDynamic) final  int keyNum;
@override@JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic) final  int keyboardPwdNum;
@override@JsonKey(name: 'cardNum', fromJson: intFromDynamic) final  int cardNum;
 final  List<Map<String, dynamic>> _keyboardPwdList;
@override@JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson) List<Map<String, dynamic>> get keyboardPwdList {
  if (_keyboardPwdList is EqualUnmodifiableListView) return _keyboardPwdList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keyboardPwdList);
}

 final  List<Map<String, dynamic>> _identityCardList;
@override@JsonKey(name: 'identityCardList', fromJson: mapListFromJson) List<Map<String, dynamic>> get identityCardList {
  if (_identityCardList is EqualUnmodifiableListView) return _identityCardList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_identityCardList);
}


/// Create a copy of LockImportDataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockImportDataDtoCopyWith<_LockImportDataDto> get copyWith => __$LockImportDataDtoCopyWithImpl<_LockImportDataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockImportDataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockImportDataDto&&(identical(other.keyNum, keyNum) || other.keyNum == keyNum)&&(identical(other.keyboardPwdNum, keyboardPwdNum) || other.keyboardPwdNum == keyboardPwdNum)&&(identical(other.cardNum, cardNum) || other.cardNum == cardNum)&&const DeepCollectionEquality().equals(other._keyboardPwdList, _keyboardPwdList)&&const DeepCollectionEquality().equals(other._identityCardList, _identityCardList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyNum,keyboardPwdNum,cardNum,const DeepCollectionEquality().hash(_keyboardPwdList),const DeepCollectionEquality().hash(_identityCardList));

@override
String toString() {
  return 'LockImportDataDto(keyNum: $keyNum, keyboardPwdNum: $keyboardPwdNum, cardNum: $cardNum, keyboardPwdList: $keyboardPwdList, identityCardList: $identityCardList)';
}


}

/// @nodoc
abstract mixin class _$LockImportDataDtoCopyWith<$Res> implements $LockImportDataDtoCopyWith<$Res> {
  factory _$LockImportDataDtoCopyWith(_LockImportDataDto value, $Res Function(_LockImportDataDto) _then) = __$LockImportDataDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'keyNum', fromJson: intFromDynamic) int keyNum,@JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic) int keyboardPwdNum,@JsonKey(name: 'cardNum', fromJson: intFromDynamic) int cardNum,@JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson) List<Map<String, dynamic>> keyboardPwdList,@JsonKey(name: 'identityCardList', fromJson: mapListFromJson) List<Map<String, dynamic>> identityCardList
});




}
/// @nodoc
class __$LockImportDataDtoCopyWithImpl<$Res>
    implements _$LockImportDataDtoCopyWith<$Res> {
  __$LockImportDataDtoCopyWithImpl(this._self, this._then);

  final _LockImportDataDto _self;
  final $Res Function(_LockImportDataDto) _then;

/// Create a copy of LockImportDataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyNum = null,Object? keyboardPwdNum = null,Object? cardNum = null,Object? keyboardPwdList = null,Object? identityCardList = null,}) {
  return _then(_LockImportDataDto(
keyNum: null == keyNum ? _self.keyNum : keyNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdNum: null == keyboardPwdNum ? _self.keyboardPwdNum : keyboardPwdNum // ignore: cast_nullable_to_non_nullable
as int,cardNum: null == cardNum ? _self.cardNum : cardNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdList: null == keyboardPwdList ? _self._keyboardPwdList : keyboardPwdList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,identityCardList: null == identityCardList ? _self._identityCardList : identityCardList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$ChangeTimezoneResultDto {

@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic) String get lockData;
/// Create a copy of ChangeTimezoneResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeTimezoneResultDtoCopyWith<ChangeTimezoneResultDto> get copyWith => _$ChangeTimezoneResultDtoCopyWithImpl<ChangeTimezoneResultDto>(this as ChangeTimezoneResultDto, _$identity);

  /// Serializes this ChangeTimezoneResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeTimezoneResultDto&&(identical(other.lockData, lockData) || other.lockData == lockData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockData);

@override
String toString() {
  return 'ChangeTimezoneResultDto(lockData: $lockData)';
}


}

/// @nodoc
abstract mixin class $ChangeTimezoneResultDtoCopyWith<$Res>  {
  factory $ChangeTimezoneResultDtoCopyWith(ChangeTimezoneResultDto value, $Res Function(ChangeTimezoneResultDto) _then) = _$ChangeTimezoneResultDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic) String lockData
});




}
/// @nodoc
class _$ChangeTimezoneResultDtoCopyWithImpl<$Res>
    implements $ChangeTimezoneResultDtoCopyWith<$Res> {
  _$ChangeTimezoneResultDtoCopyWithImpl(this._self, this._then);

  final ChangeTimezoneResultDto _self;
  final $Res Function(ChangeTimezoneResultDto) _then;

/// Create a copy of ChangeTimezoneResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockData = null,}) {
  return _then(_self.copyWith(
lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeTimezoneResultDto].
extension ChangeTimezoneResultDtoPatterns on ChangeTimezoneResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeTimezoneResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeTimezoneResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeTimezoneResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic)  String lockData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto() when $default != null:
return $default(_that.lockData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic)  String lockData)  $default,) {final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto():
return $default(_that.lockData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic)  String lockData)?  $default,) {final _that = this;
switch (_that) {
case _ChangeTimezoneResultDto() when $default != null:
return $default(_that.lockData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeTimezoneResultDto extends ChangeTimezoneResultDto {
  const _ChangeTimezoneResultDto({@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic) this.lockData = ''}): super._();
  factory _ChangeTimezoneResultDto.fromJson(Map<String, dynamic> json) => _$ChangeTimezoneResultDtoFromJson(json);

@override@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic) final  String lockData;

/// Create a copy of ChangeTimezoneResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTimezoneResultDtoCopyWith<_ChangeTimezoneResultDto> get copyWith => __$ChangeTimezoneResultDtoCopyWithImpl<_ChangeTimezoneResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeTimezoneResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTimezoneResultDto&&(identical(other.lockData, lockData) || other.lockData == lockData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockData);

@override
String toString() {
  return 'ChangeTimezoneResultDto(lockData: $lockData)';
}


}

/// @nodoc
abstract mixin class _$ChangeTimezoneResultDtoCopyWith<$Res> implements $ChangeTimezoneResultDtoCopyWith<$Res> {
  factory _$ChangeTimezoneResultDtoCopyWith(_ChangeTimezoneResultDto value, $Res Function(_ChangeTimezoneResultDto) _then) = __$ChangeTimezoneResultDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lockData', readValue: _readLockData, fromJson: stringFromDynamic) String lockData
});




}
/// @nodoc
class __$ChangeTimezoneResultDtoCopyWithImpl<$Res>
    implements _$ChangeTimezoneResultDtoCopyWith<$Res> {
  __$ChangeTimezoneResultDtoCopyWithImpl(this._self, this._then);

  final _ChangeTimezoneResultDto _self;
  final $Res Function(_ChangeTimezoneResultDto) _then;

/// Create a copy of ChangeTimezoneResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockData = null,}) {
  return _then(_ChangeTimezoneResultDto(
lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
