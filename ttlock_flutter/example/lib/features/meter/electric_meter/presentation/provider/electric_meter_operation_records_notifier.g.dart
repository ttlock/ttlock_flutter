// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_operation_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

@ProviderFor(ElectricMeterOperationRecordsNotifier)
const electricMeterOperationRecordsProvider =
    ElectricMeterOperationRecordsNotifierFamily._();

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。
final class ElectricMeterOperationRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterOperationRecordsNotifier,
          ElectricMeterOperationRecordsState
        > {
  /// 操作记录页：筛选 chips + 分页列表（spec §6.4）。
  const ElectricMeterOperationRecordsNotifierProvider._({
    required ElectricMeterOperationRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'electricMeterOperationRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$electricMeterOperationRecordsNotifierHash();

  @override
  String toString() {
    return r'electricMeterOperationRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElectricMeterOperationRecordsNotifier create() =>
      ElectricMeterOperationRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ElectricMeterOperationRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$electricMeterOperationRecordsNotifierHash() =>
    r'74810201cb3529910906baa50a0deed694dd65ce';

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

final class ElectricMeterOperationRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ElectricMeterOperationRecordsNotifier,
          AsyncValue<ElectricMeterOperationRecordsState>,
          ElectricMeterOperationRecordsState,
          FutureOr<ElectricMeterOperationRecordsState>,
          int
        > {
  const ElectricMeterOperationRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'electricMeterOperationRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

  ElectricMeterOperationRecordsNotifierProvider call(int meterId) =>
      ElectricMeterOperationRecordsNotifierProvider._(
        argument: meterId,
        from: this,
      );

  @override
  String toString() => r'electricMeterOperationRecordsProvider';
}

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

abstract class _$ElectricMeterOperationRecordsNotifier
    extends $AsyncNotifier<ElectricMeterOperationRecordsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<ElectricMeterOperationRecordsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ElectricMeterOperationRecordsState>,
              ElectricMeterOperationRecordsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterOperationRecordsState>,
                ElectricMeterOperationRecordsState
              >,
              AsyncValue<ElectricMeterOperationRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
