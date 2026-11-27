import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/util/md5_utils.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_api.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_list_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_register_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_token_dto.dart';

part 'user_data_source.g.dart';

@Riverpod(keepAlive: true)
UserApi userApi(Ref ref) => UserApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class UserDataSource extends _$UserDataSource {
  @override
  void build() {}

  UserApi get _api => ref.watch(userApiProvider);

  TaskEither<AppException, UserTokenDto> login({
    required String clientId,
    required String clientSecret,
    required String username,
    required String password,
  }) => TaskEither.tryCatch(() async {
    final dto = await _api.login(
      clientId: clientId,
      clientSecret: clientSecret,
      username: username,
      password: md5Of(password),
    );
    _ensureTokenOk(dto);
    return dto;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, UserTokenDto> refresh({
    required String clientId,
    required String clientSecret,
    required String refreshToken,
  }) => TaskEither.tryCatch(() async {
    final dto = await _api.refresh(
      clientId: clientId,
      clientSecret: clientSecret,
      grantType: 'refresh_token',
      refreshToken: refreshToken,
    );
    _ensureTokenOk(dto);
    return dto;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, UserRegisterDto> register({
    required String clientId,
    required String clientSecret,
    required String username,
    required String password,
  }) => TaskEither.tryCatch(() async {
    final dto = await _api.register(
      clientId: clientId,
      clientSecret: clientSecret,
      username: username,
      password: md5Of(password),
      date: DateTime.now().millisecondsSinceEpoch,
    );
    if (dto.errcode != 0) {
      throw AppException.business(code: dto.errcode, message: dto.errmsg);
    }
    return dto;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, UserListDto> list({
    required String clientId,
    required String clientSecret,
    required int pageNo,
    required int pageSize,
    int? startDate,
    int? endDate,
  }) => TaskEither.tryCatch(
    () => _api.list(
      clientId: clientId,
      clientSecret: clientSecret,
      pageNo: pageNo,
      pageSize: pageSize,
      date: DateTime.now().millisecondsSinceEpoch,
      startDate: startDate,
      endDate: endDate,
    ),
    ExceptionUtils.extractAppException,
  );
}

void _ensureTokenOk(UserTokenDto dto) {
  // OAuth 失败常只有 errmsg、无 errcode；缺省 errcode=0 会被误判成功。
  if (dto.errcode != 0 || dto.accessToken.isEmpty) {
    throw AppException.business(
      code: dto.errcode != 0 ? dto.errcode : -1,
      message: dto.errmsg.isEmpty ? '登录失败' : dto.errmsg,
    );
  }
}
