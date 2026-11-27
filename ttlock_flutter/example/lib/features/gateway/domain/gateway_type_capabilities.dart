import 'package:ttlock_flutter/ttlock_flutter.dart';

/// G2 / G5 / G6 需配 Wi-Fi；G3 / G4 自带蜂窝网络，跳过 Wi-Fi 扫描。
bool gatewayNeedsWifi(TTGatewayType type) =>
    type == TTGatewayType.g2 ||
    type == TTGatewayType.g5 ||
    type == TTGatewayType.g6;

/// G2 / G5 / G6（Wi-Fi）与 G3（有线）支持静态 IP；G4 不支持。
bool gatewaySupportsStaticIp(TTGatewayType type) =>
    type == TTGatewayType.g2 ||
    type == TTGatewayType.g3 ||
    type == TTGatewayType.g5 ||
    type == TTGatewayType.g6;

/// 仅 G4 支持可选 APN 配置。
bool gatewayNeedsApn(TTGatewayType type) => type == TTGatewayType.g4;
