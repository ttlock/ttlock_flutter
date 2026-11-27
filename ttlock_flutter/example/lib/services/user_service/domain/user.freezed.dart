// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSession {

 String get accessToken; String get refreshToken; int get uid; int get expiresIn; String get loginName; int get obtainedAt;
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionCopyWith<UserSession> get copyWith => _$UserSessionCopyWithImpl<UserSession>(this as UserSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSession&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.loginName, loginName) || other.loginName == loginName)&&(identical(other.obtainedAt, obtainedAt) || other.obtainedAt == obtainedAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,uid,expiresIn,loginName,obtainedAt);

@override
String toString() {
  return 'UserSession(accessToken: $accessToken, refreshToken: $refreshToken, uid: $uid, expiresIn: $expiresIn, loginName: $loginName, obtainedAt: $obtainedAt)';
}


}

/// @nodoc
abstract mixin class $UserSessionCopyWith<$Res>  {
  factory $UserSessionCopyWith(UserSession value, $Res Function(UserSession) _then) = _$UserSessionCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, int uid, int expiresIn, String loginName, int obtainedAt
});




}
/// @nodoc
class _$UserSessionCopyWithImpl<$Res>
    implements $UserSessionCopyWith<$Res> {
  _$UserSessionCopyWithImpl(this._self, this._then);

  final UserSession _self;
  final $Res Function(UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? uid = null,Object? expiresIn = null,Object? loginName = null,Object? obtainedAt = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,loginName: null == loginName ? _self.loginName : loginName // ignore: cast_nullable_to_non_nullable
as String,obtainedAt: null == obtainedAt ? _self.obtainedAt : obtainedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSession].
extension UserSessionPatterns on UserSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSession value)  $default,){
final _that = this;
switch (_that) {
case _UserSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSession value)?  $default,){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int uid,  int expiresIn,  String loginName,  int obtainedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.uid,_that.expiresIn,_that.loginName,_that.obtainedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  int uid,  int expiresIn,  String loginName,  int obtainedAt)  $default,) {final _that = this;
switch (_that) {
case _UserSession():
return $default(_that.accessToken,_that.refreshToken,_that.uid,_that.expiresIn,_that.loginName,_that.obtainedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  int uid,  int expiresIn,  String loginName,  int obtainedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.uid,_that.expiresIn,_that.loginName,_that.obtainedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserSession extends UserSession {
  const _UserSession({required this.accessToken, required this.refreshToken, this.uid = 0, this.expiresIn = 0, this.loginName = '', this.obtainedAt = 0}): super._();
  

@override final  String accessToken;
@override final  String refreshToken;
@override@JsonKey() final  int uid;
@override@JsonKey() final  int expiresIn;
@override@JsonKey() final  String loginName;
@override@JsonKey() final  int obtainedAt;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionCopyWith<_UserSession> get copyWith => __$UserSessionCopyWithImpl<_UserSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSession&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.loginName, loginName) || other.loginName == loginName)&&(identical(other.obtainedAt, obtainedAt) || other.obtainedAt == obtainedAt));
}


@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,uid,expiresIn,loginName,obtainedAt);

@override
String toString() {
  return 'UserSession(accessToken: $accessToken, refreshToken: $refreshToken, uid: $uid, expiresIn: $expiresIn, loginName: $loginName, obtainedAt: $obtainedAt)';
}


}

/// @nodoc
abstract mixin class _$UserSessionCopyWith<$Res> implements $UserSessionCopyWith<$Res> {
  factory _$UserSessionCopyWith(_UserSession value, $Res Function(_UserSession) _then) = __$UserSessionCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, int uid, int expiresIn, String loginName, int obtainedAt
});




}
/// @nodoc
class __$UserSessionCopyWithImpl<$Res>
    implements _$UserSessionCopyWith<$Res> {
  __$UserSessionCopyWithImpl(this._self, this._then);

  final _UserSession _self;
  final $Res Function(_UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? uid = null,Object? expiresIn = null,Object? loginName = null,Object? obtainedAt = null,}) {
  return _then(_UserSession(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,loginName: null == loginName ? _self.loginName : loginName // ignore: cast_nullable_to_non_nullable
as String,obtainedAt: null == obtainedAt ? _self.obtainedAt : obtainedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CloudUser {

 String get username; int get registeredAt;
/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudUserCopyWith<CloudUser> get copyWith => _$CloudUserCopyWithImpl<CloudUser>(this as CloudUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudUser&&(identical(other.username, username) || other.username == username)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,username,registeredAt);

@override
String toString() {
  return 'CloudUser(username: $username, registeredAt: $registeredAt)';
}


}

/// @nodoc
abstract mixin class $CloudUserCopyWith<$Res>  {
  factory $CloudUserCopyWith(CloudUser value, $Res Function(CloudUser) _then) = _$CloudUserCopyWithImpl;
@useResult
$Res call({
 String username, int registeredAt
});




}
/// @nodoc
class _$CloudUserCopyWithImpl<$Res>
    implements $CloudUserCopyWith<$Res> {
  _$CloudUserCopyWithImpl(this._self, this._then);

  final CloudUser _self;
  final $Res Function(CloudUser) _then;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? registeredAt = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudUser].
extension CloudUserPatterns on CloudUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudUser value)  $default,){
final _that = this;
switch (_that) {
case _CloudUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudUser value)?  $default,){
final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  int registeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
return $default(_that.username,_that.registeredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  int registeredAt)  $default,) {final _that = this;
switch (_that) {
case _CloudUser():
return $default(_that.username,_that.registeredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  int registeredAt)?  $default,) {final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
return $default(_that.username,_that.registeredAt);case _:
  return null;

}
}

}

/// @nodoc


class _CloudUser implements CloudUser {
  const _CloudUser({this.username = '', this.registeredAt = 0});
  

@override@JsonKey() final  String username;
@override@JsonKey() final  int registeredAt;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudUserCopyWith<_CloudUser> get copyWith => __$CloudUserCopyWithImpl<_CloudUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudUser&&(identical(other.username, username) || other.username == username)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,username,registeredAt);

@override
String toString() {
  return 'CloudUser(username: $username, registeredAt: $registeredAt)';
}


}

/// @nodoc
abstract mixin class _$CloudUserCopyWith<$Res> implements $CloudUserCopyWith<$Res> {
  factory _$CloudUserCopyWith(_CloudUser value, $Res Function(_CloudUser) _then) = __$CloudUserCopyWithImpl;
@override @useResult
$Res call({
 String username, int registeredAt
});




}
/// @nodoc
class __$CloudUserCopyWithImpl<$Res>
    implements _$CloudUserCopyWith<$Res> {
  __$CloudUserCopyWithImpl(this._self, this._then);

  final _CloudUser _self;
  final $Res Function(_CloudUser) _then;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? registeredAt = null,}) {
  return _then(_CloudUser(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CloudUserPage {

 List<CloudUser> get list; int get pageNo; int get pageSize; int get pages; int get total;
/// Create a copy of CloudUserPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudUserPageCopyWith<CloudUserPage> get copyWith => _$CloudUserPageCopyWithImpl<CloudUserPage>(this as CloudUserPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudUserPage&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'CloudUserPage(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class $CloudUserPageCopyWith<$Res>  {
  factory $CloudUserPageCopyWith(CloudUserPage value, $Res Function(CloudUserPage) _then) = _$CloudUserPageCopyWithImpl;
@useResult
$Res call({
 List<CloudUser> list, int pageNo, int pageSize, int pages, int total
});




}
/// @nodoc
class _$CloudUserPageCopyWithImpl<$Res>
    implements $CloudUserPageCopyWith<$Res> {
  _$CloudUserPageCopyWithImpl(this._self, this._then);

  final CloudUserPage _self;
  final $Res Function(CloudUserPage) _then;

/// Create a copy of CloudUserPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<CloudUser>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudUserPage].
extension CloudUserPagePatterns on CloudUserPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudUserPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudUserPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudUserPage value)  $default,){
final _that = this;
switch (_that) {
case _CloudUserPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudUserPage value)?  $default,){
final _that = this;
switch (_that) {
case _CloudUserPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CloudUser> list,  int pageNo,  int pageSize,  int pages,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudUserPage() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CloudUser> list,  int pageNo,  int pageSize,  int pages,  int total)  $default,) {final _that = this;
switch (_that) {
case _CloudUserPage():
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CloudUser> list,  int pageNo,  int pageSize,  int pages,  int total)?  $default,) {final _that = this;
switch (_that) {
case _CloudUserPage() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _CloudUserPage implements CloudUserPage {
  const _CloudUserPage({final  List<CloudUser> list = const [], this.pageNo = 1, this.pageSize = 20, this.pages = 0, this.total = 0}): _list = list;
  

 final  List<CloudUser> _list;
@override@JsonKey() List<CloudUser> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int pageNo;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int pages;
@override@JsonKey() final  int total;

/// Create a copy of CloudUserPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudUserPageCopyWith<_CloudUserPage> get copyWith => __$CloudUserPageCopyWithImpl<_CloudUserPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudUserPage&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'CloudUserPage(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CloudUserPageCopyWith<$Res> implements $CloudUserPageCopyWith<$Res> {
  factory _$CloudUserPageCopyWith(_CloudUserPage value, $Res Function(_CloudUserPage) _then) = __$CloudUserPageCopyWithImpl;
@override @useResult
$Res call({
 List<CloudUser> list, int pageNo, int pageSize, int pages, int total
});




}
/// @nodoc
class __$CloudUserPageCopyWithImpl<$Res>
    implements _$CloudUserPageCopyWith<$Res> {
  __$CloudUserPageCopyWithImpl(this._self, this._then);

  final _CloudUserPage _self;
  final $Res Function(_CloudUserPage) _then;

/// Create a copy of CloudUserPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_CloudUserPage(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CloudUser>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
