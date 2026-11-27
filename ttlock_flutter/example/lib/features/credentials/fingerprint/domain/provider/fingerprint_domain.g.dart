// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FingerprintDomain)
const fingerprintDomainProvider = FingerprintDomainProvider._();

final class FingerprintDomainProvider
    extends $NotifierProvider<FingerprintDomain, void> {
  const FingerprintDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fingerprintDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fingerprintDomainHash();

  @$internal
  @override
  FingerprintDomain create() => FingerprintDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$fingerprintDomainHash() => r'9f8843b3793a7a065ca738f6be981104c24b856e';

abstract class _$FingerprintDomain extends $Notifier<void> {
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
