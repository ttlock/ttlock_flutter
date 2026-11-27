import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/provider/qr_code_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_list_state.dart';

part 'qr_code_list_notifier.g.dart';

@Riverpod()
class QrCodeListNotifier extends _$QrCodeListNotifier {
  int _lockId = 0;
  bool _loadingMore = false;

  @override
  Future<QrCodeListState> build(int lockId) async {
    _lockId = lockId;
    final page = await _loadPage(lockId, 1);
    return QrCodeListState(pageState: page);
  }

  Future<PageState<QrCodeEntity>> _loadPage(int lockId, int pageNo) async {
    final r = await ref
        .read(qrCodeDomainProvider.notifier)
        .list(lockId, pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(_lockId, 1);
    state = AsyncValue.data(QrCodeListState(pageState: page));
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
        QrCodeListState(
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
