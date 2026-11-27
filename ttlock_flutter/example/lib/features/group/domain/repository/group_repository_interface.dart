import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';

abstract class GroupRepositoryInterface {
  TaskEither<AppException, List<GroupEntity>> list({int orderBy = 0});

  TaskEither<AppException, List<GroupEntity>> listWithLockNum({int? keyRight});

  TaskEither<AppException, int> add(String name);

  TaskEither<AppException, Unit> rename(int groupId, String name);

  TaskEither<AppException, Unit> delete(int groupId);

  TaskEither<AppException, Unit> setDeviceGroup(int lockId, int groupId);
}
