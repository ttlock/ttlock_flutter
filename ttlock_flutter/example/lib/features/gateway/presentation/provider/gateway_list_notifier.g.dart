// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GatewayListNotifier)
const gatewayListProvider = GatewayListNotifierProvider._();

final class GatewayListNotifierProvider
    extends $AsyncNotifierProvider<GatewayListNotifier, GatewayListState> {
  const GatewayListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gatewayListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gatewayListNotifierHash();

  @$internal
  @override
  GatewayListNotifier create() => GatewayListNotifier();
}

String _$gatewayListNotifierHash() =>
    r'57c6c77358cbf3e2d771618ed218c47f0b395ad6';

abstract class _$GatewayListNotifier extends $AsyncNotifier<GatewayListState> {
  FutureOr<GatewayListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<GatewayListState>, GatewayListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GatewayListState>, GatewayListState>,
              AsyncValue<GatewayListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
