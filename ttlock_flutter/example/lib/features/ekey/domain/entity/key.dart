import 'package:freezed_annotation/freezed_annotation.dart';

part 'key.freezed.dart';

enum KeyUserType {
  admin('110301', '管理员钥匙'),
  normal('110302', '普通用户钥匙');

  const KeyUserType(this.value, this.label);
  final String value;
  final String label;

  static KeyUserType fromValue(String? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => KeyUserType.normal);
}

enum KeyStatus {
  normal('110401', '正常使用'),
  pending('110402', '待接收'),
  frozen('110405', '已冻结'),
  deleted('110408', '已删除'),
  reset('110410', '已重置');

  const KeyStatus(this.value, this.label);
  final String value;
  final String label;

  static KeyStatus fromValue(String? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => KeyStatus.normal);
}

@freezed
abstract class KeyEntity with _$KeyEntity {
  const KeyEntity._();
  const factory KeyEntity({
    @Default(0) int keyId,
    @Default('') String lockData,
    @Default(0) int lockId,
    @Default(KeyUserType.normal) KeyUserType userType,
    @Default(KeyStatus.normal) KeyStatus keyStatus,
    @Default('') String lockName,
    @Default('') String lockAlias,
    @Default('') String lockMac,
    @Default('') String noKeyPwd,
    @Default(0) int electricQuantity,
    DateTime? startDate,
    DateTime? endDate,
    @Default('') String remarks,
    @Default(false) bool keyRight,
    @Default('') String featureValue,
    @Default(false) bool remoteEnable,
    @Default(false) bool passageMode,
    @Default(0) int timezoneRawOffset,
    @Default(0) int groupId,
    @Default('') String groupName,
    @Default('') String username,
    @Default('') String keyName,
    @Default('') String senderUsername,
    @Default(0) int uid,
    DateTime? sendDate,
  }) = _KeyEntity;
}
