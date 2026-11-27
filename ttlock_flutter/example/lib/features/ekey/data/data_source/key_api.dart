import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'key_api.g.dart';

/// 电子钥匙接口（/v3/key/*）。
///
/// 分页/读接口使用 [dynamic]，写接口返回 [OpenApiEnvelope]；
/// 由 DataSource 先判 errcode 再解析。
@RestApi()
abstract class KeyApi {
  factory KeyApi(Dio dio, {String? baseUrl}) = _KeyApi;

  @POST('/v3/key/send')
  @FormUrlEncoded()
  Future<dynamic> send({
    @Field('lockId') required int lockId,
    @Field('receiverUsername') required String receiverUsername,
    @Field('keyName') required String keyName,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('remarks') String? remarks,
    @Field('remoteEnable') int? remoteEnable,
    @Field('keyRight') int? keyRight,
    @Field('createUser') int? createUser,
  });

  @POST('/v3/key/batchSend')
  @FormUrlEncoded()
  Future<dynamic> batchSend({
    @Field('lockIdList') String? lockIdList,
    @Field('groupIdIdList') String? groupIdIdList,
    @Field('receiverUsername') required String receiverUsername,
    @Field('keyName') required String keyName,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('remarks') String? remarks,
    @Field('remoteEnable') int? remoteEnable,
    @Field('keyRight') int? keyRight,
    @Field('createUser') int? createUser,
  });

  @POST('/v3/key/list')
  @FormUrlEncoded()
  Future<dynamic> list({
    @Field('lockAlias') String? lockAlias,
    @Field('groupId') int? groupId,
    @Field('pageNo') int pageNo = 1,
    @Field('pageSize') int pageSize = 20,
  });

  /// 锁详情下的钥匙列表（与 lock feature 的 listKey 同路径，本 feature 独立复制）。
  @GET('/v3/lock/listKey')
  Future<dynamic> listByLock({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('keyRight') int? keyRight,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 1,
  });

  @GET('/v3/key/get')
  Future<dynamic> get({@Query('lockId') required int lockId});

  @POST('/v3/key/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('keyId') required int keyId,
    @Field('keyName') String? keyName,
    @Field('remoteEnable') int? remoteEnable,
  });

  @POST('/v3/key/changePeriod')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> changePeriod({
    @Field('keyId') required int keyId,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
  });

  @POST('/v3/key/freeze')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> freeze({@Field('keyId') required int keyId});

  @POST('/v3/key/unfreeze')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> unfreeze({@Field('keyId') required int keyId});

  @POST('/v3/key/authorize')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> authorize({
    @Field('lockId') required int lockId,
    @Field('keyId') required int keyId,
  });

  @POST('/v3/key/unauthorize')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> unauthorize({
    @Field('lockId') required int lockId,
    @Field('keyId') required int keyId,
  });

  @POST('/v3/key/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({@Field('keyId') required int keyId});

  @POST('/v3/key/getUnlockLink')
  @FormUrlEncoded()
  Future<dynamic> getUnlockLink({@Field('keyId') required int keyId});
}
