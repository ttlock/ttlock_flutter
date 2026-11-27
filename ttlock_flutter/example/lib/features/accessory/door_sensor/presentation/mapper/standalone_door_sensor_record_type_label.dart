import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

/// 独立门磁 listRecord.recordType：0 闭合 / 1 打开 / 2 未关门报警 / 3 久未打开报警。
String standaloneDoorSensorRecordTypeLabel(
  AppLocalizations l10n,
  int recordType,
) => switch (recordType) {
  0 => l10n.standaloneDoorClosed,
  1 => l10n.standaloneDoorOpen,
  2 => l10n.standaloneDoorNotCloseAlert,
  3 => l10n.standaloneDoorLongTimeNotOpenAlert,
  _ => '$recordType',
};
