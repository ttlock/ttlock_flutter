// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door_sensor_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DoorSensorRepository)
const doorSensorRepositoryProvider = DoorSensorRepositoryProvider._();

final class DoorSensorRepositoryProvider
    extends $NotifierProvider<DoorSensorRepository, void> {
  const DoorSensorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doorSensorRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doorSensorRepositoryHash();

  @$internal
  @override
  DoorSensorRepository create() => DoorSensorRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$doorSensorRepositoryHash() =>
    r'd7ec7cad9aceb9ff2b843a200df31cc91b01ea19';

abstract class _$DoorSensorRepository extends $Notifier<void> {
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

@ProviderFor(StandaloneDoorSensorRepository)
const standaloneDoorSensorRepositoryProvider =
    StandaloneDoorSensorRepositoryProvider._();

final class StandaloneDoorSensorRepositoryProvider
    extends $NotifierProvider<StandaloneDoorSensorRepository, void> {
  const StandaloneDoorSensorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'standaloneDoorSensorRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$standaloneDoorSensorRepositoryHash();

  @$internal
  @override
  StandaloneDoorSensorRepository create() => StandaloneDoorSensorRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$standaloneDoorSensorRepositoryHash() =>
    r'a19b349936550b2dbce73d571f38331519104787';

abstract class _$StandaloneDoorSensorRepository extends $Notifier<void> {
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
