// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppConfigDomain)
const appConfigDomainProvider = AppConfigDomainProvider._();

final class AppConfigDomainProvider
    extends $NotifierProvider<AppConfigDomain, void> {
  const AppConfigDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigDomainHash();

  @$internal
  @override
  AppConfigDomain create() => AppConfigDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$appConfigDomainHash() => r'819d0c287bdd68dff9110733bb4cdf2e67588f1d';

abstract class _$AppConfigDomain extends $Notifier<void> {
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
