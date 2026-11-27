import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_record_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_record_dto.dart';

part 'lock_record_data_source.g.dart';

@Riverpod(keepAlive: true)
LockRecordApi lockRecordApi(Ref ref) => LockRecordApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class LockRecordDataSource extends _$LockRecordDataSource {
  late final LockRecordApi _api;

  @override
  void build() {
    _api = ref.watch(lockRecordApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<LockRecordDto>> list({
    required int lockId,
    int pageNo = 1,
    int pageSize = 20,
    int? startDate,
    int? endDate,
    int? uid,
    int? recordType,
    String? searchStr,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      startDate: startDate,
      endDate: endDate,
      pageNo: pageNo,
      pageSize: pageSize,
      uid: uid,
      recordType: recordType,
      searchStr: searchStr,
    ),
    (json) => OpenApiPageDto<LockRecordDto>.fromJson(
      json,
      (j) => LockRecordDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required List<int> recordIdList,
  }) => _write(
    () => _api.delete(lockId: lockId, recordIdList: jsonEncode(recordIdList)),
  );

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> upload({
    required int lockId,
    required String records,
  }) => _write(() => _api.upload(lockId: lockId, records: records));

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
