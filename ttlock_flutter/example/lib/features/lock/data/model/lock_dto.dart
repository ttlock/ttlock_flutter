// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

part 'lock_dto.freezed.dart';
part 'lock_dto.g.dart';

/// detail 开关：0-未知、1-开启、2-关闭 → `null` / `true` / `false`。
bool? cloudSwitchToBool(int? v) {
  if (v == null || v == 0) return null;
  if (v == 1) return true;
  if (v == 2) return false;
  return null;
}

@freezed
abstract class LockDto with _$LockDto {
  const LockDto._();
  const factory LockDto({
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'lockName') @Default('') String lockName,
    @JsonKey(name: 'lockAlias') @Default('') String lockAlias,
    @JsonKey(name: 'lockMac') @Default('') String lockMac,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)
    @Default(0)
    int hasGateway,
    @JsonKey(name: 'lockData') @Default('') String lockData,
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(
      name: 'date',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? initDate,
    /// 以下字段仅 `lock/detail` 可能返回；list 响应中为 null。
    @JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic)
    int? autoLockTime,
    @JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic)
    int? lockSound,
    @JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic)
    int? soundVolume,
    @JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic)
    int? privacyLock,
    @JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic)
    int? tamperAlert,
    @JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic)
    int? resetButton,
    @JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic)
    int? openDirection,
    @JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic)
    int? passageMode,
    @JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic)
    int? passageModeAutoUnlock,
  }) = _LockDto;

  factory LockDto.fromJson(Map<String, dynamic> json) =>
      _$LockDtoFromJson(json);

  LockEntity toEntity() => LockEntity(
    lockId: lockId,
    lockName: lockName,
    lockAlias: lockAlias,
    lockMac: lockMac,
    electricQuantity: electricQuantity,
    featureValue: featureValue,
    hasGateway: hasGateway == 1,
    lockData: lockData,
    groupId: groupId,
    groupName: groupName,
    initDate: initDate,
  );

  LockCloudSettings toCloudSettings() => LockCloudSettings(
    autoLockTime: autoLockTime,
    lockSoundOn: cloudSwitchToBool(lockSound),
    soundVolume: soundVolume,
    privacyLockOn: cloudSwitchToBool(privacyLock),
    tamperAlertOn: cloudSwitchToBool(tamperAlert),
    resetButtonOn: cloudSwitchToBool(resetButton),
    openDirection: (openDirection == 1 || openDirection == 2)
        ? openDirection
        : null,
    passageModeOn: cloudSwitchToBool(passageMode),
    passageModeAutoUnlockOn: cloudSwitchToBool(passageModeAutoUnlock),
  );
}

@freezed
abstract class LockInitializeDto with _$LockInitializeDto {
  const LockInitializeDto._();
  const factory LockInitializeDto({
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'keyId', fromJson: stringFromDynamic)
    @Default('')
    String keyId,
  }) = _LockInitializeDto;

  factory LockInitializeDto.fromJson(Map<String, dynamic> json) =>
      _$LockInitializeDtoFromJson(json);

  LockInitializeResult toEntity() =>
      LockInitializeResult(lockId: lockId, keyId: keyId);
}
