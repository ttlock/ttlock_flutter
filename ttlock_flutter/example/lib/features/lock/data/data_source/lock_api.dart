import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_dto.dart';

part 'lock_api.g.dart';

@RestApi()
abstract class LockApi {
  factory LockApi(Dio dio, {String? baseUrl}) = _LockApi;

  /// 成功返回 `{lockId, keyId}`；失败返回 `{errcode, errmsg, description}`。
  /// 使用 [dynamic] 由 DataSource 先判 errcode 再解析 [LockInitializeDto]。
  @POST('/v3/lock/initialize')
  @FormUrlEncoded()
  Future<dynamic> initialize({
    @Field('lockData') required String lockData,
    @Field('lockAlias') String? lockAlias,
    @Field('groupId') int? groupId,
  });

  /// 分页接口返回裸 JSON Map，由 DataSource 手动 [OpenApiPageDto] 解析。
  ///
  /// 使用 [dynamic] 而非 `Map<String, dynamic>`：retrofit_generator 9.6
  /// 会把后者生成非法的 `dynamic.fromJson`。
  @GET('/v3/lock/list')
  Future<dynamic> list({
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('groupId') int? groupId,
  });

  /// 成功为裸锁详情；失败 `{errcode}`。使用 [dynamic] 由 DataSource 先判码。
  @GET('/v3/lock/detail')
  Future<dynamic> detail({@Query('lockId') required int lockId});

  @POST('/v3/lock/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('lockId') required int lockId,
    @Field('lockAlias') required String lockAlias,
  });

  @POST('/v3/lock/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({@Field('lockId') required int lockId});

  @POST('/v3/lock/unlock')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> unlock({@Field('lockId') required int lockId});

  @POST('/v3/lock/lock')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> lock({@Field('lockId') required int lockId});
}
