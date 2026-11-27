import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';

abstract class UserRepositoryInterface {
  TaskEither<AppException, UserSession> login(String username, String password);

  TaskEither<AppException, UserSession> refresh();

  TaskEither<AppException, String> register(String username, String password);

  TaskEither<AppException, CloudUserPage> list({
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
  });
}
