import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/theme/app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() => _base(Brightness.light, AppColors.seed);
  static ThemeData dark() => _base(Brightness.dark, AppColors.seed);

  static ThemeData _base(Brightness brightness, Color seed) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? AppColors.surface
          : AppColors.surfaceDark,
      appBarTheme: AppBarTheme(
        backgroundColor: brightness == Brightness.light
            ? AppColors.surface
            : AppColors.surfaceDark,
        elevation: 0,
      ),
    );
  }
}
