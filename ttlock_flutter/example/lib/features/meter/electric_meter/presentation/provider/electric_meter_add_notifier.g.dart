// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElectricMeterAddNotifier)
const electricMeterAddProvider = ElectricMeterAddNotifierProvider._();

final class ElectricMeterAddNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterAddNotifier,
          ElectricMeterAddState
        > {
  const ElectricMeterAddNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterAddProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterAddNotifierHash();

  @$internal
  @override
  ElectricMeterAddNotifier create() => ElectricMeterAddNotifier();
}

String _$electricMeterAddNotifierHash() =>
    r'53114276b39f54dc52e894788d05bced878f16d0';

abstract class _$ElectricMeterAddNotifier
    extends $AsyncNotifier<ElectricMeterAddState> {
  FutureOr<ElectricMeterAddState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<ElectricMeterAddState>, ElectricMeterAddState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterAddState>,
                ElectricMeterAddState
              >,
              AsyncValue<ElectricMeterAddState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。

@ProviderFor(ElectricMeterAddError)
const electricMeterAddErrorProvider = ElectricMeterAddErrorProvider._();

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。
final class ElectricMeterAddErrorProvider
    extends $NotifierProvider<ElectricMeterAddError, AppException?> {
  /// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
  ///
  /// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。
  const ElectricMeterAddErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterAddErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterAddErrorHash();

  @$internal
  @override
  ElectricMeterAddError create() => ElectricMeterAddError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppException?>(value),
    );
  }
}

String _$electricMeterAddErrorHash() =>
    r'd916a5392d31002565db187cd5b353a488b24131';

/// 添加流程的一次性错误通道（改名失败等非阻断错误的提示出口）。
///
/// 这些错误不该把用户推进 `failure` 步骤 —— 表已注册，流程要继续。

abstract class _$ElectricMeterAddError extends $Notifier<AppException?> {
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
