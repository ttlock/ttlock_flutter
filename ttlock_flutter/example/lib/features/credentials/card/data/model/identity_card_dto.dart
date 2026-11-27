// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';

part 'identity_card_dto.freezed.dart';
part 'identity_card_dto.g.dart';

List<CyclicConfig> identityCardCyclicConfigFromJson(Object? v) {
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
abstract class IdentityCardDto with _$IdentityCardDto {
  const IdentityCardDto._();
  const factory IdentityCardDto({
    @JsonKey(name: 'cardId', fromJson: intFromDynamic) @Default(0) int cardId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'cardNumber', fromJson: stringFromDynamic)
    @Default('')
    String cardNumber,
    @JsonKey(name: 'cardName') @Default('') String cardName,
    @JsonKey(name: 'cardType', fromJson: intFromDynamic)
    @Default(1)
    int cardType,
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
    @JsonKey(
      name: 'createDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? createDate,
    @JsonKey(name: 'senderUsername') @Default('') String senderUsername,
    @JsonKey(name: 'cyclicConfig', fromJson: identityCardCyclicConfigFromJson)
    @Default([])
    List<CyclicConfig> cyclicConfig,
  }) = _IdentityCardDto;

  factory IdentityCardDto.fromJson(Map<String, dynamic> json) =>
      _$IdentityCardDtoFromJson(json);

  IdentityCardEntity toEntity() => IdentityCardEntity(
    cardId: cardId,
    lockId: lockId,
    cardNumber: cardNumber,
    cardName: cardName,
    cardType: CredentialType.fromValue(cardType),
    startDate: startDate,
    endDate: endDate,
    createDate: createDate,
    senderUsername: senderUsername,
    cyclicConfig: cyclicConfig,
  );
}
