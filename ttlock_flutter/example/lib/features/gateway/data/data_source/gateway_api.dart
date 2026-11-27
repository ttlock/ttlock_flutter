import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'gateway_api.g.dart';

/// 网关接口。
///
/// 读接口使用 [dynamic]：成功为裸数据，失败可能带 `{errcode}`；由 DataSource 先判 errcode 再解析。
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class GatewayApi {
  factory GatewayApi(Dio dio, {String? baseUrl}) = _GatewayApi;

  @GET('/v3/gateway/list')
  Future<dynamic> list({
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 0,
  });

  @GET('/v3/gateway/detail')
  Future<dynamic> detail({@Query('gatewayId') required int gatewayId});

  @POST('/v3/gateway/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({@Field('gatewayId') required int gatewayId});

  @POST('/v3/gateway/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('gatewayId') required int gatewayId,
    @Field('gatewayName') required String gatewayName,
  });

  @POST('/v3/gateway/transfer')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> transfer({
    @Field('receiverUsername') required String receiverUsername,
    @Field('gatewayIdList') required String gatewayIdList,
  });

  @GET('/v3/gateway/listByLock')
  Future<dynamic> listByLock({@Query('lockId') required int lockId});

  @GET('/v3/gateway/listLock')
  Future<dynamic> listLock({@Query('gatewayId') required int gatewayId});

  @GET('/v3/gateway/listDevice')
  Future<dynamic> listDevice({@Query('gatewayId') required int gatewayId});

  /// 查询网关是否已在云端注册。
  ///
  /// [gatewayNetMac] 按开放平台文档传「网关网络 MAC **或** 添加网关时自定义的
  /// 网关名称」：若 APP SDK init 时未以 netMac 作为 gatewayName，则必须传该自定义
  /// 名称，否则云端查不到记录。
  @POST('/v3/gateway/isInitSuccess')
  @FormUrlEncoded()
  Future<dynamic> isInitSuccess({
    @Field('gatewayNetMac') required String gatewayNetMac,
  });

  @POST('/v3/gateway/setUpgradeMode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setUpgradeMode({
    @Field('gatewayId') required int gatewayId,
  });

  @GET('/v3/gateway/upgradeCheck')
  Future<dynamic> upgradeCheck({@Query('gatewayId') required int gatewayId});

  @POST('/v3/gateway/upgradeCheckForOnPremise')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheckForOnPremise({
    @Field('secret') required String secret,
    @Field('modelNum') required String modelNum,
    @Field('hardwareRevision') required String hardwareRevision,
    @Field('firmwareRevision') required String firmwareRevision,
    @Field('account') int? account,
  });

  @POST('/v3/gateway/uploadDetail')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> uploadDetail({
    @Field('gatewayId') required int gatewayId,
    @Field('modelNum') required String modelNum,
    @Field('hardwareRevision') required String hardwareRevision,
    @Field('firmwareRevision') required String firmwareRevision,
    @Field('networkName') required String networkName,
  });
}
