// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standalone_add_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StandaloneDoorSensorAddNotifier)
const standaloneDoorSensorAddProvider =
    StandaloneDoorSensorAddNotifierProvider._();

final class StandaloneDoorSensorAddNotifierProvider
    extends
        $AsyncNotifierProvider<
          StandaloneDoorSensorAddNotifier,
          StandaloneDoorSensorAddState
        > {
  const StandaloneDoorSensorAddNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'standaloneDoorSensorAddProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$standaloneDoorSensorAddNotifierHash();

  @$internal
  @override
  StandaloneDoorSensorAddNotifier create() => StandaloneDoorSensorAddNotifier();
}

String _$standaloneDoorSensorAddNotifierHash() =>
    r'08eee01d06d9fd4e26b7fb270c6c6bf01e40f11c';

abstract class _$StandaloneDoorSensorAddNotifier
    extends $AsyncNotifier<StandaloneDoorSensorAddState> {
  FutureOr<StandaloneDoorSensorAddState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<StandaloneDoorSensorAddState>,
              StandaloneDoorSensorAddState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<StandaloneDoorSensorAddState>,
                StandaloneDoorSensorAddState
              >,
              AsyncValue<StandaloneDoorSensorAddState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
