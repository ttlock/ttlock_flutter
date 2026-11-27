import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/group/data/data_source/group_data_source.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/repository/group_repository_interface.dart';

part 'group_repository.g.dart';

@Riverpod(keepAlive: true)
class GroupRepository extends _$GroupRepository
    implements GroupRepositoryInterface {
  late final GroupDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(groupDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<GroupEntity>> list({int orderBy = 0}) => _map(
    _dataSource.list(orderBy: orderBy),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, List<GroupEntity>> listWithLockNum({
    int? keyRight,
  }) => _map(
    _dataSource.listWithLockNum(keyRight: keyRight),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(String name) => _dataSource.add(name: name);

  @override
  TaskEither<AppException, Unit> rename(int groupId, String name) =>
      _dataSource.update(groupId: groupId, name: name).map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(int groupId) =>
      _dataSource.delete(groupId: groupId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> setDeviceGroup(int lockId, int groupId) =>
      _dataSource
          .setDeviceGroup(deviceType: 0, deviceId: lockId, groupId: groupId)
          .map((_) => unit);

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
            message: '分组数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
