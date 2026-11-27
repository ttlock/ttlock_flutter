import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';

part 'wireless_keypad_api.g.dart';

/// 无线键盘云端接口。
///
/// `add` / `listByLock` / `listSlot` / `upgradeCheck` 使用 [dynamic]：成功为裸数据，
/// 失败可能带 `{errcode}`；由 DataSource 先判 errcode 再解析。
/// 写接口返回 [OpenApiEnvelope]。
@RestApi()
abstract class WirelessKeypadApi {
  factory WirelessKeypadApi(Dio dio, {String? baseUrl}) = _WirelessKeypadApi;

  @POST('/v3/wirelessKeypad/add')
  @FormUrlEncoded()
  Future<dynamic> add({
    @Field('lockId') required int lockId,
    @Field('wirelessKeypadNumber') required String wirelessKeypadNumber,
    @Field('wirelessKeypadName') required String wirelessKeypadName,
    @Field('wirelessKeypadMac') required String wirelessKeypadMac,
    @Field('wirelessKeypadFeatureValue')
    required String wirelessKeypadFeatureValue,
    @Field('electricQuantity') int? electricQuantity,

    /// 键盘类型：1-多功能，2-普通（云端默认 2）。
    @Field('hasSlot') int? hasSlot,

    /// 槽位编号，`hasSlot == 1` 时**必填**。
    @Field('slotNumber') int? slotNumber,

    /// 多功能键盘可绑定锁的数量上限。
    @Field('slotLimit') int? slotLimit,

    /// 型号 / 硬件版本 / 固件版本，云端用于固件升级检测。
    @Field('modelNum') String? modelNum,
    @Field('hardwareRevision') String? hardwareRevision,
    @Field('firmwareRevision') String? firmwareRevision,
  });

  @POST('/v3/wirelessKeypad/delete')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> delete({
    @Field('wirelessKeypadId') required int wirelessKeypadId,

    /// 多功能键盘必填：**仅解绑该槽位**；不传表示删除整个（普通）键盘。
    @Field('slotNumber') int? slotNumber,
  });

  /// [hasSlot]：0-全部（默认），1-仅多功能，2-仅普通。
  @GET('/v3/wirelessKeypad/listByLock')
  Future<dynamic> listByLock({
    @Query('lockId') required int lockId,
    @Query('hasSlot') int? hasSlot,
  });

  /// 多功能键盘的全部槽位及其绑定的锁（按 slotNumber 升序，含未绑定槽位）。
  @GET('/v3/wirelessKeypad/listSlot')
  Future<dynamic> listSlot({
    @Query('wirelessKeypadId') required int wirelessKeypadId,
  });

  @POST('/v3/wirelessKeypad/rename')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> rename({
    @Field('wirelessKeypadId') required int wirelessKeypadId,
    @Field('wirelessKeypadName') required String wirelessKeypadName,

    /// 多功能键盘必填：重命名的是**当前锁槽位**上的键盘名称。
    @Field('slotNumber') int? slotNumber,
  });

  @POST('/v3/wirelessKeypad/upgradeCheck')
  @FormUrlEncoded()
  Future<dynamic> upgradeCheck({
    @Field('wirelessKeypadId') required int wirelessKeypadId,
    @Field('slotNumber') required int slotNumber,
  });

  @POST('/v3/wirelessKeypad/upgradeSuccess')
  @FormUrlEncoded()
  Future<OpenApiEnvelope> upgradeSuccess({
    @Field('wirelessKeypadId') required int wirelessKeypadId,
    @Field('slotNumber') required int slotNumber,
    @Field('featureValue') String? featureValue,
  });
}
