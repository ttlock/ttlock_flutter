// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设置页能力探测 + 全部 domain 写操作。
///
/// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
/// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。

@ProviderFor(LockSettingsNotifier)
const lockSettingsProvider = LockSettingsNotifierFamily._();

/// 设置页能力探测 + 全部 domain 写操作。
///
/// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
/// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。
final class LockSettingsNotifierProvider
    extends $AsyncNotifierProvider<LockSettingsNotifier, LockSettingsState> {
  /// 设置页能力探测 + 全部 domain 写操作。
  ///
  /// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
  /// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。
  const LockSettingsNotifierProvider._({
    required LockSettingsNotifierFamily super.from,
    required (int, LockEntity?) super.argument,
  }) : super(
         retry: null,
         name: r'lockSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lockSettingsNotifierHash();

  @override
  String toString() {
    return r'lockSettingsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  LockSettingsNotifier create() => LockSettingsNotifier();

  @override
  bool operator ==(Object other) {
    return other is LockSettingsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lockSettingsNotifierHash() =>
    r'69e6b8409c455e637d34e5ff52ec945938d75c0c';

/// 设置页能力探测 + 全部 domain 写操作。
///
/// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
/// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。

final class LockSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LockSettingsNotifier,
          AsyncValue<LockSettingsState>,
          LockSettingsState,
          FutureOr<LockSettingsState>,
          (int, LockEntity?)
        > {
  const LockSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'lockSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 设置页能力探测 + 全部 domain 写操作。
  ///
  /// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
  /// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。

  LockSettingsNotifierProvider call(int lockId, LockEntity? extra) =>
      LockSettingsNotifierProvider._(argument: (lockId, extra), from: this);

  @override
  String toString() => r'lockSettingsProvider';
}

/// 设置页能力探测 + 全部 domain 写操作。
///
/// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
/// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。

abstract class _$LockSettingsNotifier
    extends $AsyncNotifier<LockSettingsState> {
  late final _$args = ref.$arg as (int, LockEntity?);
  int get lockId => _$args.$1;
  LockEntity? get extra => _$args.$2;

  FutureOr<LockSettingsState> build(int lockId, LockEntity? extra);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref as $Ref<AsyncValue<LockSettingsState>, LockSettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LockSettingsState>, LockSettingsState>,
              AsyncValue<LockSettingsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
