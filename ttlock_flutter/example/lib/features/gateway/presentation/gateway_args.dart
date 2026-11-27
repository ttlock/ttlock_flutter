import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';

class GatewayDetailArgs {
  const GatewayDetailArgs({required this.gateway});

  final GatewayEntity gateway;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GatewayDetailArgs && other.gateway == gateway;

  @override
  int get hashCode => gateway.hashCode;
}
