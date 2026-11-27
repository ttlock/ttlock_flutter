// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keypad_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KeypadDetailState {

 WirelessKeypadEntity get keypad; bool get slotsLoading; List<KeypadSlot> get slots; AppException? get slotsError;/// 最近一次**页面级操作**的失败原因（解绑 / 重试同步 / 重命名 / 检查固件）。
///
/// 统一一个字段而非每种操作一个：页面只需在 `ref.listen` 里弹一次 snackbar。
/// snackbar 就报这次操作本身——**不按 [pendingCloudSync] 分流**：它是粘性的
/// （云端推送失败后一直为 true），而本字段每次操作都会被覆盖，按前者分流会
/// 让解绑失败之后的任何一次失败都被误报成「云端未同步」，真实原因被吞掉。
/// 云端未同步由常驻横幅负责，见 [pendingCloudSync]。
 AppException? get actionError; bool get unbinding;/// **BLE 已完成、云端未同步**：键盘槽位已清空，重试只重发云端。
 bool get pendingCloudSync; bool get renaming; bool get checkingUpgrade;
/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeypadDetailStateCopyWith<KeypadDetailState> get copyWith => _$KeypadDetailStateCopyWithImpl<KeypadDetailState>(this as KeypadDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeypadDetailState&&(identical(other.keypad, keypad) || other.keypad == keypad)&&(identical(other.slotsLoading, slotsLoading) || other.slotsLoading == slotsLoading)&&const DeepCollectionEquality().equals(other.slots, slots)&&(identical(other.slotsError, slotsError) || other.slotsError == slotsError)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.unbinding, unbinding) || other.unbinding == unbinding)&&(identical(other.pendingCloudSync, pendingCloudSync) || other.pendingCloudSync == pendingCloudSync)&&(identical(other.renaming, renaming) || other.renaming == renaming)&&(identical(other.checkingUpgrade, checkingUpgrade) || other.checkingUpgrade == checkingUpgrade));
}


@override
int get hashCode => Object.hash(runtimeType,keypad,slotsLoading,const DeepCollectionEquality().hash(slots),slotsError,actionError,unbinding,pendingCloudSync,renaming,checkingUpgrade);

@override
String toString() {
  return 'KeypadDetailState(keypad: $keypad, slotsLoading: $slotsLoading, slots: $slots, slotsError: $slotsError, actionError: $actionError, unbinding: $unbinding, pendingCloudSync: $pendingCloudSync, renaming: $renaming, checkingUpgrade: $checkingUpgrade)';
}


}

/// @nodoc
abstract mixin class $KeypadDetailStateCopyWith<$Res>  {
  factory $KeypadDetailStateCopyWith(KeypadDetailState value, $Res Function(KeypadDetailState) _then) = _$KeypadDetailStateCopyWithImpl;
@useResult
$Res call({
 WirelessKeypadEntity keypad, bool slotsLoading, List<KeypadSlot> slots, AppException? slotsError, AppException? actionError, bool unbinding, bool pendingCloudSync, bool renaming, bool checkingUpgrade
});


$WirelessKeypadEntityCopyWith<$Res> get keypad;$AppExceptionCopyWith<$Res>? get slotsError;$AppExceptionCopyWith<$Res>? get actionError;

}
/// @nodoc
class _$KeypadDetailStateCopyWithImpl<$Res>
    implements $KeypadDetailStateCopyWith<$Res> {
  _$KeypadDetailStateCopyWithImpl(this._self, this._then);

  final KeypadDetailState _self;
  final $Res Function(KeypadDetailState) _then;

/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keypad = null,Object? slotsLoading = null,Object? slots = null,Object? slotsError = freezed,Object? actionError = freezed,Object? unbinding = null,Object? pendingCloudSync = null,Object? renaming = null,Object? checkingUpgrade = null,}) {
  return _then(_self.copyWith(
keypad: null == keypad ? _self.keypad : keypad // ignore: cast_nullable_to_non_nullable
as WirelessKeypadEntity,slotsLoading: null == slotsLoading ? _self.slotsLoading : slotsLoading // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<KeypadSlot>,slotsError: freezed == slotsError ? _self.slotsError : slotsError // ignore: cast_nullable_to_non_nullable
as AppException?,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as AppException?,unbinding: null == unbinding ? _self.unbinding : unbinding // ignore: cast_nullable_to_non_nullable
as bool,pendingCloudSync: null == pendingCloudSync ? _self.pendingCloudSync : pendingCloudSync // ignore: cast_nullable_to_non_nullable
as bool,renaming: null == renaming ? _self.renaming : renaming // ignore: cast_nullable_to_non_nullable
as bool,checkingUpgrade: null == checkingUpgrade ? _self.checkingUpgrade : checkingUpgrade // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WirelessKeypadEntityCopyWith<$Res> get keypad {
  
  return $WirelessKeypadEntityCopyWith<$Res>(_self.keypad, (value) {
    return _then(_self.copyWith(keypad: value));
  });
}/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get slotsError {
    if (_self.slotsError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.slotsError!, (value) {
    return _then(_self.copyWith(slotsError: value));
  });
}/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get actionError {
    if (_self.actionError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.actionError!, (value) {
    return _then(_self.copyWith(actionError: value));
  });
}
}


/// Adds pattern-matching-related methods to [KeypadDetailState].
extension KeypadDetailStatePatterns on KeypadDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeypadDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeypadDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeypadDetailState value)  $default,){
final _that = this;
switch (_that) {
case _KeypadDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeypadDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _KeypadDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WirelessKeypadEntity keypad,  bool slotsLoading,  List<KeypadSlot> slots,  AppException? slotsError,  AppException? actionError,  bool unbinding,  bool pendingCloudSync,  bool renaming,  bool checkingUpgrade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeypadDetailState() when $default != null:
return $default(_that.keypad,_that.slotsLoading,_that.slots,_that.slotsError,_that.actionError,_that.unbinding,_that.pendingCloudSync,_that.renaming,_that.checkingUpgrade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WirelessKeypadEntity keypad,  bool slotsLoading,  List<KeypadSlot> slots,  AppException? slotsError,  AppException? actionError,  bool unbinding,  bool pendingCloudSync,  bool renaming,  bool checkingUpgrade)  $default,) {final _that = this;
switch (_that) {
case _KeypadDetailState():
return $default(_that.keypad,_that.slotsLoading,_that.slots,_that.slotsError,_that.actionError,_that.unbinding,_that.pendingCloudSync,_that.renaming,_that.checkingUpgrade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WirelessKeypadEntity keypad,  bool slotsLoading,  List<KeypadSlot> slots,  AppException? slotsError,  AppException? actionError,  bool unbinding,  bool pendingCloudSync,  bool renaming,  bool checkingUpgrade)?  $default,) {final _that = this;
switch (_that) {
case _KeypadDetailState() when $default != null:
return $default(_that.keypad,_that.slotsLoading,_that.slots,_that.slotsError,_that.actionError,_that.unbinding,_that.pendingCloudSync,_that.renaming,_that.checkingUpgrade);case _:
  return null;

}
}

}

/// @nodoc


class _KeypadDetailState extends KeypadDetailState {
  const _KeypadDetailState({required this.keypad, this.slotsLoading = false, final  List<KeypadSlot> slots = const <KeypadSlot>[], this.slotsError, this.actionError, this.unbinding = false, this.pendingCloudSync = false, this.renaming = false, this.checkingUpgrade = false}): _slots = slots,super._();
  

@override final  WirelessKeypadEntity keypad;
@override@JsonKey() final  bool slotsLoading;
 final  List<KeypadSlot> _slots;
@override@JsonKey() List<KeypadSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}

@override final  AppException? slotsError;
/// 最近一次**页面级操作**的失败原因（解绑 / 重试同步 / 重命名 / 检查固件）。
///
/// 统一一个字段而非每种操作一个：页面只需在 `ref.listen` 里弹一次 snackbar。
/// snackbar 就报这次操作本身——**不按 [pendingCloudSync] 分流**：它是粘性的
/// （云端推送失败后一直为 true），而本字段每次操作都会被覆盖，按前者分流会
/// 让解绑失败之后的任何一次失败都被误报成「云端未同步」，真实原因被吞掉。
/// 云端未同步由常驻横幅负责，见 [pendingCloudSync]。
@override final  AppException? actionError;
@override@JsonKey() final  bool unbinding;
/// **BLE 已完成、云端未同步**：键盘槽位已清空，重试只重发云端。
@override@JsonKey() final  bool pendingCloudSync;
@override@JsonKey() final  bool renaming;
@override@JsonKey() final  bool checkingUpgrade;

/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeypadDetailStateCopyWith<_KeypadDetailState> get copyWith => __$KeypadDetailStateCopyWithImpl<_KeypadDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeypadDetailState&&(identical(other.keypad, keypad) || other.keypad == keypad)&&(identical(other.slotsLoading, slotsLoading) || other.slotsLoading == slotsLoading)&&const DeepCollectionEquality().equals(other._slots, _slots)&&(identical(other.slotsError, slotsError) || other.slotsError == slotsError)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.unbinding, unbinding) || other.unbinding == unbinding)&&(identical(other.pendingCloudSync, pendingCloudSync) || other.pendingCloudSync == pendingCloudSync)&&(identical(other.renaming, renaming) || other.renaming == renaming)&&(identical(other.checkingUpgrade, checkingUpgrade) || other.checkingUpgrade == checkingUpgrade));
}


@override
int get hashCode => Object.hash(runtimeType,keypad,slotsLoading,const DeepCollectionEquality().hash(_slots),slotsError,actionError,unbinding,pendingCloudSync,renaming,checkingUpgrade);

@override
String toString() {
  return 'KeypadDetailState(keypad: $keypad, slotsLoading: $slotsLoading, slots: $slots, slotsError: $slotsError, actionError: $actionError, unbinding: $unbinding, pendingCloudSync: $pendingCloudSync, renaming: $renaming, checkingUpgrade: $checkingUpgrade)';
}


}

/// @nodoc
abstract mixin class _$KeypadDetailStateCopyWith<$Res> implements $KeypadDetailStateCopyWith<$Res> {
  factory _$KeypadDetailStateCopyWith(_KeypadDetailState value, $Res Function(_KeypadDetailState) _then) = __$KeypadDetailStateCopyWithImpl;
@override @useResult
$Res call({
 WirelessKeypadEntity keypad, bool slotsLoading, List<KeypadSlot> slots, AppException? slotsError, AppException? actionError, bool unbinding, bool pendingCloudSync, bool renaming, bool checkingUpgrade
});


@override $WirelessKeypadEntityCopyWith<$Res> get keypad;@override $AppExceptionCopyWith<$Res>? get slotsError;@override $AppExceptionCopyWith<$Res>? get actionError;

}
/// @nodoc
class __$KeypadDetailStateCopyWithImpl<$Res>
    implements _$KeypadDetailStateCopyWith<$Res> {
  __$KeypadDetailStateCopyWithImpl(this._self, this._then);

  final _KeypadDetailState _self;
  final $Res Function(_KeypadDetailState) _then;

/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keypad = null,Object? slotsLoading = null,Object? slots = null,Object? slotsError = freezed,Object? actionError = freezed,Object? unbinding = null,Object? pendingCloudSync = null,Object? renaming = null,Object? checkingUpgrade = null,}) {
  return _then(_KeypadDetailState(
keypad: null == keypad ? _self.keypad : keypad // ignore: cast_nullable_to_non_nullable
as WirelessKeypadEntity,slotsLoading: null == slotsLoading ? _self.slotsLoading : slotsLoading // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<KeypadSlot>,slotsError: freezed == slotsError ? _self.slotsError : slotsError // ignore: cast_nullable_to_non_nullable
as AppException?,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as AppException?,unbinding: null == unbinding ? _self.unbinding : unbinding // ignore: cast_nullable_to_non_nullable
as bool,pendingCloudSync: null == pendingCloudSync ? _self.pendingCloudSync : pendingCloudSync // ignore: cast_nullable_to_non_nullable
as bool,renaming: null == renaming ? _self.renaming : renaming // ignore: cast_nullable_to_non_nullable
as bool,checkingUpgrade: null == checkingUpgrade ? _self.checkingUpgrade : checkingUpgrade // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WirelessKeypadEntityCopyWith<$Res> get keypad {
  
  return $WirelessKeypadEntityCopyWith<$Res>(_self.keypad, (value) {
    return _then(_self.copyWith(keypad: value));
  });
}/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get slotsError {
    if (_self.slotsError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.slotsError!, (value) {
    return _then(_self.copyWith(slotsError: value));
  });
}/// Create a copy of KeypadDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get actionError {
    if (_self.actionError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.actionError!, (value) {
    return _then(_self.copyWith(actionError: value));
  });
}
}

// dart format on
