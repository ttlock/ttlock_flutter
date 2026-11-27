// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 锁域编排：BLE 与 Cloud 双轨（spec §3.1/§3.2）。

@ProviderFor(LockDomain)
const lockDomainProvider = LockDomainProvider._();

/// 锁域编排：BLE 与 Cloud 双轨（spec §3.1/§3.2）。
final class LockDomainProvider extends $NotifierProvider<LockDomain, void> {
  /// 锁域编排：BLE 与 Cloud 双轨（spec §3.1/§3.2）。
  const LockDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lockDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lockDomainHash();

  @$internal
  @override
  LockDomain create() => LockDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$lockDomainHash() => r'02b3dec7e24080ec8412e40e57ebedada4af19da';

/// 锁域编排：BLE 与 Cloud 双轨（spec §3.1/§3.2）。

abstract class _$LockDomain extends $Notifier<void> {
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
