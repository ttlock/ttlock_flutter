// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
///
/// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
/// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
/// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。

@ProviderFor(FaceAddNotifier)
const faceAddProvider = FaceAddNotifierFamily._();

/// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
///
/// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
/// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
/// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。
final class FaceAddNotifierProvider
    extends $NotifierProvider<FaceAddNotifier, FaceAddState> {
  /// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
  ///
  /// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
  /// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
  /// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
  ///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
  /// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。
  const FaceAddNotifierProvider._({
    required FaceAddNotifierFamily super.from,
    required LockEntity super.argument,
  }) : super(
         retry: null,
         name: r'faceAddProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$faceAddNotifierHash();

  @override
  String toString() {
    return r'faceAddProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FaceAddNotifier create() => FaceAddNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceAddState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceAddState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FaceAddNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$faceAddNotifierHash() => r'1f0daf647276e898de4857872c60b02ba1043ba7';

/// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
///
/// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
/// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
/// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。

final class FaceAddNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FaceAddNotifier,
          FaceAddState,
          FaceAddState,
          FaceAddState,
          LockEntity
        > {
  const FaceAddNotifierFamily._()
    : super(
        retry: null,
        name: r'faceAddProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
  ///
  /// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
  /// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
  /// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
  ///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
  /// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。

  FaceAddNotifierProvider call(LockEntity lock) =>
      FaceAddNotifierProvider._(argument: lock, from: this);

  @override
  String toString() => r'faceAddProvider';
}

/// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
///
/// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
/// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
/// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。

abstract class _$FaceAddNotifier extends $Notifier<FaceAddState> {
  late final _$args = ref.$arg as LockEntity;
  LockEntity get lock => _$args;

  FaceAddState build(LockEntity lock);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<FaceAddState, FaceAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FaceAddState, FaceAddState>,
              FaceAddState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
