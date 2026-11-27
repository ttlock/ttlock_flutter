// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_usage_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

@ProviderFor(ElectricMeterUsageRecordsNotifier)
const electricMeterUsageRecordsProvider =
    ElectricMeterUsageRecordsNotifierFamily._();

/// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。
final class ElectricMeterUsageRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterUsageRecordsNotifier,
          ElectricMeterUsageRecordsState
        > {
  /// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。
  const ElectricMeterUsageRecordsNotifierProvider._({
    required ElectricMeterUsageRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'electricMeterUsageRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$electricMeterUsageRecordsNotifierHash();

  @override
  String toString() {
    return r'electricMeterUsageRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElectricMeterUsageRecordsNotifier create() =>
      ElectricMeterUsageRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ElectricMeterUsageRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$electricMeterUsageRecordsNotifierHash() =>
    r'c6727d78260863a52f9f72364315a40f05b05199';

/// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

final class ElectricMeterUsageRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ElectricMeterUsageRecordsNotifier,
          AsyncValue<ElectricMeterUsageRecordsState>,
          ElectricMeterUsageRecordsState,
          FutureOr<ElectricMeterUsageRecordsState>,
          int
        > {
  const ElectricMeterUsageRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'electricMeterUsageRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

  ElectricMeterUsageRecordsNotifierProvider call(int meterId) =>
      ElectricMeterUsageRecordsNotifierProvider._(
        argument: meterId,
        from: this,
      );

  @override
  String toString() => r'electricMeterUsageRecordsProvider';
}

/// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。

abstract class _$ElectricMeterUsageRecordsNotifier
    extends $AsyncNotifier<ElectricMeterUsageRecordsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<ElectricMeterUsageRecordsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ElectricMeterUsageRecordsState>,
              ElectricMeterUsageRecordsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterUsageRecordsState>,
                ElectricMeterUsageRecordsState
              >,
              AsyncValue<ElectricMeterUsageRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
