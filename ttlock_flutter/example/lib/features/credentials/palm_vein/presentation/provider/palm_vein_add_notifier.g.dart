// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
///
/// 与人脸录入同构（见 face_add_notifier）：
/// - 以流式相位驱动 UI（canStartAdd/error/success）；
/// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。

@ProviderFor(PalmVeinAddNotifier)
const palmVeinAddProvider = PalmVeinAddNotifierFamily._();

/// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
///
/// 与人脸录入同构（见 face_add_notifier）：
/// - 以流式相位驱动 UI（canStartAdd/error/success）；
/// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。
final class PalmVeinAddNotifierProvider
    extends $NotifierProvider<PalmVeinAddNotifier, PalmVeinAddState> {
  /// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
  ///
  /// 与人脸录入同构（见 face_add_notifier）：
  /// - 以流式相位驱动 UI（canStartAdd/error/success）；
  /// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
  ///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
  ///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
  /// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。
  const PalmVeinAddNotifierProvider._({
    required PalmVeinAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'palmVeinAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$palmVeinAddNotifierHash();

  @override
  String toString() {
    return r'palmVeinAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PalmVeinAddNotifier create() => PalmVeinAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PalmVeinAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PalmVeinAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PalmVeinAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$palmVeinAddNotifierHash() =>
    r'80382809a28ba0b9b47d38f2721e6d6c8bee56f7';

/// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
///
/// 与人脸录入同构（见 face_add_notifier）：
/// - 以流式相位驱动 UI（canStartAdd/error/success）；
/// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。

final class PalmVeinAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PalmVeinAddNotifier,
          PalmVeinAddState,
          PalmVeinAddState,
          PalmVeinAddState,
          LockEntity
        > {
  const PalmVeinAddNotifierFamily._()
    : super(
        retry: null,
        name: r'palmVeinAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
  ///
  /// 与人脸录入同构（见 face_add_notifier）：
  /// - 以流式相位驱动 UI（canStartAdd/error/success）；
  /// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
  ///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
  ///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
  /// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。

  PalmVeinAddNotifierProvider call(LockEntity lock) =>
      PalmVeinAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'palmVeinAddProvider';
}

/// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
///
/// 与人脸录入同构（见 face_add_notifier）：
/// - 以流式相位驱动 UI（canStartAdd/error/success）；
/// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。

abstract class _$PalmVeinAddNotifier extends $Notifier<PalmVeinAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  PalmVeinAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<PalmVeinAddState, PalmVeinAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PalmVeinAddState, PalmVeinAddState>,
              PalmVeinAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
