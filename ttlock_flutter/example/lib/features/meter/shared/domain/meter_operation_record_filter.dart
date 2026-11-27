/// 操作记录**请求侧**的 `recordType` 筛选值域
/// （`electricMeter/admin/listOperationRecords.md:27`，水表同构）。
///
/// ⚠ 与**响应侧**值域是两套值，不能混用（spec §6.4）：请求侧 `1` 是充值，
/// 响应侧 `1` 却是「清除剩余电量」。响应侧映射在各 feature 自己的
/// `*_operation_record_label.dart` 里，值域也不同（水表 `8` = 设置水量，
/// 电表 `8` = 充值中）。
///
/// 水表 `2` / `3` 语义是「断水 / 通水」，与本枚举的断电/通电共用同一批值，
/// 文案差异由各 feature 选自己的 l10n key 承担。
enum MeterOperationRecordFilter {
  recharge('1'),
  powerOff('2'),
  powerOn('3'),
  read('4'),
  price('5'),
  clear('6');

  const MeterOperationRecordFilter(this.value);

  final String value;
}
