// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaterMeterAddNotifier)
const waterMeterAddProvider = WaterMeterAddNotifierProvider._();

final class WaterMeterAddNotifierProvider
    extends $AsyncNotifierProvider<WaterMeterAddNotifier, WaterMeterAddState> {
  const WaterMeterAddNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterAddProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterAddNotifierHash();

  @$internal
  @override
  WaterMeterAddNotifier create() => WaterMeterAddNotifier();
}

String _$waterMeterAddNotifierHash() =>
    r'20df56f64d9e2137a0b942855971e7ca6b75c89d';

abstract class _$WaterMeterAddNotifier
    extends $AsyncNotifier<WaterMeterAddState> {
  FutureOr<WaterMeterAddState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<WaterMeterAddState>, WaterMeterAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WaterMeterAddState>, WaterMeterAddState>,
              AsyncValue<WaterMeterAddState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。

@ProviderFor(WaterMeterAddError)
const waterMeterAddErrorProvider = WaterMeterAddErrorProvider._();

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。
final class WaterMeterAddErrorProvider
    extends $NotifierProvider<WaterMeterAddError, AppException?> {
  /// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
  ///
  /// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。
  const WaterMeterAddErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterMeterAddErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterMeterAddErrorHash();

  @$internal
  @override
  WaterMeterAddError create() => WaterMeterAddError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppException?>(value),
    );
  }
}

String _$waterMeterAddErrorHash() =>
    r'ab91cad609e90b69ce0413afc97d865db49a8b57';

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。

abstract class _$WaterMeterAddError extends $Notifier<AppException?> {
  AppException? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppException?, AppException?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppException?, AppException?>,
              AppException?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
