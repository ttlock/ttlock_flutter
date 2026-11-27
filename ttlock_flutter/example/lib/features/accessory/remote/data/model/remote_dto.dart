// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';

part 'remote_dto.freezed.dart';
part 'remote_dto.g.dart';

EntityStatus entityStatusFromJson(Object? v) =>
    EntityStatus.fromValue(v?.toString());

CredentialType credentialTypeFromJson(Object? v) =>
    CredentialType.fromValue(intFromDynamic(v));

List<CyclicConfig> cyclicConfigListFromJson(Object? v) {
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

Object? _readUserId(Map json, String key) => json['userId'] ?? json['userid'];

@freezed
abstract class RemoteDto with _$RemoteDto {
  const RemoteDto._();
  const factory RemoteDto({
    @JsonKey(name: 'remoteId', fromJson: intFromDynamic)
    @Default(0)
    int remoteId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'mac') @Default('') String mac,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'status', fromJson: entityStatusFromJson)
    @Default(EntityStatus.normal)
    EntityStatus status,
    @JsonKey(name: 'nickname') @Default('') String nickname,
    @JsonKey(name: 'userId', readValue: _readUserId) @Default('') String userId,
    @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? endDate,
    @JsonKey(name: 'type', fromJson: credentialTypeFromJson)
    @Default(CredentialType.normal)
    CredentialType type,
    @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)
    @Default([])
    List<CyclicConfig> cyclicConfig,
    @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? createDate,
  }) = _RemoteDto;

  factory RemoteDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteDtoFromJson(json);

  RemoteEntity toEntity() => RemoteEntity(
    remoteId: remoteId,
    name: name,
    mac: mac,
    electricQuantity: electricQuantity,
    status: status,
    nickname: nickname,
    userId: userId,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    createDate: createDate,
  );
}
