// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_lock_config_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
///
/// 页面级（autoDispose）；离页取消扫描订阅。

@ProviderFor(WifiLockConfigNotifier)
const wifiLockConfigProvider = WifiLockConfigNotifierFamily._();

/// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
///
/// 页面级（autoDispose）；离页取消扫描订阅。
final class WifiLockConfigNotifierProvider
    extends
        $AsyncNotifierProvider<WifiLockConfigNotifier, WifiLockConfigState> {
  /// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
  ///
  /// 页面级（autoDispose）；离页取消扫描订阅。
  const WifiLockConfigNotifierProvider._({
    required WifiLockConfigNotifierFamily super.from,
    required (int, LockEntity) super.argument,
  }) : super(
         retry: null,
         name: r'wifiLockConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$wifiLockConfigNotifierHash();

  @override
  String toString() {
    return r'wifiLockConfigProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  WifiLockConfigNotifier create() => WifiLockConfigNotifier();

  @override
  bool operator ==(Object other) {
    return other is WifiLockConfigNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$wifiLockConfigNotifierHash() =>
    r'3558f1de48872155c29daa9e3b7bfde8252d8f5a';

/// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
///
/// 页面级（autoDispose）；离页取消扫描订阅。

final class WifiLockConfigNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WifiLockConfigNotifier,
          AsyncValue<WifiLockConfigState>,
          WifiLockConfigState,
          FutureOr<WifiLockConfigState>,
          (int, LockEntity)
        > {
  const WifiLockConfigNotifierFamily._()
    : super(
        retry: null,
        name: r'wifiLockConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
  ///
  /// 页面级（autoDispose）；离页取消扫描订阅。

  WifiLockConfigNotifierProvider call(int lockId, LockEntity lock) =>
      WifiLockConfigNotifierProvider._(argument: (lockId, lock), from: this);

  @override
  String toString() => r'wifiLockConfigProvider';
}

/// 锁网络配置页：载入云端已配置信息、探测静态 IP 能力、扫描周边 WiFi、提交配网。
///
/// 页面级（autoDispose）；离页取消扫描订阅。

abstract class _$WifiLockConfigNotifier
    extends $AsyncNotifier<WifiLockConfigState> {
  late final _$args = ref.$arg as (int, LockEntity);
  int get lockId => _$args.$1;
  LockEntity get lock => _$args.$2;

  FutureOr<WifiLockConfigState> build(int lockId, LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref as $Ref<AsyncValue<WifiLockConfigState>, WifiLockConfigState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WifiLockConfigState>, WifiLockConfigState>,
              AsyncValue<WifiLockConfigState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
