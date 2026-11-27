// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 梯控页面状态机：楼层激活、工作模式、关联楼层。
///
/// 激活结果映射：BLE 回退带回新 lockData → [LiftActivateOutcome.bleFallback]
/// （此时已调 `LockDomain.syncLockData` 保鲜）；云成功 / 无需保鲜 →
/// [LiftActivateOutcome.succeeded]；失败 → [LiftState.error]。
///
/// 工作模式 / 关联楼层为 BLE 写配置，成功 → [LiftState.configOutcome]。

@ProviderFor(LiftNotifier)
const liftProvider = LiftNotifierProvider._();

/// 梯控页面状态机：楼层激活、工作模式、关联楼层。
///
/// 激活结果映射：BLE 回退带回新 lockData → [LiftActivateOutcome.bleFallback]
/// （此时已调 `LockDomain.syncLockData` 保鲜）；云成功 / 无需保鲜 →
/// [LiftActivateOutcome.succeeded]；失败 → [LiftState.error]。
///
/// 工作模式 / 关联楼层为 BLE 写配置，成功 → [LiftState.configOutcome]。
final class LiftNotifierProvider
    extends $NotifierProvider<LiftNotifier, LiftState> {
  /// 梯控页面状态机：楼层激活、工作模式、关联楼层。
  ///
  /// 激活结果映射：BLE 回退带回新 lockData → [LiftActivateOutcome.bleFallback]
  /// （此时已调 `LockDomain.syncLockData` 保鲜）；云成功 / 无需保鲜 →
  /// [LiftActivateOutcome.succeeded]；失败 → [LiftState.error]。
  ///
  /// 工作模式 / 关联楼层为 BLE 写配置，成功 → [LiftState.configOutcome]。
  const LiftNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liftNotifierHash();

  @$internal
  @override
  LiftNotifier create() => LiftNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiftState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiftState>(value),
    );
  }
}

String _$liftNotifierHash() => r'4a6037429f7fcee53f0772656f9510d41c94a111';

/// 梯控页面状态机：楼层激活、工作模式、关联楼层。
///
/// 激活结果映射：BLE 回退带回新 lockData → [LiftActivateOutcome.bleFallback]
/// （此时已调 `LockDomain.syncLockData` 保鲜）；云成功 / 无需保鲜 →
/// [LiftActivateOutcome.succeeded]；失败 → [LiftState.error]。
///
/// 工作模式 / 关联楼层为 BLE 写配置，成功 → [LiftState.configOutcome]。

abstract class _$LiftNotifier extends $Notifier<LiftState> {
  LiftState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LiftState, LiftState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LiftState, LiftState>,
              LiftState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
