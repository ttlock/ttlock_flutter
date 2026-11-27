import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/features/lift/data/data_source/lift_api.dart';
import 'package:ttlock_flutter_demo/features/lift/data/model/lift_dto.dart';

part 'lift_data_source.g.dart';

@Riverpod(keepAlive: true)
LiftApi liftApi(Ref ref) => LiftApi(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
class LiftDataSource extends _$LiftDataSource {
  late final LiftApi _api;

  @override
  void build() {
    _api = ref.watch(liftApiProvider);
  }

  TaskEither<AppException, OpenApiEnvelope> activateFloors({
    required int lockId,
    required List<String> floors,
  }) => _write(
    () => _api.activateFloors(
      lockId: lockId,
      floorList: LiftDto.encodeFloorList(floors),
    ),
  );

  TaskEither<AppException, OpenApiEnvelope> _write(
    Future<OpenApiEnvelope> Function() call,
  ) => TaskEither.tryCatch(() async {
    final envelope = await call();
    if (!envelope.isOk) {
      throw AppException.business(
        code: envelope.errcode,
        message: envelope.errmsg.isEmpty
            ? envelope.description
            : envelope.errmsg,
      );
    }
    return envelope;
  }, ExceptionUtils.extractAppException);
}
