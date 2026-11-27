import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'remote_api.g.dart';

/// 遥控接口。
///
/// `listByLock` / `add` / `upgradeCheck` 使用 [dynamic]：成功为裸数据，
/// 失败可能带 `{errcode}`；由 DataSource 先判 errcode 再解析。
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class RemoteApi {
  factory RemoteApi(Dio dio, {String? baseUrl}) = _RemoteApi;

  @GET('/v3/remote/listByLock')
  Future<dynamic> listByLock({
    @Query('lockId') required int lockId,
    @Query('orderBy') int orderBy = 0,
  });

  @POST('/v3/remote/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('number') required String number,
    @Field('mac') required String mac,
    @Field('name') String? name,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('electricQuantity') required int electricQuantity,
    @Field('firmwareInfo') required String firmwareInfo,
    @Field('type') int? type,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/remote/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({@Field('remoteId') required int remoteId});

  @POST('/v3/remote/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('remoteId') required int remoteId,
    @Field('name') String? name,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('type') int? type,
  });

  @POST('/v3/remote/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/remote/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({
    @Field('remoteId') required int remoteId,
    @Field('modelNum') String? modelNum,
    @Field('hardwareRevision') String? hardwareRevision,
    @Field('firmwareRevision') String? firmwareRevision,
  });

  @POST('/v3/remote/upgradeSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upgradeSuccess({
    @Field('remoteId') required int remoteId,
    @Field('firmwareRevision') required String firmwareRevision,
  });
}
