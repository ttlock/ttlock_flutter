import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_list_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_register_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_token_dto.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @POST('/oauth2/token')
  @FormUrlEncoded()
  Future<UserTokenDto> login({
    @Field('clientId') required String clientId,
    @Field('clientSecret') required String clientSecret,
    @Field('username') required String username,
    @Field('password') required String password,
  });

  @POST('/oauth2/token')
  @FormUrlEncoded()
  Future<UserTokenDto> refresh({
    @Field('clientId') required String clientId,
    @Field('clientSecret') required String clientSecret,
    @Field('grant_type') required String grantType,
    @Field('refresh_token') required String refreshToken,
  });

  @POST('/v3/user/register')
  @FormUrlEncoded()
  Future<UserRegisterDto> register({
    @Field('clientId') required String clientId,
    @Field('clientSecret') required String clientSecret,
    @Field('username') required String username,
    @Field('password') required String password,
    @Field('date') int? date,
  });

  @GET('/v3/user/list')
  Future<UserListDto> list({
    @Query('clientId') required String clientId,
    @Query('clientSecret') required String clientSecret,
    @Query('pageNo') required int pageNo,
    @Query('pageSize') required int pageSize,
    @Query('date') required int date,
    @Query('startDate') int? startDate,
    @Query('endDate') int? endDate,
  });
}
