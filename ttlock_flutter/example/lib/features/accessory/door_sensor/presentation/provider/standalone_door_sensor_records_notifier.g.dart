// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standalone_door_sensor_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StandaloneDoorSensorRecordsNotifier)
const standaloneDoorSensorRecordsProvider =
    StandaloneDoorSensorRecordsNotifierFamily._();

final class StandaloneDoorSensorRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          StandaloneDoorSensorRecordsNotifier,
          StandaloneDoorSensorRecordsState
        > {
  const StandaloneDoorSensorRecordsNotifierProvider._({
    required StandaloneDoorSensorRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'standaloneDoorSensorRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$standaloneDoorSensorRecordsNotifierHash();

  @override
  String toString() {
    return r'standaloneDoorSensorRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StandaloneDoorSensorRecordsNotifier create() =>
      StandaloneDoorSensorRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is StandaloneDoorSensorRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$standaloneDoorSensorRecordsNotifierHash() =>
    r'b632171164a9cf55e21464554c6ec63eca9d0e02';

final class StandaloneDoorSensorRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          StandaloneDoorSensorRecordsNotifier,
          AsyncValue<StandaloneDoorSensorRecordsState>,
          StandaloneDoorSensorRecordsState,
          FutureOr<StandaloneDoorSensorRecordsState>,
          int
        > {
  const StandaloneDoorSensorRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'standaloneDoorSensorRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StandaloneDoorSensorRecordsNotifierProvider call(int doorSensorId) =>
      StandaloneDoorSensorRecordsNotifierProvider._(
        argument: doorSensorId,
        from: this,
      );

  @override
  String toString() => r'standaloneDoorSensorRecordsProvider';
}

abstract class _$StandaloneDoorSensorRecordsNotifier
    extends $AsyncNotifier<StandaloneDoorSensorRecordsState> {
  late final _$args = ref.$arg as int;
  int get doorSensorId => _$args;

  FutureOr<StandaloneDoorSensorRecordsState> build(int doorSensorId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<StandaloneDoorSensorRecordsState>,
              StandaloneDoorSensorRecordsState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<StandaloneDoorSensorRecordsState>,
                StandaloneDoorSensorRecordsState
              >,
              AsyncValue<StandaloneDoorSensorRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
