import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'wifi_lock_api.g.dart';

/// Wifi 锁接口。
///
/// `detail` 使用 [dynamic]：成功为裸数据，失败带 `{errcode}`。
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class WifiLockApi {
  factory WifiLockApi(Dio dio, {String? baseUrl}) = _WifiLockApi;

  @POST('/v3/wifiLock/detail')
  @FormUrlEncoded()
  Future<dynamic> detail({@Field('lockId') required int lockId});

  @POST('/v3/wifiLock/updateNetwork')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateNetwork({
    @Field('lockId') required int lockId,
    @Field('networkName') String? networkName,
    @Field('wifiMac') String? wifiMac,
    @Field('rssi') int? rssi,
    @Field('useStaticIp') bool? useStaticIp,
    @Field('ip') String? ip,
    @Field('subnetMask') String? subnetMask,
    @Field('defaultGateway') String? defaultGateway,
    @Field('preferredDns') String? preferredDns,
    @Field('alternateDns') String? alternateDns,
  });
}
