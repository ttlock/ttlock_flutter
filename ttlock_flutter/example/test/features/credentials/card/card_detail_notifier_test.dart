import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockCardDomain extends Mock implements CardDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeCardDomain extends CardDomain {
  _FakeCardDomain(this._mock);
  final _MockCardDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required IdentityCardEntity card,
    required String name,
  }) => _mock.rename(lock: lock, card: card, name: name);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const IdentityCardEntity());
  });

  test('rename 转发 domain.rename，不经过 BLE', () async {
    final domain = _MockCardDomain();
    when(
      () => domain.rename(
        lock: any(named: 'lock'),
        card: any(named: 'card'),
        name: any(named: 'name'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const args = CardDetailArgs(
      lock: LockEntity(lockId: 1, lockData: 'ld'),
      item: IdentityCardEntity(cardId: 3, cardNumber: 'AA', cardName: 'old'),
    );
    final container = ProviderContainer(
      overrides: [
        cardDomainProvider.overrideWith(() => _FakeCardDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(cardDetailProvider(args).notifier);
    await n.rename('new');
    expect(n.state.item.cardName, 'new');
    verify(
      () => domain.rename(
        lock: args.lock,
        card: any(named: 'card'),
        name: 'new',
      ),
    ).called(1);
  });
}
