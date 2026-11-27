// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupDto {

@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'name', readValue: _readName) String get name;@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int get lockNum;
/// Create a copy of GroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupDtoCopyWith<GroupDto> get copyWith => _$GroupDtoCopyWithImpl<GroupDto>(this as GroupDto, _$identity);

  /// Serializes this GroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.name, name) || other.name == name)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,name,lockNum);

@override
String toString() {
  return 'GroupDto(groupId: $groupId, name: $name, lockNum: $lockNum)';
}


}

/// @nodoc
abstract mixin class $GroupDtoCopyWith<$Res>  {
  factory $GroupDtoCopyWith(GroupDto value, $Res Function(GroupDto) _then) = _$GroupDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'name', readValue: _readName) String name,@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int lockNum
});




}
/// @nodoc
class _$GroupDtoCopyWithImpl<$Res>
    implements $GroupDtoCopyWith<$Res> {
  _$GroupDtoCopyWithImpl(this._self, this._then);

  final GroupDto _self;
  final $Res Function(GroupDto) _then;

/// Create a copy of GroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? name = null,Object? lockNum = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupDto].
extension GroupDtoPatterns on GroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupDto value)  $default,){
final _that = this;
switch (_that) {
case _GroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _GroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'name', readValue: _readName)  String name, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupDto() when $default != null:
return $default(_that.groupId,_that.name,_that.lockNum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'name', readValue: _readName)  String name, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum)  $default,) {final _that = this;
switch (_that) {
case _GroupDto():
return $default(_that.groupId,_that.name,_that.lockNum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'name', readValue: _readName)  String name, @JsonKey(name: 'lockNum', fromJson: intFromDynamic)  int lockNum)?  $default,) {final _that = this;
switch (_that) {
case _GroupDto() when $default != null:
return $default(_that.groupId,_that.name,_that.lockNum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupDto extends GroupDto {
  const _GroupDto({@JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'name', readValue: _readName) this.name = '', @JsonKey(name: 'lockNum', fromJson: intFromDynamic) this.lockNum = 0}): super._();
  factory _GroupDto.fromJson(Map<String, dynamic> json) => _$GroupDtoFromJson(json);

@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'name', readValue: _readName) final  String name;
@override@JsonKey(name: 'lockNum', fromJson: intFromDynamic) final  int lockNum;

/// Create a copy of GroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupDtoCopyWith<_GroupDto> get copyWith => __$GroupDtoCopyWithImpl<_GroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.name, name) || other.name == name)&&(identical(other.lockNum, lockNum) || other.lockNum == lockNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,name,lockNum);

@override
String toString() {
  return 'GroupDto(groupId: $groupId, name: $name, lockNum: $lockNum)';
}


}

/// @nodoc
abstract mixin class _$GroupDtoCopyWith<$Res> implements $GroupDtoCopyWith<$Res> {
  factory _$GroupDtoCopyWith(_GroupDto value, $Res Function(_GroupDto) _then) = __$GroupDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'name', readValue: _readName) String name,@JsonKey(name: 'lockNum', fromJson: intFromDynamic) int lockNum
});




}
/// @nodoc
class __$GroupDtoCopyWithImpl<$Res>
    implements _$GroupDtoCopyWith<$Res> {
  __$GroupDtoCopyWithImpl(this._self, this._then);

  final _GroupDto _self;
  final $Res Function(_GroupDto) _then;

/// Create a copy of GroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? name = null,Object? lockNum = null,}) {
  return _then(_GroupDto(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lockNum: null == lockNum ? _self.lockNum : lockNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
