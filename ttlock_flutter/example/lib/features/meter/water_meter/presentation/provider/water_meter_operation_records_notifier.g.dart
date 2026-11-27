// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_operation_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

@ProviderFor(WaterMeterOperationRecordsNotifier)
const waterMeterOperationRecordsProvider =
    WaterMeterOperationRecordsNotifierFamily._();

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。
final class WaterMeterOperationRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          WaterMeterOperationRecordsNotifier,
          WaterMeterOperationRecordsState
        > {
  /// 操作记录页：筛选 chips + 分页列表（spec §6.4）。
  const WaterMeterOperationRecordsNotifierProvider._({
    required WaterMeterOperationRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waterMeterOperationRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$waterMeterOperationRecordsNotifierHash();

  @override
  String toString() {
    return r'waterMeterOperationRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterMeterOperationRecordsNotifier create() =>
      WaterMeterOperationRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterMeterOperationRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterMeterOperationRecordsNotifierHash() =>
    r'71447a9485c7eac21bdf037edf042f58b18a1d57';

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

final class WaterMeterOperationRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterMeterOperationRecordsNotifier,
          AsyncValue<WaterMeterOperationRecordsState>,
          WaterMeterOperationRecordsState,
          FutureOr<WaterMeterOperationRecordsState>,
          int
        > {
  const WaterMeterOperationRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'waterMeterOperationRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

  WaterMeterOperationRecordsNotifierProvider call(int meterId) =>
      WaterMeterOperationRecordsNotifierProvider._(
        argument: meterId,
        from: this,
      );

  @override
  String toString() => r'waterMeterOperationRecordsProvider';
}

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。

abstract class _$WaterMeterOperationRecordsNotifier
    extends $AsyncNotifier<WaterMeterOperationRecordsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<WaterMeterOperationRecordsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<WaterMeterOperationRecordsState>,
              WaterMeterOperationRecordsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<WaterMeterOperationRecordsState>,
                WaterMeterOperationRecordsState
              >,
              AsyncValue<WaterMeterOperationRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
