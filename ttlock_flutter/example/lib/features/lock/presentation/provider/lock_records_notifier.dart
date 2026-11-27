import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_records_state.dart';

part 'lock_records_notifier.g.dart';

@Riverpod()
class LockRecordsNotifier extends _$LockRecordsNotifier {
  int _lockId = 0;
  bool _loadingMore = false;

  LockDomain get _domain => ref.read(lockDomainProvider.notifier);

  @override
  Future<LockRecordsState> build(int lockId) async {
    _lockId = lockId;
    final page = await _loadPage(lockId, 1, null);
    return LockRecordsState(pageState: page);
  }

  Future<PageState<LockRecordEntity>> _loadPage(
    int lockId,
    int pageNo,
    int? filter,
  ) async {
    final r = await _domain
        .listRecords(lockId, pageNo: pageNo, pageSize: 20, recordType: filter)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final filter = state.value?.recordTypeFilter;
    final page = await _loadPage(_lockId, 1, filter);
    state = AsyncValue.data(
      LockRecordsState(pageState: page, recordTypeFilter: filter),
    );
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(_lockId, next, current.recordTypeFilter);
      final cur = current.pageState;
      state = AsyncValue.data(
        LockRecordsState(
          pageState: PageState(
            data: [...cur.data, ...page.data],
            currentPage: next,
            pageSize: cur.pageSize,
            total: page.total,
          ),
          recordTypeFilter: current.recordTypeFilter,
        ),
      );
    } finally {
      _loadingMore = false;
    }
  }

  Future<void> setFilter(int? recordType) async {
    // 切换筛选重查第一页：无页面级指示，借用全局 loading。
    final page = await withGlobalLoading(
      () => _loadPage(_lockId, 1, recordType),
      status: ref.read(l10nProvider).loading,
    );
    state = AsyncValue.data(
      LockRecordsState(pageState: page, recordTypeFilter: recordType),
    );
  }

  Future<void> deleteRecord(int recordId) async {
    final r = await _domain
        .deleteRecords(_lockId, [recordId])
        .runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(_setError, (_) {
      final cur = state.value!;
      state = AsyncValue.data(
        LockRecordsState(
          pageState: PageState(
            data: cur.pageState.data
                .where((e) => e.recordId != recordId)
                .toList(),
            currentPage: cur.pageState.currentPage,
            pageSize: cur.pageState.pageSize,
            total: cur.pageState.total - 1,
          ),
          recordTypeFilter: cur.recordTypeFilter,
        ),
      );
    });
  }

  Future<void> clearRecords() async {
    // 清空成功后的 refresh() 共用同一 loading 窗口，避免闪烁。
    await withGlobalLoading(() async {
      final r = await _domain.clearRecords(_lockId).run();
      await r.fold((err) async => _setError(err), (_) => refresh());
    }, status: ref.read(l10nProvider).loading);
  }

  /// BLE 读离线记录 → 云端上传；失败经 LockRecordsError 通道呈现（禁止裸 throw 出 onPressed）。
  Future<void> syncOfflineRecords(String lockData) async {
    await withGlobalLoading(() async {
      final r = await _domain.fetchOfflineRecords(lockData).run();
      final String? records = r.fold((err) {
        _setError(err);
        return null;
      }, (records) => records);
      if (records == null) return;
      final up = await _domain.uploadRecords(_lockId, records).run();
      up.fold(_setError, (_) {});
      await refresh();
    }, status: ref.read(l10nProvider).loading);
  }

  void _setError(AppException err) =>
      ref.read(lockRecordsErrorProvider.notifier).setError(err);
}

/// 同步离线记录的一次性错误通道（UI listen 后 SnackBar 呈现并 clear）。
@riverpod
class LockRecordsError extends _$LockRecordsError {
  @override
  AppException? build() => null;
  void clear() => state = null;
  void setError(AppException err) => state = err;
}
