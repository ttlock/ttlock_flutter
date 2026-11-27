// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_card_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(identityCardApi)
const identityCardApiProvider = IdentityCardApiProvider._();

final class IdentityCardApiProvider
    extends
        $FunctionalProvider<IdentityCardApi, IdentityCardApi, IdentityCardApi>
    with $Provider<IdentityCardApi> {
  const IdentityCardApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'identityCardApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$identityCardApiHash();

  @$internal
  @override
  $ProviderElement<IdentityCardApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IdentityCardApi create(Ref ref) {
    return identityCardApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IdentityCardApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IdentityCardApi>(value),
    );
  }
}

String _$identityCardApiHash() => r'e6f2d16a12e8cd769e3f86aee9756ecbeba9e5df';

@ProviderFor(IdentityCardDataSource)
const identityCardDataSourceProvider = IdentityCardDataSourceProvider._();

final class IdentityCardDataSourceProvider
    extends $NotifierProvider<IdentityCardDataSource, void> {
  const IdentityCardDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'identityCardDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$identityCardDataSourceHash();

  @$internal
  @override
  IdentityCardDataSource create() => IdentityCardDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$identityCardDataSourceHash() =>
    r'739e5bfc9f4d8ba5c271251e1caa617d48ca5d41';

abstract class _$IdentityCardDataSource extends $Notifier<void> {
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
