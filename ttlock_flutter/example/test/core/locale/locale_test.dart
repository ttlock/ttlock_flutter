import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';

void main() {
  test('localeProvider 默认 zh', () {
    final c = ProviderContainer();
    addTearDown(c.dispose);
    expect(c.read(localeProvider), const Locale('zh'));
  });

  test('getUserFriendlyMessage 映射网络/业务异常', () {
    final c = ProviderContainer();
    addTearDown(c.dispose);
    final l10n = c.read(l10nProvider);

    expect(
      getUserFriendlyMessage(
        AppException.network(exception: 'x', message: 'raw'),
        l10n,
      ),
      l10n.errorNetwork,
    );
    expect(
      getUserFriendlyMessage(
        AppException.business(code: 1, message: '服务端提示'),
        l10n,
      ),
      '服务端提示',
    );
    expect(
      getUserFriendlyMessage(
        const AppException.business(
          code: -11,
          message: 'bluetooth_permission_denied',
        ),
        l10n,
      ),
      l10n.bluetoothPermissionDenied,
    );
  });

  test('getUserFriendlyMessage 映射键盘录入超时 -28', () {
    final c = ProviderContainer();
    addTearDown(c.dispose);
    final l10n = c.read(l10nProvider);

    // 未登记时这里会走 default 分支，把英文哨兵 'enroll_timeout' 直接丢给用户。
    expect(
      getUserFriendlyMessage(
        const AppException.business(code: -28, message: 'enroll_timeout'),
        l10n,
      ),
      l10n.enrollTimeout,
    );
  });
}
