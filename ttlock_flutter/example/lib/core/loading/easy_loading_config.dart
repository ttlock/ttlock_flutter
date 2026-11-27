import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:ttlock_flutter_demo/core/theme/app_colors.dart';

/// 全局 loading 样式，仅在 main() 启动时调用一次。
/// 深色半透明卡片 + 白色指示器，明暗两套主题下均清晰。
void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.surfaceDark.withValues(alpha: 0.9)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..progressColor = Colors.white
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false
    ..radius = 12.0;
}
