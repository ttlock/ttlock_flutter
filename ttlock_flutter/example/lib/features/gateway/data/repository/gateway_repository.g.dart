// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GatewayRepository)
const gatewayRepositoryProvider = GatewayRepositoryProvider._();

final class GatewayRepositoryProvider
    extends $NotifierProvider<GatewayRepository, void> {
  const GatewayRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayRepositoryHash();

  @$internal
  @override
  GatewayRepository create() => GatewayRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$gatewayRepositoryHash() => r'0a1d5cc49eeef3cb871baaf6f368614fd2a809d9';

abstract class _$GatewayRepository extends $Notifier<void> {
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
