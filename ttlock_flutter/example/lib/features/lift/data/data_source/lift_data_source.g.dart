// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(liftApi)
const liftApiProvider = LiftApiProvider._();

final class LiftApiProvider
    extends $FunctionalProvider<LiftApi, LiftApi, LiftApi>
    with $Provider<LiftApi> {
  const LiftApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liftApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liftApiHash();

  @$internal
  @override
  $ProviderElement<LiftApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LiftApi create(Ref ref) {
    return liftApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiftApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiftApi>(value),
    );
  }
}

String _$liftApiHash() => r'6e31b531caec0b5d0bd4f199e37907c1b0b33427';

@ProviderFor(LiftDataSource)
const liftDataSourceProvider = LiftDataSourceProvider._();

final class LiftDataSourceProvider
    extends $NotifierProvider<LiftDataSource, void> {
  const LiftDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liftDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liftDataSourceHash();

  @$internal
  @override
  LiftDataSource create() => LiftDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$liftDataSourceHash() => r'14325917ec660dfe8d9662c50f5ad950e06537a4';

abstract class _$LiftDataSource extends $Notifier<void> {
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
