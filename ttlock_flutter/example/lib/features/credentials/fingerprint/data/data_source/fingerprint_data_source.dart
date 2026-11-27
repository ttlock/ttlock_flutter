import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/data_source/fingerprint_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/model/fingerprint_dto.dart';

part 'fingerprint_data_source.g.dart';

@Riverpod(keepAlive: true)
FingerprintApi fingerprintApi(Ref ref) =>
    FingerprintApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class FingerprintDataSource extends _$FingerprintDataSource {
  late final FingerprintApi _api;

  @override
  void build() {
    _api = ref.watch(fingerprintApiProvider);
  }

  TaskEither<AppException, List<FingerprintDto>> list({
    required int lockId,
    String? searchStr,
    int pageNo = 1,
    int pageSize = 200,
    int orderBy = 1,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      searchStr: searchStr,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => OpenApiPageDto<FingerprintDto>.fromJson(
      json,
      (j) => FingerprintDto.fromJson(j as Map<String, dynamic>),
    ).list,
  );

  TaskEither<AppException, int> add({
    required int lockId,
    required String fingerprintNumber,
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      fingerprintNumber: fingerprintNumber,
      fingerprintType: fingerprintType.value,
      fingerprintName: fingerprintName,
      startDate: nullableDateTimeMsToJson(startDate),
      endDate: nullableDateTimeMsToJson(endDate),
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      addType: channel.value,
    ),
    (json) => intFromDynamic(json['fingerprintId']),
  );

  TaskEither<AppException, int> addByGateway({
    required int lockId,
    required String fingerprintData,
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
  }) => _parse(
    () => _api.addByGateway(
      lockId: lockId,
      fingerprintData: fingerprintData,
      fingerprintType: fingerprintType.value,
      fingerprintName: fingerprintName,
      startDate: nullableDateTimeMsToJson(startDate),
      endDate: nullableDateTimeMsToJson(endDate),
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      addType: ChannelType.gatewayWifi.value,
    ),
    (json) => intFromDynamic(json['fingerprintId']),
  );

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int lockId,
    required int fingerprintId,
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.changePeriod(
      lockId: lockId,
      fingerprintId: fingerprintId,
      startDate: startDate.millisecondsSinceEpoch,
      endDate: endDate.millisecondsSinceEpoch,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      changeType: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required int fingerprintId,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.delete(
      lockId: lockId,
      fingerprintId: fingerprintId,
      deleteType: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int lockId,
    required int fingerprintId,
    required String fingerprintName,
  }) => _write(
    () => _api.rename(
      lockId: lockId,
      fingerprintId: fingerprintId,
      fingerprintName: fingerprintName,
    ),
  );

  String? _encodeCyclicConfig(List<CyclicConfig>? cyclicConfig) {
    if (cyclicConfig == null || cyclicConfig.isEmpty) return null;
    return jsonEncode(cyclicConfig.map((e) => e.toJson()).toList());
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
