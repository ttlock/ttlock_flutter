import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'fingerprint_api.g.dart';

/// 指纹接口。
///
/// `list` / `add` / `addByGateway` 使用 [dynamic]：成功为裸数据，失败可能带 `{errcode}`；
/// 由 DataSource 先判 errcode 再解析。写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class FingerprintApi {
  factory FingerprintApi(Dio dio, {String? baseUrl}) = _FingerprintApi;

  @GET('/v3/fingerprint/list')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 1,
  });

  @POST('/v3/fingerprint/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('fingerprintNumber') required String fingerprintNumber,
    @Field('fingerprintType') int? fingerprintType,
    @Field('fingerprintName') String? fingerprintName,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('addType') required int addType,
  });

  @POST('/v3/fingerprint/addByGateway')
  @FormUrlEncoded()
  Future<dynamic> addByGateway({
    @Field('lockId') required int lockId,
    @Field('fingerprintData') required String fingerprintData,
    @Field('fingerprintType') int? fingerprintType,
    @Field('fingerprintName') String? fingerprintName,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('addType') int addType = 2,
  });

  @POST('/v3/fingerprint/changePeriod')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> changePeriod({
    @Field('lockId') required int lockId,
    @Field('fingerprintId') required int fingerprintId,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('changeType') required int changeType,
  });

  @POST('/v3/fingerprint/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('fingerprintId') required int fingerprintId,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/fingerprint/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/fingerprint/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('lockId') required int lockId,
    @Field('fingerprintId') required int fingerprintId,
    @Field('fingerprintName') required String fingerprintName,
  });
}
