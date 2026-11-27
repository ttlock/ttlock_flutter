import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/data_source/key_data_source.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/repository/key_repository_interface.dart';

part 'key_repository.g.dart';

@Riverpod(keepAlive: true)
class KeyRepository extends _$KeyRepository implements KeyRepositoryInterface {
  late final KeyDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(keyDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<KeyEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _map(
    _dataSource.listByLock(lockId: lockId, pageNo: pageNo, pageSize: pageSize),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, int> send(
    int lockId,
    String username, {
    String? keyName,
    DateTime? startDate,
    DateTime? endDate,
    KeyUserType? userType,
  }) => _dataSource.send(
    lockId: lockId,
    receiverUsername: username,
    keyName: keyName ?? username,
    startDate: startDate?.millisecondsSinceEpoch,
    endDate: endDate?.millisecondsSinceEpoch,
    keyRight: userType == KeyUserType.admin ? 1 : null,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int keyId,
    DateTime startDate,
    DateTime endDate,
  ) => _dataSource
      .changePeriod(
        keyId: keyId,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> freeze(int keyId) =>
      _dataSource.freeze(keyId: keyId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> unfreeze(int keyId) =>
      _dataSource.unfreeze(keyId: keyId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(int keyId) =>
      _dataSource.delete(keyId: keyId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> authorize(int lockId, int keyId) =>
      _dataSource.authorize(lockId: lockId, keyId: keyId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> unauthorize(int lockId, int keyId) =>
      _dataSource.unauthorize(lockId: lockId, keyId: keyId).map((_) => unit);

  @override
  TaskEither<AppException, String> getUnlockLink(int keyId) =>
      _dataSource.getUnlockLink(keyId: keyId);

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
            message: '电子钥匙数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
