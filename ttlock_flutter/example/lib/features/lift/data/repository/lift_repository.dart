import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lift/data/data_source/lift_data_source.dart';
import 'package:ttlock_flutter_demo/features/lift/domain/repository/lift_repository_interface.dart';

part 'lift_repository.g.dart';

@Riverpod(keepAlive: true)
class LiftRepository extends _$LiftRepository
    implements LiftRepositoryInterface {
  late final LiftDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(liftDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, Unit> activateFloors(
    int lockId,
    List<String> floors,
  ) => _dataSource
      .activateFloors(lockId: lockId, floors: floors)
      .map((_) => unit);
}
