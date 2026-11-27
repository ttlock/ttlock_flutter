import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_repository.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user_repository_interface.dart';

part 'user_domain.g.dart';

@Riverpod(keepAlive: true)
class UserDomain extends _$UserDomain {
  UserRepositoryInterface get _repository =>
      ref.watch(userRepositoryProvider.notifier);

  @override
  void build() {}

  TaskEither<AppException, UserSession> login(
    String username,
    String password,
  ) => _repository.login(username, password);

  TaskEither<AppException, UserSession> refresh() => _repository.refresh();

  TaskEither<AppException, String> register(String username, String password) =>
      _repository.register(username, password);

  TaskEither<AppException, CloudUserPage> list({
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
  }) => _repository.list(
    pageNo: pageNo,
    pageSize: pageSize,
    startDate: startDate,
    endDate: endDate,
  );
}
