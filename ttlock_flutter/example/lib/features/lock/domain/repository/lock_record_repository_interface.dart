import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';

abstract class LockRecordRepositoryInterface {
  TaskEither<AppException, PageState<LockRecordEntity>> getRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
    int? uid,
    int? recordType,
    String? searchStr,
  });

  TaskEither<AppException, Unit> delete(
    int lockId, {
    required List<int> recordIdList,
  });

  TaskEither<AppException, Unit> clear(int lockId);

  TaskEither<AppException, Unit> upload(int lockId, {required String records});
}
