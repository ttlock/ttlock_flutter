import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_sector_sheet.dart';

void main() {
  test('encodeSector：升序、逗号分隔、从 1 计数', () {
    expect(encodeSector({3, 1, 2}), '1,2,3');
    expect(encodeSector({10, 1}), '1,10');
    expect(encodeSector(const <int>{}), '');
  });

  test('decodeSector：解析升序串', () {
    expect(decodeSector('1,2,3'), {1, 2, 3});
    expect(decodeSector(''), isEmpty);
  });

  test('decodeSector：容错——空白、乱序、重复、非法片段、越界值都丢弃', () {
    expect(decodeSector(' 3 , 1 ,1'), {1, 3});
    expect(decodeSector('1,a,2'), {1, 2});
    expect(decodeSector('0,11,-1,5'), {5});
  });

  test('encodeSector → decodeSector 往返一致', () {
    const selected = {2, 7, 10};
    expect(decodeSector(encodeSector(selected)), selected);
  });
}
