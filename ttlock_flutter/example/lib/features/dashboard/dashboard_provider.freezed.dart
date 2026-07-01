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
mixin _$DashboardState {
  List<SavedLockDevice> get locks;
  List<SavedGatewayDevice> get gateways;
  List<SavedMeterDevice> get waterMeters;
  List<SavedMeterDevice> get electricMeters;
  bool get isLoading;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      _$DashboardStateCopyWithImpl<DashboardState>(
          this as DashboardState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardState &&
            const DeepCollectionEquality().equals(other.locks, locks) &&
            const DeepCollectionEquality().equals(other.gateways, gateways) &&
            const DeepCollectionEquality()
                .equals(other.waterMeters, waterMeters) &&
            const DeepCollectionEquality()
                .equals(other.electricMeters, electricMeters) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(locks),
      const DeepCollectionEquality().hash(gateways),
      const DeepCollectionEquality().hash(waterMeters),
      const DeepCollectionEquality().hash(electricMeters),
      isLoading);

  @override
  String toString() {
    return 'DashboardState(locks: $locks, gateways: $gateways, waterMeters: $waterMeters, electricMeters: $electricMeters, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) _then) =
      _$DashboardStateCopyWithImpl;
  @useResult
  $Res call(
      {List<SavedLockDevice> locks,
      List<SavedGatewayDevice> gateways,
      List<SavedMeterDevice> waterMeters,
      List<SavedMeterDevice> electricMeters,
      bool isLoading});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locks = null,
    Object? gateways = null,
    Object? waterMeters = null,
    Object? electricMeters = null,
    Object? isLoading = null,
  }) {
    return _then(_self.copyWith(
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
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _DashboardState implements DashboardState {
  const _DashboardState(
      {required final List<SavedLockDevice> locks,
      required final List<SavedGatewayDevice> gateways,
      required final List<SavedMeterDevice> waterMeters,
      required final List<SavedMeterDevice> electricMeters,
      this.isLoading = false})
      : _locks = locks,
        _gateways = gateways,
        _waterMeters = waterMeters,
        _electricMeters = electricMeters;

  final List<SavedLockDevice> _locks;
  @override
  List<SavedLockDevice> get locks {
    if (_locks is EqualUnmodifiableListView) return _locks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locks);
  }

  final List<SavedGatewayDevice> _gateways;
  @override
  List<SavedGatewayDevice> get gateways {
    if (_gateways is EqualUnmodifiableListView) return _gateways;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gateways);
  }

  final List<SavedMeterDevice> _waterMeters;
  @override
  List<SavedMeterDevice> get waterMeters {
    if (_waterMeters is EqualUnmodifiableListView) return _waterMeters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waterMeters);
  }

  final List<SavedMeterDevice> _electricMeters;
  @override
  List<SavedMeterDevice> get electricMeters {
    if (_electricMeters is EqualUnmodifiableListView) return _electricMeters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_electricMeters);
  }

  @override
  @JsonKey()
  final bool isLoading;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardStateCopyWith<_DashboardState> get copyWith =>
      __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardState &&
            const DeepCollectionEquality().equals(other._locks, _locks) &&
            const DeepCollectionEquality().equals(other._gateways, _gateways) &&
            const DeepCollectionEquality()
                .equals(other._waterMeters, _waterMeters) &&
            const DeepCollectionEquality()
                .equals(other._electricMeters, _electricMeters) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locks),
      const DeepCollectionEquality().hash(_gateways),
      const DeepCollectionEquality().hash(_waterMeters),
      const DeepCollectionEquality().hash(_electricMeters),
      isLoading);

  @override
  String toString() {
    return 'DashboardState(locks: $locks, gateways: $gateways, waterMeters: $waterMeters, electricMeters: $electricMeters, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(
          _DashboardState value, $Res Function(_DashboardState) _then) =
      __$DashboardStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<SavedLockDevice> locks,
      List<SavedGatewayDevice> gateways,
      List<SavedMeterDevice> waterMeters,
      List<SavedMeterDevice> electricMeters,
      bool isLoading});
}

/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locks = null,
    Object? gateways = null,
    Object? waterMeters = null,
    Object? electricMeters = null,
    Object? isLoading = null,
  }) {
    return _then(_DashboardState(
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
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
