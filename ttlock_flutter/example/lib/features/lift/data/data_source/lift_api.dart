import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'lift_api.g.dart';

/// 梯控接口（写接口返回 [OpenApiEnvelope]）。
@RestApi()
abstract class LiftApi {
  factory LiftApi(Dio dio, {String? baseUrl}) = _LiftApi;

  @POST('/v3/lift/activateFloors')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> activateFloors({
    @Field('lockId') required int lockId,
    @Field('floorList') required String floorList,
  });
}
