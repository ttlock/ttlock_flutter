// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door_sensor_records_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DoorSensorRecordsNotifier)
const doorSensorRecordsProvider = DoorSensorRecordsNotifierFamily._();

final class DoorSensorRecordsNotifierProvider
    extends
        $AsyncNotifierProvider<
          DoorSensorRecordsNotifier,
          DoorSensorRecordsState
        > {
  const DoorSensorRecordsNotifierProvider._({
    required DoorSensorRecordsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'doorSensorRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$doorSensorRecordsNotifierHash();

  @override
  String toString() {
    return r'doorSensorRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DoorSensorRecordsNotifier create() => DoorSensorRecordsNotifier();

  @override
  bool operator ==(Object other) {
    return other is DoorSensorRecordsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$doorSensorRecordsNotifierHash() =>
    r'3e4cac451c64bd395bc92efda18e1b0ce48f0bbb';

final class DoorSensorRecordsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DoorSensorRecordsNotifier,
          AsyncValue<DoorSensorRecordsState>,
          DoorSensorRecordsState,
          FutureOr<DoorSensorRecordsState>,
          int
        > {
  const DoorSensorRecordsNotifierFamily._()
    : super(
        retry: null,
        name: r'doorSensorRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DoorSensorRecordsNotifierProvider call(int lockId) =>
      DoorSensorRecordsNotifierProvider._(argument: lockId, from: this);

  @override
  String toString() => r'doorSensorRecordsProvider';
}

abstract class _$DoorSensorRecordsNotifier
    extends $AsyncNotifier<DoorSensorRecordsState> {
  late final _$args = ref.$arg as int;
  int get lockId => _$args;

  FutureOr<DoorSensorRecordsState> build(int lockId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<DoorSensorRecordsState>, DoorSensorRecordsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DoorSensorRecordsState>,
                DoorSensorRecordsState
              >,
              AsyncValue<DoorSensorRecordsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
