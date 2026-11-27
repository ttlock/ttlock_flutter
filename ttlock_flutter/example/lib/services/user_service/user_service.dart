import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserService extends _$UserService {
  @override
  void build() {}

  TaskEither<AppException, UserSession> login(
    String username,
    String password,
  ) => TaskEither.Do(($) async {
    final session = await $(
      ref.read(userDomainProvider.notifier).login(username, password),
    );
    await ref.read(userProvider.notifier).setSession(session);
    return session;
  });

  TaskEither<AppException, String> register(String username, String password) =>
      ref.read(userDomainProvider.notifier).register(username, password);

  TaskEither<AppException, UserSession> refresh() => TaskEither.Do(($) async {
    final session = await $(ref.read(userDomainProvider.notifier).refresh());
    await ref.read(userProvider.notifier).setSession(session);
    return session;
  });

  Future<void> logout() => ref.read(userProvider.notifier).logout();
}
