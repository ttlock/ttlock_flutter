import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/group/data/data_source/group_api.dart';
import 'package:ttlock_flutter_demo/features/group/data/model/group_dto.dart';

part 'group_data_source.g.dart';

@Riverpod(keepAlive: true)
GroupApi groupApi(Ref ref) => GroupApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class GroupDataSource extends _$GroupDataSource {
  late final GroupApi _api;

  @override
  void build() {
    _api = ref.watch(groupApiProvider);
  }

  TaskEither<AppException, int> add({required String name}) => _parse(
    () => _api.add(name: name),
    (json) => intFromDynamic(json['groupId']),
  );

  TaskEither<AppException, List<GroupDto>> list({int orderBy = 0}) =>
      _parse(() => _api.list(orderBy: orderBy), _groupListFromJson);

  TaskEither<AppException, OpenApiEnvelope> update({
    required int groupId,
    required String name,
  }) => _write(() => _api.update(groupId: groupId, name: name));

  TaskEither<AppException, OpenApiEnvelope> delete({required int groupId}) =>
      _write(() => _api.delete(groupId: groupId));

  TaskEither<AppException, List<GroupDto>> listWithLockNum({int? keyRight}) =>
      _parse(
        () => _api.listWithLockNum(keyRight: keyRight),
        _groupListFromJson,
      );

  TaskEither<AppException, OpenApiEnvelope> setDeviceGroup({
    required int deviceType,
    required int deviceId,
    required int groupId,
  }) => _write(
    () => _api.setDeviceGroup(
      deviceType: deviceType,
      deviceId: deviceId,
      groupId: groupId,
    ),
  );

  List<GroupDto> _groupListFromJson(Map<String, dynamic> json) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map((e) => GroupDto.fromJson(Map<String, dynamic>.from(e as Map)))
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
