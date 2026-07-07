import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/model/saved_standalone_door_sensor.dart';
import 'standalone_door_sensor_storage.dart';

part 'standalone_door_sensor_list_provider.g.dart';

final _storage = StandaloneDoorSensorStorage();

@riverpod
class StandaloneDoorSensorListNotifier
    extends _$StandaloneDoorSensorListNotifier {
  @override
  Future<List<SavedStandaloneDoorSensor>> build() async =>
      _storage.load();

  Future<void> addDevice(SavedStandaloneDoorSensor device) async {
    final list = <SavedStandaloneDoorSensor>[...?state.valueOrNull];
    final idx = list.indexWhere((d) => d.mac == device.mac);
    if (idx >= 0) {
      list[idx] = device;
    } else {
      list.add(device);
    }
    await _storage.save(list);
    ref.invalidateSelf();
  }

  Future<void> removeDevice(String mac) async {
    final list =
        (state.valueOrNull ?? []).where((d) => d.mac != mac).toList();
    await _storage.save(list);
    ref.invalidateSelf();
  }

  Future<void> updateDevice(SavedStandaloneDoorSensor device) async {
    final list = <SavedStandaloneDoorSensor>[...?state.valueOrNull];
    await _storage.save(
      list.map((d) => d.mac == device.mac ? device : d).toList(),
    );
    ref.invalidateSelf();
  }
}
