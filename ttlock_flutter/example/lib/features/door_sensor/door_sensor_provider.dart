import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../providers/ttlock_providers.dart';

part 'door_sensor_provider.g.dart';

class DoorSensorState {
  final bool isLoading;
  final String? error;
  final String? result;

  const DoorSensorState({this.isLoading = false, this.error, this.result});
}

@riverpod
class DoorSensorNotifier extends _$DoorSensorNotifier {
  @override
  DoorSensorState build() => const DoorSensorState();

  /// 初始化挂锁门磁（需要 lockData）
  Future<void> initDoorSensor(String mac, String lockData) async {
    final api = ref.read(doorSensorApiProvider);
    state = DoorSensorState(isLoading: true, error: null);
    try {
      final result = await runRemoteAccessoryApi(() => api.initDoorSensor(mac, lockData));
      state = DoorSensorState(result: 'Init success: model=${result.modelNum}');
    } on TTRemoteAccessoryException catch (e) {
      state = DoorSensorState(error: e.toString());
    }
  }

  /// 初始化独立门磁
  Future<void> initStandalone(String mac, Map<String, Object?> info) async {
    final api = ref.read(doorSensorApiProvider);
    state = DoorSensorState(isLoading: true, error: null);
    try {
      final result = await runRemoteAccessoryApi(() => api.standaloneDoorSensorInit(mac, info));
      state = DoorSensorState(result: 'Init success: model=${result.modelNum}');
    } on TTRemoteAccessoryException catch (e) {
      state = DoorSensorState(error: e.toString());
    }
  }

  /// 读取特性值
  Future<void> readFeatureValue(String mac) async {
    final api = ref.read(doorSensorApiProvider);
    state = DoorSensorState(isLoading: true, error: null);
    try {
      final value = await runRemoteAccessoryApi(() => api.standaloneDoorSensorReadFeatureValue(mac));
      state = DoorSensorState(result: 'Feature value: $value');
    } on TTRemoteAccessoryException catch (e) {
      state = DoorSensorState(error: e.toString());
    }
  }

  /// 检查功能支持
  Future<void> checkSupport(String mac, String featureValue, int function) async {
    final api = ref.read(doorSensorApiProvider);
    state = DoorSensorState(isLoading: true, error: null);
    try {
      final supported = await runRemoteAccessoryApi(() => api.standaloneDoorSensorIsSupportFunction(featureValue, function));
      state = DoorSensorState(result: 'Function $function supported: $supported');
    } on TTRemoteAccessoryException catch (e) {
      state = DoorSensorState(error: e.toString());
    }
  }
}
