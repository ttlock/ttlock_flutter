import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'card_encoder_api.g.dart';

/// 酒店发卡器对接接口（`/v3/cardEncoder/*`）。
///
/// 两个接口都用 `dynamic` 承接响应，由 DataSource 先判 `errcode` 再解析
/// ——与仓库其他域一致（读接口直接返回数据体，无统一信封）。
@RestApi()
abstract class CardEncoderApi {
  factory CardEncoderApi(Dio dio, {String? baseUrl}) = _CardEncoderApi;

  @GET('/v3/cardEncoder/getHotelInfo')
  Future<dynamic> getHotelInfo();

  @GET('/v3/cardEncoder/getIcKey')
  Future<dynamic> getIcKey();
}
