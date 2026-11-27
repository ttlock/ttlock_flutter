import 'package:freezed_annotation/freezed_annotation.dart';

part 'lock.freezed.dart';

@freezed
abstract class LockEntity with _$LockEntity {
  const LockEntity._();
  const factory LockEntity({
    @Default(0) int lockId,
    @Default('') String lockName,
    @Default('') String lockAlias,
    @Default('') String lockMac,
    @Default(0) int electricQuantity,
    @Default('') String featureValue,
    @Default(false) bool hasGateway,
    @Default('') String lockData,
    @Default(0) int groupId,
    @Default('') String groupName,
    DateTime? initDate,
  }) = _LockEntity;
}

@freezed
abstract class LockInitializeResult with _$LockInitializeResult {
  const factory LockInitializeResult({
    @Default(0) int lockId,
    @Default('') String keyId,
  }) = _LockInitializeResult;
}

/// BLE getLockSystemInfo 结果：更新后的锁 Entity + 设备系统信息字段。
@freezed
abstract class LockSystemInfoResult with _$LockSystemInfoResult {
  const factory LockSystemInfoResult({
    required LockEntity lock,
    @Default('') String modelNum,
    @Default('') String hardwareRevision,
    @Default('') String firmwareRevision,
    @Default('') String nbOperator,
    @Default('') String nbNodeId,
    @Default('') String nbCardNumber,
    @Default('') String nbRssi,
  }) = _LockSystemInfoResult;
}
