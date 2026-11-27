// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gatewayApi)
const gatewayApiProvider = GatewayApiProvider._();

final class GatewayApiProvider
    extends $FunctionalProvider<GatewayApi, GatewayApi, GatewayApi>
    with $Provider<GatewayApi> {
  const GatewayApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayApiHash();

  @$internal
  @override
  $ProviderElement<GatewayApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GatewayApi create(Ref ref) {
    return gatewayApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GatewayApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GatewayApi>(value),
    );
  }
}

String _$gatewayApiHash() => r'7783620f4824cd84e5ac5545195873ced00774dc';

@ProviderFor(GatewayDataSource)
const gatewayDataSourceProvider = GatewayDataSourceProvider._();

final class GatewayDataSourceProvider
    extends $NotifierProvider<GatewayDataSource, void> {
  const GatewayDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayDataSourceHash();

  @$internal
  @override
  GatewayDataSource create() => GatewayDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$gatewayDataSourceHash() => r'c9784eba8d88e99772e9903dd264f7c3333c37e0';

abstract class _$GatewayDataSource extends $Notifier<void> {
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
