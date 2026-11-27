// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';

part 'app_config_dto.freezed.dart';
part 'app_config_dto.g.dart';

@freezed
abstract class AppConfigDto with _$AppConfigDto {
  const AppConfigDto._();
  const factory AppConfigDto({
    @JsonKey(name: 'clientId') @Default('') String clientId,
    @JsonKey(name: 'clientSecret') @Default('') String clientSecret,
    @JsonKey(name: 'site') @Default('cn') String site,
  }) = _AppConfigDto;

  factory AppConfigDto.fromJson(Map<String, dynamic> json) =>
      _$AppConfigDtoFromJson(json);

  factory AppConfigDto.fromEntity(AppConfig entity) => AppConfigDto(
    clientId: entity.clientId,
    clientSecret: entity.clientSecret,
    site: entity.site.value,
  );

  AppConfig toEntity() => AppConfig(
    clientId: clientId,
    clientSecret: clientSecret,
    site: AppSite.fromValue(site),
  );
}
