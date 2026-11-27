import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'face_api.g.dart';

/// 人脸凭证接口。
///
/// 删除通道参数为 `type`（非 deleteType）。读接口使用 [dynamic]。
@RestApi()
abstract class FaceApi {
  factory FaceApi(Dio dio, {String? baseUrl}) = _FaceApi;

  @GET('/v3/face/list')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 200,
    @Query('searchStr') String? searchStr,
  });

  @POST('/v3/face/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('name') String? name,
    @Field('faceNumber') String? faceNumber,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('type') int? type,
    @Field('addType') required int addType,
    @Field('featureData') String? featureData,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/face/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('faceId') required int faceId,
    @Field('type') required int type,
  });

  @POST('/v3/face/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/face/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('lockId') required int lockId,
    @Field('faceId') required int faceId,
    @Field('name') required String name,
  });

  @POST('/v3/face/changePeriod')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> changePeriod({
    @Field('lockId') required int lockId,
    @Field('faceId') required int faceId,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('type') required int type,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/face/getFeatureDataByPhoto')
  @MultiPart()
  Future<dynamic> getFeatureDataByPhoto(
    @Part(name: 'image') List<MultipartFile> image, {
    @Query('lockId') required int lockId,
  });

  @POST('/v3/face/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('lockId') required int lockId,
    @Field('faceId') required int faceId,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('type') required int type,
    @Field('cyclicConfig') String? cyclicConfig,
  });
}
