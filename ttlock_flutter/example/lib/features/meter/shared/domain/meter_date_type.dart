/// 用量记录查询的日期粒度（`listRecords.md:25`：`0` 日 / `1` 月 / `2` 年）。
///
/// 只有这三个值有文档出处。Plan 2A 之前两个详情 Notifier 里的
/// `defaultDateType = 4` **无文档出处**，已随内联记录列表一并删除；
/// 记录页一律用 0/1/2。
enum MeterDateType {
  day(0),
  month(1),
  year(2);

  const MeterDateType(this.value);

  final int value;

  /// `dateStr` 必须与粒度对齐：`2024-09-06` / `2024-09` / `2024`
  /// （`listRecords.md:26`）。
  String dateStr(DateTime at) {
    final y = at.year.toString().padLeft(4, '0');
    final m = at.month.toString().padLeft(2, '0');
    return switch (this) {
      MeterDateType.day => '$y-$m-${at.day.toString().padLeft(2, '0')}',
      MeterDateType.month => '$y-$m',
      MeterDateType.year => y,
    };
  }
}
