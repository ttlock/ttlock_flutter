import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_data_source.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_token_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user_repository_interface.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
class UserRepository extends _$UserRepository
    implements UserRepositoryInterface {
  UserDataSource get _dataSource => ref.watch(userDataSourceProvider.notifier);

  AppConfig get _config => ref.read(appConfigServiceProvider);

  @override
  void build() {}

  @override
  TaskEither<AppException, UserSession> login(
    String username,
    String password,
  ) {
    final missing = _missingCredentials();
    if (missing != null) return TaskEither.left(missing);
    return _mapToken(
      _dataSource.login(
        clientId: _config.clientId,
        clientSecret: _config.clientSecret,
        username: username,
        password: password,
      ),
      loginName: username,
    );
  }

  @override
  TaskEither<AppException, UserSession> refresh() {
    final missing = _missingCredentials();
    if (missing != null) return TaskEither.left(missing);
    final session = ref.read(userProvider);
    if (session == null || session.refreshToken.isEmpty) {
      return TaskEither.left(const AppException('无刷新令牌', null));
    }
    return _mapToken(
      _dataSource.refresh(
        clientId: _config.clientId,
        clientSecret: _config.clientSecret,
        refreshToken: session.refreshToken,
      ),
      loginName: session.loginName,
    );
  }

  @override
  TaskEither<AppException, String> register(String username, String password) {
    final missing = _missingCredentials();
    if (missing != null) return TaskEither.left(missing);
    return TaskEither(() async {
      final result = await _dataSource
          .register(
            clientId: _config.clientId,
            clientSecret: _config.clientSecret,
            username: username,
            password: password,
          )
          .run();
      return result.fold(Left.new, (dto) => Right(dto.username));
    });
  }

  AppException? _missingCredentials() {
    if (_config.hasCredentials) return null;
    return AppException.business(
      code: -1,
      message: '请先配置 clientId 与 clientSecret',
    );
  }

  @override
  TaskEither<AppException, CloudUserPage> list({
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
  }) => TaskEither(() async {
    final result = await _dataSource
        .list(
          clientId: _config.clientId,
          clientSecret: _config.clientSecret,
          pageNo: pageNo,
          pageSize: pageSize,
          startDate: startDate,
          endDate: endDate,
        )
        .run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(dto.toEntity());
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '用户列表转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });

  TaskEither<AppException, UserSession> _mapToken(
    TaskEither<AppException, UserTokenDto> call, {
    String loginName = '',
  }) => TaskEither(() async {
    final result = await call.run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(dto.toEntity(loginName: loginName));
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '用户数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
