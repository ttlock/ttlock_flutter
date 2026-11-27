// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaterMeterDomain)
const waterMeterDomainProvider = WaterMeterDomainProvider._();

final class WaterMeterDomainProvider
    extends $NotifierProvider<WaterMeterDomain, void> {
  const WaterMeterDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterDomainHash();

  @$internal
  @override
  WaterMeterDomain create() => WaterMeterDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$waterMeterDomainHash() => r'e05055e50ddfc70c7b5d06ef3897c4667a7a4cd6';

abstract class _$WaterMeterDomain extends $Notifier<void> {
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
