// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardDomain)
const cardDomainProvider = CardDomainProvider._();

final class CardDomainProvider extends $NotifierProvider<CardDomain, void> {
  const CardDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardDomainHash();

  @$internal
  @override
  CardDomain create() => CardDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$cardDomainHash() => r'75b199057e72c8c5697519adabd71fbe6df5c67c';

abstract class _$CardDomain extends $Notifier<void> {
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
