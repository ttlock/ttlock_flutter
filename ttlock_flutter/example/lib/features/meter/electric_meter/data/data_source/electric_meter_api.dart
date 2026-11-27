import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'electric_meter_api.g.dart';

/// 电表 admin 侧接口（/v3/electricMeter/*）。
@RestApi()
abstract class ElectricMeterApi {
  factory ElectricMeterApi(Dio dio, {String? baseUrl}) = _ElectricMeterApi;

  @POST('/v3/electricMeter/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('mac') required String mac,
    @Field('name') required String name,
  });

  @POST('/v3/electricMeter/bind')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> bind({
    @Field('mac') required String mac,
    @Field('name') required String name,
  });

  @POST('/v3/electricMeter/list')
  @FormUrlEncoded()
  Future<dynamic> list({
    @Field('pageNo') required int pageNo,
    @Field('pageSize') required int pageSize,
    @Field('groupId') int? groupId,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/electricMeter/detail')
  @FormUrlEncoded()
  Future<dynamic> detail({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('electricMeterId') required int electricMeterId,
    @Field('name') required String name,
  });

  @POST('/v3/electricMeter/renameGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> renameGroup({
    @Field('groupId') required int groupId,
    @Field('groupName') required String groupName,
  });

  @POST('/v3/electricMeter/setGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setGroup({
    @Field('electricMeterId') required int electricMeterId,
    @Field('groupId') required int groupId,
  });

  @POST('/v3/electricMeter/addGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> addGroup({
    @Field('groupName') required String groupName,
  });

  @POST('/v3/electricMeter/listGroup')
  @FormUrlEncoded()
  Future<dynamic> listGroup();

  @POST('/v3/electricMeter/deleteGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> deleteGroup({@Field('groupId') required int groupId});

  @POST('/v3/electricMeter/listRecords')
  @FormUrlEncoded()
  Future<dynamic> listRecords({
    @Field('electricMeterId') required int electricMeterId,
    @Field('dateType') required int dateType,
    @Field('dateStr') required String dateStr,
  });

  @POST('/v3/electricMeter/listOperationRecords')
  @FormUrlEncoded()
  Future<dynamic> listOperationRecords({
    @Field('electricMeterId') required int electricMeterId,
    @Field('pageNo') required int pageNo,
    @Field('pageSize') required int pageSize,
    @Field('recordType') String? recordType,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/electricMeter/listTask')
  @FormUrlEncoded()
  Future<dynamic> listTask({
    @Field('electricMeterId') required int electricMeterId,
    @Field('usedFlag') int? usedFlag,
  });

  @POST('/v3/electricMeter/addTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> addTask({
    @Field('electricMeterId') required int electricMeterId,
    @Field('taskType') required int taskType,
    @Field('rechargeAmount') double? rechargeAmount,
    @Field('rechargeKwh') double? rechargeKwh,
    @Field('remainderKwh') double? remainderKwh,
  });

  @POST('/v3/electricMeter/cancelTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> cancelTask({
    @Field('electricMeterId') required int electricMeterId,
    @Field('taskId') required int taskId,
  });

  @POST('/v3/electricMeter/finishTask')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> finishTask({
    @Field('electricMeterId') required int electricMeterId,
    @Field('taskId') required int taskId,
  });

  @POST('/v3/electricMeter/recharge')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> recharge({
    @Field('electricMeterId') required int electricMeterId,
    @Field('rechargeAmount') required double rechargeAmount,
    @Field('rechargeKwh') required double rechargeKwh,
  });

  @POST('/v3/electricMeter/controlOnOff')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> controlOnOff({
    @Field('electricMeterId') required int electricMeterId,
    @Field('onOff') required int onOff,
  });

  @POST('/v3/electricMeter/configCatOneInfo')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> configCatOneInfo({
    @Field('electricMeterId') required int electricMeterId,
    @Field('catOneNodeId') required String catOneNodeId,
    @Field('catOneCardNumber') required String catOneCardNumber,
    @Field('catOneOperator') required String catOneOperator,
    @Field('catOneImsi') required String catOneImsi,
    @Field('catOneRssi') required int catOneRssi,
    @Field('catOneApn') String? catOneApn,
  });

  @POST('/v3/electricMeter/catOneDetail')
  @FormUrlEncoded()
  Future<dynamic> catOneDetail({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/createExecuteToken')
  @FormUrlEncoded()
  Future<dynamic> createExecuteToken({
    @Field('electricMeterId') required int electricMeterId,
    @Field('rechargeKwh') required double rechargeKwh,
    @Field('rechargeAmount') required String rechargeAmount,
  });

  @POST('/v3/electricMeter/decodeBleAdvertising')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> decodeBleAdvertising({
    @Field('mac') required String mac,
    @Field('executeResponse') required String executeResponse,
  });

  @POST('/v3/electricMeter/gatewayList')
  @FormUrlEncoded()
  Future<dynamic> gatewayList({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/syncSameAdmin')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> syncSameAdmin({
    @Field('mac') required String mac,
    @Field('payMode') required int payMode,
    @Field('onOff') required int onOff,
    @Field('voltage') required String voltage,
    @Field('electricCurrent') required String electricCurrent,
    @Field('totalKwh') required String totalKwh,
    @Field('maxPower') required String maxPower,
    @Field('remainderKwh') required String remainderKwh,
  });

  @POST('/v3/electricMeter/syncState')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> syncState({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/updatePrice')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updatePrice({
    @Field('electricMeterId') required int electricMeterId,
    @Field('price') required double price,
  });

  @POST('/v3/electricMeter/updatePayMode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updatePayMode({
    @Field('electricMeterId') required int electricMeterId,
    @Field('payMode') required int payMode,
    @Field('price') double? price,
  });

  @POST('/v3/electricMeter/updateTotal')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateTotal({
    @Field('electricMeterId') required int electricMeterId,
    @Field('totalKwh') required double totalKwh,
  });

  @POST('/v3/electricMeter/updateMaxPower')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateMaxPower({
    @Field('electricMeterId') required int electricMeterId,
    @Field('maxPower') required int maxPower,
  });

  @POST('/v3/electricMeter/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/upgradeSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upgradeSuccess({
    @Field('electricMeterId') required int electricMeterId,
  });

  @POST('/v3/electricMeter/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({
    @Field('electricMeterId') required int electricMeterId,
  });
}
