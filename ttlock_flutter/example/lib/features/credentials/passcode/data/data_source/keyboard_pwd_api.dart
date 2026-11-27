import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'keyboard_pwd_api.g.dart';

/// 密码（keyboardPwd）接口。
///
/// `add` / `get` / `list` 使用 [dynamic]：成功为裸数据，失败可能带 `{errcode}`；
/// 由 DataSource 先判 errcode 再解析。写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class KeyboardPwdApi {
  factory KeyboardPwdApi(Dio dio, {String? baseUrl}) = _KeyboardPwdApi;

  @GET('/v3/lock/listKeyboardPwd')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 1,
  });

  @POST('/v3/keyboardPwd/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('keyboardPwd') required String keyboardPwd,
    @Field('keyboardPwdName') String? keyboardPwdName,
    @Field('keyboardPwdType') int? keyboardPwdType,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('addType') required int addType,
  });

  @POST('/v3/keyboardPwd/get')
  @FormUrlEncoded()
  Future<dynamic> getRandom({
    @Field('lockId') required int lockId,
    @Field('keyboardPwdType') required int keyboardPwdType,
    @Field('keyboardPwdName') String? keyboardPwdName,
    @Field('startDate') required int startDate,
    @Field('endDate') int? endDate,
  });

  @POST('/v3/keyboardPwd/change')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> change({
    @Field('lockId') required int lockId,
    @Field('keyboardPwdId') required int keyboardPwdId,
    @Field('keyboardPwdName') String? keyboardPwdName,
    @Field('newKeyboardPwd') String? newKeyboardPwd,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('changeType') required int changeType,
  });

  @POST('/v3/keyboardPwd/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('keyboardPwdId') required int keyboardPwdId,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/keyboardPwd/deleteByCode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> deleteByCode({
    @Field('lockId') required int lockId,
    @Field('keyboardPwd') required String keyboardPwd,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/keyboardPwd/uploadValidCodeFromLock')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> uploadValidCodeFromLock({
    @Field('lockId') required int lockId,
    @Field('keyboardPwdList') required String keyboardPwdList,
  });
}
