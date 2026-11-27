// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaterMeterListNotifier)
const waterMeterListProvider = WaterMeterListNotifierProvider._();

final class WaterMeterListNotifierProvider
    extends
        $AsyncNotifierProvider<WaterMeterListNotifier, WaterMeterListState> {
  const WaterMeterListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterListNotifierHash();

  @$internal
  @override
  WaterMeterListNotifier create() => WaterMeterListNotifier();
}

String _$waterMeterListNotifierHash() =>
    r'e95bf3fc95a27ff63946c2a492c90cab1a3d3c36';

abstract class _$WaterMeterListNotifier
    extends $AsyncNotifier<WaterMeterListState> {
  FutureOr<WaterMeterListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<WaterMeterListState>, WaterMeterListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WaterMeterListState>, WaterMeterListState>,
              AsyncValue<WaterMeterListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
