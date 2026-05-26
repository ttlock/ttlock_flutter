import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/env/app_mode.dart';

part 'config_model.freezed.dart';
part 'config_model.g.dart';

@freezed
abstract class ConfigModel with _$ConfigModel {
  const ConfigModel._();

  const factory ConfigModel({
    @Default(0) int uid,
    String? serverIp,
    String? serverPort,
    @Default('Gateway') String gatewayName,
  }) = _ConfigModel;

  bool get isValid {
    if (AppEnv.isOnPremise) {
      return serverIp != null && serverIp!.isNotEmpty &&
             serverPort != null && serverPort!.isNotEmpty;
    }
    return uid > 0;
  }

  factory ConfigModel.fromJson(Map<String, dynamic> json) => _$ConfigModelFromJson(json);
}
