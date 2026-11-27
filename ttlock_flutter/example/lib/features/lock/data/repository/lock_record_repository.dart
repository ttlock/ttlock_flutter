import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_record_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/lock_record_repository_interface.dart';

part 'lock_record_repository.g.dart';

@Riverpod(keepAlive: true)
class LockRecordRepository extends _$LockRecordRepository
    implements LockRecordRepositoryInterface {
  late final LockRecordDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(lockRecordDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<LockRecordEntity>> getRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
    int? uid,
    int? recordType,
    String? searchStr,
  }) => _map(
    _dataSource.list(
      lockId: lockId,
      pageNo: pageNo,
      pageSize: pageSize,
      startDate: startDate,
      endDate: endDate,
      uid: uid,
      recordType: recordType,
      searchStr: searchStr,
    ),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, Unit> delete(
    int lockId, {
    required List<int> recordIdList,
  }) => _dataSource
      .delete(lockId: lockId, recordIdList: recordIdList)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> upload(
    int lockId, {
    required String records,
  }) => _dataSource.upload(lockId: lockId, records: records).map((_) => unit);

  TaskEither<AppException, R> _map<T, R>(
    TaskEither<AppException, T> call,
    R Function(T) mapper,
  ) => TaskEither(() async {
    final result = await call.run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(mapper(dto));
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '锁记录数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
