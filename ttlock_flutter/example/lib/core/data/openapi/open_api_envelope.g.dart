// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_api_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenApiEnvelope _$OpenApiEnvelopeFromJson(Map<String, dynamic> json) =>
    _OpenApiEnvelope(
      errcode: (json['errcode'] as num?)?.toInt() ?? 0,
      errmsg: json['errmsg'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$OpenApiEnvelopeToJson(_OpenApiEnvelope instance) =>
    <String, dynamic>{
      'errcode': instance.errcode,
      'errmsg': instance.errmsg,
      'description': instance.description,
    };
