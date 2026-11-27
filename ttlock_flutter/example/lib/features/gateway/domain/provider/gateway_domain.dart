import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/repository/gateway_repository.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/repository/gateway_repository_interface.dart';

part 'gateway_domain.g.dart';

@Riverpod(keepAlive: true)
class GatewayDomain extends _$GatewayDomain {
  late final GatewayRepositoryInterface _repo;

  @override
  void build() => _repo = ref.watch(gatewayRepositoryProvider.notifier);

  TaskEither<AppException, PageState<GatewayEntity>> list({int pageNo = 1}) =>
      _repo.list(pageNo: pageNo);

  TaskEither<AppException, Unit> rename(int gatewayId, String name) =>
      _repo.rename(gatewayId, name);

  TaskEither<AppException, Unit> delete(int gatewayId) =>
      _repo.delete(gatewayId);

  /// SDK init 成功后 3 分钟内轮询；`gatewayId <= 0` 视为云端尚未注册。
  ///
  /// [gatewayNetMac] 是开放平台字段名，取值另有约定：APP SDK init 时若未以
  /// netMac 作为网关名称，需传「添加网关时自定义的网关名称」——本应用传名称。
  TaskEither<AppException, int> confirmInit(String gatewayNetMac) => _repo
      .confirmInitSuccess(gatewayNetMac)
      .flatMap(
        (id) => id > 0
            ? TaskEither.right(id)
            : TaskEither.left(
                AppException.business(
                  code: -31,
                  message: 'gateway_init_not_confirmed',
                ),
              ),
      );
}
