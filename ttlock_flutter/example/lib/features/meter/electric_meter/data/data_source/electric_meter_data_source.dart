import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/data_source/electric_meter_api.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/model/electric_meter_dto.dart';

part 'electric_meter_data_source.g.dart';

@Riverpod(keepAlive: true)
ElectricMeterApi electricMeterApi(Ref ref) =>
    ElectricMeterApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class ElectricMeterDataSource extends _$ElectricMeterDataSource {
  late final ElectricMeterApi _api;

  @override
  void build() {
    _api = ref.watch(electricMeterApiProvider);
  }

  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  }) => _parse(
    () => _api.add(mac: mac, name: name),
    (json) => intFromDynamic(json['electricMeterId']),
  );

  TaskEither<AppException, OpenApiEnvelope> bind({
    required String mac,
    required String name,
  }) => _write(() => _api.bind(mac: mac, name: name));

  TaskEither<AppException, OpenApiPageDto<ElectricMeterDto>> list({
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
    (json) => OpenApiPageDto<ElectricMeterDto>.fromJson(
      json,
      (j) => ElectricMeterDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, ElectricMeterDto> detail({
    required int electricMeterId,
  }) => _parse(
    () => _api.detail(electricMeterId: electricMeterId),
    ElectricMeterDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int electricMeterId,
    required String name,
  }) => _write(() => _api.rename(electricMeterId: electricMeterId, name: name));

  TaskEither<AppException, OpenApiEnvelope> renameGroup({
    required int groupId,
    required String groupName,
  }) => _write(() => _api.renameGroup(groupId: groupId, groupName: groupName));

  TaskEither<AppException, OpenApiEnvelope> setGroup({
    required int electricMeterId,
    required int groupId,
  }) => _write(
    () => _api.setGroup(electricMeterId: electricMeterId, groupId: groupId),
  );

  TaskEither<AppException, OpenApiEnvelope> addGroup({
    required String groupName,
  }) => _write(() => _api.addGroup(groupName: groupName));

  TaskEither<AppException, List<ElectricMeterGroupDto>> listGroup() =>
      _parse(() => _api.listGroup(), _groupListFromJson);

  TaskEither<AppException, OpenApiEnvelope> deleteGroup({
    required int groupId,
  }) => _write(() => _api.deleteGroup(groupId: groupId));

  TaskEither<AppException, List<ElectricMeterUsageRecordDto>> listRecords({
    required int electricMeterId,
    required int dateType,
    required String dateStr,
  }) => _parse(
    () => _api.listRecords(
      electricMeterId: electricMeterId,
      dateType: dateType,
      dateStr: dateStr,
    ),
    _usageRecordListFromJson,
  );

  TaskEither<AppException, OpenApiPageDto<ElectricMeterOperationRecordDto>>
  listOperationRecords({
    required int electricMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
    String? searchStr,
  }) => _parse(
    () => _api.listOperationRecords(
      electricMeterId: electricMeterId,
      pageNo: pageNo,
      pageSize: pageSize,
      recordType: recordType,
      searchStr: searchStr,
    ),
    (json) => OpenApiPageDto<ElectricMeterOperationRecordDto>.fromJson(
      json,
      (j) =>
          ElectricMeterOperationRecordDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, List<ElectricMeterTaskDto>> listTask({
    required int electricMeterId,
    int? usedFlag,
  }) => _parse(
    () => _api.listTask(electricMeterId: electricMeterId, usedFlag: usedFlag),
    _taskListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> addTask({
    required int electricMeterId,
    required int taskType,
    double? rechargeAmount,
    double? rechargeKwh,
    double? remainderKwh,
  }) => _write(
    () => _api.addTask(
      electricMeterId: electricMeterId,
      taskType: taskType,
      rechargeAmount: rechargeAmount,
      rechargeKwh: rechargeKwh,
      remainderKwh: remainderKwh,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> cancelTask({
    required int electricMeterId,
    required int taskId,
  }) => _write(
    () => _api.cancelTask(electricMeterId: electricMeterId, taskId: taskId),
  );

  TaskEither<AppException, OpenApiEnvelope> finishTask({
    required int electricMeterId,
    required int taskId,
  }) => _write(
    () => _api.finishTask(electricMeterId: electricMeterId, taskId: taskId),
  );

  TaskEither<AppException, OpenApiEnvelope> recharge({
    required int electricMeterId,
    required double rechargeAmount,
    required double rechargeKwh,
  }) => _write(
    () => _api.recharge(
      electricMeterId: electricMeterId,
      rechargeAmount: rechargeAmount,
      rechargeKwh: rechargeKwh,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> controlOnOff({
    required int electricMeterId,
    required int onOff,
  }) => _write(
    () => _api.controlOnOff(electricMeterId: electricMeterId, onOff: onOff),
  );

  TaskEither<AppException, OpenApiEnvelope> configCatOneInfo({
    required int electricMeterId,
    required String catOneNodeId,
    required String catOneCardNumber,
    required String catOneOperator,
    required String catOneImsi,
    required int catOneRssi,
    String? catOneApn,
  }) => _write(
    () => _api.configCatOneInfo(
      electricMeterId: electricMeterId,
      catOneNodeId: catOneNodeId,
      catOneCardNumber: catOneCardNumber,
      catOneOperator: catOneOperator,
      catOneImsi: catOneImsi,
      catOneRssi: catOneRssi,
      catOneApn: catOneApn,
    ),
  );

  TaskEither<AppException, ElectricMeterCatOneDetailDto> catOneDetail({
    required int electricMeterId,
  }) => _parse(
    () => _api.catOneDetail(electricMeterId: electricMeterId),
    ElectricMeterCatOneDetailDto.fromJson,
  );

  TaskEither<AppException, ElectricMeterExecuteTokenDto> createExecuteToken({
    required int electricMeterId,
    required double rechargeKwh,
    required String rechargeAmount,
  }) => _parse(
    () => _api.createExecuteToken(
      electricMeterId: electricMeterId,
      rechargeKwh: rechargeKwh,
      rechargeAmount: rechargeAmount,
    ),
    ElectricMeterExecuteTokenDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> decodeBleAdvertising({
    required String mac,
    required String executeResponse,
  }) => _write(
    () => _api.decodeBleAdvertising(mac: mac, executeResponse: executeResponse),
  );

  TaskEither<AppException, List<ElectricMeterGatewayDto>> gatewayList({
    required int electricMeterId,
  }) => _parse(
    () => _api.gatewayList(electricMeterId: electricMeterId),
    _gatewayListFromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> syncSameAdmin({
    required String mac,
    required int payMode,
    required int onOff,
    required String voltage,
    required String electricCurrent,
    required String totalKwh,
    required String maxPower,
    required String remainderKwh,
  }) => _write(
    () => _api.syncSameAdmin(
      mac: mac,
      payMode: payMode,
      onOff: onOff,
      voltage: voltage,
      electricCurrent: electricCurrent,
      totalKwh: totalKwh,
      maxPower: maxPower,
      remainderKwh: remainderKwh,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> syncState({
    required int electricMeterId,
  }) => _write(() => _api.syncState(electricMeterId: electricMeterId));

  TaskEither<AppException, OpenApiEnvelope> updatePrice({
    required int electricMeterId,
    required double price,
  }) => _write(
    () => _api.updatePrice(electricMeterId: electricMeterId, price: price),
  );

  TaskEither<AppException, OpenApiEnvelope> updatePayMode({
    required int electricMeterId,
    required int payMode,
    double? price,
  }) => _write(
    () => _api.updatePayMode(
      electricMeterId: electricMeterId,
      payMode: payMode,
      price: price,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> updateTotal({
    required int electricMeterId,
    required double totalKwh,
  }) => _write(
    () =>
        _api.updateTotal(electricMeterId: electricMeterId, totalKwh: totalKwh),
  );

  TaskEither<AppException, OpenApiEnvelope> updateMaxPower({
    required int electricMeterId,
    required int maxPower,
  }) => _write(
    () => _api.updateMaxPower(
      electricMeterId: electricMeterId,
      maxPower: maxPower,
    ),
  );

  TaskEither<AppException, ElectricMeterUpgradeCheckDto> upgradeCheck({
    required int electricMeterId,
  }) => _parse(
    () => _api.upgradeCheck(electricMeterId: electricMeterId),
    ElectricMeterUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> upgradeSuccess({
    required int electricMeterId,
  }) => _write(() => _api.upgradeSuccess(electricMeterId: electricMeterId));

  TaskEither<AppException, OpenApiEnvelope> clear({
    required int electricMeterId,
  }) => _write(() => _api.clear(electricMeterId: electricMeterId));

  List<ElectricMeterGroupDto> _groupListFromJson(Map<String, dynamic> json) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => ElectricMeterGroupDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  List<ElectricMeterUsageRecordDto> _usageRecordListFromJson(
    Map<String, dynamic> json,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => ElectricMeterUsageRecordDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  List<ElectricMeterTaskDto> _taskListFromJson(Map<String, dynamic> json) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => ElectricMeterTaskDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  List<ElectricMeterGatewayDto> _gatewayListFromJson(
    Map<String, dynamic> json,
  ) {
    final rawList = json['list'];
    if (rawList is! List) return const [];
    return rawList
        .map(
          (e) => ElectricMeterGatewayDto.fromJson(
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
