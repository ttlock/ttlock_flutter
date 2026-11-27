// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';

part 'wifi_lock_dto.freezed.dart';
part 'wifi_lock_dto.g.dart';

@freezed
abstract class WifiLockDto with _$WifiLockDto {
  const WifiLockDto._();
  const factory WifiLockDto({
    @JsonKey(name: 'networkName') @Default('') String networkName,
    @JsonKey(name: 'ip') @Default('') String ip,
    @JsonKey(name: 'subnetMask') @Default('') String subnetMask,
    @JsonKey(name: 'defaultGateway') @Default('') String defaultGateway,
    @JsonKey(name: 'wifiMac') @Default('') String wifiMac,
    @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)
    @Default(0)
    int rssiGrade,
    @JsonKey(name: 'isOnline', fromJson: boolFromDynamic)
    @Default(false)
    bool isOnline,
    @JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic)
    @Default(0)
    int powerSavingMode,
    @JsonKey(name: 'preferredDns') @Default('') String preferredDns,
    @JsonKey(name: 'alternateDns') @Default('') String alternateDns,
  }) = _WifiLockDto;

  factory WifiLockDto.fromJson(Map<String, dynamic> json) =>
      _$WifiLockDtoFromJson(json);

  WifiLockEntity toEntity() => WifiLockEntity(
    networkName: networkName,
    ip: ip,
    subnetMask: subnetMask,
    defaultGateway: defaultGateway,
    wifiMac: wifiMac,
    rssiGrade: rssiGrade,
    isOnline: isOnline,
    powerSavingMode: powerSavingMode,
    preferredDns: preferredDns,
    alternateDns: alternateDns,
  );
}
