// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_switch_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 取电开关页面状态机：工作模式、关联门锁。
///
/// BLE 写配置成功 → [PowerSwitchState.configOutcome]；失败 → [PowerSwitchState.error]。

@ProviderFor(PowerSwitchNotifier)
const powerSwitchProvider = PowerSwitchNotifierProvider._();

/// 取电开关页面状态机：工作模式、关联门锁。
///
/// BLE 写配置成功 → [PowerSwitchState.configOutcome]；失败 → [PowerSwitchState.error]。
final class PowerSwitchNotifierProvider
    extends $NotifierProvider<PowerSwitchNotifier, PowerSwitchState> {
  /// 取电开关页面状态机：工作模式、关联门锁。
  ///
  /// BLE 写配置成功 → [PowerSwitchState.configOutcome]；失败 → [PowerSwitchState.error]。
  const PowerSwitchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'powerSwitchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$powerSwitchNotifierHash();

  @$internal
  @override
  PowerSwitchNotifier create() => PowerSwitchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PowerSwitchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PowerSwitchState>(value),
    );
  }
}

String _$powerSwitchNotifierHash() =>
    r'd6cb71ad64d46ab9d245670eb1a8ef0beaa1c118';

/// 取电开关页面状态机：工作模式、关联门锁。
///
/// BLE 写配置成功 → [PowerSwitchState.configOutcome]；失败 → [PowerSwitchState.error]。

abstract class _$PowerSwitchNotifier extends $Notifier<PowerSwitchState> {
  PowerSwitchState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PowerSwitchState, PowerSwitchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PowerSwitchState, PowerSwitchState>,
              PowerSwitchState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
