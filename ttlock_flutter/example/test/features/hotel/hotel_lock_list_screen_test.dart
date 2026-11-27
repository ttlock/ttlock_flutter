import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations_zh.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_state.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_lock_list_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeHotelLockListNotifier extends HotelLockListNotifier {
  _FakeHotelLockListNotifier(this._value);

  final HotelLockListState _value;

  @override
  Future<HotelLockListState> build() async => _value;
}

Widget wrap(HotelLockListState state) => ProviderScope(
  overrides: [
    hotelLockListNotifierProvider.overrideWith(
      () => _FakeHotelLockListNotifier(state),
    ),
  ],
  child: const MaterialApp(home: HotelLockListScreen()),
);

void main() {
  testWidgets('total 为 0 时展示说明性空态而非「暂无数据」', (tester) async {
    await tester.pumpWidget(wrap(const HotelLockListState()));
    await tester.pumpAndSettle();

    // 生成的 l10n 类有默认构造，直接实例化即可；`delegate` 定义在**基类**
    // `AppLocalizations` 上（`app_localizations.dart`），不在 `AppLocalizationsZh` 上。
    final l10n = AppLocalizationsZh();
    expect(find.text(l10n.hotelEmptyTitle), findsOneWidget);
    expect(find.textContaining('通通酒店'), findsOneWidget);
  });

  testWidgets('有数据时按楼栋楼层分组渲染', (tester) async {
    await tester.pumpWidget(
      wrap(
        const HotelLockListState(
          pageState: PageState<HotelLockEntity>(
            data: [
              HotelLockEntity(
                lockId: 1,
                lockAlias: '101',
                buildingName: 'A栋',
                floorName: '1楼',
              ),
            ],
            total: 1,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 组标题是 `'$building · $floor'`；卡片上的楼栋/楼层刻意渲染成
    // `'$building $floor'`（空格、无 `·`），故这里只应命中组标题 1 个。
    expect(find.text('A栋 · 1楼'), findsOneWidget);
    expect(find.text('101'), findsOneWidget);
  });

  testWidgets('无 lockData 时展示「不支持」且无右箭头', (tester) async {
    final l10n = AppLocalizationsZh();
    await tester.pumpWidget(
      wrap(
        const HotelLockListState(
          pageState: PageState<HotelLockEntity>(
            data: [
              HotelLockEntity(
                lockId: 2,
                lockAlias: '202',
                buildingName: 'B栋',
                floorName: '2楼',
              ),
            ],
            total: 1,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(l10n.hotelNotSupported), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });
}
