// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door_sensor_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(doorSensorApi)
const doorSensorApiProvider = DoorSensorApiProvider._();

final class DoorSensorApiProvider
    extends $FunctionalProvider<DoorSensorApi, DoorSensorApi, DoorSensorApi>
    with $Provider<DoorSensorApi> {
  const DoorSensorApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doorSensorApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doorSensorApiHash();

  @$internal
  @override
  $ProviderElement<DoorSensorApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DoorSensorApi create(Ref ref) {
    return doorSensorApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DoorSensorApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DoorSensorApi>(value),
    );
  }
}

String _$doorSensorApiHash() => r'e705ab266684944925177f27b8294842ae9cca5e';

@ProviderFor(DoorSensorDataSource)
const doorSensorDataSourceProvider = DoorSensorDataSourceProvider._();

final class DoorSensorDataSourceProvider
    extends $NotifierProvider<DoorSensorDataSource, void> {
  const DoorSensorDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doorSensorDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doorSensorDataSourceHash();

  @$internal
  @override
  DoorSensorDataSource create() => DoorSensorDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$doorSensorDataSourceHash() =>
    r'd50b3ff15a9e23f16a780b80d2b85242dfb44d92';

abstract class _$DoorSensorDataSource extends $Notifier<void> {
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
