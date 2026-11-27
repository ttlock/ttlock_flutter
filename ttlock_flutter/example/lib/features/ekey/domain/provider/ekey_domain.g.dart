// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ekey_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EkeyDomain)
const ekeyDomainProvider = EkeyDomainProvider._();

final class EkeyDomainProvider extends $NotifierProvider<EkeyDomain, void> {
  const EkeyDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ekeyDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ekeyDomainHash();

  @$internal
  @override
  EkeyDomain create() => EkeyDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$ekeyDomainHash() => r'46c588d7fbbde55ffcc9b2f0096dbff23c62402d';

abstract class _$EkeyDomain extends $Notifier<void> {
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
