import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

/// 操作记录**响应侧** `recordType` → 文案。
///
/// 值域出处：`waterMeter/admin/listOperationRecords.md:44` ——
/// `-1` 日期间隔 · `1` 清除剩余水量 · `2` 付费类型切换 · `4` 通断水 ·
/// `5` 抄表 · `6` 更新单价 · `7` 充值 · **`8` 设置水量** · **`9` 充值中**。
///
/// ⚠ 水表 `8` 是「设置水量」而电表 `8` 是「充值中」；水表的「充值中」是 `9`。
/// ⚠ 与**请求侧筛选**值域（`MeterOperationRecordFilter`）是两套值。
/// `-1` 由界面按分隔行处理，不会走到这里。
String waterMeterOperationRecordText(
  AppLocalizations l10n,
  String recordType,
) => switch (recordType) {
  '1' => l10n.meterRecordTypeClearRemainderWater,
  '2' => l10n.meterRecordTypePayModeSwitch,
  '4' => l10n.meterRecordTypePowerOnOffWater,
  '5' => l10n.meterRecordTypeRead,
  '6' => l10n.meterRecordTypePrice,
  '7' => l10n.meterRecordTypeRecharge,
  '8' => l10n.meterRecordTypeSetTotalUsage,
  '9' => l10n.meterRecordTypePaying,
  _ => recordType,
};
