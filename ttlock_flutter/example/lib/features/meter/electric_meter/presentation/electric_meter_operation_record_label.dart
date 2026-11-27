import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

/// 操作记录**响应侧** `recordType` → 文案。
///
/// 值域出处：`electricMeter/admin/listOperationRecords.md:44` ——
/// `-1` 日期间隔 · `1` 清除剩余电量 · `2` 付费类型切换 · `4` 通断电 ·
/// `5` 抄表 · `6` 更新单价 · `7` 充值 · `8` 充值中。
///
/// ⚠ 与**请求侧筛选**值域（`MeterOperationRecordFilter`）是两套值：请求侧 `1`
/// 是充值、`6` 是清零。**不要**把两者合并成一个 switch（spec §6.4）。
/// `-1` 由界面按分隔行处理，不会走到这里。
String electricMeterOperationRecordText(
  AppLocalizations l10n,
  String recordType,
) => switch (recordType) {
  '1' => l10n.meterRecordTypeClearRemainder,
  '2' => l10n.meterRecordTypePayModeSwitch,
  '4' => l10n.meterRecordTypePowerOnOff,
  '5' => l10n.meterRecordTypeRead,
  '6' => l10n.meterRecordTypePrice,
  '7' => l10n.meterRecordTypeRecharge,
  '8' => l10n.meterRecordTypePaying,
  _ => recordType,
};
