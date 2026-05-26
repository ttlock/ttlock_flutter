import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/theme/app_colors.dart';
import 'package:ttlock_flutter_example/core/theme/app_theme.dart';

void main() {
  test('AppColors light colors are defined', () {
    expect(AppColors.primary, isNotNull);
    expect(AppColors.secondary, isNotNull);
    expect(AppColors.surface, isNotNull);
    expect(AppColors.error, isNotNull);
    expect(AppColors.success, isNotNull);
    expect(AppColors.warning, isNotNull);
  });

  test('AppTheme light theme is created', () {
    final theme = AppTheme.light;
    expect(theme, isNotNull);
    expect(theme.brightness, Brightness.light);
    expect(theme.useMaterial3, true);
  });

  test('AppTheme dark theme is created', () {
    final theme = AppTheme.dark;
    expect(theme, isNotNull);
    expect(theme.brightness, Brightness.dark);
    expect(theme.useMaterial3, true);
  });
}
