// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

@ProviderFor(ElectricMeterSettingsNotifier)
const electricMeterSettingsProvider = ElectricMeterSettingsNotifierFamily._();

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。
final class ElectricMeterSettingsNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterSettingsNotifier,
          ElectricMeterSettingsState
        > {
  /// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。
  const ElectricMeterSettingsNotifierProvider._({
    required ElectricMeterSettingsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'electricMeterSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$electricMeterSettingsNotifierHash();

  @override
  String toString() {
    return r'electricMeterSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElectricMeterSettingsNotifier create() => ElectricMeterSettingsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ElectricMeterSettingsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$electricMeterSettingsNotifierHash() =>
    r'2931df894b67c40f662905898b101382ef48406e';

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

final class ElectricMeterSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ElectricMeterSettingsNotifier,
          AsyncValue<ElectricMeterSettingsState>,
          ElectricMeterSettingsState,
          FutureOr<ElectricMeterSettingsState>,
          int
        > {
  const ElectricMeterSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'electricMeterSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

  ElectricMeterSettingsNotifierProvider call(int meterId) =>
      ElectricMeterSettingsNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'electricMeterSettingsProvider';
}

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

abstract class _$ElectricMeterSettingsNotifier
    extends $AsyncNotifier<ElectricMeterSettingsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<ElectricMeterSettingsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ElectricMeterSettingsState>,
              ElectricMeterSettingsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterSettingsState>,
                ElectricMeterSettingsState
              >,
              AsyncValue<ElectricMeterSettingsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
