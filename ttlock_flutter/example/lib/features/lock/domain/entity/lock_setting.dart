import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'lock_setting.freezed.dart';

/// `POST /v3/lock/updateSetting` 单次修改项。
///
/// [type]：2-反锁、3-防撬、4-重置键、6-声音开关、7-开门方向、8-音量、
/// 10-WiFi 省电、11-门未关报警秒数。[value] 语义随 type 变化。
class LockSettingUpdate {
  const LockSettingUpdate({
    required this.type,
    required this.value,
    this.channel = ChannelType.bleSynced,
  });

  final int type;
  final int value;
  final ChannelType channel;
}

/// `GET /v3/lock/detail` 中的锁设置快照。
///
/// 各开关：`null` = 云端未返回或为 0（未知）；`true`/`false` = 1/2。
/// [autoLockTime]：秒；`null` = 未返回；`<=0`（含 -1）表示关闭自动闭锁。
/// [openDirection]：`null` 未知；`1` 左开；`2` 右开。
/// [soundVolume]：`null` 未知；有效范围 1–5。
@freezed
abstract class LockCloudSettings with _$LockCloudSettings {
  const factory LockCloudSettings({
    int? autoLockTime,
    bool? lockSoundOn,
    int? soundVolume,
    bool? privacyLockOn,
    bool? tamperAlertOn,
    bool? resetButtonOn,
    int? openDirection,
    bool? passageModeOn,
    bool? passageModeAutoUnlockOn,
  }) = _LockCloudSettings;
}

@freezed
abstract class ExtraSettingEntity with _$ExtraSettingEntity {
  const factory ExtraSettingEntity({
    @Default(0) int flag,
    @Default(0) int count,
    @Default(0) int lockTime,
    @Default(0) int pwd,
    @Default(0) int card,
    @Default(0) int fingerprint,
  }) = _ExtraSettingEntity;
}

@freezed
abstract class PassageModeConfigEntity with _$PassageModeConfigEntity {
  const factory PassageModeConfigEntity({
    @Default(2) int passageMode,
    @Default(0) int startDate,
    @Default(0) int endDate,
    @Default(2) int isAllDay,
    @Default([]) List<int> weekDays,
    @Default(2) int autoUnlock,
  }) = _PassageModeConfigEntity;
}

@freezed
abstract class WorkingModeCyclicConfigEntity
    with _$WorkingModeCyclicConfigEntity {
  const factory WorkingModeCyclicConfigEntity({
    @Default(2) int isAllDay,
    @Default(0) int startTime,
    @Default(0) int endTime,
    @Default([]) List<int> weekDays,
  }) = _WorkingModeCyclicConfigEntity;
}

@freezed
abstract class WorkingModeEntity with _$WorkingModeEntity {
  const factory WorkingModeEntity({
    @Default(1) int workingMode,
    @Default([]) List<WorkingModeCyclicConfigEntity> cyclicConfig,
  }) = _WorkingModeEntity;
}

@freezed
abstract class FirmwareInfoEntity with _$FirmwareInfoEntity {
  const factory FirmwareInfoEntity({
    @Default('') String modelNum,
    @Default('') String hardwareRevision,
    @Default('') String firmwareRevision,
  }) = _FirmwareInfoEntity;
}

@freezed
abstract class LockUpgradeCheckEntity with _$LockUpgradeCheckEntity {
  const factory LockUpgradeCheckEntity({
    @Default(2) int needUpgrade,
    FirmwareInfoEntity? firmwareInfo,
    @Default('') String firmwarePackage,
    @Default('') String version,
  }) = _LockUpgradeCheckEntity;
}

@freezed
abstract class NbDeviceInfoEntity with _$NbDeviceInfoEntity {
  const factory NbDeviceInfoEntity({
    @Default('') String nbNodeId,
    @Default('') String nbCardNumber,
    @Default('') String nbOperator,
    @Default('') String nbOperatorName,
    @Default(0) int nbRssi,
    DateTime? updateDate,
  }) = _NbDeviceInfoEntity;
}

@freezed
abstract class NbPlatformEndpointEntity with _$NbPlatformEndpointEntity {
  const factory NbPlatformEndpointEntity({
    @Default('') String nbOperator,
    @Default('') String ip,
    @Default(0) int port,
  }) = _NbPlatformEndpointEntity;
}

@freezed
abstract class HotelLockEntity with _$HotelLockEntity {
  const HotelLockEntity._();
  const factory HotelLockEntity({
    @Default(0) int lockId,
    @Default('') String lockName,
    @Default('') String lockAlias,
    @Default('') String lockMac,
    @Default(0) int electricQuantity,
    @Default('') String featureValue,
    @Default(false) bool hasGateway,
    @Default('') String lockData,
    @Default('') String sector,
    DateTime? electricQuantityUpdateDate,
    @Default('') String buildingName,
    @Default(0) int buildingNumber,
    @Default('') String floorName,
    @Default(0) int floorNumber,
    @Default(0) int groupId,
    @Default('') String groupName,
    DateTime? initDate,
  }) = _HotelLockEntity;

  LockEntity toLockEntity() => LockEntity(
    lockId: lockId,
    lockName: lockName,
    lockAlias: lockAlias,
    lockMac: lockMac,
    lockData: lockData,
    groupId: groupId,
    groupName: groupName,
    initDate: initDate,
    electricQuantity: electricQuantity,
    featureValue: featureValue,
    hasGateway: hasGateway,
  );
}

@freezed
abstract class LockImportDataEntity with _$LockImportDataEntity {
  const factory LockImportDataEntity({
    @Default(0) int keyNum,
    @Default(0) int keyboardPwdNum,
    @Default(0) int cardNum,
    @Default([]) List<Map<String, dynamic>> keyboardPwdList,
    @Default([]) List<Map<String, dynamic>> identityCardList,
  }) = _LockImportDataEntity;
}
