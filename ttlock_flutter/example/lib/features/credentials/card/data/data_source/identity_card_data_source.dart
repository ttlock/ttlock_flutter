import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/data_source/identity_card_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/model/identity_card_dto.dart';

part 'identity_card_data_source.g.dart';

@Riverpod(keepAlive: true)
IdentityCardApi identityCardApi(Ref ref) =>
    IdentityCardApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class IdentityCardDataSource extends _$IdentityCardDataSource {
  late final IdentityCardApi _api;

  @override
  void build() {
    _api = ref.watch(identityCardApiProvider);
  }

  TaskEither<AppException, OpenApiPageDto<IdentityCardDto>> list({
    required int lockId,
    String? searchStr,
    int pageNo = 1,
    int pageSize = 200,
    int orderBy = 0,
  }) => _parse(
    () => _api.list(
      lockId: lockId,
      searchStr: searchStr,
      pageNo: pageNo,
      pageSize: pageSize,
      orderBy: orderBy,
    ),
    (json) => OpenApiPageDto<IdentityCardDto>.fromJson(
      json,
      (j) => IdentityCardDto.fromJson(j as Map<String, dynamic>),
    ),
  );

  TaskEither<AppException, int> add({
    required int lockId,
    required String cardNumber,
    String? cardName,
    required int startDate,
    required int endDate,
    CredentialType cardType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) {
    final addType = channel.value;
    final cyclicJson = _encodeCyclicConfig(cyclicConfig);
    final cardTypeValue = cardType == CredentialType.normal
        ? null
        : cardType.value;
    final call = channel == ChannelType.gatewayWifi
        ? () => _api.addForReversedCardNumber(
            lockId: lockId,
            cardNumber: cardNumber,
            cardName: cardName,
            startDate: startDate,
            endDate: endDate,
            cardType: cardTypeValue,
            cyclicConfig: cyclicJson,
            addType: addType,
          )
        : () => _api.add(
            lockId: lockId,
            cardNumber: cardNumber,
            cardName: cardName,
            startDate: startDate,
            endDate: endDate,
            cardType: cardTypeValue,
            cyclicConfig: cyclicJson,
            addType: addType,
          );
    return _parse(call, (json) => intFromDynamic(json['cardId']));
  }

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int lockId,
    required int cardId,
    required int startDate,
    required int endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.changePeriod(
      lockId: lockId,
      cardId: cardId,
      startDate: startDate,
      endDate: endDate,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
      changeType: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required int cardId,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () =>
        _api.delete(lockId: lockId, cardId: cardId, deleteType: channel.value),
  );

  TaskEither<AppException, OpenApiEnvelope> deleteByCardNumber({
    required int lockId,
    required String cardNumber,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.deleteByCardNumber(
      lockId: lockId,
      cardNumber: cardNumber,
      deleteType: channel.value,
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int lockId,
    required int cardId,
    required String cardName,
  }) => _write(
    () => _api.rename(lockId: lockId, cardId: cardId, cardName: cardName),
  );

  String? _encodeCyclicConfig(List<CyclicConfig>? configs) {
    if (configs == null || configs.isEmpty) return null;
    return jsonEncode(configs.map((e) => e.toJson()).toList());
  }

  TaskEither<AppException, OpenApiEnvelope> _write(
    Future<OpenApiEnvelope> Function() call,
  ) => TaskEither.tryCatch(() async {
    final envelope = await call();
    if (!envelope.isOk) {
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return envelope;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, T> _parse<T>(
    Future<dynamic> Function() call,
    T Function(Map<String, dynamic> json) mapper,
  ) => TaskEither.tryCatch(() async {
    final raw = await call();
    final json = Map<String, dynamic>.from(raw as Map);
    final errcode = json['errcode'];
    if (errcode is int && errcode != 0) {
      final envelope = OpenApiEnvelope.fromJson(json);
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return mapper(json);
  }, ExceptionUtils.extractAppException);
}
