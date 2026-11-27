import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_list_state.dart';

part 'palm_vein_list_notifier.g.dart';

@Riverpod()
class PalmVeinListNotifier extends _$PalmVeinListNotifier {
  int _lockId = 0;

  @override
  Future<PalmVeinListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _load(lockId);
    return PalmVeinListState(items: items);
  }

  Future<List<PalmVeinEntity>> _load(int lockId) async {
    final r = await ref
        .read(palmVeinDomainProvider.notifier)
        .list(lockId)
        .run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _load(_lockId);
    state = AsyncValue.data(PalmVeinListState(items: items));
  }
}
