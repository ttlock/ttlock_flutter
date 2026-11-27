// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_locks_for_power_switch.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 取电「关联门锁」候选：酒店锁列表（`listByHotel type=1`）。
///
/// 与酒店列表页的 [hotelLockListNotifierProvider] 隔离，避免改动对方筛选状态。

@ProviderFor(hotelLocksForPowerSwitch)
const hotelLocksForPowerSwitchProvider = HotelLocksForPowerSwitchProvider._();

/// 取电「关联门锁」候选：酒店锁列表（`listByHotel type=1`）。
///
/// 与酒店列表页的 [hotelLockListNotifierProvider] 隔离，避免改动对方筛选状态。

final class HotelLocksForPowerSwitchProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HotelLockEntity>>,
          List<HotelLockEntity>,
          FutureOr<List<HotelLockEntity>>
        >
    with
        $FutureModifier<List<HotelLockEntity>>,
        $FutureProvider<List<HotelLockEntity>> {
  /// 取电「关联门锁」候选：酒店锁列表（`listByHotel type=1`）。
  ///
  /// 与酒店列表页的 [hotelLockListNotifierProvider] 隔离，避免改动对方筛选状态。
  const HotelLocksForPowerSwitchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hotelLocksForPowerSwitchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hotelLocksForPowerSwitchHash();

  @$internal
  @override
  $FutureProviderElement<List<HotelLockEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HotelLockEntity>> create(Ref ref) {
    return hotelLocksForPowerSwitch(ref);
  }
}

String _$hotelLocksForPowerSwitchHash() =>
    r'169c28c069a5125c94017046275f8f254cc1822e';
