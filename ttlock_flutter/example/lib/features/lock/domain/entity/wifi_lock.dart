import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_lock.freezed.dart';

@freezed
abstract class WifiLockEntity with _$WifiLockEntity {
  const WifiLockEntity._();
  const factory WifiLockEntity({
    @Default('') String networkName,
    @Default('') String ip,
    @Default('') String subnetMask,
    @Default('') String defaultGateway,
    @Default('') String wifiMac,
    @Default(0) int rssiGrade,
    @Default(false) bool isOnline,
    @Default(0) int powerSavingMode,
    @Default('') String preferredDns,
    @Default('') String alternateDns,
  }) = _WifiLockEntity;
}
