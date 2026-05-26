// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardData {
  bool get hasConfig;
  List<SavedLockDevice> get locks;
  List<SavedGatewayDevice> get gateways;
  List<SavedMeterDevice> get waterMeters;
  List<SavedMeterDevice> get electricMeters;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      _$DashboardDataCopyWithImpl<DashboardData>(
          this as DashboardData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardData &&
            (identical(other.hasConfig, hasConfig) ||
                other.hasConfig == hasConfig) &&
            const DeepCollectionEquality().equals(other.locks, locks) &&
            const DeepCollectionEquality().equals(other.gateways, gateways) &&
            const DeepCollectionEquality()
                .equals(other.waterMeters, waterMeters) &&
            const DeepCollectionEquality()
                .equals(other.electricMeters, electricMeters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasConfig,
      const DeepCollectionEquality().hash(locks),
      const DeepCollectionEquality().hash(gateways),
      const DeepCollectionEquality().hash(waterMeters),
      const DeepCollectionEquality().hash(electricMeters));

  @override
  String toString() {
    return 'DashboardData(hasConfig: $hasConfig, locks: $locks, gateways: $gateways, waterMeters: $waterMeters, electricMeters: $electricMeters)';
  }
}

/// @nodoc
abstract mixin class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) _then) =
      _$DashboardDataCopyWithImpl;
  @useResult
  $Res call(
      {bool hasConfig,
      List<SavedLockDevice> locks,
      List<SavedGatewayDevice> gateways,
      List<SavedMeterDevice> waterMeters,
      List<SavedMeterDevice> electricMeters});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._self, this._then);

  final DashboardData _self;
  final $Res Function(DashboardData) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasConfig = null,
    Object? locks = null,
    Object? gateways = null,
    Object? waterMeters = null,
    Object? electricMeters = null,
  }) {
    return _then(_self.copyWith(
      hasConfig: null == hasConfig
          ? _self.hasConfig
          : hasConfig // ignore: cast_nullable_to_non_nullable
              as bool,
      locks: null == locks
          ? _self.locks
          : locks // ignore: cast_nullable_to_non_nullable
              as List<SavedLockDevice>,
      gateways: null == gateways
          ? _self.gateways
          : gateways // ignore: cast_nullable_to_non_nullable
              as List<SavedGatewayDevice>,
      waterMeters: null == waterMeters
          ? _self.waterMeters
          : waterMeters // ignore: cast_nullable_to_non_nullable
              as List<SavedMeterDevice>,
      electricMeters: null == electricMeters
          ? _self.electricMeters
          : electricMeters // ignore: cast_nullable_to_non_nullable
              as List<SavedMeterDevice>,
    ));
  }
}

/// @nodoc

class _DashboardData implements DashboardData {
  const _DashboardData(
      {this.hasConfig = false,
      final List<SavedLockDevice> locks = const [],
      final List<SavedGatewayDevice> gateways = const [],
      final List<SavedMeterDevice> waterMeters = const [],
      final List<SavedMeterDevice> electricMeters = const []})
      : _locks = locks,
        _gateways = gateways,
        _waterMeters = waterMeters,
        _electricMeters = electricMeters;

  @override
  @JsonKey()
  final bool hasConfig;
  final List<SavedLockDevice> _locks;
  @override
  @JsonKey()
  List<SavedLockDevice> get locks {
    if (_locks is EqualUnmodifiableListView) return _locks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locks);
  }

  final List<SavedGatewayDevice> _gateways;
  @override
  @JsonKey()
  List<SavedGatewayDevice> get gateways {
    if (_gateways is EqualUnmodifiableListView) return _gateways;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gateways);
  }

  final List<SavedMeterDevice> _waterMeters;
  @override
  @JsonKey()
  List<SavedMeterDevice> get waterMeters {
    if (_waterMeters is EqualUnmodifiableListView) return _waterMeters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waterMeters);
  }

  final List<SavedMeterDevice> _electricMeters;
  @override
  @JsonKey()
  List<SavedMeterDevice> get electricMeters {
    if (_electricMeters is EqualUnmodifiableListView) return _electricMeters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_electricMeters);
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardDataCopyWith<_DashboardData> get copyWith =>
      __$DashboardDataCopyWithImpl<_DashboardData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardData &&
            (identical(other.hasConfig, hasConfig) ||
                other.hasConfig == hasConfig) &&
            const DeepCollectionEquality().equals(other._locks, _locks) &&
            const DeepCollectionEquality().equals(other._gateways, _gateways) &&
            const DeepCollectionEquality()
                .equals(other._waterMeters, _waterMeters) &&
            const DeepCollectionEquality()
                .equals(other._electricMeters, _electricMeters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasConfig,
      const DeepCollectionEquality().hash(_locks),
      const DeepCollectionEquality().hash(_gateways),
      const DeepCollectionEquality().hash(_waterMeters),
      const DeepCollectionEquality().hash(_electricMeters));

  @override
  String toString() {
    return 'DashboardData(hasConfig: $hasConfig, locks: $locks, gateways: $gateways, waterMeters: $waterMeters, electricMeters: $electricMeters)';
  }
}

/// @nodoc
abstract mixin class _$DashboardDataCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$DashboardDataCopyWith(
          _DashboardData value, $Res Function(_DashboardData) _then) =
      __$DashboardDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool hasConfig,
      List<SavedLockDevice> locks,
      List<SavedGatewayDevice> gateways,
      List<SavedMeterDevice> waterMeters,
      List<SavedMeterDevice> electricMeters});
}

/// @nodoc
class __$DashboardDataCopyWithImpl<$Res>
    implements _$DashboardDataCopyWith<$Res> {
  __$DashboardDataCopyWithImpl(this._self, this._then);

  final _DashboardData _self;
  final $Res Function(_DashboardData) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hasConfig = null,
    Object? locks = null,
    Object? gateways = null,
    Object? waterMeters = null,
    Object? electricMeters = null,
  }) {
    return _then(_DashboardData(
      hasConfig: null == hasConfig
          ? _self.hasConfig
          : hasConfig // ignore: cast_nullable_to_non_nullable
              as bool,
      locks: null == locks
          ? _self._locks
          : locks // ignore: cast_nullable_to_non_nullable
              as List<SavedLockDevice>,
      gateways: null == gateways
          ? _self._gateways
          : gateways // ignore: cast_nullable_to_non_nullable
              as List<SavedGatewayDevice>,
      waterMeters: null == waterMeters
          ? _self._waterMeters
          : waterMeters // ignore: cast_nullable_to_non_nullable
              as List<SavedMeterDevice>,
      electricMeters: null == electricMeters
          ? _self._electricMeters
          : electricMeters // ignore: cast_nullable_to_non_nullable
              as List<SavedMeterDevice>,
    ));
  }
}

// dart format on
