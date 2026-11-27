// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_meter_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElectricMeterListNotifier)
const electricMeterListProvider = ElectricMeterListNotifierProvider._();

final class ElectricMeterListNotifierProvider
    extends
        $AsyncNotifierProvider<
          ElectricMeterListNotifier,
          ElectricMeterListState
        > {
  const ElectricMeterListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'electricMeterListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$electricMeterListNotifierHash();

  @$internal
  @override
  ElectricMeterListNotifier create() => ElectricMeterListNotifier();
}

String _$electricMeterListNotifierHash() =>
    r'88e63841f8818f1eb596a605d3d35985cbcc5666';

abstract class _$ElectricMeterListNotifier
    extends $AsyncNotifier<ElectricMeterListState> {
  FutureOr<ElectricMeterListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<ElectricMeterListState>, ElectricMeterListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ElectricMeterListState>,
                ElectricMeterListState
              >,
              AsyncValue<ElectricMeterListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
