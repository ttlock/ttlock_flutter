// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcode_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasscodeDomain)
const passcodeDomainProvider = PasscodeDomainProvider._();

final class PasscodeDomainProvider
    extends $NotifierProvider<PasscodeDomain, void> {
  const PasscodeDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passcodeDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passcodeDomainHash();

  @$internal
  @override
  PasscodeDomain create() => PasscodeDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$passcodeDomainHash() => r'5c8fa21ff18117e0edb64644c731742340b66260';

abstract class _$PasscodeDomain extends $Notifier<void> {
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
