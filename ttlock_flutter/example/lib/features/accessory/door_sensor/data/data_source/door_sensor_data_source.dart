import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/data_source/door_sensor_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/model/door_sensor_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/model/standalone_door_sensor_dto.dart';

part 'door_sensor_data_source.g.dart';

@Riverpod(keepAlive: true)
DoorSensorApi doorSensorApi(Ref ref) => DoorSensorApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class DoorSensorDataSource extends _$DoorSensorDataSource {
  late final DoorSensorApi _api;

  @override
  void build() {
    _api = ref.watch(doorSensorApiProvider);
  }

  TaskEither<AppException, int> add({
    required int lockId,
    required String mac,
    String? name,
    required int electricQuantity,
    required String firmwareInfo,
    required String number,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      mac: mac,
      name: name,
      electricQuantity: electricQuantity,
      firmwareInfo: firmwareInfo,
      number: number,
    ),
    (json) => intFromDynamic(json['doorSensorId']),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int doorSensorId,
  }) => _write(() => _api.delete(doorSensorId: doorSensorId));

  TaskEither<AppException, OpenApiPageDto<DoorSensorRecordDto>> listRecord({
    required int lockId,
    int pageNo = 1,
    int pageSize = 20,
  }) => _parse(
    () => _api.listRecord(lockId: lockId, pageNo: pageNo, pageSize: pageSize),
    (json) => OpenApiPageDto<DoorSensorRecordDto>.fromJson(
      json,
      (j) => DoorSensorRecordDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, DoorSensorDto> query({required int lockId}) =>
      _parse(() => _api.query(lockId: lockId), parseDoorSensorDto);

  TaskEither<AppException, OpenApiEnvelope> update({
    required int doorSensorId,
    String? name,
  }) => _write(() => _api.update(doorSensorId: doorSensorId, name: name));

  TaskEither<AppException, DoorSensorUpgradeCheckDto> upgradeCheck({
    required int doorSensorId,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  }) => _parse(
    () => _api.upgradeCheck(
      doorSensorId: doorSensorId,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
    ),
    DoorSensorUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> upgradeSuccess({
    required int doorSensorId,
  }) => _write(() => _api.upgradeSuccess(doorSensorId: doorSensorId));

  TaskEither<AppException, int> standaloneAdd({
    required String name,
    required String doorSensorData,
    required String wifiName,
  }) => _parse(
    () => _api.standaloneAdd(
      name: name,
      doorSensorData: doorSensorData,
      wifiName: wifiName,
    ),
    (json) => intFromDynamic(json['doorSensorId']),
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneDelete({
    required int doorSensorId,
  }) => _write(() => _api.standaloneDelete(doorSensorId: doorSensorId));

  TaskEither<AppException, OpenApiPageDto<StandaloneDoorSensorDto>>
  standaloneList({int pageNo = 1, int pageSize = 20, String? searchStr}) =>
      _parse(
        () => _api.standaloneList(
          pageNo: pageNo,
          pageSize: pageSize,
          searchStr: searchStr,
        ),
        (json) => OpenApiPageDto<StandaloneDoorSensorDto>.fromJson(
          json,
          (j) => StandaloneDoorSensorDto.fromJson(j as Map<String, dynamic>),
        ),
      );

  TaskEither<AppException, OpenApiEnvelope> standaloneUpdate({
    required int doorSensorId,
    required String name,
  }) => _write(
    () => _api.standaloneUpdate(doorSensorId: doorSensorId, name: name),
  );

  TaskEither<AppException, List<StandaloneDoorSensorRecordDto>>
  standaloneListRecord({
    required int doorSensorId,
    int pageNo = 1,
    int pageSize = 20,
  }) => _parse(
    () => _api.standaloneListRecord(
      doorSensorId: doorSensorId,
      pageNo: pageNo,
      pageSize: pageSize,
    ),
    _standaloneRecordListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneAddDoorSensorUser({
    required int doorSensorId,
    required String account,
    required String username,
  }) => _write(
    () => _api.standaloneAddDoorSensorUser(
      doorSensorId: doorSensorId,
      account: account,
      username: username,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneDeleteDoorSensorUser({
    required int doorSensorId,
    required int id,
  }) => _write(
    () =>
        _api.standaloneDeleteDoorSensorUser(doorSensorId: doorSensorId, id: id),
  );

  TaskEither<AppException, List<StandaloneDoorSensorUserDto>>
  standaloneListDoorSensorUser({
    required int doorSensorId,
    String? searchStr,
  }) => _parse(
    () => _api.standaloneListDoorSensorUser(
      doorSensorId: doorSensorId,
      searchStr: searchStr,
    ),
    _standaloneUserListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneConfigNetwork({
    required int doorSensorId,
    required String doorSensorData,
    required String wifiName,
  }) => _write(
    () => _api.standaloneConfigNetwork(
      doorSensorId: doorSensorId,
      doorSensorData: doorSensorData,
      wifiName: wifiName,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneConfigAlertFlag({
    required int doorSensorId,
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  }) => _write(
    () => _api.standaloneConfigAlertFlag(
      doorSensorId: doorSensorId,
      notCloseAlertFlag: notCloseAlertFlag,
      notCloseAlertSecondNum: notCloseAlertSecondNum,
      longTimeNotOpenAlertFlag: longTimeNotOpenAlertFlag,
      longTimeNotOpenDayNum: longTimeNotOpenDayNum,
    ),
  );

  TaskEither<AppException, StandaloneDoorSensorAlertFlagDto>
  standaloneGetAlertFlag({required int doorSensorId}) => _parse(
    () => _api.standaloneGetAlertFlag(doorSensorId: doorSensorId),
    StandaloneDoorSensorAlertFlagDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> standaloneCheckAuthOnPremise({
    required int doorSensorId,
  }) => _write(
    () => _api.standaloneCheckAuthOnPremise(doorSensorId: doorSensorId),
  );

  TaskEither<AppException, DoorSensorUpgradeCheckDto>
  standaloneUpgradeCheckForOnPremise({
    required int doorSensorId,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  }) => _parse(
    () => _api.standaloneUpgradeCheckForOnPremise(
      doorSensorId: doorSensorId,
      modelNum: modelNum,
      hardwareRevision: hardwareRevision,
      firmwareRevision: firmwareRevision,
    ),
    DoorSensorUpgradeCheckDto.fromJson,
  );

  List<StandaloneDoorSensorRecordDto> _standaloneRecordListFromJson(
    Map<String, dynamic> json,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => StandaloneDoorSensorRecordDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  List<StandaloneDoorSensorUserDto> _standaloneUserListFromJson(
    Map<String, dynamic> json,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => StandaloneDoorSensorUserDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
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
