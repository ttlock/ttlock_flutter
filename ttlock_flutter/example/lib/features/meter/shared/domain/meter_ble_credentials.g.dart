// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_ble_credentials.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 解析 BLE 凭证。
///
/// 原来是 water / electric 各自的私有 `_credentials()`；共享层拿不到，提到
/// `shared/domain` 并参数化 [MeterKind]。凭证缺失 → business(-32)，与既有口径一致。

@ProviderFor(MeterBleCredentialsResolver)
const meterBleCredentialsResolverProvider =
    MeterBleCredentialsResolverProvider._();

/// 解析 BLE 凭证。
///
/// 原来是 water / electric 各自的私有 `_credentials()`；共享层拿不到，提到
/// `shared/domain` 并参数化 [MeterKind]。凭证缺失 → business(-32)，与既有口径一致。
final class MeterBleCredentialsResolverProvider
    extends $NotifierProvider<MeterBleCredentialsResolver, void> {
  /// 解析 BLE 凭证。
  ///
  /// 原来是 water / electric 各自的私有 `_credentials()`；共享层拿不到，提到
  /// `shared/domain` 并参数化 [MeterKind]。凭证缺失 → business(-32)，与既有口径一致。
  const MeterBleCredentialsResolverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meterBleCredentialsResolverProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meterBleCredentialsResolverHash();

  @$internal
  @override
  MeterBleCredentialsResolver create() => MeterBleCredentialsResolver();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$meterBleCredentialsResolverHash() =>
    r'0c41a1bb3e3f01747418866ddec7b01fd292f68e';

/// 解析 BLE 凭证。
///
/// 原来是 water / electric 各自的私有 `_credentials()`；共享层拿不到，提到
/// `shared/domain` 并参数化 [MeterKind]。凭证缺失 → business(-32)，与既有口径一致。

abstract class _$MeterBleCredentialsResolver extends $Notifier<void> {
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
