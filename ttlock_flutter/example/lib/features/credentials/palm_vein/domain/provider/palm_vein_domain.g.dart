// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PalmVeinDomain)
const palmVeinDomainProvider = PalmVeinDomainProvider._();

final class PalmVeinDomainProvider
    extends $NotifierProvider<PalmVeinDomain, void> {
  const PalmVeinDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'palmVeinDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$palmVeinDomainHash();

  @$internal
  @override
  PalmVeinDomain create() => PalmVeinDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$palmVeinDomainHash() => r'53975d81e3e2d029a2aafbefb96102d51157b4f4';

abstract class _$PalmVeinDomain extends $Notifier<void> {
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
