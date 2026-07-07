import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'standalone_door_sensor_provider.g.dart';

class StandaloneDoorSensorState {
  final bool isLoading;
  final String? error;
  final String? result;

  const StandaloneDoorSensorState({
    this.isLoading = false,
    this.error,
    this.result,
  });
}

@riverpod
class StandaloneDoorSensorNotifier extends _$StandaloneDoorSensorNotifier {
  @override
  StandaloneDoorSensorState build() => const StandaloneDoorSensorState();

  Future<TTStandaloneDoorSensorInfo?> init(
    TTStandaloneDoorSensorInitParams params,
  ) async {
    final api = TTLock.doorSensor;
    state = const StandaloneDoorSensorState(isLoading: true);
    try {
      final result = await api.standaloneDoorSensorInit(params);
      state = StandaloneDoorSensorState(
        result: 'Init success: model=${result.modelNum}',
      );
      return result;
    } on TTStandaloneDoorSensorException catch (e) {
      state = StandaloneDoorSensorState(error: e.toString());
      return null;
    }
  }

  Future<void> readFeatureValue(String mac) async {
    final api = TTLock.doorSensor;
    state = const StandaloneDoorSensorState(isLoading: true);
    try {
      final value = await api.standaloneDoorSensorReadFeatureValue(mac);
      state = StandaloneDoorSensorState(result: 'Feature value: $value');
    } on TTStandaloneDoorSensorException catch (e) {
      state = StandaloneDoorSensorState(error: e.toString());
    }
  }

  Future<void> checkSupport(
    String featureValue,
    TTStandaloneDoorSensorFeature function,
  ) async {
    final api = TTLock.doorSensor;
    state = const StandaloneDoorSensorState(isLoading: true);
    try {
      final supported = await api.standaloneDoorSensorIsSupportFunction(
        featureValue,
        function,
      );
      state = StandaloneDoorSensorState(
        result: 'Function $function supported: $supported',
      );
    } on TTStandaloneDoorSensorException catch (e) {
      state = StandaloneDoorSensorState(error: e.toString());
    }
  }
}
