import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_list_state.dart';

part 'face_list_notifier.g.dart';

@Riverpod()
class FaceListNotifier extends _$FaceListNotifier {
  int _lockId = 0;

  @override
  Future<FaceListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _load(lockId);
    return FaceListState(items: items);
  }

  Future<List<FaceEntity>> _load(int lockId) async {
    final r = await ref.read(faceDomainProvider.notifier).list(lockId).run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _load(_lockId);
    state = AsyncValue.data(FaceListState(items: items));
  }
}
