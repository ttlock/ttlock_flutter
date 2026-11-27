// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 梯控编排：楼层激活（远程优先 + BLE 回退）、工作模式 / 关联楼层（BLE 单轨）。
///
/// [activateFloors] 返回值语义：
/// - [None]：云成功，或 BLE 回退但 lockData 未变/为空（无需保鲜）。
/// - [Some]：BLE 回退且带回新 lockData，交由 Notifier 调 `LockDomain.syncLockData` 保鲜。
///
/// [setWorkMode] / [setControlableFloors] 无云端接口，仅 BLE；`lockData` 空 → -21。

@ProviderFor(LiftDomain)
const liftDomainProvider = LiftDomainProvider._();

/// 梯控编排：楼层激活（远程优先 + BLE 回退）、工作模式 / 关联楼层（BLE 单轨）。
///
/// [activateFloors] 返回值语义：
/// - [None]：云成功，或 BLE 回退但 lockData 未变/为空（无需保鲜）。
/// - [Some]：BLE 回退且带回新 lockData，交由 Notifier 调 `LockDomain.syncLockData` 保鲜。
///
/// [setWorkMode] / [setControlableFloors] 无云端接口，仅 BLE；`lockData` 空 → -21。
final class LiftDomainProvider extends $NotifierProvider<LiftDomain, void> {
  /// 梯控编排：楼层激活（远程优先 + BLE 回退）、工作模式 / 关联楼层（BLE 单轨）。
  ///
  /// [activateFloors] 返回值语义：
  /// - [None]：云成功，或 BLE 回退但 lockData 未变/为空（无需保鲜）。
  /// - [Some]：BLE 回退且带回新 lockData，交由 Notifier 调 `LockDomain.syncLockData` 保鲜。
  ///
  /// [setWorkMode] / [setControlableFloors] 无云端接口，仅 BLE；`lockData` 空 → -21。
  const LiftDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liftDomainProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liftDomainHash();

  @$internal
  @override
  LiftDomain create() => LiftDomain();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$liftDomainHash() => r'4353dfd6ec34aa4ebcf359c1d041b3079c471b9f';

/// 梯控编排：楼层激活（远程优先 + BLE 回退）、工作模式 / 关联楼层（BLE 单轨）。
///
/// [activateFloors] 返回值语义：
/// - [None]：云成功，或 BLE 回退但 lockData 未变/为空（无需保鲜）。
/// - [Some]：BLE 回退且带回新 lockData，交由 Notifier 调 `LockDomain.syncLockData` 保鲜。
///
/// [setWorkMode] / [setControlableFloors] 无云端接口，仅 BLE；`lockData` 空 → -21。

abstract class _$LiftDomain extends $Notifier<void> {
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
