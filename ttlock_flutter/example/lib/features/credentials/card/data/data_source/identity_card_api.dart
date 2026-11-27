import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'identity_card_api.g.dart';

/// IC 卡（/v3/identityCard/*）接口。
///
/// `add` / `list` 使用 [dynamic]：成功为裸数据，失败可能带 `{errcode}`；
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class IdentityCardApi {
  factory IdentityCardApi(Dio dio, {String? baseUrl}) = _IdentityCardApi;

  @POST('/v3/identityCard/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('cardNumber') required String cardNumber,
    @Field('cardName') String? cardName,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('cardType') int? cardType,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('addType') required int addType,
  });

  @POST('/v3/identityCard/addForReversedCardNumber')
  @FormUrlEncoded()
  Future<dynamic> addForReversedCardNumber({
    @Field('lockId') required int lockId,
    @Field('cardNumber') required String cardNumber,
    @Field('cardName') String? cardName,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('cardType') int? cardType,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('addType') required int addType,
  });

  @GET('/v3/identityCard/list')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 0,
  });

  @POST('/v3/identityCard/changePeriod')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> changePeriod({
    @Field('lockId') required int lockId,
    @Field('cardId') required int cardId,
    @Field('startDate') required int startDate,
    @Field('endDate') required int endDate,
    @Field('cyclicConfig') String? cyclicConfig,
    @Field('changeType') required int changeType,
  });

  @POST('/v3/identityCard/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('cardId') required int cardId,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/identityCard/deleteByCardNumber')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> deleteByCardNumber({
    @Field('lockId') required int lockId,
    @Field('cardNumber') required String cardNumber,
    @Field('deleteType') required int deleteType,
  });

  @POST('/v3/identityCard/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/identityCard/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('lockId') required int lockId,
    @Field('cardId') required int cardId,
    @Field('cardName') required String cardName,
  });
}
