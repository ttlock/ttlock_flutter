// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaterMeterRepository)
const waterMeterRepositoryProvider = WaterMeterRepositoryProvider._();

final class WaterMeterRepositoryProvider
    extends $NotifierProvider<WaterMeterRepository, void> {
  const WaterMeterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterRepositoryHash();

  @$internal
  @override
  WaterMeterRepository create() => WaterMeterRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$waterMeterRepositoryHash() =>
    r'7bb94537f9403315dcbb4175cabd1387a714e8ac';

abstract class _$WaterMeterRepository extends $Notifier<void> {
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
