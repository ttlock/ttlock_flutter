import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_quantity.dart';

void main() {
  test('数值与单位之间留一个空格', () {
    expect(meterQuantity('9.89', '千瓦时'), '9.89 千瓦时');
    expect(meterQuantity('10.00', '吨'), '10.00 吨');
    expect(meterQuantity('255', '千瓦'), '255 千瓦');
  });

  test('空值返回空串 —— 交给展示层落占位符，不出现「只有单位」', () {
    expect(meterQuantity('', '千瓦时'), '');
    expect(meterQuantity('   ', '吨'), '');
  });

  test('两侧空白先 trim', () {
    expect(meterQuantity(' 9.89 ', '千瓦时'), '9.89 千瓦时');
  });
}
