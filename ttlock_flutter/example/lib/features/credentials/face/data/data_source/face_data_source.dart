import 'dart:convert';

import 'package:dio/dio.dart';
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
import 'package:ttlock_flutter_demo/features/credentials/face/data/data_source/face_api.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/model/face_dto.dart';

part 'face_data_source.g.dart';

@Riverpod(keepAlive: true)
FaceApi faceApi(Ref ref) => FaceApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class FaceDataSource extends _$FaceDataSource {
  late final FaceApi _api;

  @override
  void build() {
    _api = ref.watch(faceApiProvider);
  }

  TaskEither<AppException, List<FaceDto>> list({
    required int lockId,
    String? searchStr,
  }) => _parse(
    () => _api.list(lockId: lockId, searchStr: searchStr),
    (json) => OpenApiPageDto<FaceDto>.fromJson(
      json,
      (j) => FaceDto.fromJson(j as Map<String, dynamic>),
    ).list,
  );

  TaskEither<AppException, int> add({
    required int lockId,
    String? faceName,
    String? faceNumber,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
    String? featureData,
  }) => _parse(
    () => _api.add(
      lockId: lockId,
      name: faceName,
      faceNumber: faceNumber,
      startDate: _dateToMs(startDate),
      endDate: _dateToMs(endDate),
      type: type == CredentialType.normal ? null : type.value,
      addType: channel.value,
      featureData: featureData,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
    ),
    (json) => intFromDynamic(json['faceId']),
  );

  TaskEither<AppException, String> getFeatureDataByPhoto({
    required int lockId,
    required List<int> imageBytes,
  }) => _parse(
    () => _api.getFeatureDataByPhoto([
      MultipartFile.fromBytes(imageBytes, filename: 'face.jpg'),
    ], lockId: lockId),
    (json) => stringFromDynamic(json['featureData']),
  );

  TaskEither<AppException, OpenApiEnvelope> changePeriod({
    required int lockId,
    required int faceId,
    required DateTime startDate,
    required DateTime endDate,
    ChannelType channel = ChannelType.bleSynced,
    List<CyclicConfig>? cyclicConfig,
  }) => _write(
    () => _api.changePeriod(
      lockId: lockId,
      faceId: faceId,
      startDate: startDate.millisecondsSinceEpoch,
      endDate: endDate.millisecondsSinceEpoch,
      type: channel.value,
      cyclicConfig: _encodeCyclicConfig(cyclicConfig),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> delete({
    required int lockId,
    required int faceId,
    ChannelType channel = ChannelType.bleSynced,
  }) => _write(
    () => _api.delete(lockId: lockId, faceId: faceId, type: channel.value),
  );

  TaskEither<AppException, OpenApiEnvelope> clear({required int lockId}) =>
      _write(() => _api.clear(lockId: lockId));

  TaskEither<AppException, OpenApiEnvelope> rename({
    required int lockId,
    required int faceId,
    required String name,
  }) => _write(() => _api.rename(lockId: lockId, faceId: faceId, name: name));

  int _dateToMs(DateTime? date) => date?.millisecondsSinceEpoch ?? 0;

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
