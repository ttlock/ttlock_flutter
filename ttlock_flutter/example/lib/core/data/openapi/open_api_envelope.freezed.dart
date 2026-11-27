// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_api_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenApiEnvelope {

@JsonKey(name: 'errcode') int get errcode;@JsonKey(name: 'errmsg') String get errmsg;@JsonKey(name: 'description') String get description;
/// Create a copy of OpenApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenApiEnvelopeCopyWith<OpenApiEnvelope> get copyWith => _$OpenApiEnvelopeCopyWithImpl<OpenApiEnvelope>(this as OpenApiEnvelope, _$identity);

  /// Serializes this OpenApiEnvelope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenApiEnvelope&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,errcode,errmsg,description);

@override
String toString() {
  return 'OpenApiEnvelope(errcode: $errcode, errmsg: $errmsg, description: $description)';
}


}

/// @nodoc
abstract mixin class $OpenApiEnvelopeCopyWith<$Res>  {
  factory $OpenApiEnvelopeCopyWith(OpenApiEnvelope value, $Res Function(OpenApiEnvelope) _then) = _$OpenApiEnvelopeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class _$OpenApiEnvelopeCopyWithImpl<$Res>
    implements $OpenApiEnvelopeCopyWith<$Res> {
  _$OpenApiEnvelopeCopyWithImpl(this._self, this._then);

  final OpenApiEnvelope _self;
  final $Res Function(OpenApiEnvelope) _then;

/// Create a copy of OpenApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errcode = null,Object? errmsg = null,Object? description = null,}) {
  return _then(_self.copyWith(
errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenApiEnvelope].
extension OpenApiEnvelopePatterns on OpenApiEnvelope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenApiEnvelope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenApiEnvelope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenApiEnvelope value)  $default,){
final _that = this;
switch (_that) {
case _OpenApiEnvelope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenApiEnvelope value)?  $default,){
final _that = this;
switch (_that) {
case _OpenApiEnvelope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg, @JsonKey(name: 'description')  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenApiEnvelope() when $default != null:
return $default(_that.errcode,_that.errmsg,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg, @JsonKey(name: 'description')  String description)  $default,) {final _that = this;
switch (_that) {
case _OpenApiEnvelope():
return $default(_that.errcode,_that.errmsg,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg, @JsonKey(name: 'description')  String description)?  $default,) {final _that = this;
switch (_that) {
case _OpenApiEnvelope() when $default != null:
return $default(_that.errcode,_that.errmsg,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenApiEnvelope extends OpenApiEnvelope {
  const _OpenApiEnvelope({@JsonKey(name: 'errcode') this.errcode = 0, @JsonKey(name: 'errmsg') this.errmsg = '', @JsonKey(name: 'description') this.description = ''}): super._();
  factory _OpenApiEnvelope.fromJson(Map<String, dynamic> json) => _$OpenApiEnvelopeFromJson(json);

@override@JsonKey(name: 'errcode') final  int errcode;
@override@JsonKey(name: 'errmsg') final  String errmsg;
@override@JsonKey(name: 'description') final  String description;

/// Create a copy of OpenApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenApiEnvelopeCopyWith<_OpenApiEnvelope> get copyWith => __$OpenApiEnvelopeCopyWithImpl<_OpenApiEnvelope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenApiEnvelopeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenApiEnvelope&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,errcode,errmsg,description);

@override
String toString() {
  return 'OpenApiEnvelope(errcode: $errcode, errmsg: $errmsg, description: $description)';
}


}

/// @nodoc
abstract mixin class _$OpenApiEnvelopeCopyWith<$Res> implements $OpenApiEnvelopeCopyWith<$Res> {
  factory _$OpenApiEnvelopeCopyWith(_OpenApiEnvelope value, $Res Function(_OpenApiEnvelope) _then) = __$OpenApiEnvelopeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg,@JsonKey(name: 'description') String description
});




}
/// @nodoc
class __$OpenApiEnvelopeCopyWithImpl<$Res>
    implements _$OpenApiEnvelopeCopyWith<$Res> {
  __$OpenApiEnvelopeCopyWithImpl(this._self, this._then);

  final _OpenApiEnvelope _self;
  final $Res Function(_OpenApiEnvelope) _then;

/// Create a copy of OpenApiEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errcode = null,Object? errmsg = null,Object? description = null,}) {
  return _then(_OpenApiEnvelope(
errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
