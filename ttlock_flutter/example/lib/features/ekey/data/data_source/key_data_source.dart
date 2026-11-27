import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/data_source/key_api.dart';
import 'package:ttlock_flutter_demo/features/ekey/data/model/key_dto.dart';

part 'key_data_source.g.dart';

@Riverpod(keepAlive: true)
KeyApi keyApi(Ref ref) => KeyApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class KeyDataSource extends _$KeyDataSource {
  late final KeyApi _api;

  @override
  void build() {
    _api = ref.watch(keyApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<KeyDto>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? lockAlias,
    int? groupId,
  }) => _parse(
    () => _api.list(
      pageNo: pageNo,
      pageSize: pageSize,
      lockAlias: lockAlias,
      groupId: groupId,
    ),
    (json) => OpenApiPageDto<KeyDto>.fromJson(
      json,
      (j) => KeyDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, OpenApiPageDto<KeyDto>> listByLock({
    required int lockId,
    String? searchStr,
    int? keyRight,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _parse(
    () => _api.listByLock(
      lockId: lockId,
      searchStr: searchStr,
      keyRight: keyRight,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => OpenApiPageDto<KeyDto>.fromJson(
      json,
      (j) => KeyDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, KeyDto> get({required int lockId}) =>
      _parse(() => _api.get(lockId: lockId), KeyDto.fromJson);

  TaskEither<AppException, int> send({
    required int lockId,
    required String receiverUsername,
    required String keyName,
    int? startDate,
    int? endDate,
    String? remarks,
    int? remoteEnable,
    int? keyRight,
    int? createUser,
  }) => _parse(
    () => _api.send(
      lockId: lockId,
      receiverUsername: receiverUsername,
      keyName: keyName,
      startDate: startDate,
      endDate: endDate,
      remarks: remarks,
      remoteEnable: remoteEnable,
      keyRight: keyRight,
      createUser: createUser,
    ),
    (json) => intFromDynamic(json['keyId']),
  );

  TaskEither<AppException, List<Map<String, int>>> batchSend({
    String? lockIdList,
    String? groupIdIdList,
    required String receiverUsername,
    required String keyName,
    required int startDate,
    required int endDate,
    String? remarks,
    int? remoteEnable,
    int? keyRight,
    int? createUser,
  }) => _parse(
    () => _api.batchSend(
      lockIdList: lockIdList,
      groupIdIdList: groupIdIdList,
      receiverUsername: receiverUsername,
      keyName: keyName,
      startDate: startDate,
      endDate: endDate,
      remarks: remarks,
      remoteEnable: remoteEnable,
      keyRight: keyRight,
      createUser: createUser,
    ),
    (json) {
      final rawList = json['list'];
      if (rawList is! List) return const [];
      return rawList
          .map(
            (e) => {
              'lockId': intFromDynamic((e as Map)['lockId']),
              'keyId': intFromDynamic(e['keyId']),
            },
          )
          .toList();
    },
  );

  TaskEither<AppException, OpenApiEnvelope> update({
    required int keyId,
    String? keyName,
    int? remoteEnable,
  }) => _write(
    () =>
        _api.update(keyId: keyId, keyName: keyName, remoteEnable: remoteEnable),
  );

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int keyId,
    required int startDate,
    required int endDate,
  }) => _write(
    () =>
        _api.changePeriod(keyId: keyId, startDate: startDate, endDate: endDate),
  );

  TaskEither<AppException, OpenApiEnvelope> freeze({required int keyId}) =>
      _write(() => _api.freeze(keyId: keyId));

  TaskEither<AppException, OpenApiEnvelope> unfreeze({required int keyId}) =>
      _write(() => _api.unfreeze(keyId: keyId));

  TaskEither<AppException, OpenApiEnvelope> authorize({
    required int lockId,
    required int keyId,
  }) => _write(() => _api.authorize(lockId: lockId, keyId: keyId));

  TaskEither<AppException, OpenApiEnvelope> unauthorize({
    required int lockId,
    required int keyId,
  }) => _write(() => _api.unauthorize(lockId: lockId, keyId: keyId));

  TaskEither<AppException, OpenApiEnvelope> delete({required int keyId}) =>
      _write(() => _api.delete(keyId: keyId));

  TaskEither<AppException, String> getUnlockLink({required int keyId}) =>
      _parse(
        () => _api.getUnlockLink(keyId: keyId),
        (json) => stringFromDynamic(json['link']),
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
