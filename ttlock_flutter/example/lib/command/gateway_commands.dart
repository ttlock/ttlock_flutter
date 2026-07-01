import 'command_category.dart';

enum GatewayCommand {
  connect(category: CommandCategory.basic),
  disconnect(category: CommandCategory.basic),
  init(category: CommandCategory.basic),
  getNearbyWifi(category: CommandCategory.network),
  configIp(category: CommandCategory.network),
  configApn(category: CommandCategory.network),
  getNetworkMac(category: CommandCategory.basic),
  enterUpgradeMode(category: CommandCategory.advanced);

  const GatewayCommand({required this.category});
  final CommandCategory category;
}
