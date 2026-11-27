import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'lock_record_api.g.dart';

/// 锁操作记录接口。
///
/// 分页使用 [dynamic]，避免 retrofit_generator 9.6 对 `Map<String, dynamic>`
/// 生成非法 `dynamic.fromJson`。写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class LockRecordApi {
  factory LockRecordApi(Dio dio, {String? baseUrl}) = _LockRecordApi;

  @GET('/v3/lockRecord/list')
  Future<dynamic> list({
    @Query('lockId') required int lockId,
    @Query('startDate') int? startDate,
    @Query('endDate') int? endDate,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('uid') int? uid,
    @Query('recordType') int? recordType,
    @Query('searchStr') String? searchStr,
  });

  @POST('/v3/lockRecord/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('lockId') required int lockId,
    @Field('recordIdList') required String recordIdList,
  });

  @POST('/v3/lockRecord/clear')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> clear({@Field('lockId') required int lockId});

  @POST('/v3/lockRecord/upload')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upload({
    @Field('lockId') required int lockId,
    @Field('records') required String records,
  });
}
