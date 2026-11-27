// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_cat_one_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

@ProviderFor(ElectricMeterCatOneNotifier)
const electricMeterCatOneProvider = ElectricMeterCatOneNotifierFamily._();

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。
final class ElectricMeterCatOneNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterCatOneNotifier,
          ElectricMeterCatOneState
        > {
  /// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。
  const ElectricMeterCatOneNotifierProvider._({
    required ElectricMeterCatOneNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'electricMeterCatOneProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$electricMeterCatOneNotifierHash();

  @override
  String toString() {
    return r'electricMeterCatOneProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElectricMeterCatOneNotifier create() => ElectricMeterCatOneNotifier();

  @override
  bool operator ==(Object other) {
    return other is ElectricMeterCatOneNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$electricMeterCatOneNotifierHash() =>
    r'2e5eb0533f365a3a4c13e53da74beb0693501a60';

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

final class ElectricMeterCatOneNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ElectricMeterCatOneNotifier,
          AsyncValue<ElectricMeterCatOneState>,
          ElectricMeterCatOneState,
          FutureOr<ElectricMeterCatOneState>,
          int
        > {
  const ElectricMeterCatOneNotifierFamily._()
    : super(
        retry: null,
        name: r'electricMeterCatOneProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

  ElectricMeterCatOneNotifierProvider call(int meterId) =>
      ElectricMeterCatOneNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'electricMeterCatOneProvider';
}

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。

abstract class _$ElectricMeterCatOneNotifier
    extends $AsyncNotifier<ElectricMeterCatOneState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<ElectricMeterCatOneState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ElectricMeterCatOneState>,
              ElectricMeterCatOneState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterCatOneState>,
                ElectricMeterCatOneState
              >,
              AsyncValue<ElectricMeterCatOneState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
