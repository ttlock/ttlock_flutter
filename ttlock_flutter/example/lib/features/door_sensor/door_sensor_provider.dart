import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

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
    final api = TTLock.doorSensor;
    state = DoorSensorState(isLoading: true, error: null);
    try {
      final result = await api.initDoorSensor(mac, lockData);
      state = DoorSensorState(result: 'Init success: model=${result.modelNum}');
    } on TTRemoteAccessoryException catch (e) {
      state = DoorSensorState(error: e.toString());
    }
  }
}
