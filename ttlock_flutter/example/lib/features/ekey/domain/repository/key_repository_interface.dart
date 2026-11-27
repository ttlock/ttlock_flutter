import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

abstract class KeyRepositoryInterface {
  TaskEither<AppException, PageState<KeyEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  });

  TaskEither<AppException, int> send(
    int lockId,
    String username, {
    String? keyName,
    DateTime? startDate,
    DateTime? endDate,
    KeyUserType? userType,
  });

  TaskEither<AppException, Unit> changePeriod(
    int keyId,
    DateTime startDate,
    DateTime endDate,
  );

  TaskEither<AppException, Unit> freeze(int keyId);

  TaskEither<AppException, Unit> unfreeze(int keyId);

  TaskEither<AppException, Unit> delete(int keyId);

  TaskEither<AppException, Unit> authorize(int lockId, int keyId);

  TaskEither<AppException, Unit> unauthorize(int lockId, int keyId);

  TaskEither<AppException, String> getUnlockLink(int keyId);
}
