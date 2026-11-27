import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_list_state.dart';

part 'passcode_list_notifier.g.dart';

@Riverpod()
class PasscodeListNotifier extends _$PasscodeListNotifier {
  int _lockId = 0;
  bool _loadingMore = false;
  static const _pageSize = 20;

  @override
  Future<PasscodeListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _loadPage(lockId, 1);
    return PasscodeListState(
      items: items,
      currentPage: 1,
      hasMore: items.length >= _pageSize,
    );
  }

  Future<List<KeyboardPwdEntity>> _loadPage(int lockId, int pageNo) async {
    final r = await ref
        .read(passcodeDomainProvider.notifier)
        .list(lockId, pageNo: pageNo, pageSize: _pageSize)
        .run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _loadPage(_lockId, 1);
    state = AsyncValue.data(
      PasscodeListState(
        items: items,
        currentPage: 1,
        hasMore: items.length >= _pageSize,
      ),
    );
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.currentPage + 1;
      final page = await _loadPage(_lockId, next);
      state = AsyncValue.data(
        PasscodeListState(
          items: [...current.items, ...page],
          currentPage: next,
          hasMore: page.length >= _pageSize,
        ),
      );
    } finally {
      _loadingMore = false;
    }
  }
}
