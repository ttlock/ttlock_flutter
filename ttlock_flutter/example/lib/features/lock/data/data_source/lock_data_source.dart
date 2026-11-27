import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_dto.dart';

part 'lock_data_source.g.dart';

@Riverpod(keepAlive: true)
LockApi lockApi(Ref ref) => LockApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class LockDataSource extends _$LockDataSource {
  late final LockApi _api;

  @override
  void build() {
    _api = ref.watch(lockApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<LockDto>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => TaskEither.tryCatch(() async {
    final raw = await _api.list(
      pageNo: pageNo,
      pageSize: pageSize,
      groupId: groupId,
    );
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
    return OpenApiPageDto<LockDto>.fromJson(
      json,
      (j) => LockDto.fromJson(j as Map<String, dynamic>),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, LockDto> detail({required int lockId}) =>
      TaskEither.tryCatch(() async {
        final raw = await _api.detail(lockId: lockId);
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
        return LockDto.fromJson(json);
      }, ExceptionUtils.extractAppException);

  TaskEither<AppException, LockInitializeDto> initialize({
    required String lockData,
    String? lockAlias,
    int? groupId,
  }) => TaskEither.tryCatch(() async {
    final raw = await _api.initialize(
      lockData: lockData,
      lockAlias: lockAlias,
      groupId: groupId,
    );
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
    return LockInitializeDto.fromJson(json);
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int lockId,
    required String lockAlias,
  }) => _write(() => _api.rename(lockId: lockId, lockAlias: lockAlias));

  TaskEither<AppException, OpenApiEnvelope> delete({required int lockId}) =>
      _write(() => _api.delete(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> unlock({required int lockId}) =>
      _write(() => _api.unlock(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> lock({required int lockId}) =>
      _write(() => _api.lock(lockId: lockId));

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
}
