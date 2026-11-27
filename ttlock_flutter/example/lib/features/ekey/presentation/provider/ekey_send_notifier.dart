import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_send_state.dart';

part 'ekey_send_notifier.g.dart';

@Riverpod()
class EkeySendNotifier extends _$EkeySendNotifier {
  int _lockId = 0;

  @override
  EkeySendState build(int lockId) {
    _lockId = lockId;
    return const EkeySendState();
  }

  void setPermanent(bool value) {
    if (value) {
      state = state.copyWith(permanent: true);
      return;
    }
    final now = DateTime.now();
    state = state.copyWith(
      permanent: false,
      startDate: state.startDate ?? now,
      endDate: state.endDate ?? now.add(const Duration(days: 7)),
    );
  }

  void setStartDate(DateTime value) => state = state.copyWith(startDate: value);

  void setEndDate(DateTime value) => state = state.copyWith(endDate: value);

  void setAuthorized(bool value) => state = state.copyWith(authorized: value);

  void clearError() => state = state.copyWith(error: null);

  /// 永久有效期传 epoch 0；授权管理员只走 `sendKey(authorized: true)`，不叠加 authorize。
  Future<bool> submit({required String username, String? keyName}) async {
    state = state.copyWith(submitting: true, error: null);
    final epochZero = DateTime.fromMillisecondsSinceEpoch(0);
    final start = state.permanent ? epochZero : state.startDate;
    final end = state.permanent ? epochZero : state.endDate;
    final r = await ref
        .read(ekeyDomainProvider.notifier)
        .sendKey(
          lockId: _lockId,
          username: username,
          keyName: keyName,
          startDate: start,
          endDate: end,
          authorized: state.authorized,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(submitting: false);
        return true;
      },
    );
  }
}
