// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standalone_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StandaloneDoorSensorListNotifier)
const standaloneDoorSensorListProvider =
    StandaloneDoorSensorListNotifierProvider._();

final class StandaloneDoorSensorListNotifierProvider
    extends
        $AsyncNotifierProvider<
          StandaloneDoorSensorListNotifier,
          StandaloneDoorSensorListState
        > {
  const StandaloneDoorSensorListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'standaloneDoorSensorListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$standaloneDoorSensorListNotifierHash();

  @$internal
  @override
  StandaloneDoorSensorListNotifier create() =>
      StandaloneDoorSensorListNotifier();
}

String _$standaloneDoorSensorListNotifierHash() =>
    r'af133eaac7ec4f1bd26e373ae105661ba2818c0d';

abstract class _$StandaloneDoorSensorListNotifier
    extends $AsyncNotifier<StandaloneDoorSensorListState> {
  FutureOr<StandaloneDoorSensorListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<StandaloneDoorSensorListState>,
              StandaloneDoorSensorListState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<StandaloneDoorSensorListState>,
                StandaloneDoorSensorListState
              >,
              AsyncValue<StandaloneDoorSensorListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
