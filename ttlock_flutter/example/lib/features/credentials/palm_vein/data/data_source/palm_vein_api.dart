import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'palm_vein_api.g.dart';

/// 掌静脉接口。
///
/// `list` / `add` 使用 [dynamic]：成功为裸数据，失败可能带 `{errcode}`；
/// 写接口返回 [OpenApiEnvelope]。
/// 删除/修改有效期通道参数名为 `type`（非 deleteType/changeType）。
@RestApi()
abstract class PalmVeinApi {
  factory PalmVeinApi(Dio dio, {String? baseUrl}) = _PalmVeinApi;

  @POST('/v3/palmVein/list')
  @FormUrlEncoded()
  Future<dynamic> list({
    @Field('lockId') required int lockId,
    @Field('pageNo') int pageNo = 1,
    @Field('pageSize') int pageSize = 20,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/palmVein/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('number') required String number,
    @Field('name') String? name,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('type') int? type,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/palmVein/changePeriod')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> changePeriod({
    @Field('id') required int id,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('type') int? type,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/palmVein/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('id') required int id,
    @Field('type') int? type,
  });

  @POST('/v3/palmVein/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/palmVein/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('id') required int id,
    @Field('name') required String name,
  });
}
