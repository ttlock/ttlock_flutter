// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppConfigService)
const appConfigServiceProvider = AppConfigServiceProvider._();

final class AppConfigServiceProvider
    extends $NotifierProvider<AppConfigService, AppConfig> {
  const AppConfigServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigServiceHash();

  @$internal
  @override
  AppConfigService create() => AppConfigService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfig>(value),
    );
  }
}

String _$appConfigServiceHash() => r'74804cacae5ddf50bb48f6ce617bdca6e284f5b8';

abstract class _$AppConfigService extends $Notifier<AppConfig> {
  AppConfig build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppConfig, AppConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppConfig, AppConfig>,
              AppConfig,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
