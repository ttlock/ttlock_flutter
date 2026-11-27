// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FingerprintRepository)
const fingerprintRepositoryProvider = FingerprintRepositoryProvider._();

final class FingerprintRepositoryProvider
    extends $NotifierProvider<FingerprintRepository, void> {
  const FingerprintRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fingerprintRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fingerprintRepositoryHash();

  @$internal
  @override
  FingerprintRepository create() => FingerprintRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$fingerprintRepositoryHash() =>
    r'7d18763ffb0f30357da5dc64dd9108100e0f0f52';

abstract class _$FingerprintRepository extends $Notifier<void> {
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
