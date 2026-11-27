// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';

part 'palm_vein_dto.freezed.dart';
part 'palm_vein_dto.g.dart';

EntityStatus _entityStatusFromJson(Object? v) =>
    EntityStatus.fromValue(v?.toString());

CredentialType _credentialTypeFromJson(Object? v) =>
    CredentialType.fromValue(intFromDynamic(v));

List<CyclicConfig> _cyclicConfigFromJson(Object? v) {
  if (v == null) return const [];
  Object decoded = v;
  if (v is String) {
    if (v.isEmpty) return const [];
    decoded = jsonDecode(v);
  }
  if (decoded is! List) return const [];
  return decoded
      .map((e) => CyclicConfig.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
}

@freezed
abstract class PalmVeinDto with _$PalmVeinDto {
  const PalmVeinDto._();
  const factory PalmVeinDto({
    @JsonKey(fromJson: intFromDynamic) @Default(0) int id,
    @Default('') String name,
    @JsonKey(fromJson: stringFromDynamic) @Default('') String number,
    @JsonKey(fromJson: _entityStatusFromJson)
    @Default(EntityStatus.normal)
    EntityStatus status,
    @Default('') String nickname,
    @JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? startDate,
    @JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? endDate,
    @JsonKey(fromJson: _credentialTypeFromJson)
    @Default(CredentialType.normal)
    CredentialType type,
    @JsonKey(fromJson: _cyclicConfigFromJson)
    @Default([])
    List<CyclicConfig> cyclicConfig,
    @JsonKey(fromJson: nullableDateTimeMsFromJson) DateTime? createDate,
  }) = _PalmVeinDto;

  factory PalmVeinDto.fromJson(Map<String, dynamic> json) =>
      _$PalmVeinDtoFromJson(json);

  PalmVeinEntity toEntity() => PalmVeinEntity(
    id: id,
    name: name,
    number: number,
    status: status,
    nickname: nickname,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    createDate: createDate,
  );
}
