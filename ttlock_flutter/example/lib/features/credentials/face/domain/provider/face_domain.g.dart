// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaceDomain)
const faceDomainProvider = FaceDomainProvider._();

final class FaceDomainProvider extends $NotifierProvider<FaceDomain, void> {
  const FaceDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceDomainHash();

  @$internal
  @override
  FaceDomain create() => FaceDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$faceDomainHash() => r'8d8a8a4f12f5039f66e13b2783bf0a96b21cd705';

abstract class _$FaceDomain extends $Notifier<void> {
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
