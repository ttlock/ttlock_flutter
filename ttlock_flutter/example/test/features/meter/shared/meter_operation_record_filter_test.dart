import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';

void main() {
  test('请求侧值域取自 listOperationRecords.md:27（两表一致）', () {
    expect(
      MeterOperationRecordFilter.values.map((e) => e.value).toList(),
      ['1', '2', '3', '4', '5', '6'],
    );
    expect(MeterOperationRecordFilter.recharge.value, '1');
    expect(MeterOperationRecordFilter.clear.value, '6');
  });
}
