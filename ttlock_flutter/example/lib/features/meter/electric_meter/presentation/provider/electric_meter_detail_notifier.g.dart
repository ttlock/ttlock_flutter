// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。

@ProviderFor(ElectricMeterDetailNotifier)
const electricMeterDetailProvider = ElectricMeterDetailNotifierFamily._();

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。
final class ElectricMeterDetailNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterDetailNotifier,
          ElectricMeterDetailState
        > {
  /// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
  ///
  /// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
  /// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
  /// 再次进入必然重跑 [build]。
  const ElectricMeterDetailNotifierProvider._({
    required ElectricMeterDetailNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'electricMeterDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$electricMeterDetailNotifierHash();

  @override
  String toString() {
    return r'electricMeterDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElectricMeterDetailNotifier create() => ElectricMeterDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is ElectricMeterDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$electricMeterDetailNotifierHash() =>
    r'62c0ecd9e412c69bef6db5e245a5e4110e6b9f5d';

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。

final class ElectricMeterDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ElectricMeterDetailNotifier,
          AsyncValue<ElectricMeterDetailState>,
          ElectricMeterDetailState,
          FutureOr<ElectricMeterDetailState>,
          int
        > {
  const ElectricMeterDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'electricMeterDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
  ///
  /// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
  /// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
  /// 再次进入必然重跑 [build]。

  ElectricMeterDetailNotifierProvider call(int meterId) =>
      ElectricMeterDetailNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'electricMeterDetailProvider';
}

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。

abstract class _$ElectricMeterDetailNotifier
    extends $AsyncNotifier<ElectricMeterDetailState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<ElectricMeterDetailState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ElectricMeterDetailState>,
              ElectricMeterDetailState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterDetailState>,
                ElectricMeterDetailState
              >,
              AsyncValue<ElectricMeterDetailState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
