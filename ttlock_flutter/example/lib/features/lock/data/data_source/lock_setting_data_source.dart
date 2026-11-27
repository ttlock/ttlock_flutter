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
import 'package:ttlock_flutter_demo/features/lock/data/data_source/lock_setting_api.dart';
import 'package:ttlock_flutter_demo/features/lock/data/model/lock_setting_dto.dart';

part 'lock_setting_data_source.g.dart';

@Riverpod(keepAlive: true)
LockSettingApi lockSettingApi(Ref ref) =>
    LockSettingApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class LockSettingDataSource extends _$LockSettingDataSource {
  late final LockSettingApi _api;

  @override
  void build() {
    _api = ref.watch(lockSettingApiProvider);
  }

  TaskEither<AppException, OpenApiEnvelope> transfer({
    required String receiverUsername,
    required List<int> lockIdList,
  }) => _write(
    () => _api.transfer(
      receiverUsername: receiverUsername,
      lockIdList: jsonEncode(lockIdList),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> updateLockData({
    required int lockId,
    required String lockData,
  }) => _write(() => _api.updateLockData(lockId: lockId, lockData: lockData));

  TaskEither<AppException, OpenApiEnvelope> updateSetting({
    required int lockId,
    required int type,
    required int value,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.updateSetting(
      lockId: lockId,
      type: type,
      value: value,
      changeType: channel.value,
    ),
  );

  TaskEither<AppException, ExtraSettingDto> getExtraSetting({
    required int lockId,
    required int type,
  }) => _parse(
    () => _api.getExtraSetting(lockId: lockId, type: type),
    ExtraSettingDto.fromJson,
  );

  TaskEither<AppException, int> querySetting({
    required int lockId,
    required int type,
  }) => _parse(
    () => _api.querySetting(lockId: lockId, type: type),
    (json) => intFromDynamic(json['value']),
  );

  TaskEither<AppException, OpenApiEnvelope> setAutoLockTime({
    required int lockId,
    required int seconds,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.setAutoLockTime(
      lockId: lockId,
      seconds: seconds,
      type: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> configPassageMode({
    required int lockId,
    required int passageMode,
    int? startDate,
    int? endDate,
    int? isAllDay,
    List<int>? weekDays,
    int? autoUnlock,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.configPassageMode(
      lockId: lockId,
      passageMode: passageMode,
      startDate: startDate,
      endDate: endDate,
      isAllDay: isAllDay,
      weekDays: weekDays == null ? null : jsonEncode(weekDays),
      autoUnlock: autoUnlock,
      type: channel.value,
    ),
  );

  TaskEither<AppException, PassageModeConfigDto> getPassageModeConfig({
    required int lockId,
  }) => _parse(
    () => _api.getPassageModeConfig(lockId: lockId),
    PassageModeConfigDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> configWorkingMode({
    required int lockId,
    required int workingMode,
    List<WorkingModeCyclicConfigDto>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.configWorkingMode(
      lockId: lockId,
      workingMode: workingMode,
      type: channel.value,
      cyclicConfig: cyclicConfig == null
          ? null
          : jsonEncode(cyclicConfig.map((e) => e.toJson()).toList()),
    ),
  );

  TaskEither<AppException, WorkingModeDto> getWorkingMode({
    required int lockId,
  }) => _parse(
    () => _api.getWorkingMode(lockId: lockId),
    WorkingModeDto.fromJson,
  );

  TaskEither<AppException, ChangeTimezoneResultDto> changeTimezoneRawOffset({
    required int lockId,
    required int timezoneRawOffset,
    ChannelType channel = ChannelType.bleSynced,
  }) => _parse(
    () => _api.changeTimezoneRawOffset(
      lockId: lockId,
      timezoneRawOffset: timezoneRawOffset,
      type: channel.value,
    ),
    ChangeTimezoneResultDto.fromJson,
  );

  TaskEither<AppException, DateTime?> updateDate({required int lockId}) =>
      _parse(
        () => _api.updateDate(lockId: lockId),
        (json) => nullableDateTimeMsFromJson(json['date']),
      );

  TaskEither<AppException, OpenApiEnvelope> updateElectricQuantity({
    required int lockId,
    required int electricQuantity,
  }) => _write(
    () => _api.updateElectricQuantity(
      lockId: lockId,
      electricQuantity: electricQuantity,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> updateAccessoryElectricQuantity({
    required int type,
    required String mac,
    required int electricQuantity,
    required int updateDate,
  }) => _write(
    () => _api.updateAccessoryElectricQuantity(
      type: type,
      mac: mac,
      electricQuantity: electricQuantity,
      updateDate: updateDate,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> updateUnauthorizedAttemptAlert({
    required int lockId,
    ChannelType channel = ChannelType.bleSynced,
    required int flag,
    required int count,
    required int lockTime,
    int? pwd,
    int? card,
    int? fingerprint,
  }) => _write(
    () => _api.updateUnauthorizedAttemptAlert(
      lockId: lockId,
      type: channel.value,
      flag: flag,
      count: count,
      lockTime: lockTime,
      pwd: pwd,
      card: card,
      fingerprint: fingerprint,
    ),
  );

  TaskEither<AppException, int> queryElectricQuantity({required int lockId}) =>
      _parse(
        () => _api.queryElectricQuantity(lockId: lockId),
        (json) => intFromDynamic(json['electricQuantity']),
      );

  TaskEither<AppException, int> queryOpenState({required int lockId}) => _parse(
    () => _api.queryOpenState(lockId: lockId),
    (json) => intFromDynamic(json['state']),
  );

  TaskEither<AppException, int> queryStatus({required int lockId}) => _parse(
    () => _api.queryStatus(lockId: lockId),
    (json) => intFromDynamic(json['status']),
  );

  TaskEither<AppException, DateTime?> queryDate({required int lockId}) =>
      _parse(
        () => _api.queryDate(lockId: lockId),
        (json) => nullableDateTimeMsFromJson(json['date']),
      );

  TaskEither<AppException, Map<String, dynamic>> listKey({
    required int lockId,
    String? searchStr,
    int? keyRight,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _parse(
    () => _api.listKey(
      lockId: lockId,
      searchStr: searchStr,
      keyRight: keyRight,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => json,
  );

  TaskEither<AppException, Map<String, dynamic>> listKeyboardPwd({
    required int lockId,
    String? searchStr,
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 1,
  }) => _parse(
    () => _api.listKeyboardPwd(
      lockId: lockId,
      searchStr: searchStr,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => json,
  );

  TaskEither<AppException, OpenApiEnvelope> deleteAllKey({
    required int lockId,
  }) => _write(() => _api.deleteAllKey(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> registerNb({
    required int lockId,
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  }) => _write(
    () => _api.registerNb(
      lockId: lockId,
      nbNodeId: nbNodeId,
      nbCardNumber: nbCardNumber,
      nbOperator: nbOperator,
      nbRssi: nbRssi,
    ),
  );

  TaskEither<AppException, NbDeviceInfoDto> getNbDeviceInfo({
    required int lockId,
  }) => _parse(
    () => _api.getNbDeviceInfo(lockId: lockId),
    NbDeviceInfoDto.fromJson,
  );

  TaskEither<AppException, List<NbPlatformEndpointDto>>
  getNbPlatformIpAndPort() => _parse(() => _api.getNbPlatformIpAndPort(), (
    json,
  ) {
    final list = json['list'];
    if (list is! List) return const <NbPlatformEndpointDto>[];
    return list
        .map(
          (e) => NbPlatformEndpointDto.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  });

  TaskEither<AppException, LockUpgradeCheckDto> upgradeCheck({
    required int lockId,
  }) => _parse(
    () => _api.upgradeCheck(lockId: lockId),
    LockUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, LockUpgradeCheckDto> upgradeRecheck({
    required int lockId,
    required String lockData,
  }) => _parse(
    () => _api.upgradeRecheck(lockId: lockId, lockData: lockData),
    LockUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, LockUpgradeCheckDto> upgradeCheckForOnPremise({
    required String secret,
    required String lockData,
    String? account,
  }) => _parse(
    () => _api.upgradeCheckForOnPremise(
      secret: secret,
      lockData: lockData,
      account: account,
    ),
    LockUpgradeCheckDto.fromJson,
  );

  TaskEither<AppException, OpenApiPageDto<HotelLockDto>> listByHotel({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  }) => _parse(
    () => _api.listByHotel(
      pageNo: pageNo,
      pageSize: pageSize,
      type: type,
      lockAlias: lockAlias,
      groupId: groupId,
    ),
    (json) => OpenApiPageDto<HotelLockDto>.fromJson(
      json,
      (j) => HotelLockDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> setHotelCardSector({
    required int lockId,
    required String sector,
  }) => _write(() => _api.setHotelCardSector(lockId: lockId, sector: sector));

  TaskEither<AppException, OpenApiEnvelope> emergencyLock({
    required int lockId,
    required int autoLockTime,
  }) => _write(
    () => _api.emergencyLock(lockId: lockId, autoLockTime: autoLockTime),
  );

  TaskEither<AppException, OpenApiEnvelope> emergencyUnlock({
    required int lockId,
  }) => _write(() => _api.emergencyUnlock(lockId: lockId));

  TaskEither<AppException, LockImportDataDto> getImportData({
    required int lockId,
    required int fromLockId,
  }) => _parse(
    () => _api.getImportData(lockId: lockId, fromLockId: fromLockId),
    LockImportDataDto.fromJson,
  );

  TaskEither<AppException, OpenApiEnvelope> importSuccess({
    required int lockId,
    required int fromLockId,
    List<int>? keyboardPwdIdList,
    List<int>? cardIdList,
  }) => _write(
    () => _api.importSuccess(
      lockId: lockId,
      fromLockId: fromLockId,
      keyboardPwdIdList: keyboardPwdIdList == null
          ? null
          : jsonEncode(keyboardPwdIdList),
      cardIdList: cardIdList == null ? null : jsonEncode(cardIdList),
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
