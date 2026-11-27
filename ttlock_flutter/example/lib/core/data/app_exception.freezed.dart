// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {

 String get message; StackTrace? get stackTrace;
/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<AppException> get copyWith => _$AppExceptionCopyWithImpl<AppException>(this as AppException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,stackTrace);

@override
String toString() {
  return 'AppException(message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppExceptionCopyWith<$Res>  {
  factory $AppExceptionCopyWith(AppException value, $Res Function(AppException) _then) = _$AppExceptionCopyWithImpl;
@useResult
$Res call({
 String message, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppExceptionCopyWithImpl<$Res>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._self, this._then);

  final AppException _self;
  final $Res Function(AppException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( AppExceptionGeneric value)?  $default,{TResult Function( AppNetworkException value)?  network,TResult Function( AppBusinessException value)?  business,TResult Function( AppHttpException value)?  http,TResult Function( AppParseException value)?  parse,TResult Function( AppDatabaseException value)?  database,TResult Function( AppFirmwareException value)?  firmware,TResult Function( AppUnknownException value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppExceptionGeneric() when $default != null:
return $default(_that);case AppNetworkException() when network != null:
return network(_that);case AppBusinessException() when business != null:
return business(_that);case AppHttpException() when http != null:
return http(_that);case AppParseException() when parse != null:
return parse(_that);case AppDatabaseException() when database != null:
return database(_that);case AppFirmwareException() when firmware != null:
return firmware(_that);case AppUnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( AppExceptionGeneric value)  $default,{required TResult Function( AppNetworkException value)  network,required TResult Function( AppBusinessException value)  business,required TResult Function( AppHttpException value)  http,required TResult Function( AppParseException value)  parse,required TResult Function( AppDatabaseException value)  database,required TResult Function( AppFirmwareException value)  firmware,required TResult Function( AppUnknownException value)  unknown,}){
final _that = this;
switch (_that) {
case AppExceptionGeneric():
return $default(_that);case AppNetworkException():
return network(_that);case AppBusinessException():
return business(_that);case AppHttpException():
return http(_that);case AppParseException():
return parse(_that);case AppDatabaseException():
return database(_that);case AppFirmwareException():
return firmware(_that);case AppUnknownException():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( AppExceptionGeneric value)?  $default,{TResult? Function( AppNetworkException value)?  network,TResult? Function( AppBusinessException value)?  business,TResult? Function( AppHttpException value)?  http,TResult? Function( AppParseException value)?  parse,TResult? Function( AppDatabaseException value)?  database,TResult? Function( AppFirmwareException value)?  firmware,TResult? Function( AppUnknownException value)?  unknown,}){
final _that = this;
switch (_that) {
case AppExceptionGeneric() when $default != null:
return $default(_that);case AppNetworkException() when network != null:
return network(_that);case AppBusinessException() when business != null:
return business(_that);case AppHttpException() when http != null:
return http(_that);case AppParseException() when parse != null:
return parse(_that);case AppDatabaseException() when database != null:
return database(_that);case AppFirmwareException() when firmware != null:
return firmware(_that);case AppUnknownException() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  StackTrace? stackTrace)?  $default,{TResult Function( dynamic exception,  String message,  StackTrace? stackTrace)?  network,TResult Function( int code,  String message,  Object? data,  StackTrace? stackTrace)?  business,TResult Function( int statusCode,  String message,  Object? data,  StackTrace? stackTrace)?  http,TResult Function( String message,  Object? error,  StackTrace? stackTrace)?  parse,TResult Function( String message,  StackTrace? stackTrace)?  database,TResult Function( String message,  Object? error,  StackTrace? stackTrace)?  firmware,TResult Function( String message,  Object? error,  StackTrace? stackTrace)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppExceptionGeneric() when $default != null:
return $default(_that.message,_that.stackTrace);case AppNetworkException() when network != null:
return network(_that.exception,_that.message,_that.stackTrace);case AppBusinessException() when business != null:
return business(_that.code,_that.message,_that.data,_that.stackTrace);case AppHttpException() when http != null:
return http(_that.statusCode,_that.message,_that.data,_that.stackTrace);case AppParseException() when parse != null:
return parse(_that.message,_that.error,_that.stackTrace);case AppDatabaseException() when database != null:
return database(_that.message,_that.stackTrace);case AppFirmwareException() when firmware != null:
return firmware(_that.message,_that.error,_that.stackTrace);case AppUnknownException() when unknown != null:
return unknown(_that.message,_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  StackTrace? stackTrace)  $default,{required TResult Function( dynamic exception,  String message,  StackTrace? stackTrace)  network,required TResult Function( int code,  String message,  Object? data,  StackTrace? stackTrace)  business,required TResult Function( int statusCode,  String message,  Object? data,  StackTrace? stackTrace)  http,required TResult Function( String message,  Object? error,  StackTrace? stackTrace)  parse,required TResult Function( String message,  StackTrace? stackTrace)  database,required TResult Function( String message,  Object? error,  StackTrace? stackTrace)  firmware,required TResult Function( String message,  Object? error,  StackTrace? stackTrace)  unknown,}) {final _that = this;
switch (_that) {
case AppExceptionGeneric():
return $default(_that.message,_that.stackTrace);case AppNetworkException():
return network(_that.exception,_that.message,_that.stackTrace);case AppBusinessException():
return business(_that.code,_that.message,_that.data,_that.stackTrace);case AppHttpException():
return http(_that.statusCode,_that.message,_that.data,_that.stackTrace);case AppParseException():
return parse(_that.message,_that.error,_that.stackTrace);case AppDatabaseException():
return database(_that.message,_that.stackTrace);case AppFirmwareException():
return firmware(_that.message,_that.error,_that.stackTrace);case AppUnknownException():
return unknown(_that.message,_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  StackTrace? stackTrace)?  $default,{TResult? Function( dynamic exception,  String message,  StackTrace? stackTrace)?  network,TResult? Function( int code,  String message,  Object? data,  StackTrace? stackTrace)?  business,TResult? Function( int statusCode,  String message,  Object? data,  StackTrace? stackTrace)?  http,TResult? Function( String message,  Object? error,  StackTrace? stackTrace)?  parse,TResult? Function( String message,  StackTrace? stackTrace)?  database,TResult? Function( String message,  Object? error,  StackTrace? stackTrace)?  firmware,TResult? Function( String message,  Object? error,  StackTrace? stackTrace)?  unknown,}) {final _that = this;
switch (_that) {
case AppExceptionGeneric() when $default != null:
return $default(_that.message,_that.stackTrace);case AppNetworkException() when network != null:
return network(_that.exception,_that.message,_that.stackTrace);case AppBusinessException() when business != null:
return business(_that.code,_that.message,_that.data,_that.stackTrace);case AppHttpException() when http != null:
return http(_that.statusCode,_that.message,_that.data,_that.stackTrace);case AppParseException() when parse != null:
return parse(_that.message,_that.error,_that.stackTrace);case AppDatabaseException() when database != null:
return database(_that.message,_that.stackTrace);case AppFirmwareException() when firmware != null:
return firmware(_that.message,_that.error,_that.stackTrace);case AppUnknownException() when unknown != null:
return unknown(_that.message,_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class AppExceptionGeneric extends AppException {
  const AppExceptionGeneric(this.message, this.stackTrace): super._();
  

@override final  String message;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppExceptionGenericCopyWith<AppExceptionGeneric> get copyWith => _$AppExceptionGenericCopyWithImpl<AppExceptionGeneric>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppExceptionGeneric&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,stackTrace);

@override
String toString() {
  return 'AppException(message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppExceptionGenericCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppExceptionGenericCopyWith(AppExceptionGeneric value, $Res Function(AppExceptionGeneric) _then) = _$AppExceptionGenericCopyWithImpl;
@override @useResult
$Res call({
 String message, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppExceptionGenericCopyWithImpl<$Res>
    implements $AppExceptionGenericCopyWith<$Res> {
  _$AppExceptionGenericCopyWithImpl(this._self, this._then);

  final AppExceptionGeneric _self;
  final $Res Function(AppExceptionGeneric) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? stackTrace = freezed,}) {
  return _then(AppExceptionGeneric(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppNetworkException extends AppException {
  const AppNetworkException({required this.exception, required this.message, this.stackTrace}): super._();
  

 final  dynamic exception;
@override final  String message;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNetworkExceptionCopyWith<AppNetworkException> get copyWith => _$AppNetworkExceptionCopyWithImpl<AppNetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNetworkException&&const DeepCollectionEquality().equals(other.exception, exception)&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exception),message,stackTrace);

@override
String toString() {
  return 'AppException.network(exception: $exception, message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppNetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppNetworkExceptionCopyWith(AppNetworkException value, $Res Function(AppNetworkException) _then) = _$AppNetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 dynamic exception, String message, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppNetworkExceptionCopyWithImpl<$Res>
    implements $AppNetworkExceptionCopyWith<$Res> {
  _$AppNetworkExceptionCopyWithImpl(this._self, this._then);

  final AppNetworkException _self;
  final $Res Function(AppNetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exception = freezed,Object? message = null,Object? stackTrace = freezed,}) {
  return _then(AppNetworkException(
exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as dynamic,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppBusinessException extends AppException {
  const AppBusinessException({required this.code, required this.message, this.data, this.stackTrace}): super._();
  

 final  int code;
@override final  String message;
 final  Object? data;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppBusinessExceptionCopyWith<AppBusinessException> get copyWith => _$AppBusinessExceptionCopyWithImpl<AppBusinessException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppBusinessException&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(data),stackTrace);

@override
String toString() {
  return 'AppException.business(code: $code, message: $message, data: $data, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppBusinessExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppBusinessExceptionCopyWith(AppBusinessException value, $Res Function(AppBusinessException) _then) = _$AppBusinessExceptionCopyWithImpl;
@override @useResult
$Res call({
 int code, String message, Object? data, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppBusinessExceptionCopyWithImpl<$Res>
    implements $AppBusinessExceptionCopyWith<$Res> {
  _$AppBusinessExceptionCopyWithImpl(this._self, this._then);

  final AppBusinessException _self;
  final $Res Function(AppBusinessException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? data = freezed,Object? stackTrace = freezed,}) {
  return _then(AppBusinessException(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppHttpException extends AppException {
  const AppHttpException({required this.statusCode, required this.message, this.data, this.stackTrace}): super._();
  

 final  int statusCode;
@override final  String message;
 final  Object? data;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppHttpExceptionCopyWith<AppHttpException> get copyWith => _$AppHttpExceptionCopyWithImpl<AppHttpException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppHttpException&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message,const DeepCollectionEquality().hash(data),stackTrace);

@override
String toString() {
  return 'AppException.http(statusCode: $statusCode, message: $message, data: $data, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppHttpExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppHttpExceptionCopyWith(AppHttpException value, $Res Function(AppHttpException) _then) = _$AppHttpExceptionCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String message, Object? data, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppHttpExceptionCopyWithImpl<$Res>
    implements $AppHttpExceptionCopyWith<$Res> {
  _$AppHttpExceptionCopyWithImpl(this._self, this._then);

  final AppHttpException _self;
  final $Res Function(AppHttpException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? data = freezed,Object? stackTrace = freezed,}) {
  return _then(AppHttpException(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppParseException extends AppException {
  const AppParseException({required this.message, this.error, this.stackTrace}): super._();
  

@override final  String message;
 final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppParseExceptionCopyWith<AppParseException> get copyWith => _$AppParseExceptionCopyWithImpl<AppParseException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppParseException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'AppException.parse(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppParseExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppParseExceptionCopyWith(AppParseException value, $Res Function(AppParseException) _then) = _$AppParseExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppParseExceptionCopyWithImpl<$Res>
    implements $AppParseExceptionCopyWith<$Res> {
  _$AppParseExceptionCopyWithImpl(this._self, this._then);

  final AppParseException _self;
  final $Res Function(AppParseException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(AppParseException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppDatabaseException extends AppException {
  const AppDatabaseException({required this.message, this.stackTrace}): super._();
  

@override final  String message;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppDatabaseExceptionCopyWith<AppDatabaseException> get copyWith => _$AppDatabaseExceptionCopyWithImpl<AppDatabaseException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppDatabaseException&&(identical(other.message, message) || other.message == message)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,stackTrace);

@override
String toString() {
  return 'AppException.database(message: $message, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppDatabaseExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppDatabaseExceptionCopyWith(AppDatabaseException value, $Res Function(AppDatabaseException) _then) = _$AppDatabaseExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppDatabaseExceptionCopyWithImpl<$Res>
    implements $AppDatabaseExceptionCopyWith<$Res> {
  _$AppDatabaseExceptionCopyWithImpl(this._self, this._then);

  final AppDatabaseException _self;
  final $Res Function(AppDatabaseException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? stackTrace = freezed,}) {
  return _then(AppDatabaseException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppFirmwareException extends AppException {
  const AppFirmwareException({required this.message, this.error, this.stackTrace}): super._();
  

@override final  String message;
 final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFirmwareExceptionCopyWith<AppFirmwareException> get copyWith => _$AppFirmwareExceptionCopyWithImpl<AppFirmwareException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFirmwareException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'AppException.firmware(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppFirmwareExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppFirmwareExceptionCopyWith(AppFirmwareException value, $Res Function(AppFirmwareException) _then) = _$AppFirmwareExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppFirmwareExceptionCopyWithImpl<$Res>
    implements $AppFirmwareExceptionCopyWith<$Res> {
  _$AppFirmwareExceptionCopyWithImpl(this._self, this._then);

  final AppFirmwareException _self;
  final $Res Function(AppFirmwareException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(AppFirmwareException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class AppUnknownException extends AppException {
  const AppUnknownException({required this.message, this.error, this.stackTrace}): super._();
  

@override final  String message;
 final  Object? error;
@override final  StackTrace? stackTrace;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUnknownExceptionCopyWith<AppUnknownException> get copyWith => _$AppUnknownExceptionCopyWithImpl<AppUnknownException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUnknownException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'AppException.unknown(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $AppUnknownExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AppUnknownExceptionCopyWith(AppUnknownException value, $Res Function(AppUnknownException) _then) = _$AppUnknownExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$AppUnknownExceptionCopyWithImpl<$Res>
    implements $AppUnknownExceptionCopyWith<$Res> {
  _$AppUnknownExceptionCopyWithImpl(this._self, this._then);

  final AppUnknownException _self;
  final $Res Function(AppUnknownException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(AppUnknownException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
