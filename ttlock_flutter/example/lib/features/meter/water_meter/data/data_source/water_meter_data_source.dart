import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/data_source/water_meter_api.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/model/water_meter_dto.dart';

part 'water_meter_data_source.g.dart';

@Riverpod(keepAlive: true)
WaterMeterApi waterMeterApi(Ref ref) => WaterMeterApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class WaterMeterDataSource extends _$WaterMeterDataSource {
  late final WaterMeterApi _api;

  @override
  void build() {
    _api = ref.watch(waterMeterApiProvider);
  }

  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  }) => _parse(
    () => _api.add(mac: mac, name: name),
    (json) => intFromDynamic(json['waterMeterId']),
  );

  TaskEither<AppException, OpenApiEnvelope> bind({
    required String mac,
    required String name,
  }) => _write(() => _api.bind(mac: mac, name: name));

  TaskEither<AppException, OpenApiPageDto<WaterMeterDto>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => _parse(
    () => _api.list(
      pageNo: pageNo,
      pageSize: pageSize,
      groupId: groupId,
      searchStr: searchStr,
    ),
    (json) => OpenApiPageDto<WaterMeterDto>.fromJson(
      json,
      (j) => WaterMeterDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, WaterMeterDto> detail({required int waterMeterId}) =>
      _parse(
        () => _api.detail(waterMeterId: waterMeterId),
        WaterMeterDto.fromJson,
      );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int waterMeterId,
  }) => _write(() => _api.delete(waterMeterId: waterMeterId));

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int waterMeterId,
    required String name,
  }) => _write(() => _api.rename(waterMeterId: waterMeterId, name: name));

  TaskEither<AppException, OpenApiEnvelope> renameGroup({
    required int groupId,
    required String groupName,
  }) => _write(() => _api.renameGroup(groupId: groupId, groupName: groupName));

  TaskEither<AppException, OpenApiEnvelope> setGroup({
    required int groupId,
    required int waterMeterId,
  }) =>
      _write(() => _api.setGroup(groupId: groupId, waterMeterId: waterMeterId));

  TaskEither<AppException, OpenApiEnvelope> addGroup({
    required String groupName,
  }) => _write(() => _api.addGroup(groupName: groupName));

  TaskEither<AppException, List<WaterMeterGroupDto>> listGroup() =>
      _parse(_api.listGroup, _groupListFromJson);

  TaskEither<AppException, List<WaterMeterRecordDto>> listRecords({
    required int waterMeterId,
    required int dateType,
    required String dateStr,
  }) => _parse(
    () => _api.listRecords(
      waterMeterId: waterMeterId,
      dateType: dateType,
      dateStr: dateStr,
    ),
    _recordListFromJson,
  );

  TaskEither<AppException, OpenApiPageDto<WaterMeterOperationRecordDto>>
  listOperationRecords({
    required int waterMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
    String? searchStr,
  }) => _parse(
    () => _api.listOperationRecords(
      waterMeterId: waterMeterId,
      pageNo: pageNo,
      pageSize: pageSize,
      recordType: recordType,
      searchStr: searchStr,
    ),
    (json) => OpenApiPageDto<WaterMeterOperationRecordDto>.fromJson(
      json,
      (j) => WaterMeterOperationRecordDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, List<WaterMeterTaskDto>> listTask({
    required int waterMeterId,
    int? usedFlag,
  }) => _parse(
    () => _api.listTask(waterMeterId: waterMeterId, usedFlag: usedFlag),
    _taskListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> addTask({
    required int waterMeterId,
    required int taskType,
    double? rechargeAmount,
    double? rechargeM3,
    double? remainderM3,
  }) => _write(
    () => _api.addTask(
      waterMeterId: waterMeterId,
      taskType: taskType,
      rechargeAmount: rechargeAmount,
      rechargeM3: rechargeM3,
      remainderM3: remainderM3,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> cancelTask({
    required int waterMeterId,
    required int id,
  }) => _write(() => _api.cancelTask(waterMeterId: waterMeterId, id: id));

  TaskEither<AppException, OpenApiEnvelope> finishTask({
    required int waterMeterId,
    required int id,
  }) => _write(() => _api.finishTask(waterMeterId: waterMeterId, id: id));

  TaskEither<AppException, OpenApiEnvelope> recharge({
    required int waterMeterId,
    required double rechargeAmount,
    required double rechargeM3,
  }) => _write(
    () => _api.recharge(
      waterMeterId: waterMeterId,
      rechargeAmount: rechargeAmount,
      rechargeM3: rechargeM3,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> controlOnOff({
    required int waterMeterId,
    required int onOff,
  }) =>
      _write(() => _api.controlOnOff(waterMeterId: waterMeterId, onOff: onOff));

  TaskEither<AppException, OpenApiEnvelope> configCatOneInfo({
    required int waterMeterId,
    required String catOneNodeId,
    required String catOneCardNumber,
    required String catOneOperator,
    required String catOneImsi,
    required int catOneRssi,
    String? catOneApn,
  }) => _write(
    () => _api.configCatOneInfo(
      waterMeterId: waterMeterId,
      catOneNodeId: catOneNodeId,
      catOneCardNumber: catOneCardNumber,
      catOneOperator: catOneOperator,
      catOneImsi: catOneImsi,
      catOneRssi: catOneRssi,
      catOneApn: catOneApn,
    ),
  );

  TaskEither<AppException, WaterMeterCatOneDetailDto> catOneDetail({
    required int waterMeterId,
  }) => _parse(
    () => _api.catOneDetail(waterMeterId: waterMeterId),
    WaterMeterCatOneDetailDto.fromJson,
  );

  TaskEither<AppException, String> createExecuteToken({
    required int waterMeterId,
    required double rechargeM3,
    required String rechargeAmount,
  }) => _parse(
    () => _api.createExecuteToken(
      waterMeterId: waterMeterId,
      rechargeM3: rechargeM3,
      rechargeAmount: rechargeAmount,
    ),
    (json) => stringFromDynamic(json['executeToken']),
  );

  TaskEither<AppException, OpenApiEnvelope> decodeBleAdvertising({
    required String mac,
    required String executeResponse,
  }) => _write(
    () => _api.decodeBleAdvertising(mac: mac, executeResponse: executeResponse),
  );

  TaskEither<AppException, List<WaterMeterGatewayDto>> gatewayList({
    required int waterMeterId,
  }) => _parse(
    () => _api.gatewayList(waterMeterId: waterMeterId),
    _gatewayListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> syncSameAdmin({
    required String mac,
    required int payMode,
    required int onOff,
    required String electricQuantity,
    required String totalM3,
    required String remainderM3,
    required int magneticInterference,
    required int waterValveMalfunction,
  }) => _write(
    () => _api.syncSameAdmin(
      mac: mac,
      payMode: payMode,
      onOff: onOff,
      electricQuantity: electricQuantity,
      totalM3: totalM3,
      remainderM3: remainderM3,
      magneticInterference: magneticInterference,
      waterValveMalfunction: waterValveMalfunction,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> syncState({
    required int waterMeterId,
  }) => _write(() => _api.syncState(waterMeterId: waterMeterId));

  TaskEither<AppException, OpenApiEnvelope> updatePrice({
    required int waterMeterId,
    required double price,
  }) =>
      _write(() => _api.updatePrice(waterMeterId: waterMeterId, price: price));

  TaskEither<AppException, OpenApiEnvelope> updatePayMode({
    required int waterMeterId,
    required int payMode,
    double? price,
  }) => _write(
    () => _api.updatePayMode(
      waterMeterId: waterMeterId,
      payMode: payMode,
      price: price,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> updateTotal({
    required int waterMeterId,
    required double totalM3,
  }) => _write(
    () => _api.updateTotal(waterMeterId: waterMeterId, totalM3: totalM3),
  );

  TaskEither<AppException, WaterMeterUpgradeCheckDto> upgradeCheck({
    required int waterMeterId,
  }) => _parse(
    () => _api.upgradeCheck(waterMeterId: waterMeterId),
    WaterMeterUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> upgradeSuccess({
    required int waterMeterId,
  }) => _write(() => _api.upgradeSuccess(waterMeterId: waterMeterId));

  TaskEither<AppException, OpenApiEnvelope> clear({
    required int waterMeterId,
  }) => _write(() => _api.clear(waterMeterId: waterMeterId));

  List<WaterMeterGroupDto> _groupListFromJson(Map<String, dynamic> json) =>
      _listFromJson(json, WaterMeterGroupDto.fromJson);

  List<WaterMeterRecordDto> _recordListFromJson(Map<String, dynamic> json) =>
      _listFromJson(json, WaterMeterRecordDto.fromJson);

  List<WaterMeterTaskDto> _taskListFromJson(Map<String, dynamic> json) =>
      _listFromJson(json, WaterMeterTaskDto.fromJson);

  List<WaterMeterGatewayDto> _gatewayListFromJson(Map<String, dynamic> json) =>
      _listFromJson(json, WaterMeterGatewayDto.fromJson);

  List<T> _listFromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map((e) => fromJson(Map<String, dynamic>.from(e as Map)))
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
