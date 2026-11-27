import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';

part 'app_config.freezed.dart';

@freezed
abstract class AppConfig with _$AppConfig {
  const AppConfig._();
  const factory AppConfig({
    @Default('') String clientId,
    @Default('') String clientSecret,
    @Default(AppSite.cn) AppSite site,
  }) = _AppConfig;

  String get baseUrl => site.baseUrl;

  /// 开放平台应用凭证是否已填写（本地持久化或 config.json 预填）。
  bool get hasCredentials =>
      clientId.trim().isNotEmpty && clientSecret.trim().isNotEmpty;
}
