// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_api_envelope.freezed.dart';
part 'open_api_envelope.g.dart';

@freezed
abstract class OpenApiEnvelope with _$OpenApiEnvelope {
  const OpenApiEnvelope._();
  const factory OpenApiEnvelope({
    @JsonKey(name: 'errcode') @Default(0) int errcode,
    @JsonKey(name: 'errmsg') @Default('') String errmsg,
    @JsonKey(name: 'description') @Default('') String description,
  }) = _OpenApiEnvelope;

  factory OpenApiEnvelope.fromJson(Map<String, dynamic> json) =>
      _$OpenApiEnvelopeFromJson(json);
  bool get isOk => errcode == 0;
}
