// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GatewayAddNotifier)
const gatewayAddProvider = GatewayAddNotifierProvider._();

final class GatewayAddNotifierProvider
    extends $AsyncNotifierProvider<GatewayAddNotifier, GatewayAddState> {
  const GatewayAddNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayAddProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayAddNotifierHash();

  @$internal
  @override
  GatewayAddNotifier create() => GatewayAddNotifier();
}

String _$gatewayAddNotifierHash() =>
    r'2c298bd3e16d049fe9d161c281f0414bd7960034';

abstract class _$GatewayAddNotifier extends $AsyncNotifier<GatewayAddState> {
  FutureOr<GatewayAddState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<GatewayAddState>, GatewayAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GatewayAddState>, GatewayAddState>,
              AsyncValue<GatewayAddState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
