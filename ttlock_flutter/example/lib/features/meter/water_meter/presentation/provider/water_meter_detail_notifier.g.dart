// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_detail_notifier.dart';

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

@ProviderFor(WaterMeterDetailNotifier)
const waterMeterDetailProvider = WaterMeterDetailNotifierFamily._();

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。
final class WaterMeterDetailNotifierProvider
    extends
        $AsyncNotifierProvider<
          WaterMeterDetailNotifier,
          WaterMeterDetailState
        > {
  /// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
  ///
  /// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
  /// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
  /// 再次进入必然重跑 [build]。
  const WaterMeterDetailNotifierProvider._({
    required WaterMeterDetailNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waterMeterDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waterMeterDetailNotifierHash();

  @override
  String toString() {
    return r'waterMeterDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterMeterDetailNotifier create() => WaterMeterDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterMeterDetailNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterMeterDetailNotifierHash() =>
    r'fcf3f1498557a29489a732b53c9188e94c577296';

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。

final class WaterMeterDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterMeterDetailNotifier,
          AsyncValue<WaterMeterDetailState>,
          WaterMeterDetailState,
          FutureOr<WaterMeterDetailState>,
          int
        > {
  const WaterMeterDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'waterMeterDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
  ///
  /// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
  /// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
  /// 再次进入必然重跑 [build]。

  WaterMeterDetailNotifierProvider call(int meterId) =>
      WaterMeterDetailNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'waterMeterDetailProvider';
}

/// 详情 Notifier：按 id 直取详情接口，读写同一个 Notifier。
///
/// **不复用列表的 entity** —— 每次进入都重新请求 `detail`（列表数据可能是
/// 过时快照，且两处字段集并不相同）。provider 是 autoDispose，离开页面即回收，
/// 再次进入必然重跑 [build]。

abstract class _$WaterMeterDetailNotifier
    extends $AsyncNotifier<WaterMeterDetailState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<WaterMeterDetailState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<WaterMeterDetailState>, WaterMeterDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<WaterMeterDetailState>,
                WaterMeterDetailState
              >,
              AsyncValue<WaterMeterDetailState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
