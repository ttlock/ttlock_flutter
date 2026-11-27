import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

/// 让 [mapKeypadEnrollTimeout] 处理一条只发错的流，返回它放行/转换后的错误。
Future<Object?> _errorThrough(Stream<int> source) async {
  try {
    await mapKeypadEnrollTimeout(source).toList();
    return null;
  } on Object catch (e) {
    return e;
  }
}

void main() {
  test('键盘 timeout 异常转成 -28 业务码', () async {
    final caught = await _errorThrough(
      Stream<int>.error(
        TTMultifunctionalKeypadException(
          TTMultifunctionalKeypadError.timeout,
          '等待键盘刷卡超时',
        ),
      ),
    );

    expect(caught, isA<AppBusinessException>());
    expect((caught! as AppBusinessException).code, kKeypadEnrollTimeoutCode);
  });

  test('非键盘超时异常原样透传，不被转换', () async {
    final original = Exception('boom');
    final caught = await _errorThrough(Stream<int>.error(original));

    expect(caught, same(original));
  });

  test('非 timeout 的键盘异常原样透传，不被转换', () async {
    final original = TTMultifunctionalKeypadException(
      TTMultifunctionalKeypadError.failed,
      'keypad fail',
    );
    final caught = await _errorThrough(Stream<int>.error(original));

    expect(caught, same(original));
  });
}
