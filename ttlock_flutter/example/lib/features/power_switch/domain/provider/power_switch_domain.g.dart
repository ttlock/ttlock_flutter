// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_switch_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 取电开关编排：工作模式 / 关联门锁（均 BLE 单轨，无云端配置回写）。
///
/// 开放平台 `listByHotel` 不返回 `hotelLockId`/`electric`，故与梯控工作模式一致，
/// 仅近场写设备；`lockData` 空 → -21。

@ProviderFor(PowerSwitchDomain)
const powerSwitchDomainProvider = PowerSwitchDomainProvider._();

/// 取电开关编排：工作模式 / 关联门锁（均 BLE 单轨，无云端配置回写）。
///
/// 开放平台 `listByHotel` 不返回 `hotelLockId`/`electric`，故与梯控工作模式一致，
/// 仅近场写设备；`lockData` 空 → -21。
final class PowerSwitchDomainProvider
    extends $NotifierProvider<PowerSwitchDomain, void> {
  /// 取电开关编排：工作模式 / 关联门锁（均 BLE 单轨，无云端配置回写）。
  ///
  /// 开放平台 `listByHotel` 不返回 `hotelLockId`/`electric`，故与梯控工作模式一致，
  /// 仅近场写设备；`lockData` 空 → -21。
  const PowerSwitchDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'powerSwitchDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$powerSwitchDomainHash();

  @$internal
  @override
  PowerSwitchDomain create() => PowerSwitchDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$powerSwitchDomainHash() => r'090e6e50885883af037b9b2bf94ef852a500362c';

/// 取电开关编排：工作模式 / 关联门锁（均 BLE 单轨，无云端配置回写）。
///
/// 开放平台 `listByHotel` 不返回 `hotelLockId`/`electric`，故与梯控工作模式一致，
/// 仅近场写设备；`lockData` 空 → -21。

abstract class _$PowerSwitchDomain extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
