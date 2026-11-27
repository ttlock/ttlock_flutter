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
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/data_source/palm_vein_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/model/palm_vein_dto.dart';

part 'palm_vein_data_source.g.dart';

@Riverpod(keepAlive: true)
PalmVeinApi palmVeinApi(Ref ref) => PalmVeinApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class PalmVeinDataSource extends _$PalmVeinDataSource {
  late final PalmVeinApi _api;

  @override
  void build() {
    _api = ref.watch(palmVeinApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<PalmVeinDto>> list({
    required int lockId,
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      pageNo: pageNo,
      pageSize: pageSize,
      searchStr: searchStr,
    ),
    (json) => OpenApiPageDto<PalmVeinDto>.fromJson(
      json,
      (j) => PalmVeinDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, int> add({
    required int lockId,
    required String number,
    String? name,
    required int startDate,
    required int endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig> cyclicConfig = const [],
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      number: number,
      name: name,
      startDate: startDate,
      endDate: endDate,
      type: type.value,
      cyclicConfig: cyclicConfig.isEmpty
          ? null
          : jsonEncode(cyclicConfig.map((e) => e.toJson()).toList()),
    ),
    (json) => intFromDynamic(json['id']),
  );

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int id,
    required int startDate,
    required int endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType? channel,
  }) => _write(
    () => _api.changePeriod(
      id: id,
      startDate: startDate,
      endDate: endDate,
      type: channel?.value,
      cyclicConfig: cyclicConfig == null || cyclicConfig.isEmpty
          ? null
          : jsonEncode(cyclicConfig.map((e) => e.toJson()).toList()),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int id,
    ChannelType? channel,
  }) => _write(() => _api.delete(id: id, type: channel?.value));

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int id,
    required String name,
  }) => _write(() => _api.rename(id: id, name: name));

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
