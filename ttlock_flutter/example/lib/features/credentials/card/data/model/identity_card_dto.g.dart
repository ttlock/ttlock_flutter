// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdentityCardDto _$IdentityCardDtoFromJson(Map<String, dynamic> json) =>
    _IdentityCardDto(
      cardId: json['cardId'] == null ? 0 : intFromDynamic(json['cardId']),
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      cardNumber: json['cardNumber'] == null
          ? ''
          : stringFromDynamic(json['cardNumber']),
      cardName: json['cardName'] as String? ?? '',
      cardType: json['cardType'] == null ? 1 : intFromDynamic(json['cardType']),
      startDate: nullableDateTimeMsFromJson(json['startDate']),
      endDate: nullableDateTimeMsFromJson(json['endDate']),
      createDate: nullableDateTimeMsFromJson(json['createDate']),
      senderUsername: json['senderUsername'] as String? ?? '',
      cyclicConfig: json['cyclicConfig'] == null
          ? const []
          : identityCardCyclicConfigFromJson(json['cyclicConfig']),
    );

Map<String, dynamic> _$IdentityCardDtoToJson(_IdentityCardDto instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'lockId': instance.lockId,
      'cardNumber': instance.cardNumber,
      'cardName': instance.cardName,
      'cardType': instance.cardType,
      'startDate': nullableDateTimeMsToJson(instance.startDate),
      'endDate': nullableDateTimeMsToJson(instance.endDate),
      'createDate': nullableDateTimeMsToJson(instance.createDate),
      'senderUsername': instance.senderUsername,
      'cyclicConfig': instance.cyclicConfig,
    };
