import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/repository/key_repository.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/repository/key_repository_interface.dart';

part 'ekey_domain.g.dart';

@Riverpod(keepAlive: true)
class EkeyDomain extends _$EkeyDomain {
  late final KeyRepositoryInterface _repo;

  @override
  void build() => _repo = ref.watch(keyRepositoryProvider.notifier);

  TaskEither<AppException, PageState<KeyEntity>> listKeys(
    int lockId, {
    int pageNo = 1,
  }) => _repo.list(lockId, pageNo: pageNo);

  TaskEither<AppException, int> sendKey({
    required int lockId,
    required String username,
    String? keyName,
    DateTime? startDate,
    DateTime? endDate,
    bool authorized = false,
  }) {
    final u = username.trim();
    if (u.isEmpty) {
      return TaskEither.left(
        AppException.business(code: -20, message: 'username_required'),
      );
    }
    return _repo.send(
      lockId,
      u,
      keyName: (keyName == null || keyName.trim().isEmpty) ? u : keyName.trim(),
      startDate: startDate,
      endDate: endDate,
      userType: authorized ? KeyUserType.admin : KeyUserType.normal,
    );
  }

  TaskEither<AppException, Unit> changePeriod(
    int keyId,
    DateTime start,
    DateTime end,
  ) => _repo.changePeriod(keyId, start, end);

  TaskEither<AppException, Unit> freezeKey(int keyId) => _repo.freeze(keyId);

  TaskEither<AppException, Unit> unfreezeKey(int keyId) =>
      _repo.unfreeze(keyId);

  TaskEither<AppException, Unit> deleteKey(int keyId) => _repo.delete(keyId);

  TaskEither<AppException, Unit> authorizeKey(int lockId, int keyId) =>
      _repo.authorize(lockId, keyId);

  TaskEither<AppException, Unit> unauthorizeKey(int lockId, int keyId) =>
      _repo.unauthorize(lockId, keyId);

  TaskEither<AppException, String> getUnlockLink(int keyId) =>
      _repo.getUnlockLink(keyId);
}
