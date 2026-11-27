import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_list_state.dart';

part 'fingerprint_list_notifier.g.dart';

@Riverpod()
class FingerprintListNotifier extends _$FingerprintListNotifier {
  int _lockId = 0;

  @override
  Future<FingerprintListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _load(lockId);
    return FingerprintListState(items: items);
  }

  Future<List<FingerprintEntity>> _load(int lockId) async {
    final r = await ref
        .read(fingerprintDomainProvider.notifier)
        .list(lockId)
        .run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _load(_lockId);
    state = AsyncValue.data(FingerprintListState(items: items));
  }
}
