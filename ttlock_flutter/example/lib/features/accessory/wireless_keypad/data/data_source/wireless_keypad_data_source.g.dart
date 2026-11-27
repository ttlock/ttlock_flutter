// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireless_keypad_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wirelessKeypadApi)
const wirelessKeypadApiProvider = WirelessKeypadApiProvider._();

final class WirelessKeypadApiProvider
    extends
        $FunctionalProvider<
          WirelessKeypadApi,
          WirelessKeypadApi,
          WirelessKeypadApi
        >
    with $Provider<WirelessKeypadApi> {
  const WirelessKeypadApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wirelessKeypadApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wirelessKeypadApiHash();

  @$internal
  @override
  $ProviderElement<WirelessKeypadApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WirelessKeypadApi create(Ref ref) {
    return wirelessKeypadApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WirelessKeypadApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WirelessKeypadApi>(value),
    );
  }
}

String _$wirelessKeypadApiHash() => r'973222b71bacfddb06ab25bae55d8dd8cf463e74';

@ProviderFor(WirelessKeypadDataSource)
const wirelessKeypadDataSourceProvider = WirelessKeypadDataSourceProvider._();

final class WirelessKeypadDataSourceProvider
    extends $NotifierProvider<WirelessKeypadDataSource, void> {
  const WirelessKeypadDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wirelessKeypadDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wirelessKeypadDataSourceHash();

  @$internal
  @override
  WirelessKeypadDataSource create() => WirelessKeypadDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$wirelessKeypadDataSourceHash() =>
    r'c92840ff6713bbb1e1ff8d83dfc51c9abe502792';

abstract class _$WirelessKeypadDataSource extends $Notifier<void> {
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
