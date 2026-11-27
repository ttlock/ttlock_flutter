import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'water_meter_api.g.dart';

/// 水表 admin 接口。
///
/// 读/混合体使用 [dynamic]；写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class WaterMeterApi {
  factory WaterMeterApi(Dio dio, {String? baseUrl}) = _WaterMeterApi;

  @POST('/v3/waterMeter/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('mac') required String mac,
    @Field('name') required String name,
  });

  @POST('/v3/waterMeter/bind')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> bind({
    @Field('mac') required String mac,
    @Field('name') required String name,
  });

  @POST('/v3/waterMeter/list')
  @FormUrlEncoded()
  Future<dynamic> list({
    @Field('pageNo') required int pageNo,
    @Field('pageSize') required int pageSize,
    @Field('groupId') int? groupId,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/waterMeter/detail')
  @FormUrlEncoded()
  Future<dynamic> detail({@Field('waterMeterId') required int waterMeterId});

  @POST('/v3/waterMeter/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('waterMeterId') required int waterMeterId,
    @Field('name') required String name,
  });

  @POST('/v3/waterMeter/renameGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> renameGroup({
    @Field('groupId') required int groupId,
    @Field('groupName') required String groupName,
  });

  @POST('/v3/waterMeter/setGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setGroup({
    @Field('groupId') required int groupId,
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/addGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> addGroup({
    @Field('groupName') required String groupName,
  });

  @POST('/v3/waterMeter/listGroup')
  @FormUrlEncoded()
  Future<dynamic> listGroup();

  @POST('/v3/waterMeter/listRecords')
  @FormUrlEncoded()
  Future<dynamic> listRecords({
    @Field('waterMeterId') required int waterMeterId,
    @Field('dateType') required int dateType,
    @Field('dateStr') required String dateStr,
  });

  @POST('/v3/waterMeter/listOperationRecords')
  @FormUrlEncoded()
  Future<dynamic> listOperationRecords({
    @Field('waterMeterId') required int waterMeterId,
    @Field('pageNo') required int pageNo,
    @Field('pageSize') required int pageSize,
    @Field('recordType') String? recordType,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/waterMeter/listTask')
  @FormUrlEncoded()
  Future<dynamic> listTask({
    @Field('waterMeterId') required int waterMeterId,
    @Field('usedFlag') int? usedFlag,
  });

  @POST('/v3/waterMeter/addTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> addTask({
    @Field('waterMeterId') required int waterMeterId,
    @Field('taskType') required int taskType,
    @Field('rechargeAmount') double? rechargeAmount,
    @Field('rechargeM3') double? rechargeM3,
    @Field('remainderM3') double? remainderM3,
  });

  @POST('/v3/waterMeter/cancelTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> cancelTask({
    @Field('waterMeterId') required int waterMeterId,
    @Field('id') required int id,
  });

  @POST('/v3/waterMeter/finishTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> finishTask({
    @Field('waterMeterId') required int waterMeterId,
    @Field('id') required int id,
  });

  @POST('/v3/waterMeter/recharge')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> recharge({
    @Field('waterMeterId') required int waterMeterId,
    @Field('rechargeAmount') required double rechargeAmount,
    @Field('rechargeM3') required double rechargeM3,
  });

  @POST('/v3/waterMeter/controlOnOff')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> controlOnOff({
    @Field('waterMeterId') required int waterMeterId,
    @Field('onOff') required int onOff,
  });

  @POST('/v3/waterMeter/configCatOneInfo')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> configCatOneInfo({
    @Field('waterMeterId') required int waterMeterId,
    @Field('catOneNodeId') required String catOneNodeId,
    @Field('catOneCardNumber') required String catOneCardNumber,
    @Field('catOneOperator') required String catOneOperator,
    @Field('catOneImsi') required String catOneImsi,
    @Field('catOneRssi') required int catOneRssi,
    @Field('catOneApn') String? catOneApn,
  });

  @POST('/v3/waterMeter/catOneDetail')
  @FormUrlEncoded()
  Future<dynamic> catOneDetail({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/createExecuteToken')
  @FormUrlEncoded()
  Future<dynamic> createExecuteToken({
    @Field('waterMeterId') required int waterMeterId,
    @Field('rechargeM3') required double rechargeM3,
    @Field('rechargeAmount') required String rechargeAmount,
  });

  @POST('/v3/waterMeter/decodeBleAdvertising')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> decodeBleAdvertising({
    @Field('mac') required String mac,
    @Field('executeResponse') required String executeResponse,
  });

  @POST('/v3/waterMeter/gatewayList')
  @FormUrlEncoded()
  Future<dynamic> gatewayList({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/syncSameAdmin')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> syncSameAdmin({
    @Field('mac') required String mac,
    @Field('payMode') required int payMode,
    @Field('onOff') required int onOff,
    @Field('electricQuantity') required String electricQuantity,
    @Field('totalM3') required String totalM3,
    @Field('remainderM3') required String remainderM3,
    @Field('magneticInterference') required int magneticInterference,
    @Field('waterValveMalfunction') required int waterValveMalfunction,
  });

  @POST('/v3/waterMeter/syncState')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> syncState({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/updatePrice')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updatePrice({
    @Field('waterMeterId') required int waterMeterId,
    @Field('price') required double price,
  });

  @POST('/v3/waterMeter/updatePayMode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updatePayMode({
    @Field('waterMeterId') required int waterMeterId,
    @Field('payMode') required int payMode,
    @Field('price') double? price,
  });

  @POST('/v3/waterMeter/updateTotal')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateTotal({
    @Field('waterMeterId') required int waterMeterId,
    @Field('totalM3') required double totalM3,
  });

  @POST('/v3/waterMeter/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/upgradeSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upgradeSuccess({
    @Field('waterMeterId') required int waterMeterId,
  });

  @POST('/v3/waterMeter/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({
    @Field('waterMeterId') required int waterMeterId,
  });
}
