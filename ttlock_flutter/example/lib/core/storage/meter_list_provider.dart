import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/model/saved_meter_device.dart';
import 'meter_storage.dart';

part 'meter_list_provider.g.dart';

final _meterStorage = MeterStorage();

@riverpod
class MeterListNotifier extends _$MeterListNotifier {
  @override
  Future<List<SavedMeterDevice>> build() async => _meterStorage.load();

  Future<void> addDevice(SavedMeterDevice device) async {
    final list = <SavedMeterDevice>[...?state.valueOrNull];
    final idx = list.indexWhere((d) => d.mac == device.mac);
    if (idx >= 0) {
      list[idx] = device;
    } else {
      list.add(device);
    }
    await _meterStorage.save(list);
    ref.invalidateSelf();
  }

  Future<void> removeDevice(String mac) async {
    final list = (state.valueOrNull ?? []).where((d) => d.mac != mac).toList();
    await _meterStorage.save(list);
    ref.invalidateSelf();
  }
}

@riverpod
Future<List<SavedMeterDevice>> waterMeterList(Ref ref) async {
  final all = await ref.watch(meterListNotifierProvider.future);
  return all.where((m) => m.isWater).toList();
}

@riverpod
Future<List<SavedMeterDevice>> electricMeterList(Ref ref) async {
  final all = await ref.watch(meterListNotifierProvider.future);
  return all.where((m) => m.isElectric).toList();
}
