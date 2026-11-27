import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

void main() {
  group('AppException helpers', () {
    test('business 10004 判定 isAuthException', () {
      final e = AppException.business(code: 10004, message: 'token 失效');
      expect(e.isAuthException, isTrue);
    });
    test('network 类型判定 isNetworkException', () {
      final e = AppException.network(exception: 'x', message: 'net');
      expect(e.isNetworkException, isTrue);
    });
  });
}
