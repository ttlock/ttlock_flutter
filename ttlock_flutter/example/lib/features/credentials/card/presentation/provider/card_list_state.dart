import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';

part 'card_list_state.freezed.dart';

@freezed
abstract class CardListState with _$CardListState {
  const CardListState._();
  const factory CardListState({@Default([]) List<IdentityCardEntity> items}) =
      _CardListState;
}
