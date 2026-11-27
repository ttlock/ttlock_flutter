import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/wifi_lock_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/wifi_lock_dto.dart';

part 'wifi_lock_data_source.g.dart';

@Riverpod(keepAlive: true)
WifiLockApi wifiLockApi(Ref ref) => WifiLockApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class WifiLockDataSource extends _$WifiLockDataSource {
  late final WifiLockApi _api;

  @override
  void build() {
    _api = ref.watch(wifiLockApiProvider);
  }

  TaskEither<AppException, WifiLockDto> detail({required int lockId}) =>
      _parse(() => _api.detail(lockId: lockId), WifiLockDto.fromJson);

  TaskEither<AppException, OpenApiEnvelope> updateNetwork({
    required int lockId,
    String? networkName,
    String? wifiMac,
    int? rssi,
    bool? useStaticIp,
    String? ip,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
  }) => _write(
    () => _api.updateNetwork(
      lockId: lockId,
      networkName: networkName,
      wifiMac: wifiMac,
      rssi: rssi,
      useStaticIp: useStaticIp,
      ip: ip,
      subnetMask: subnetMask,
      defaultGateway: defaultGateway,
      preferredDns: preferredDns,
      alternateDns: alternateDns,
    ),
  );

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
