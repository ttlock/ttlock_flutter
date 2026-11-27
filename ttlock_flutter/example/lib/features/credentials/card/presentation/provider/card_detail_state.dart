import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';

part 'card_detail_state.freezed.dart';

@freezed
abstract class CardDetailState with _$CardDetailState {
  const CardDetailState._();
  const factory CardDetailState({
    required IdentityCardEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _CardDetailState;
}
