import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/data_source/qr_code_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/model/qr_code_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

part 'qr_code_data_source.g.dart';

@Riverpod(keepAlive: true)
QrCodeApi qrCodeApi(Ref ref) => QrCodeApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class QrCodeDataSource extends _$QrCodeDataSource {
  late final QrCodeApi _api;

  @override
  void build() {
    _api = ref.watch(qrCodeApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<QrCodeDto>> list({
    required int lockId,
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      pageNo: pageNo,
      pageSize: pageSize,
      name: name,
    ),
    (json) => OpenApiPageDto<QrCodeDto>.fromJson(
      json,
      (j) => QrCodeDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, QrCodeEntity> add({
    required int lockId,
    String? qrCodeName,
    String? qrCodeNumber,
    DateTime? startDate,
    DateTime? endDate,
    QrCodeType type = QrCodeType.limited,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      name: qrCodeName,
      type: type.value,
      addType: channel.value,
      startDate: startDate?.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      qrCodeNumber: qrCodeNumber,
    ),
    (json) => QrCodeDto.fromJson(json).toEntity(),
  );

  TaskEither<AppException, OpenApiEnvelope> update({
    required int qrCodeId,
    required QrCodeType type,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _write(
    () => _api.update(
      qrCodeId: qrCodeId,
      type: type.value,
      changeType: channel.value,
      name: name,
      startDate: startDate?.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
    ),
  );

  TaskEither<AppException, QrCodeEntity> getData({required int qrCodeId}) =>
      _parse(
        () => _api.getData(qrCodeId: qrCodeId),
        (json) => QrCodeDto.fromJson(json).toEntity(),
      );

  String? _encodeCyclicConfig(List<CyclicConfig>? configs) {
    if (configs == null || configs.isEmpty) return null;
    return jsonEncode(configs.map((e) => e.toJson()).toList());
  }

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required int qrCodeId,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _write(
    () => _api.delete(
      lockId: lockId,
      qrCodeId: qrCodeId,
      deleteType: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> clear({
    required int lockId,
    ChannelType channel = ChannelType.cloudOnly,
  }) => _write(() => _api.clear(lockId: lockId, type: channel.value));

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
