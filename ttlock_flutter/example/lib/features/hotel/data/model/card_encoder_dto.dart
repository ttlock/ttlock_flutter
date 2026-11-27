// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_encoder_dto.freezed.dart';
part 'card_encoder_dto.g.dart';

/// `/v3/cardEncoder/getHotelInfo` 响应：`{ "hotelInfo": "<base64>" }`
@freezed
abstract class HotelInfoDto with _$HotelInfoDto {
  const HotelInfoDto._();
  const factory HotelInfoDto({
    @JsonKey(name: 'hotelInfo') @Default('') String hotelInfo,
  }) = _HotelInfoDto;

  factory HotelInfoDto.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoDtoFromJson(json);

  /// 服务端未返回时为空串；调用方按 `Left(-29)` 处理空值。
  String toEntity() => hotelInfo.trim();
}

/// `/v3/cardEncoder/getIcKey` 响应：`{ "icKey": "<hex>" }`
@freezed
abstract class IcKeyDto with _$IcKeyDto {
  const IcKeyDto._();
  const factory IcKeyDto({@JsonKey(name: 'icKey') @Default('') String icKey}) =
      _IcKeyDto;

  factory IcKeyDto.fromJson(Map<String, dynamic> json) =>
      _$IcKeyDtoFromJson(json);

  String toEntity() => icKey.trim();
}
