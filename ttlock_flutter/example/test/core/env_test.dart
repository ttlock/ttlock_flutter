import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/env/app_mode.dart';

void main() {
  test('AppEnv defaults to onPremise', () {
    // --dart-define=mode not set, defaults to onPremise
    expect(AppEnv.isOnPremise, true);
    expect(AppEnv.isOnline, false);
  });

  test('AppMode enum values', () {
    expect(AppMode.onPremise, isA<AppMode>());
    expect(AppMode.online, isA<AppMode>());
    expect(AppMode.values.length, 2);
  });
}
