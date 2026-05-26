// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfigModel {
  int get uid;
  String? get serverIp;
  String? get serverPort;
  String get gatewayName;

  /// Create a copy of ConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfigModelCopyWith<ConfigModel> get copyWith =>
      _$ConfigModelCopyWithImpl<ConfigModel>(this as ConfigModel, _$identity);

  /// Serializes this ConfigModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfigModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.serverIp, serverIp) ||
                other.serverIp == serverIp) &&
            (identical(other.serverPort, serverPort) ||
                other.serverPort == serverPort) &&
            (identical(other.gatewayName, gatewayName) ||
                other.gatewayName == gatewayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, serverIp, serverPort, gatewayName);

  @override
  String toString() {
    return 'ConfigModel(uid: $uid, serverIp: $serverIp, serverPort: $serverPort, gatewayName: $gatewayName)';
  }
}

/// @nodoc
abstract mixin class $ConfigModelCopyWith<$Res> {
  factory $ConfigModelCopyWith(
          ConfigModel value, $Res Function(ConfigModel) _then) =
      _$ConfigModelCopyWithImpl;
  @useResult
  $Res call(
      {int uid, String? serverIp, String? serverPort, String gatewayName});
}

/// @nodoc
class _$ConfigModelCopyWithImpl<$Res> implements $ConfigModelCopyWith<$Res> {
  _$ConfigModelCopyWithImpl(this._self, this._then);

  final ConfigModel _self;
  final $Res Function(ConfigModel) _then;

  /// Create a copy of ConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? serverIp = freezed,
    Object? serverPort = freezed,
    Object? gatewayName = null,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      serverIp: freezed == serverIp
          ? _self.serverIp
          : serverIp // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPort: freezed == serverPort
          ? _self.serverPort
          : serverPort // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayName: null == gatewayName
          ? _self.gatewayName
          : gatewayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ConfigModel extends ConfigModel {
  const _ConfigModel(
      {this.uid = 0,
      this.serverIp,
      this.serverPort,
      this.gatewayName = 'Gateway'})
      : super._();
  factory _ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);

  @override
  @JsonKey()
  final int uid;
  @override
  final String? serverIp;
  @override
  final String? serverPort;
  @override
  @JsonKey()
  final String gatewayName;

  /// Create a copy of ConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConfigModelCopyWith<_ConfigModel> get copyWith =>
      __$ConfigModelCopyWithImpl<_ConfigModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConfigModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConfigModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.serverIp, serverIp) ||
                other.serverIp == serverIp) &&
            (identical(other.serverPort, serverPort) ||
                other.serverPort == serverPort) &&
            (identical(other.gatewayName, gatewayName) ||
                other.gatewayName == gatewayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, serverIp, serverPort, gatewayName);

  @override
  String toString() {
    return 'ConfigModel(uid: $uid, serverIp: $serverIp, serverPort: $serverPort, gatewayName: $gatewayName)';
  }
}

/// @nodoc
abstract mixin class _$ConfigModelCopyWith<$Res>
    implements $ConfigModelCopyWith<$Res> {
  factory _$ConfigModelCopyWith(
          _ConfigModel value, $Res Function(_ConfigModel) _then) =
      __$ConfigModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int uid, String? serverIp, String? serverPort, String gatewayName});
}

/// @nodoc
class __$ConfigModelCopyWithImpl<$Res> implements _$ConfigModelCopyWith<$Res> {
  __$ConfigModelCopyWithImpl(this._self, this._then);

  final _ConfigModel _self;
  final $Res Function(_ConfigModel) _then;

  /// Create a copy of ConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? serverIp = freezed,
    Object? serverPort = freezed,
    Object? gatewayName = null,
  }) {
    return _then(_ConfigModel(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      serverIp: freezed == serverIp
          ? _self.serverIp
          : serverIp // ignore: cast_nullable_to_non_nullable
              as String?,
      serverPort: freezed == serverPort
          ? _self.serverPort
          : serverPort // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayName: null == gatewayName
          ? _self.gatewayName
          : gatewayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
