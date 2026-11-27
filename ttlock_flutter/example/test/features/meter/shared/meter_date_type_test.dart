import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';

void main() {
  final at = DateTime(2024, 9, 6, 14, 59, 34);

  test('value 与云文档 0/1/2 对齐', () {
    expect(MeterDateType.day.value, 0);
    expect(MeterDateType.month.value, 1);
    expect(MeterDateType.year.value, 2);
  });

  test('dateStr 与粒度对齐（listRecords.md:26）', () {
    expect(MeterDateType.day.dateStr(at), '2024-09-06');
    expect(MeterDateType.month.dateStr(at), '2024-09');
    expect(MeterDateType.year.dateStr(at), '2024');
  });

  test('月/日补零', () {
    final jan = DateTime(2024, 1, 5);
    expect(MeterDateType.day.dateStr(jan), '2024-01-05');
    expect(MeterDateType.month.dateStr(jan), '2024-01');
  });
}
