import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_list_state.dart';

part 'card_list_notifier.g.dart';

@Riverpod()
class CardListNotifier extends _$CardListNotifier {
  int _lockId = 0;

  @override
  Future<CardListState> build(int lockId) async {
    _lockId = lockId;
    final items = await _load(lockId);
    return CardListState(items: items);
  }

  Future<List<IdentityCardEntity>> _load(int lockId) async {
    final r = await ref.read(cardDomainProvider.notifier).list(lockId).run();
    return r.fold((err) => throw err, (items) => items);
  }

  Future<void> refresh() async {
    final items = await _load(_lockId);
    state = AsyncValue.data(CardListState(items: items));
  }
}
