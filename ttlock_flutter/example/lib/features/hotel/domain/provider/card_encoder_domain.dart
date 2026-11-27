import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/hotel/data/repository/card_encoder_repository.dart';
import 'package:ttlock_flutter_demo/features/hotel/domain/repository/card_encoder_repository_interface.dart';

part 'card_encoder_domain.g.dart';

/// cardEncoder 域编排（纯云端）。
///
/// 两接口是**收费功能**且要求账号已创建酒店；失败时返回 `Left(-29)`，
/// 页面据此给出「需已创建酒店」的说明文案。
@Riverpod(keepAlive: true)
class CardEncoderDomain extends _$CardEncoderDomain {
  late final CardEncoderRepositoryInterface _repo;

  @override
  void build() => _repo = ref.watch(cardEncoderRepositoryProvider.notifier);

  TaskEither<AppException, String> getHotelInfo() => _repo.getHotelInfo();

  TaskEither<AppException, String> getIcKey() => _repo.getIcKey();
}
