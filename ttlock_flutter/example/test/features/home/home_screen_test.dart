import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/screen/home_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（Riverpod 2 运行期注入限制）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<LockEntity>> listLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => _mock.listLocks(pageNo: pageNo, pageSize: pageSize, groupId: groupId);
}

void main() {
  testWidgets('空态显示提示 + FAB', (tester) async {
    final domain = _MockLockDomain();
    when(
      () => domain.listLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer((_) => TaskEither.right(const PageState<LockEntity>()));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();
    final container = ProviderScope.containerOf(
      tester.element(find.byType(HomeScreen)),
    );
    final l10n = container.read(l10nProvider);
    expect(find.text(l10n.noLocks), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('渲染锁卡片', (tester) async {
    final domain = _MockLockDomain();
    when(
      () => domain.listLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(
          data: [
            LockEntity(
              lockId: 1,
              lockAlias: '大门',
              lockName: 'BT-1',
              groupName: '4栋',
            ),
          ],
          total: 1,
        ),
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();
    // 数据字段可用字面量；用户可见空态/按钮文案必须走 l10n
    expect(find.text('大门'), findsOneWidget);
    expect(find.text('BT-1'), findsOneWidget);
    expect(find.text('4栋'), findsOneWidget);
    expect(find.byKey(const Key('lock_card_1')), findsOneWidget);
  });
}
