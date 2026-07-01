import 'command_category.dart';

enum AccessoryCommand {
  startScan(category: CommandCategory.basic),
  init(category: CommandCategory.basic),
  getStoredLocks(category: CommandCategory.basic),
  deleteStoredLock(category: CommandCategory.basic),
  addFingerprint(category: CommandCategory.fingerprint),
  addCard(category: CommandCategory.card),
  initDoorSensor(category: CommandCategory.basic),
  initStandaloneDoorSensor(category: CommandCategory.basic),
  readFeatureValue(category: CommandCategory.advanced),
  checkSupport(category: CommandCategory.advanced);

  const AccessoryCommand({required this.category});
  final CommandCategory category;
}
