// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_meter_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

@ProviderFor(WaterMeterSettingsNotifier)
const waterMeterSettingsProvider = WaterMeterSettingsNotifierFamily._();

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。
final class WaterMeterSettingsNotifierProvider
    extends
        $AsyncNotifierProvider<
          WaterMeterSettingsNotifier,
          WaterMeterSettingsState
        > {
  /// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。
  const WaterMeterSettingsNotifierProvider._({
    required WaterMeterSettingsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waterMeterSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waterMeterSettingsNotifierHash();

  @override
  String toString() {
    return r'waterMeterSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaterMeterSettingsNotifier create() => WaterMeterSettingsNotifier();

  @override
  bool operator ==(Object other) {
    return other is WaterMeterSettingsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waterMeterSettingsNotifierHash() =>
    r'7c263192755f4623fea1577bf6c3775e6b40bc87';

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

final class WaterMeterSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaterMeterSettingsNotifier,
          AsyncValue<WaterMeterSettingsState>,
          WaterMeterSettingsState,
          FutureOr<WaterMeterSettingsState>,
          int
        > {
  const WaterMeterSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'waterMeterSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

  WaterMeterSettingsNotifierProvider call(int meterId) =>
      WaterMeterSettingsNotifierProvider._(argument: meterId, from: this);

  @override
  String toString() => r'waterMeterSettingsProvider';
}

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。

abstract class _$WaterMeterSettingsNotifier
    extends $AsyncNotifier<WaterMeterSettingsState> {
  late final _$args = ref.$arg as int;
  int get meterId => _$args;

  FutureOr<WaterMeterSettingsState> build(int meterId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<WaterMeterSettingsState>,
              WaterMeterSettingsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<WaterMeterSettingsState>,
                WaterMeterSettingsState
              >,
              AsyncValue<WaterMeterSettingsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
