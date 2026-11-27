// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential_enums.freezed.dart';
part 'credential_enums.g.dart';

/// 凭证通用类型（卡/指纹/人脸/掌静脉/遥控器）: 1-普通、4-循环。
enum CredentialType {
  normal(1, '普通'),
  cycle(4, '循环');

  const CredentialType(this.value, this.label);

  final int value;
  final String label;

  static CredentialType fromValue(int? v) => values.firstWhere(
    (e) => e.value == v,
    orElse: () => CredentialType.normal,
  );
}

/// 凭证/设备通用状态（字符串, cloud 语义）: 1-正常、2-已失效、3-待生效。
enum EntityStatus {
  normal('1', '正常'),
  expired('2', '已失效'),
  pending('3', '待生效');

  const EntityStatus(this.value, this.label);

  final String value;
  final String label;

  static EntityStatus fromValue(String? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => EntityStatus.normal);
}

/// 表计通用枚举（水/电表共享）。
enum MeterPayMode {
  energy(0, '计能模式'),
  prepaid(1, '预付费');

  const MeterPayMode(this.value, this.label);

  final int value;
  final String label;

  static MeterPayMode fromValue(int? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => MeterPayMode.energy);
}

enum MeterOnOff {
  off(0, '关'),
  on(1, '开'),
  unknown(2, '未知');

  const MeterOnOff(this.value, this.label);

  final int value;
  final String label;

  static MeterOnOff fromValue(int? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => MeterOnOff.unknown);
}

/// 循环有效期配置（cyclicConfig 元素）。
@freezed
abstract class CyclicConfig with _$CyclicConfig {
  const CyclicConfig._();
  const factory CyclicConfig({
    @JsonKey(name: 'weekDay') @Default(0) int weekDay,
    @JsonKey(name: 'startTime') @Default(0) int startTime,
    @JsonKey(name: 'endTime') @Default(0) int endTime,
  }) = _CyclicConfig;

  factory CyclicConfig.fromJson(Map<String, dynamic> json) =>
      _$CyclicConfigFromJson(json);
}
