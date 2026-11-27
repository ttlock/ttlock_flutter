import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/theme/app_theme.dart';
import 'package:ttlock_flutter_demo/core/theme/theme_provider.dart';

void main() {
  test('appThemeProvider 亮色基于 Material3', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final theme = container.read(appThemeProvider(ThemeMode.light));
    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.brightness, Brightness.light);
    expect(theme.scaffoldBackgroundColor, isNot(Colors.white));
  });

  test('darkTheme 亮度为 dark 且主色种子生效', () {
    final dark = AppTheme.dark();
    expect(dark.colorScheme.brightness, Brightness.dark);
    expect(dark.colorScheme.primary, isNot(equals(dark.colorScheme.surface)));
  });
}
