import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

abstract class LiftRepositoryInterface {
  TaskEither<AppException, Unit> activateFloors(
    int lockId,
    List<String> floors,
  );
}
