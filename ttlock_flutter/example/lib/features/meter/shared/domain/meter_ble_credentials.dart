import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_kind.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'meter_ble_credentials.g.dart';

/// BLE 指令通道所需的三元组。
@immutable
class MeterBleCredentials {
  const MeterBleCredentials({
    required this.url,
    required this.clientId,
    required this.token,
  });

  /// 表计指令端点（站点专用域名，非云 API 基址）。
  final String url;
  final String clientId;
  final String token;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeterBleCredentials &&
          other.url == url &&
          other.clientId == clientId &&
          other.token == token;

  @override
  int get hashCode => Object.hash(url, clientId, token);
}

/// 解析 BLE 凭证。
///
/// 原来是 water / electric 各自的私有 `_credentials()`；共享层拿不到，提到
/// `shared/domain` 并参数化 [MeterKind]。凭证缺失 → business(-32)，与既有口径一致。
@Riverpod(keepAlive: true)
class MeterBleCredentialsResolver extends _$MeterBleCredentialsResolver {
  @override
  void build() {}

  TaskEither<AppException, MeterBleCredentials> resolve(MeterKind kind) =>
      TaskEither.tryCatch(() async {
        final config = await ref
            .read(appConfigDomainProvider.notifier)
            .load()
            .run()
            .then((r) => r.fold((e) => throw e, (v) => v));
        final token = ref.read(userProvider)?.accessToken;
        if (config.clientId.isEmpty || token == null || token.isEmpty) {
          throw AppException.business(
            code: -32,
            message: 'meter_config_missing',
          );
        }
        return MeterBleCredentials(
          url: resolveMeterCommandUrl(
            config.site,
            kind == MeterKind.water ? 'waterMeter' : 'electricMeter',
          ),
          clientId: config.clientId,
          token: token,
        );
      }, ExceptionUtils.extractAppException);
}
