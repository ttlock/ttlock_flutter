// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';

part 'face_dto.freezed.dart';
part 'face_dto.g.dart';

Object? _readFaceName(Map json, String _) => json['faceName'] ?? json['name'];

Object? _readFaceType(Map json, String _) => json['type'] ?? json['faceType'];

Object? _readNickname(Map json, String _) => json['nickname'] ?? json['nick'];

EntityStatus _statusFromJson(Object? v) =>
    EntityStatus.fromValue(v?.toString());

CredentialType _typeFromJson(Object? v) =>
    CredentialType.fromValue(intFromDynamic(v));

List<CyclicConfig> _cyclicConfigFromJson(Object? v) {
  if (v is! List) return const [];
  return v
      .map((e) => CyclicConfig.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
}

@freezed
abstract class FaceDto with _$FaceDto {
  const FaceDto._();
  const factory FaceDto({
    @JsonKey(name: 'faceId', fromJson: intFromDynamic) @Default(0) int faceId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(readValue: _readFaceName, fromJson: stringFromDynamic)
    @Default('')
    String name,
    @JsonKey(name: 'faceNumber', fromJson: stringFromDynamic)
    @Default('')
    String faceNumber,
    @JsonKey(name: 'status', fromJson: _statusFromJson)
    @Default(EntityStatus.normal)
    EntityStatus status,
    @JsonKey(readValue: _readNickname, fromJson: stringFromDynamic)
    @Default('')
    String nickname,
    @JsonKey(name: 'userid', fromJson: stringFromDynamic)
    @Default('')
    String userid,
    @JsonKey(readValue: _readFaceType, fromJson: _typeFromJson)
    @Default(CredentialType.normal)
    CredentialType type,
    @JsonKey(
      name: 'startDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? startDate,
    @JsonKey(
      name: 'endDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? endDate,
    @JsonKey(name: 'cyclicConfig', fromJson: _cyclicConfigFromJson)
    @Default([])
    List<CyclicConfig> cyclicConfig,
    @JsonKey(
      name: 'createDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? createDate,
  }) = _FaceDto;

  factory FaceDto.fromJson(Map<String, dynamic> json) =>
      _$FaceDtoFromJson(json);

  FaceEntity toEntity() => FaceEntity(
    faceId: faceId,
    lockId: lockId,
    name: name,
    faceNumber: faceNumber,
    status: status,
    nickname: nickname,
    userid: userid,
    type: type,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    createDate: createDate,
  );
}
