import 'package:freezed_annotation/freezed_annotation.dart';

part 'gateway.freezed.dart';

enum GatewayVersion {
  g1(1, 'G1'),
  g2(2, 'G2'),
  g3(3, 'G3'),
  g4(4, 'G4');

  const GatewayVersion(this.value, this.label);

  final int value;
  final String label;

  static GatewayVersion fromValue(int? v) =>
      values.firstWhere((e) => e.value == v, orElse: () => GatewayVersion.g2);
}

@freezed
abstract class GatewayEntity with _$GatewayEntity {
  const GatewayEntity._();
  const factory GatewayEntity({
    @Default(0) int gatewayId,
    @Default('') String gatewayMac,
    @Default('') String gatewayName,
    @Default(GatewayVersion.g2) GatewayVersion gatewayVersion,
    @Default('') String networkName,
    @Default('') String networkMac,
    @Default(0) int lockNum,
    @Default(false) bool isOnline,
  }) = _GatewayEntity;
}
