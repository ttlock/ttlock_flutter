// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_cat_one_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

@ProviderFor(WaterMeterCatOneNotifier)
const waterMeterCatOneProvider = WaterMeterCatOneNotifierFamily._();

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。
final class WaterMeterCatOneNotifierProvider
    extends
        $AsyncNotifierProvider<
          WaterMeterCatOneNotifier,
          WaterMeterCatOneState
        > {
  /// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。
  const WaterMeterCatOneNotifierProvider._({
    required WaterMeterCatOneNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waterMeterCatOneProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waterMeterCatOneNotifierHash();

  @override
  String toString() {
    return r'waterMeterCatOneProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterMeterCatOneNotifier create() => WaterMeterCatOneNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterMeterCatOneNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterMeterCatOneNotifierHash() =>
    r'decf0aa81253d0a7978ea9f7d919b29920aa4205';

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

final class WaterMeterCatOneNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterMeterCatOneNotifier,
          AsyncValue<WaterMeterCatOneState>,
          WaterMeterCatOneState,
          FutureOr<WaterMeterCatOneState>,
          int
        > {
  const WaterMeterCatOneNotifierFamily._()
    : super(
        retry: null,
        name: r'waterMeterCatOneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

  WaterMeterCatOneNotifierProvider call(int meterId) =>
      WaterMeterCatOneNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'waterMeterCatOneProvider';
}

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

abstract class _$WaterMeterCatOneNotifier
    extends $AsyncNotifier<WaterMeterCatOneState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<WaterMeterCatOneState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<WaterMeterCatOneState>, WaterMeterCatOneState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<WaterMeterCatOneState>,
                WaterMeterCatOneState
              >,
              AsyncValue<WaterMeterCatOneState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
