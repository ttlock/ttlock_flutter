import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/provider/remote_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_list_state.dart';

part 'remote_list_notifier.g.dart';

@Riverpod()
class RemoteListNotifier extends _$RemoteListNotifier {
  int _lockId = 0;

  @override
  Future<RemoteListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _load(lockId);
    return RemoteListState(items: items);
  }

  Future<List<RemoteEntity>> _load(int lockId) async {
    final r = await ref
        .read(remoteDomainProvider.notifier)
        .listByLock(lockId)
        .run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _load(_lockId);
    state = AsyncValue.data(RemoteListState(items: items));
  }
}
