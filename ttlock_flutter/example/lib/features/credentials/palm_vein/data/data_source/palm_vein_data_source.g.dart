// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(palmVeinApi)
const palmVeinApiProvider = PalmVeinApiProvider._();

final class PalmVeinApiProvider
    extends $FunctionalProvider<PalmVeinApi, PalmVeinApi, PalmVeinApi>
    with $Provider<PalmVeinApi> {
  const PalmVeinApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'palmVeinApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$palmVeinApiHash();

  @$internal
  @override
  $ProviderElement<PalmVeinApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PalmVeinApi create(Ref ref) {
    return palmVeinApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PalmVeinApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PalmVeinApi>(value),
    );
  }
}

String _$palmVeinApiHash() => r'c27883d3d737303f11e22a2b9282f01558848829';

@ProviderFor(PalmVeinDataSource)
const palmVeinDataSourceProvider = PalmVeinDataSourceProvider._();

final class PalmVeinDataSourceProvider
    extends $NotifierProvider<PalmVeinDataSource, void> {
  const PalmVeinDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'palmVeinDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$palmVeinDataSourceHash();

  @$internal
  @override
  PalmVeinDataSource create() => PalmVeinDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$palmVeinDataSourceHash() =>
    r'ef23ccb5a94f5f055adfe04bf6f20c506befe4dc';

abstract class _$PalmVeinDataSource extends $Notifier<void> {
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
