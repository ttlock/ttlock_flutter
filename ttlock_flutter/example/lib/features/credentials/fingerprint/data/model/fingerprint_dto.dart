// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';

part 'fingerprint_dto.freezed.dart';
part 'fingerprint_dto.g.dart';

List<CyclicConfig> cyclicConfigListFromJson(Object? v) {
  if (v == null) return const [];
  var raw = v;
  if (raw is String) {
    final decoded = jsonDecode(raw);
    if (decoded is! List) return const [];
    raw = decoded;
  }
  if (raw is! List) return const [];
  return raw
      .map((e) => CyclicConfig.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
}

@freezed
abstract class FingerprintDto with _$FingerprintDto {
  const FingerprintDto._();
  const factory FingerprintDto({
    @JsonKey(name: 'fingerprintId', fromJson: intFromDynamic)
    @Default(0)
    int fingerprintId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'fingerprintNumber', fromJson: stringFromDynamic)
    @Default('')
    String fingerprintNumber,
    @JsonKey(name: 'fingerprintType', fromJson: intFromDynamic)
    @Default(1)
    int fingerprintType,
    @JsonKey(name: 'fingerprintName') @Default('') String fingerprintName,
    @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? endDate,
    @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)
    @Default([])
    List<CyclicConfig> cyclicConfig,
    @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? createDate,
    @JsonKey(name: 'senderUsername') @Default('') String senderUsername,
  }) = _FingerprintDto;

  factory FingerprintDto.fromJson(Map<String, dynamic> json) =>
      _$FingerprintDtoFromJson(json);

  FingerprintEntity toEntity() => FingerprintEntity(
    fingerprintId: fingerprintId,
    lockId: lockId,
    fingerprintNumber: fingerprintNumber,
    fingerprintType: CredentialType.fromValue(fingerprintType),
    fingerprintName: fingerprintName,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    createDate: createDate,
    senderUsername: senderUsername,
  );
}
