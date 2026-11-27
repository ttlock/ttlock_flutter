import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'door_sensor_api.g.dart';

/// 绑锁门磁与独立门磁云端接口。
///
/// 读接口使用 [dynamic] 裸数据；写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class DoorSensorApi {
  factory DoorSensorApi(Dio dio, {String? baseUrl}) = _DoorSensorApi;

  @POST('/v3/doorSensor/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('mac') required String mac,
    @Field('name') String? name,
    @Field('electricQuantity') required int electricQuantity,
    @Field('firmwareInfo') required String firmwareInfo,
    @Field('number') required String number,
  });

  @POST('/v3/doorSensor/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('doorSensorId') required int doorSensorId,
  });

  @GET('/v3/doorSensor/listRecord')
  Future<dynamic> listRecord({
    @Query('lockId') required int lockId,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
  });

  @POST('/v3/doorSensor/query')
  @FormUrlEncoded()
  Future<dynamic> query({@Field('lockId') required int lockId});

  @POST('/v3/doorSensor/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('doorSensorId') required int doorSensorId,
    @Field('name') String? name,
  });

  @POST('/v3/doorSensor/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({
    @Field('doorSensorId') required int doorSensorId,
    @Field('modelNum') String? modelNum,
    @Field('hardwareRevision') String? hardwareRevision,
    @Field('firmwareRevision') String? firmwareRevision,
  });

  @POST('/v3/doorSensor/upgradeSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upgradeSuccess({
    @Field('doorSensorId') required int doorSensorId,
  });

  @POST('/v3/standaloneDoorSensor/add')
  @FormUrlEncoded()
  Future<dynamic> standaloneAdd({
    @Field('name') required String name,
    @Field('doorSensorData') required String doorSensorData,
    @Field('wifiName') required String wifiName,
  });

  @POST('/v3/standaloneDoorSensor/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneDelete({
    @Field('doorSensorId') required int doorSensorId,
  });

  @POST('/v3/standaloneDoorSensor/list')
  @FormUrlEncoded()
  Future<dynamic> standaloneList({
    @Field('pageNo') int pageNo = 1,
    @Field('pageSize') int pageSize = 20,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/standaloneDoorSensor/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneUpdate({
    @Field('doorSensorId') required int doorSensorId,
    @Field('name') required String name,
  });

  @POST('/v3/standaloneDoorSensor/listRecord')
  @FormUrlEncoded()
  Future<dynamic> standaloneListRecord({
    @Field('doorSensorId') required int doorSensorId,
    @Field('pageNo') int pageNo = 1,
    @Field('pageSize') int pageSize = 20,
  });

  @POST('/v3/standaloneDoorSensor/addDoorSensorUser')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneAddDoorSensorUser({
    @Field('doorSensorId') required int doorSensorId,
    @Field('account') required String account,
    @Field('username') required String username,
  });

  @POST('/v3/standaloneDoorSensor/deleteDoorSensorUser')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneDeleteDoorSensorUser({
    @Field('doorSensorId') required int doorSensorId,
    @Field('id') required int id,
  });

  @POST('/v3/standaloneDoorSensor/listDoorSensorUser')
  @FormUrlEncoded()
  Future<dynamic> standaloneListDoorSensorUser({
    @Field('doorSensorId') required int doorSensorId,
    @Field('searchStr') String? searchStr,
  });

  @POST('/v3/standaloneDoorSensor/configNetwork')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneConfigNetwork({
    @Field('doorSensorId') required int doorSensorId,
    @Field('doorSensorData') required String doorSensorData,
    @Field('wifiName') required String wifiName,
  });

  @POST('/v3/standaloneDoorSensor/configAlertFlag')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneConfigAlertFlag({
    @Field('doorSensorId') required int doorSensorId,
    @Field('notCloseAlertFlag') required int notCloseAlertFlag,
    @Field('notCloseAlertSecondNum') int? notCloseAlertSecondNum,
    @Field('longTimeNotOpenAlertFlag') required int longTimeNotOpenAlertFlag,
    @Field('longTimeNotOpenDayNum') int? longTimeNotOpenDayNum,
  });

  @POST('/v3/standaloneDoorSensor/getAlertFlag')
  @FormUrlEncoded()
  Future<dynamic> standaloneGetAlertFlag({
    @Field('doorSensorId') required int doorSensorId,
  });

  @POST('/v3/standaloneDoorSensor/checkAuthOnPremise')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> standaloneCheckAuthOnPremise({
    @Field('doorSensorId') required int doorSensorId,
  });

  @POST('/v3/standaloneDoorSensor/upgradeCheckForOnPremise')
  @FormUrlEncoded()
  Future<dynamic> standaloneUpgradeCheckForOnPremise({
    @Field('doorSensorId') required int doorSensorId,
    @Field('modelNum') String? modelNum,
    @Field('hardwareRevision') String? hardwareRevision,
    @Field('firmwareRevision') String? firmwareRevision,
  });
}
