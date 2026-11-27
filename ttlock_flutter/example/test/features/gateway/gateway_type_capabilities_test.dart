import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/gateway_type_capabilities.dart';

void main() {
  test('G2/G5/G6 需要配 Wi-Fi，G3/G4 不需要', () {
    expect(gatewayNeedsWifi(TTGatewayType.g2), isTrue);
    expect(gatewayNeedsWifi(TTGatewayType.g5), isTrue);
    expect(gatewayNeedsWifi(TTGatewayType.g6), isTrue);
    expect(gatewayNeedsWifi(TTGatewayType.g3), isFalse);
    expect(gatewayNeedsWifi(TTGatewayType.g4), isFalse);
  });

  test('G2/G3/G5/G6 支持静态 IP，G4 不支持', () {
    expect(gatewaySupportsStaticIp(TTGatewayType.g2), isTrue);
    expect(gatewaySupportsStaticIp(TTGatewayType.g3), isTrue);
    expect(gatewaySupportsStaticIp(TTGatewayType.g5), isTrue);
    expect(gatewaySupportsStaticIp(TTGatewayType.g6), isTrue);
    expect(gatewaySupportsStaticIp(TTGatewayType.g4), isFalse);
  });

  test('仅 G4 需要 APN 配置入口', () {
    expect(gatewayNeedsApn(TTGatewayType.g4), isTrue);
    expect(gatewayNeedsApn(TTGatewayType.g2), isFalse);
    expect(gatewayNeedsApn(TTGatewayType.g3), isFalse);
    expect(gatewayNeedsApn(TTGatewayType.g5), isFalse);
    expect(gatewayNeedsApn(TTGatewayType.g6), isFalse);
  });
}
