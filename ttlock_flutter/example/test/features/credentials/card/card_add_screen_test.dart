import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/screen/card_add_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

const _lock = LockEntity(lockId: 1, lockData: 'ld');

/// class 型 Notifier 的 override 必须用可构造子类，且只 override 被测方法。
class _FakeCardAddNotifier extends CardAddNotifier {
  _FakeCardAddNotifier(this.retryResult);

  final bool retryResult;

  /// 起点就是「锁里已有该卡、云端未登记」的待重试态。
  @override
  CardAddState build(CardAddArgs args) =>
      const CardAddState(pendingRegister: true, pendingCardNumber: '123');

  @override
  Future<bool> retryRegister() async => retryResult;
}

/// 录入页要被真实 Navigator push/pop 才能观察到 `Navigator.pop` 的回传值。
Widget _hosted(_FakeCardAddNotifier notifier, void Function(bool?) onPopped) {
  const args = CardAddArgs(lock: _lock);
  return ProviderScope(
    overrides: [cardAddProvider(args).overrideWith(() => notifier)],
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              key: const Key('open_add'),
              onPressed: () async => onPopped(
                await Navigator.of(context).push<bool>(
                  MaterialPageRoute<bool>(
                    builder: (_) => const CardAddScreen(lock: _lock),
                  ),
                ),
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('重试登记成功后关闭录入页并回传 true', (tester) async {
    bool? popped;
    await tester.pumpWidget(
      _hosted(_FakeCardAddNotifier(true), (v) => popped = v),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('open_add')));
    await tester.pumpAndSettle();
    expect(find.byType(CardAddScreen), findsOneWidget);

    await tester.tap(find.byKey(const Key('card_pending_register_retry')));
    await tester.pumpAndSettle();

    // 重试成功 == 云端也登记上了。留在表单上会让列表收不到 true，
    // 这张已经登记的卡要手动下拉才出现——与 start() 的成功路径必须一致。
    expect(find.byType(CardAddScreen), findsNothing);
    expect(popped, isTrue);
  });

  testWidgets('重试登记失败时留在录入页，不回传结果', (tester) async {
    bool? popped;
    await tester.pumpWidget(
      _hosted(_FakeCardAddNotifier(false), (v) => popped = v),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('open_add')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('card_pending_register_retry')));
    await tester.pumpAndSettle();

    expect(find.byType(CardAddScreen), findsOneWidget);
    expect(popped, isNull);
  });
}
