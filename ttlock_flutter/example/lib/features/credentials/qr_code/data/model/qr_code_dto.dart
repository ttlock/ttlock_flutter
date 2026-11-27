// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';

part 'qr_code_dto.freezed.dart';
part 'qr_code_dto.g.dart';

Map<String, dynamic> _normalizeQrCodeJson(Map<String, dynamic> json) {
  final normalized = Map<String, dynamic>.from(json);
  if ((normalized['name'] == null || normalized['name'].toString().isEmpty) &&
      normalized['qrCodeName'] != null) {
    normalized['name'] = normalized['qrCodeName'];
  }
  return normalized;
}

@freezed
abstract class QrCodeDto with _$QrCodeDto {
  const QrCodeDto._();
  const factory QrCodeDto({
    @JsonKey(name: 'qrCodeId', fromJson: intFromDynamic)
    @Default(0)
    int qrCodeId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'type', fromJson: intFromDynamic) @Default(1) int type,
    @JsonKey(name: 'qrCodeNumber', fromJson: stringFromDynamic)
    @Default('')
    String qrCodeNumber,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? endDate,
    @JsonKey(name: 'refreshTime', fromJson: intFromDynamic)
    @Default(0)
    int refreshTime,
    @JsonKey(name: 'cyclicConfig') @Default([]) List<CyclicConfig> cyclicConfig,
    @JsonKey(name: 'createDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? createDate,
    @JsonKey(name: 'status', fromJson: intFromDynamic) @Default(0) int status,
    @JsonKey(name: 'creator') @Default('') String creator,
    @JsonKey(name: 'link', fromJson: stringFromDynamic)
    @Default('')
    String link,
    @JsonKey(name: 'qrCodeVersion', fromJson: intFromDynamic)
    @Default(0)
    int qrCodeVersion,
    @JsonKey(name: 'qrCodeContent', fromJson: stringFromDynamic)
    @Default('')
    String qrCodeContent,
  }) = _QrCodeDto;

  factory QrCodeDto.fromJson(Map<String, dynamic> json) =>
      _$QrCodeDtoFromJson(_normalizeQrCodeJson(json));

  QrCodeEntity toEntity() => QrCodeEntity(
    qrCodeId: qrCodeId,
    lockId: lockId,
    type: QrCodeType.fromValue(type),
    qrCodeNumber: qrCodeNumber,
    name: name,
    startDate: startDate,
    endDate: endDate,
    refreshTime: refreshTime,
    cyclicConfig: cyclicConfig,
    createDate: createDate,
    status: status,
    creator: creator,
    link: link,
    qrCodeVersion: qrCodeVersion,
    qrCodeContent: qrCodeContent,
  );
}
