// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_usage_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

@ProviderFor(WaterMeterUsageRecordsNotifier)
const waterMeterUsageRecordsProvider = WaterMeterUsageRecordsNotifierFamily._();

/// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。
final class WaterMeterUsageRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          WaterMeterUsageRecordsNotifier,
          WaterMeterUsageRecordsState
        > {
  /// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。
  const WaterMeterUsageRecordsNotifierProvider._({
    required WaterMeterUsageRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waterMeterUsageRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waterMeterUsageRecordsNotifierHash();

  @override
  String toString() {
    return r'waterMeterUsageRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterMeterUsageRecordsNotifier create() => WaterMeterUsageRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterMeterUsageRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterMeterUsageRecordsNotifierHash() =>
    r'1441faed180f709f84fe40395192f5b579335a0b';

/// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

final class WaterMeterUsageRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterMeterUsageRecordsNotifier,
          AsyncValue<WaterMeterUsageRecordsState>,
          WaterMeterUsageRecordsState,
          FutureOr<WaterMeterUsageRecordsState>,
          int
        > {
  const WaterMeterUsageRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'waterMeterUsageRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

  WaterMeterUsageRecordsNotifierProvider call(int meterId) =>
      WaterMeterUsageRecordsNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'waterMeterUsageRecordsProvider';
}

/// 用水记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

abstract class _$WaterMeterUsageRecordsNotifier
    extends $AsyncNotifier<WaterMeterUsageRecordsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<WaterMeterUsageRecordsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<WaterMeterUsageRecordsState>,
              WaterMeterUsageRecordsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<WaterMeterUsageRecordsState>,
                WaterMeterUsageRecordsState
              >,
              AsyncValue<WaterMeterUsageRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
