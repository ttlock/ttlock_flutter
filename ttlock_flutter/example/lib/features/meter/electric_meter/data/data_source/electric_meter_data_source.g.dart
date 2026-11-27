// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(electricMeterApi)
const electricMeterApiProvider = ElectricMeterApiProvider._();

final class ElectricMeterApiProvider
    extends
        $FunctionalProvider<
          ElectricMeterApi,
          ElectricMeterApi,
          ElectricMeterApi
        >
    with $Provider<ElectricMeterApi> {
  const ElectricMeterApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterApiHash();

  @$internal
  @override
  $ProviderElement<ElectricMeterApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ElectricMeterApi create(Ref ref) {
    return electricMeterApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ElectricMeterApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ElectricMeterApi>(value),
    );
  }
}

String _$electricMeterApiHash() => r'9326d5958b4c15f03bc6b50f0ccc06b236a61ef0';

@ProviderFor(ElectricMeterDataSource)
const electricMeterDataSourceProvider = ElectricMeterDataSourceProvider._();

final class ElectricMeterDataSourceProvider
    extends $NotifierProvider<ElectricMeterDataSource, void> {
  const ElectricMeterDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterDataSourceHash();

  @$internal
  @override
  ElectricMeterDataSource create() => ElectricMeterDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$electricMeterDataSourceHash() =>
    r'8d43a8845320fd5c8acff667331e076fece00599';

abstract class _$ElectricMeterDataSource extends $Notifier<void> {
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
