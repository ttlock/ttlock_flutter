// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waterMeterApi)
const waterMeterApiProvider = WaterMeterApiProvider._();

final class WaterMeterApiProvider
    extends $FunctionalProvider<WaterMeterApi, WaterMeterApi, WaterMeterApi>
    with $Provider<WaterMeterApi> {
  const WaterMeterApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterApiHash();

  @$internal
  @override
  $ProviderElement<WaterMeterApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaterMeterApi create(Ref ref) {
    return waterMeterApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaterMeterApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaterMeterApi>(value),
    );
  }
}

String _$waterMeterApiHash() => r'1a0153b08f1de47de9eed4932d57c0195124fbf2';

@ProviderFor(WaterMeterDataSource)
const waterMeterDataSourceProvider = WaterMeterDataSourceProvider._();

final class WaterMeterDataSourceProvider
    extends $NotifierProvider<WaterMeterDataSource, void> {
  const WaterMeterDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterDataSourceHash();

  @$internal
  @override
  WaterMeterDataSource create() => WaterMeterDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$waterMeterDataSourceHash() =>
    r'2e11ed564cf03a593343f8d4716b80b7391c6497';

abstract class _$WaterMeterDataSource extends $Notifier<void> {
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
