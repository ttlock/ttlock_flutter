// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_json_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configJsonLoader)
const configJsonLoaderProvider = ConfigJsonLoaderProvider._();

final class ConfigJsonLoaderProvider
    extends
        $FunctionalProvider<
          ConfigJsonLoader,
          ConfigJsonLoader,
          ConfigJsonLoader
        >
    with $Provider<ConfigJsonLoader> {
  const ConfigJsonLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configJsonLoaderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configJsonLoaderHash();

  @$internal
  @override
  $ProviderElement<ConfigJsonLoader> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConfigJsonLoader create(Ref ref) {
    return configJsonLoader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigJsonLoader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigJsonLoader>(value),
    );
  }
}

String _$configJsonLoaderHash() => r'03a2fc47df1d91031114def3e0aeaf0bde88cda0';
