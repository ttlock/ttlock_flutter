// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wireless_keypad_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 键盘的槽位 / 类型 / 特征值全部来自云端 `listByLock`，
/// **本地不再缓存任何 meta**（云端是权威源）。

@ProviderFor(WirelessKeypadRepository)
const wirelessKeypadRepositoryProvider = WirelessKeypadRepositoryProvider._();

/// 键盘的槽位 / 类型 / 特征值全部来自云端 `listByLock`，
/// **本地不再缓存任何 meta**（云端是权威源）。
final class WirelessKeypadRepositoryProvider
    extends $NotifierProvider<WirelessKeypadRepository, void> {
  /// 键盘的槽位 / 类型 / 特征值全部来自云端 `listByLock`，
  /// **本地不再缓存任何 meta**（云端是权威源）。
  const WirelessKeypadRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wirelessKeypadRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wirelessKeypadRepositoryHash();

  @$internal
  @override
  WirelessKeypadRepository create() => WirelessKeypadRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$wirelessKeypadRepositoryHash() =>
    r'a570db88e5adad44b387c90549d0080bf51fb52e';

/// 键盘的槽位 / 类型 / 特征值全部来自云端 `listByLock`，
/// **本地不再缓存任何 meta**（云端是权威源）。

abstract class _$WirelessKeypadRepository extends $Notifier<void> {
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
