import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_list_state.dart';

part 'ekey_list_notifier.g.dart';

@Riverpod()
class EkeyListNotifier extends _$EkeyListNotifier {
  int _lockId = 0;
  bool _loadingMore = false;

  @override
  Future<EkeyListState> build(int lockId) async {
    _lockId = lockId;
    final page = await _loadPage(lockId, 1);
    return EkeyListState(pageState: page);
  }

  Future<PageState<KeyEntity>> _loadPage(int lockId, int pageNo) async {
    final r = await ref
        .read(ekeyDomainProvider.notifier)
        .listKeys(lockId, pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(_lockId, 1);
    state = AsyncValue.data(EkeyListState(pageState: page));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(_lockId, next);
      final cur = current.pageState;
      state = AsyncValue.data(
        EkeyListState(
          pageState: PageState(
            data: [...cur.data, ...page.data],
            currentPage: next,
            pageSize: cur.pageSize,
            total: page.total,
          ),
        ),
      );
    } finally {
      _loadingMore = false;
    }
  }
}
