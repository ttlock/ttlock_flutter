import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/data_source/keyboard_pwd_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/model/keyboard_pwd_dto.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

part 'keyboard_pwd_data_source.g.dart';

@Riverpod(keepAlive: true)
KeyboardPwdApi keyboardPwdApi(Ref ref) =>
    KeyboardPwdApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class KeyboardPwdDataSource extends _$KeyboardPwdDataSource {
  late final KeyboardPwdApi _api;

  @override
  void build() {
    _api = ref.watch(keyboardPwdApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<KeyboardPwdDto>> list({
    required int lockId,
    String? searchStr,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      searchStr: searchStr,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => OpenApiPageDto<KeyboardPwdDto>.fromJson(
      json,
      (j) => KeyboardPwdDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, int> add({
    required int lockId,
    required String keyboardPwd,
    String? keyboardPwdName,
    KeyboardPwdType keyboardPwdType = KeyboardPwdType.limited,
    DateTime? startDate,
    DateTime? endDate,
    required ChannelType addType,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      keyboardPwd: keyboardPwd,
      keyboardPwdName: keyboardPwdName,
      keyboardPwdType: keyboardPwdType.value,
      startDate: startDate?.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
      addType: addType.value,
    ),
    (json) => intFromDynamic(json['keyboardPwdId']),
  );

  TaskEither<AppException, Map<String, dynamic>> getRandom({
    required int lockId,
    required KeyboardPwdType keyboardPwdType,
    String? keyboardPwdName,
    required DateTime startDate,
    DateTime? endDate,
  }) => _parse(
    () => _api.getRandom(
      lockId: lockId,
      keyboardPwdType: keyboardPwdType.value,
      keyboardPwdName: keyboardPwdName,
      startDate: startDate.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
    ),
    (json) => json,
  );

  TaskEither<AppException, OpenApiEnvelope> change({
    required int lockId,
    required int keyboardPwdId,
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? startDate,
    DateTime? endDate,
    required ChannelType changeType,
  }) => _write(
    () => _api.change(
      lockId: lockId,
      keyboardPwdId: keyboardPwdId,
      keyboardPwdName: keyboardPwdName,
      newKeyboardPwd: newKeyboardPwd,
      startDate: startDate?.millisecondsSinceEpoch,
      endDate: endDate?.millisecondsSinceEpoch,
      changeType: changeType.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required int keyboardPwdId,
    required ChannelType deleteType,
  }) => _write(
    () => _api.delete(
      lockId: lockId,
      keyboardPwdId: keyboardPwdId,
      deleteType: deleteType.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> deleteByCode({
    required int lockId,
    required String keyboardPwd,
    required ChannelType deleteType,
  }) => _write(
    () => _api.deleteByCode(
      lockId: lockId,
      keyboardPwd: keyboardPwd,
      deleteType: deleteType.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> uploadValidCodeFromLock({
    required int lockId,
    required String keyboardPwdList,
  }) => _write(
    () => _api.uploadValidCodeFromLock(
      lockId: lockId,
      keyboardPwdList: keyboardPwdList,
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
