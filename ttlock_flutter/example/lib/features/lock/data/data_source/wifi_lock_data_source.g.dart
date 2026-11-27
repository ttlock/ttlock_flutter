// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_lock_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiLockApi)
const wifiLockApiProvider = WifiLockApiProvider._();

final class WifiLockApiProvider
    extends $FunctionalProvider<WifiLockApi, WifiLockApi, WifiLockApi>
    with $Provider<WifiLockApi> {
  const WifiLockApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiLockApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiLockApiHash();

  @$internal
  @override
  $ProviderElement<WifiLockApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WifiLockApi create(Ref ref) {
    return wifiLockApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiLockApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiLockApi>(value),
    );
  }
}

String _$wifiLockApiHash() => r'c592b3850aeeadfd9be38532dc84d82564276b90';

@ProviderFor(WifiLockDataSource)
const wifiLockDataSourceProvider = WifiLockDataSourceProvider._();

final class WifiLockDataSourceProvider
    extends $NotifierProvider<WifiLockDataSource, void> {
  const WifiLockDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiLockDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiLockDataSourceHash();

  @$internal
  @override
  WifiLockDataSource create() => WifiLockDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$wifiLockDataSourceHash() =>
    r'903473ddac820ae069afb13d775be9158482f046';

abstract class _$WifiLockDataSource extends $Notifier<void> {
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
