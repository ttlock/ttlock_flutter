// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElectricMeterRepository)
const electricMeterRepositoryProvider = ElectricMeterRepositoryProvider._();

final class ElectricMeterRepositoryProvider
    extends $NotifierProvider<ElectricMeterRepository, void> {
  const ElectricMeterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterRepositoryHash();

  @$internal
  @override
  ElectricMeterRepository create() => ElectricMeterRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$electricMeterRepositoryHash() =>
    r'f811d31a78a9eb1ca0bb1a94f7ec5a02ccbbacc3';

abstract class _$ElectricMeterRepository extends $Notifier<void> {
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
