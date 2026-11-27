// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door_sensor_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DoorSensorDomain)
const doorSensorDomainProvider = DoorSensorDomainProvider._();

final class DoorSensorDomainProvider
    extends $NotifierProvider<DoorSensorDomain, void> {
  const DoorSensorDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'doorSensorDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$doorSensorDomainHash();

  @$internal
  @override
  DoorSensorDomain create() => DoorSensorDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$doorSensorDomainHash() => r'3e4d198a64391461005ead251de8c997d3fe8670';

abstract class _$DoorSensorDomain extends $Notifier<void> {
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
