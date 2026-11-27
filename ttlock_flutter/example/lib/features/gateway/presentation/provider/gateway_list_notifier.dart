import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_list_state.dart';

part 'gateway_list_notifier.g.dart';

@Riverpod()
class GatewayListNotifier extends _$GatewayListNotifier {
  bool _loadingMore = false;

  @override
  Future<GatewayListState> build() async {
    final page = await _loadPage(1);
    return GatewayListState(pageState: page);
  }

  Future<PageState<GatewayEntity>> _loadPage(int pageNo) async {
    final r = await ref
        .read(gatewayDomainProvider.notifier)
        .list(pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(1);
    state = AsyncValue.data(GatewayListState(pageState: page));
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
        GatewayListState(
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
