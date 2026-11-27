import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/data_source/remote_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/model/remote_dto.dart';

part 'remote_data_source.g.dart';

const _defaultFirmwareInfo =
    '{"modelNum":"","hardwareRevision":"","firmwareRevision":""}';

@Riverpod(keepAlive: true)
RemoteApi remoteApi(Ref ref) => RemoteApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class RemoteDataSource extends _$RemoteDataSource {
  late final RemoteApi _api;

  @override
  void build() {
    _api = ref.watch(remoteApiProvider);
  }

  TaskEither<AppException, List<RemoteDto>> listByLock({
    required int lockId,
    int orderBy = 0,
  }) => _parse(
    () => _api.listByLock(lockId: lockId, orderBy: orderBy),
    _remoteListFromJson,
  );

  TaskEither<AppException, int> add({
    required int lockId,
    required String mac,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    String? number,
    int electricQuantity = 100,
    String firmwareInfo = _defaultFirmwareInfo,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      number: number ?? mac,
      mac: mac,
      name: name,
      startDate: (startDate ?? DateTime.fromMillisecondsSinceEpoch(0))
          .millisecondsSinceEpoch,
      endDate: (endDate ?? DateTime.fromMillisecondsSinceEpoch(0))
          .millisecondsSinceEpoch,
      electricQuantity: electricQuantity,
      firmwareInfo: firmwareInfo,
      type: type == CredentialType.normal ? null : type.value,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
    ),
    (json) => intFromDynamic(json['remoteId']),
  );

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int remoteId,
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.update(
      remoteId: remoteId,
      startDate: startDate.millisecondsSinceEpoch,
      endDate: endDate.millisecondsSinceEpoch,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      type: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> update({
    required int remoteId,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
  }) => _write(
    () => _api.update(
      remoteId: remoteId,
      name: name,
      startDate: startDate?.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({required int remoteId}) =>
      _write(() => _api.delete(remoteId: remoteId));

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  String? _encodeCyclicConfig(List<CyclicConfig>? cyclicConfig) {
    if (cyclicConfig == null || cyclicConfig.isEmpty) return null;
    return jsonEncode(cyclicConfig.map((e) => e.toJson()).toList());
  }

  List<RemoteDto> _remoteListFromJson(Map<String, dynamic> json) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map((e) => RemoteDto.fromJson(Map<String, dynamic>.from(e as Map)))
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
