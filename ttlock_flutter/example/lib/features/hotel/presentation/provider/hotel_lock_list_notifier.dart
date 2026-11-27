import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

part 'hotel_lock_list_notifier.g.dart';

/// 列表页 provider。
///
/// `name` 显式固定为 `hotelLockListNotifierProvider`：生成器默认会把类名的
/// `Notifier` 后缀剥掉产出 `hotelLockListProvider`，与跨任务约定的名字不符
/// （Task 4 列表页按 `hotelLockListNotifierProvider` 消费）。
@Riverpod(name: 'hotelLockListNotifierProvider')
class HotelLockListNotifier extends _$HotelLockListNotifier {
  bool _loadingMore = false;

  /// 查询参数存在实例字段里，**不从 `state` 读**。
  ///
  /// `AsyncValue.guard` 失败后 `state` 变 `AsyncError`，而错误态的 `.value` 为
  /// null——若 `refresh` / `setType` / `setAlias` 以 `state.value == null` 早退，
  /// 它们会在错误态下全部变成 no-op：页面把重试按钮接在 `refresh()` 上，
  /// 用户就会永久卡在错误页（自动重试最多 10 次、间隔 ≤6.4s，窗口内手动重试
  /// 同样是 no-op）。查询参数与「已加载的列表」生命周期不同，故分开存。
  int _type = 1;
  String _alias = '';

  /// 当前查询参数（只读暴露给页面）。
  ///
  /// 页面**不能**从 `state.value` 读：错误态下 `.value` 为 null，下拉框会退回
  /// 默认值，而 `setType` 又按 `_type` 早退——用户再选同一个值就成了 no-op。
  int get selectedType => _type;
  String get searchAlias => _alias;

  @override
  Future<HotelLockListState> build() => _reload(1);

  /// 用当前查询参数取第 [pageNo] 页，并**重建** state。
  ///
  /// 不读 `state.value`：错误态下 `.value` 为 null，读它等于把重试路径堵死。
  Future<HotelLockListState> _reload(int pageNo) async => HotelLockListState(
    pageState: await _loadPage(pageNo, type: _type, alias: _alias),
    type: _type,
    lockAlias: _alias,
  );

  Future<PageState<HotelLockEntity>> _loadPage(
    int pageNo, {
    required int type,
    required String alias,
  }) async {
    final r = await ref
        .read(lockDomainProvider.notifier)
        .listHotelLocks(
          pageNo: pageNo,
          type: type,
          lockAlias: alias.isEmpty ? null : alias,
        )
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  /// 失败进 error 态（`AsyncValue.guard`），不抛给调用方。
  ///
  /// 注意：这里是**重建** state 而非 `cur.copyWith`——`_reload` 不读 `state.value`，
  /// 所以错误态下仍能发请求并恢复。
  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _reload(1));
  }

  Future<void> loadMore() async {
    // error 态下没有已加载的列表可续页，早退正确；查询参数不经 state。
    final cur = state.value;
    if (cur == null || !cur.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = cur.pageState.currentPage + 1;
      state = await AsyncValue.guard(() async {
        final page = await _loadPage(next, type: _type, alias: _alias);
        final prev = cur.pageState;
        return cur.copyWith(
          pageState: PageState(
            data: [...prev.data, ...page.data],
            currentPage: next,
            pageSize: prev.pageSize,
            total: page.total,
          ),
        );
      });
    } finally {
      _loadingMore = false;
    }
  }

  /// 切换锁类型：重置到第 1 页重查。**无「全部」选项**（spec §2.1 限制 2）。
  Future<void> setType(int type) async {
    if (_type == type) return;
    _type = type;
    await _reloadFromFirstPage();
  }

  /// 别名搜索：调用方负责防抖（300ms），本方法直接重查。
  Future<void> setAlias(String alias) async {
    if (_alias == alias) return;
    _alias = alias;
    await _reloadFromFirstPage();
  }

  Future<void> _reloadFromFirstPage() async {
    state = await AsyncValue.guard(() => _reload(1));
  }
}
