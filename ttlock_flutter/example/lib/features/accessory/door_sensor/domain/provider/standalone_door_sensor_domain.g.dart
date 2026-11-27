// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standalone_door_sensor_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StandaloneDoorSensorDomain)
const standaloneDoorSensorDomainProvider =
    StandaloneDoorSensorDomainProvider._();

final class StandaloneDoorSensorDomainProvider
    extends $NotifierProvider<StandaloneDoorSensorDomain, void> {
  const StandaloneDoorSensorDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'standaloneDoorSensorDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$standaloneDoorSensorDomainHash();

  @$internal
  @override
  StandaloneDoorSensorDomain create() => StandaloneDoorSensorDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$standaloneDoorSensorDomainHash() =>
    r'a6209e6b91ec86bd3d1d76807d440593001306c3';

abstract class _$StandaloneDoorSensorDomain extends $Notifier<void> {
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
