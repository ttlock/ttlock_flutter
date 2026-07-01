import 'command_category.dart';

enum MeterCommand {
  waterConfigServer(category: CommandCategory.basic),
  waterConnect(category: CommandCategory.basic),
  waterInit(category: CommandCategory.basic),
  waterDisconnect(category: CommandCategory.basic),
  waterReadData(category: CommandCategory.basic),
  waterSetPower(category: CommandCategory.advanced),
  waterSetPayMode(category: CommandCategory.advanced),
  waterCharge(category: CommandCategory.advanced),
  waterGetFeatureValue(category: CommandCategory.advanced),
  waterGetDeviceInfo(category: CommandCategory.advanced),
  waterReset(category: CommandCategory.advanced),
  waterDelete(category: CommandCategory.advanced),
  electricConfigServer(category: CommandCategory.basic),
  electricConnect(category: CommandCategory.basic),
  electricInit(category: CommandCategory.basic),
  electricDisconnect(category: CommandCategory.basic),
  electricReadData(category: CommandCategory.basic),
  electricSetPower(category: CommandCategory.advanced),
  electricSetPayMode(category: CommandCategory.advanced),
  electricCharge(category: CommandCategory.advanced),
  electricSetMaxPower(category: CommandCategory.advanced),
  electricGetFeatureValue(category: CommandCategory.advanced),
  electricDelete(category: CommandCategory.advanced);

  const MeterCommand({required this.category});
  final CommandCategory category;
}
