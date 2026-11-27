// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElectricMeterDomain)
const electricMeterDomainProvider = ElectricMeterDomainProvider._();

final class ElectricMeterDomainProvider
    extends $NotifierProvider<ElectricMeterDomain, void> {
  const ElectricMeterDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterDomainHash();

  @$internal
  @override
  ElectricMeterDomain create() => ElectricMeterDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$electricMeterDomainHash() =>
    r'2a91f41b6c1587697cb00c6568f077b1aac2acf5';

abstract class _$ElectricMeterDomain extends $Notifier<void> {
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
