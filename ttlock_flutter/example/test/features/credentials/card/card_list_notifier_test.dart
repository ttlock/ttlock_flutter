import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_list_notifier.dart';

class _MockCardDomain extends Mock implements CardDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeCardDomain extends CardDomain {
  _FakeCardDomain(this._mock);
  final _MockCardDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId) =>
      _mock.list(lockId);
}

void main() {
  test('build 加载列表，refresh 重载', () async {
    final domain = _MockCardDomain();
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        IdentityCardEntity(cardId: 3, cardNumber: 'AA'),
      ]),
    );
    final container = ProviderContainer(
      overrides: [
        cardDomainProvider.overrideWith(() => _FakeCardDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(cardListProvider(1), (_, _) {});
    final n = container.read(cardListProvider(1).notifier);
    await container.read(cardListProvider(1).future);
    expect(n.state.value!.items.single.cardId, 3);
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        IdentityCardEntity(cardId: 9, cardNumber: 'BB'),
      ]),
    );
    await n.refresh();
    expect(n.state.value!.items.single.cardId, 9);
  });
}
