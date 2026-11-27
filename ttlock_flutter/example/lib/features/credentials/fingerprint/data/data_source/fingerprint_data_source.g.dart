// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fingerprintApi)
const fingerprintApiProvider = FingerprintApiProvider._();

final class FingerprintApiProvider
    extends $FunctionalProvider<FingerprintApi, FingerprintApi, FingerprintApi>
    with $Provider<FingerprintApi> {
  const FingerprintApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fingerprintApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fingerprintApiHash();

  @$internal
  @override
  $ProviderElement<FingerprintApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FingerprintApi create(Ref ref) {
    return fingerprintApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FingerprintApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FingerprintApi>(value),
    );
  }
}

String _$fingerprintApiHash() => r'e2bc36e263138f40688eeb88bb9e9b38fe8f699f';

@ProviderFor(FingerprintDataSource)
const fingerprintDataSourceProvider = FingerprintDataSourceProvider._();

final class FingerprintDataSourceProvider
    extends $NotifierProvider<FingerprintDataSource, void> {
  const FingerprintDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fingerprintDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fingerprintDataSourceHash();

  @$internal
  @override
  FingerprintDataSource create() => FingerprintDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$fingerprintDataSourceHash() =>
    r'50bb6bf28a462af09e6fcb47fcfe15eac4d6ca40';

abstract class _$FingerprintDataSource extends $Notifier<void> {
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
