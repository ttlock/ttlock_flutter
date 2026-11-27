import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/theme/app_theme.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
ThemeData appTheme(Ref ref, ThemeMode mode) =>
    mode == ThemeMode.dark ? AppTheme.dark() : AppTheme.light();

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() => ThemeMode.system;

  void set(ThemeMode mode) => state = mode;
}
