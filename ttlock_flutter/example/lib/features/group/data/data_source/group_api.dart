import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'group_api.g.dart';

/// 分组接口。
///
/// `add` / `list` / `listWithLockNum` 使用 [dynamic]：成功为裸数据，
/// 失败可能带 `{errcode}`；由 DataSource 先判 errcode 再解析。
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class GroupApi {
  factory GroupApi(Dio dio, {String? baseUrl}) = _GroupApi;

  @POST('/v3/group/add')
  @FormUrlEncoded()
  Future<dynamic> add({@Field('name') required String name});

  @GET('/v3/group/list')
  Future<dynamic> list({@Query('orderBy') int orderBy = 0});

  @POST('/v3/group/update')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> update({
    @Field('groupId') required int groupId,
    @Field('name') required String name,
  });

  @POST('/v3/group/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({@Field('groupId') required int groupId});

  @GET('/v3/group/listWithLockNum')
  Future<dynamic> listWithLockNum({@Query('keyRight') int? keyRight});

  @POST('/v3/group/setDeviceGroup')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setDeviceGroup({
    @Field('deviceType') required int deviceType,
    @Field('deviceId') required int deviceId,
    @Field('groupId') required int groupId,
  });
}
