import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'qr_code_api.g.dart';

/// 二维码接口。
///
/// 列表/添加成功为裸数据；写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class QrCodeApi {
  factory QrCodeApi(Dio dio, {String? baseUrl}) = _QrCodeApi;

  @GET('/v3/qrCode/list')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('name') String? name,
  });

  @POST('/v3/qrCode/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('name') String? name,
    @Field('type') required int type,
    @Field('addType') required int addType,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('refreshTime') int? refreshTime,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('qrCodeNumber') String? qrCodeNumber,
  });

  @POST('/v3/qrCode/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('qrCodeId') required int qrCodeId,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/qrCode/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({
    @Field('lockId') required int lockId,
    @Field('type') required int type,
  });

  @GET('/v3/qrCode/getData')
  Future<dynamic> getData({@Query('qrCodeId') required int qrCodeId});

  @POST('/v3/qrCode/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('qrCodeId') required int qrCodeId,
    @Field('type') required int type,
    @Field('changeType') required int changeType,
    @Field('name') String? name,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('refreshTime') int? refreshTime,
    @Field('cyclicConfig') String? cyclicConfig,
  });
}
