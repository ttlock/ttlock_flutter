// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GatewayDomain)
const gatewayDomainProvider = GatewayDomainProvider._();

final class GatewayDomainProvider
    extends $NotifierProvider<GatewayDomain, void> {
  const GatewayDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayDomainHash();

  @$internal
  @override
  GatewayDomain create() => GatewayDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$gatewayDomainHash() => r'f6e0c2232ecf7dac22e4b87fd90ea76d88545994';

abstract class _$GatewayDomain extends $Notifier<void> {
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
