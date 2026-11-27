import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/data_source/card_encoder_data_source.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/repository/card_encoder_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';

part 'card_encoder_repository.g.dart';

@Riverpod(keepAlive: true)
class CardEncoderRepository extends _$CardEncoderRepository
    implements CardEncoderRepositoryInterface {
  late final CardEncoderDataSource _ds;

  @override
  void build() => _ds = ref.watch(cardEncoderDataSourceProvider.notifier);

  @override
  TaskEither<AppException, String> getHotelInfo() =>
      _ds.getHotelInfo().flatMap(_nonEmpty);

  @override
  TaskEither<AppException, String> getIcKey() =>
      _ds.getIcKey().flatMap(_nonEmpty);

  /// 服务端「有响应但字段为空」按不可用处理，避免空串流向 BLE 写入。
  TaskEither<AppException, String> _nonEmpty(String value) => value.isEmpty
      ? TaskEither.left(
          AppException.business(
            code: kCardEncoderUnavailableCode,
            message: 'card_encoder_unavailable',
          ),
        )
      : TaskEither.right(value);
}
