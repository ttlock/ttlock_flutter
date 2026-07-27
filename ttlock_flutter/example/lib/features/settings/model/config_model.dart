import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/env/app_mode.dart';

part 'config_model.freezed.dart';
part 'config_model.g.dart';

/// 在线版服务器区域：中国 / 全球。
@JsonEnum(alwaysCreate: true)
enum ServerRegion {
  @JsonValue('china')
  china,
  @JsonValue('global')
  global,
}

@freezed
abstract class ConfigModel with _$ConfigModel {
  const ConfigModel._();

  const factory ConfigModel({
    @Default(0) int uid,
    String? password,
    String? serverIp,
    String? serverPort,
    @Default(ServerRegion.china) ServerRegion serverRegion,
  }) = _ConfigModel;

  /// Returns null when configuration is complete for the current environment.
  String? get validationError {
    if (uid <= 0) return 'UID is required';
    if (AppEnv.isOnline) {
      if (password == null || password!.isEmpty) return 'Password is required';
      return null;
    }
    if (serverIp == null || serverIp!.isEmpty) return 'Server IP is required';
    return null;
  }

  bool get isValid => validationError == null;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => _$ConfigModelFromJson(json);
}
