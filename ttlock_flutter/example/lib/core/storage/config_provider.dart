import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/settings/model/config_model.dart';
import 'config_storage.dart';

part 'config_provider.g.dart';

@riverpod
ConfigStorage configStorage(Ref ref) => ConfigStorage();

@riverpod
class ConfigNotifier extends _$ConfigNotifier {
  @override
  Future<ConfigModel> build() async {
    final storage = ref.watch(configStorageProvider);
    return storage.load();
  }

  Future<void> save(ConfigModel config) async {
    final storage = ref.read(configStorageProvider);
    await storage.save(config);
    state = AsyncValue.data(config);
  }
}
