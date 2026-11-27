import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/provider/lock_list_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

part 'lock_list_notifier.g.dart';

@Riverpod()
class LockListNotifier extends _$LockListNotifier {
  bool _loadingMore = false;

  @override
  Future<LockListState> build() async {
    final page = await _loadPage(1);
    return LockListState(pageState: page);
  }

  Future<PageState<LockEntity>> _loadPage(int pageNo) async {
    final r = await ref
        .read(lockDomainProvider.notifier)
        .listLocks(pageNo: pageNo, pageSize: 20)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(1);
    state = AsyncValue.data(LockListState(pageState: page));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(next);
      final cur = current.pageState;
      state = AsyncValue.data(
        LockListState(
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
