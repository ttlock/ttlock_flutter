// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_card_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IdentityCardRepository)
const identityCardRepositoryProvider = IdentityCardRepositoryProvider._();

final class IdentityCardRepositoryProvider
    extends $NotifierProvider<IdentityCardRepository, void> {
  const IdentityCardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'identityCardRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$identityCardRepositoryHash();

  @$internal
  @override
  IdentityCardRepository create() => IdentityCardRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$identityCardRepositoryHash() =>
    r'f094ee73c00198f1ae9343e4b968d627e8aeaa2f';

abstract class _$IdentityCardRepository extends $Notifier<void> {
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
