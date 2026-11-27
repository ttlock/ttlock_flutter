// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_lock_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WifiLockRepository)
const wifiLockRepositoryProvider = WifiLockRepositoryProvider._();

final class WifiLockRepositoryProvider
    extends $NotifierProvider<WifiLockRepository, void> {
  const WifiLockRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiLockRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiLockRepositoryHash();

  @$internal
  @override
  WifiLockRepository create() => WifiLockRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$wifiLockRepositoryHash() =>
    r'd45a8134b35c5e8e8e3978ea777b0104d9d1ef54';

abstract class _$WifiLockRepository extends $Notifier<void> {
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
