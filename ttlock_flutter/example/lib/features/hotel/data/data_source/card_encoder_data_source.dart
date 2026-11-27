import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_api.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/model/card_encoder_dto.dart';

part 'card_encoder_data_source.g.dart';

@Riverpod(keepAlive: true)
CardEncoderApi cardEncoderApi(Ref ref) =>
    CardEncoderApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class CardEncoderDataSource extends _$CardEncoderDataSource {
  late final CardEncoderApi _api;

  @override
  void build() => _api = ref.watch(cardEncoderApiProvider);

  TaskEither<AppException, String> getHotelInfo() => _parse(
    () => _api.getHotelInfo(),
    (json) => HotelInfoDto.fromJson(json).toEntity(),
  );

  TaskEither<AppException, String> getIcKey() => _parse(
    () => _api.getIcKey(),
    (json) => IcKeyDto.fromJson(json).toEntity(),
  );

  /// 读接口包装：**必须先判 `errcode` 再解析**（与 `GatewayDataSource._parse` 同构）。
  ///
  /// 若不判，`{"errcode":30008,"errmsg":"..."}`（跨站点等业务错误）会被当作正常
  /// 响应解析成空串，再经 Repository 的「空串即不可用」判成 `-29`——错误原因被
  /// 掩盖成「酒店信息不可用」，排查成本很高。
  TaskEither<AppException, T> _parse<T>(
    Future<dynamic> Function() call,
    T Function(Map<String, dynamic> json) mapper,
  ) => TaskEither.tryCatch(() async {
    final raw = await call();
    final json = Map<String, dynamic>.from(raw as Map);
    final errcode = json['errcode'];
    if (errcode is int && errcode != 0) {
      final envelope = OpenApiEnvelope.fromJson(json);
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return mapper(json);
  }, ExceptionUtils.extractAppException);
}
