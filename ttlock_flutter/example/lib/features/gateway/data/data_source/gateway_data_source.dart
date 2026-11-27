import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/data_source/gateway_api.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/model/gateway_dto.dart';

part 'gateway_data_source.g.dart';

@Riverpod(keepAlive: true)
GatewayApi gatewayApi(Ref ref) => GatewayApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class GatewayDataSource extends _$GatewayDataSource {
  late final GatewayApi _api;

  @override
  void build() {
    _api = ref.watch(gatewayApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<GatewayDto>> list({
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 0,
  }) => _parse(
    () => _api.list(pageNo: pageNo, pageSize: pageSize, orderBy: orderBy),
    (json) => OpenApiPageDto<GatewayDto>.fromJson(
      json,
      (j) => GatewayDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, GatewayDto> detail({required int gatewayId}) =>
      _parse(() => _api.detail(gatewayId: gatewayId), GatewayDto.fromJson);

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int gatewayId,
    required String gatewayName,
  }) =>
      _write(() => _api.rename(gatewayId: gatewayId, gatewayName: gatewayName));

  TaskEither<AppException, OpenApiEnvelope> delete({required int gatewayId}) =>
      _write(() => _api.delete(gatewayId: gatewayId));

  TaskEither<AppException, OpenApiEnvelope> transfer({
    required String receiverUsername,
    required String gatewayIdList,
  }) => _write(
    () => _api.transfer(
      receiverUsername: receiverUsername,
      gatewayIdList: gatewayIdList,
    ),
  );

  TaskEither<AppException, List<GatewayByLockDto>> listByLock({
    required int lockId,
  }) => _parse(
    () => _api.listByLock(lockId: lockId),
    (json) => _listFromJson(json, GatewayByLockDto.fromJson),
  );

  TaskEither<AppException, List<GatewayLockDto>> listLock({
    required int gatewayId,
  }) => _parse(
    () => _api.listLock(gatewayId: gatewayId),
    (json) => _listFromJson(json, GatewayLockDto.fromJson),
  );

  TaskEither<AppException, List<GatewayDeviceDto>> listDevice({
    required int gatewayId,
  }) => _parse(
    () => _api.listDevice(gatewayId: gatewayId),
    (json) => _listFromJson(json, GatewayDeviceDto.fromJson),
  );

  TaskEither<AppException, int> isInitSuccess({
    required String gatewayNetMac,
  }) => _parse(
    () => _api.isInitSuccess(gatewayNetMac: gatewayNetMac),
    (json) => intFromDynamic(json['gatewayId']),
  );

  TaskEither<AppException, OpenApiEnvelope> setUpgradeMode({
    required int gatewayId,
  }) => _write(() => _api.setUpgradeMode(gatewayId: gatewayId));

  TaskEither<AppException, GatewayUpgradeCheckDto> upgradeCheck({
    required int gatewayId,
  }) => _parse(
    () => _api.upgradeCheck(gatewayId: gatewayId),
    GatewayUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, GatewayUpgradeCheckOnPremiseDto>
  upgradeCheckForOnPremise({
    required String secret,
    required String modelNum,
    required String hardwareRevision,
    required String firmwareRevision,
    int? account,
  }) => _parse(
    () => _api.upgradeCheckForOnPremise(
      secret: secret,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
      account: account,
    ),
    GatewayUpgradeCheckOnPremiseDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> uploadDetail({
    required int gatewayId,
    required String modelNum,
    required String hardwareRevision,
    required String firmwareRevision,
    required String networkName,
  }) => _write(
    () => _api.uploadDetail(
      gatewayId: gatewayId,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
      networkName: networkName,
    ),
  );

  List<T> _listFromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map((e) => fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  TaskEither<AppException, OpenApiEnvelope> _write(
    Future<OpenApiEnvelope> Function() call,
  ) => TaskEither.tryCatch(() async {
    final envelope = await call();
    if (!envelope.isOk) {
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return envelope;
  }, ExceptionUtils.extractAppException);

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
