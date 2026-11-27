import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';

abstract class GatewayRepositoryInterface {
  TaskEither<AppException, PageState<GatewayEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 0,
  });

  TaskEither<AppException, GatewayEntity> detail(int gatewayId);

  TaskEither<AppException, Unit> rename(int gatewayId, String name);

  TaskEither<AppException, Unit> delete(int gatewayId);

  TaskEither<AppException, List<GatewayEntity>> listByLock(int lockId);

  TaskEither<AppException, int> confirmInitSuccess(String gatewayNetMac);
}
