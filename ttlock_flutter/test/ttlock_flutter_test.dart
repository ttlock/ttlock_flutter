import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';

void main() {
  test('exports TTLock facade', () {
    expect(TTLock.printLog, isFalse);
  });
}
