// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tt_lock_ble_guard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 注册一次 BLE 门卫；测试勿 read，除非显式要测门卫。

@ProviderFor(ttLockBleGuard)
const ttLockBleGuardProvider = TtLockBleGuardProvider._();

/// 注册一次 BLE 门卫；测试勿 read，除非显式要测门卫。

final class TtLockBleGuardProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 注册一次 BLE 门卫；测试勿 read，除非显式要测门卫。
  const TtLockBleGuardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ttLockBleGuardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ttLockBleGuardHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return ttLockBleGuard(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$ttLockBleGuardHash() => r'0226b797c8e639b242e5c50bb285301f1546cc6c';
