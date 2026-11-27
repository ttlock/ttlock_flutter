import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_args.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_detail_state.dart';

part 'ekey_detail_notifier.g.dart';

@Riverpod()
class EkeyDetailNotifier extends _$EkeyDetailNotifier {
  late EkeyDetailArgs _args;

  EkeyDomain get _domain => ref.read(ekeyDomainProvider.notifier);

  @override
  EkeyDetailState build(EkeyDetailArgs args) {
    _args = args;
    return EkeyDetailState(key: args.key);
  }

  void clearError() => state = state.copyWith(error: null);

  Future<void> freeze() => _runUnit(
    _domain.freezeKey(state.key.keyId),
    (key) => key.copyWith(keyStatus: KeyStatus.frozen),
  );

  Future<void> unfreeze() => _runUnit(
    _domain.unfreezeKey(state.key.keyId),
    (key) => key.copyWith(keyStatus: KeyStatus.normal),
  );

  Future<void> authorize() => _runUnit(
    _domain.authorizeKey(_args.lock.lockId, state.key.keyId),
    (key) => key.copyWith(keyRight: true),
  );

  Future<void> unauthorize() => _runUnit(
    _domain.unauthorizeKey(_args.lock.lockId, state.key.keyId),
    (key) => key.copyWith(keyRight: false),
  );

  Future<void> changePeriod(DateTime start, DateTime end) => _runUnit(
    _domain.changePeriod(state.key.keyId, start, end),
    (key) => key.copyWith(startDate: start, endDate: end),
  );

  Future<bool> delete() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .deleteKey(state.key.keyId)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    return r.fold(
      (err) {
        state = state.copyWith(operating: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(operating: false);
        return true;
      },
    );
  }

  Future<void> loadUnlockLink() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .getUnlockLink(state.key.keyId)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (link) => state = state.copyWith(
        operating: false,
        unlockLink: link,
        error: null,
      ),
    );
  }

  Future<void> _runUnit(
    TaskEither<AppException, Unit> task,
    KeyEntity Function(KeyEntity) update,
  ) async {
    state = state.copyWith(operating: true, error: null);
    final r = await task.runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (_) => state = state.copyWith(operating: false, key: update(state.key)),
    );
  }
}
