import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'lock_setting_api.g.dart';

/// lock 设置/时区/NB/升级/酒店等扩展接口。
///
/// 写接口返回 [OpenApiEnvelope]；读/混合体（成功裸数据、失败 `{errcode}`）
/// 使用 [dynamic]，由 DataSource 先判 errcode 再解析。
/// 分页同样使用 [dynamic]，避免 retrofit_generator 9.6 对 `Map<String, dynamic>`
/// 生成非法 `dynamic.fromJson`。
@RestApi()
abstract class LockSettingApi {
  factory LockSettingApi(Dio dio, {String? baseUrl}) = _LockSettingApi;

  @POST('/v3/lock/transfer')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> transfer({
    @Field('receiverUsername') required String receiverUsername,
    @Field('lockIdList') required String lockIdList,
  });

  @POST('/v3/lock/updateLockData')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateLockData({
    @Field('lockId') required int lockId,
    @Field('lockData') required String lockData,
  });

  @POST('/v3/lock/updateSetting')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateSetting({
    @Field('lockId') required int lockId,
    @Field('type') required int type,
    @Field('value') required int value,
    @Field('changeType') required int changeType,
  });

  @POST('/v3/lock/getExtraSetting')
  @FormUrlEncoded()
  Future<dynamic> getExtraSetting({
    @Field('lockId') required int lockId,
    @Field('type') required int type,
  });

  @POST('/v3/lock/querySetting')
  @FormUrlEncoded()
  Future<dynamic> querySetting({
    @Field('lockId') required int lockId,
    @Field('type') required int type,
  });

  @POST('/v3/lock/setAutoLockTime')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setAutoLockTime({
    @Field('lockId') required int lockId,
    @Field('seconds') required int seconds,
    @Field('type') required int type,
  });

  @POST('/v3/lock/configPassageMode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> configPassageMode({
    @Field('lockId') required int lockId,
    @Field('passageMode') required int passageMode,
    @Field('startDate') int? startDate,
    @Field('endDate') int? endDate,
    @Field('isAllDay') int? isAllDay,
    @Field('weekDays') String? weekDays,
    @Field('autoUnlock') int? autoUnlock,
    @Field('type') required int type,
  });

  @GET('/v3/lock/getPassageModeConfig')
  Future<dynamic> getPassageModeConfig({@Query('lockId') required int lockId});

  @POST('/v3/lock/configWorkingMode')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> configWorkingMode({
    @Field('lockId') required int lockId,
    @Field('workingMode') required int workingMode,
    @Field('type') required int type,
    @Field('cyclicConfig') String? cyclicConfig,
  });

  @POST('/v3/lock/getWorkingMode')
  @FormUrlEncoded()
  Future<dynamic> getWorkingMode({@Field('lockId') required int lockId});

  @POST('/v3/lock/changeTimezoneRawOffset')
  @FormUrlEncoded()
  Future<dynamic> changeTimezoneRawOffset({
    @Field('lockId') required int lockId,
    @Field('timezoneRawOffset') required int timezoneRawOffset,
    @Field('type') required int type,
  });

  @POST('/v3/lock/updateDate')
  @FormUrlEncoded()
  Future<dynamic> updateDate({@Field('lockId') required int lockId});

  @POST('/v3/lock/updateElectricQuantity')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateElectricQuantity({
    @Field('lockId') required int lockId,
    @Field('electricQuantity') required int electricQuantity,
  });

  @POST('/v3/lock/updateAccessoryElectricQuantity')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateAccessoryElectricQuantity({
    @Field('type') required int type,
    @Field('mac') required String mac,
    @Field('electricQuantity') required int electricQuantity,
    @Field('updateDate') required int updateDate,
  });

  @POST('/v3/lock/updateUnauthorizedAttemptAlert')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> updateUnauthorizedAttemptAlert({
    @Field('lockId') required int lockId,
    @Field('type') required int type,
    @Field('unauthorizedAttemptAlertFlag') required int flag,
    @Field('unauthorizedAttemptAlertCount') required int count,
    @Field('unauthorizedAttemptAlertLockTime') required int lockTime,
    @Field('unauthorizedAttemptAlertPwd') int? pwd,
    @Field('unauthorizedAttemptAlertCard') int? card,
    @Field('unauthorizedAttemptAlertFingerprint') int? fingerprint,
  });

  @GET('/v3/lock/queryElectricQuantity')
  Future<dynamic> queryElectricQuantity({@Query('lockId') required int lockId});

  @GET('/v3/lock/queryOpenState')
  Future<dynamic> queryOpenState({@Query('lockId') required int lockId});

  @GET('/v3/lock/queryStatus')
  Future<dynamic> queryStatus({@Query('lockId') required int lockId});

  @GET('/v3/lock/queryDate')
  Future<dynamic> queryDate({@Query('lockId') required int lockId});

  @GET('/v3/lock/listKey')
  Future<dynamic> listKey({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('keyRight') int? keyRight,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 1,
  });

  @GET('/v3/lock/listKeyboardPwd')
  Future<dynamic> listKeyboardPwd({
    @Query('lockId') required int lockId,
    @Query('searchStr') String? searchStr,
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('orderBy') int orderBy = 1,
  });

  @POST('/v3/lock/deleteAllKey')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> deleteAllKey({@Field('lockId') required int lockId});

  @POST('/v3/lock/registerNb')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> registerNb({
    @Field('lockId') required int lockId,
    @Field('nbNodeId') required String nbNodeId,
    @Field('nbCardNumber') required String nbCardNumber,
    @Field('nbOperator') required String nbOperator,
    @Field('nbRssi') required int nbRssi,
  });

  @GET('/v3/lock/getNbDeviceInfo')
  Future<dynamic> getNbDeviceInfo({@Query('lockId') required int lockId});

  @GET('/v3/lock/getNbPlatformIpAndPort')
  Future<dynamic> getNbPlatformIpAndPort();

  @POST('/v3/lock/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({@Field('lockId') required int lockId});

  @POST('/v3/lock/upgradeRecheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeRecheck({
    @Field('lockId') required int lockId,
    @Field('lockData') required String lockData,
  });

  @POST('/v3/lock/upgradeCheckForOnPremise')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheckForOnPremise({
    @Field('secret') required String secret,
    @Field('lockData') required String lockData,
    @Field('account') String? account,
  });

  @GET('/v3/lock/listByHotel')
  Future<dynamic> listByHotel({
    @Query('pageNo') int pageNo = 1,
    @Query('pageSize') int pageSize = 20,
    @Query('type') int? type,
    @Query('lockAlias') String? lockAlias,
    @Query('groupId') int? groupId,
  });

  @POST('/v3/lock/setHotelCardSector')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> setHotelCardSector({
    @Field('lockId') required int lockId,
    @Field('sector') required String sector,
  });

  @POST('/v3/lock/emergencyLock')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> emergencyLock({
    @Field('lockId') required int lockId,
    @Field('autoLockTime') required int autoLockTime,
  });

  @POST('/v3/lock/emergencyUnlock')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> emergencyUnlock({
    @Field('lockId') required int lockId,
  });

  @GET('/v3/lock/getImportData')
  Future<dynamic> getImportData({
    @Query('lockId') required int lockId,
    @Query('fromLockId') required int fromLockId,
  });

  @POST('/v3/lock/importSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> importSuccess({
    @Field('lockId') required int lockId,
    @Field('fromLockId') required int fromLockId,
    @Field('keyboardPwdIdList') String? keyboardPwdIdList,
    @Field('cardIdList') String? cardIdList,
  });
}
