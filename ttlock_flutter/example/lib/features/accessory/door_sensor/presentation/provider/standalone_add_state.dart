import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'standalone_add_state.freezed.dart';

/// 独立门磁配网向导状态机：scan → credential → init → done。
@freezed
sealed class StandaloneDoorSensorAddStep with _$StandaloneDoorSensorAddStep {
  const factory StandaloneDoorSensorAddStep.scanning({
    @Default(<String, TTStandaloneDoorSensorScanModel>{})
    Map<String, TTStandaloneDoorSensorScanModel> devices,
  }) = StandaloneAddStepScanning;

  const factory StandaloneDoorSensorAddStep.credential({required String mac}) =
      StandaloneAddStepCredential;

  const factory StandaloneDoorSensorAddStep.initializing({
    required String mac,
  }) = StandaloneAddStepInitializing;

  const factory StandaloneDoorSensorAddStep.done({required int doorSensorId}) =
      StandaloneAddStepDone;

  const factory StandaloneDoorSensorAddStep.failure({
    required AppException error,
  }) = StandaloneAddStepFailure;
}

@freezed
abstract class StandaloneDoorSensorAddState
    with _$StandaloneDoorSensorAddState {
  const factory StandaloneDoorSensorAddState({
    @Default(StandaloneDoorSensorAddStep.scanning())
    StandaloneDoorSensorAddStep step,
  }) = _StandaloneDoorSensorAddState;
}
