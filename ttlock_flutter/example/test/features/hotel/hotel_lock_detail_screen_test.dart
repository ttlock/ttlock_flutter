import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_detail_state.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/screen/hotel_lock_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeHotelLockDetailNotifier extends HotelLockDetailNotifier {
  _FakeHotelLockDetailNotifier(this._value);

  final HotelLockDetailState _value;

  @override
  HotelLockDetailState build(HotelLockDetailArgs args) => _value;
}

const _lock = HotelLockEntity(lockId: 7, lockAlias: '大门锁', sector: '1,2');

Widget wrap(HotelLockDetailState state, {int hotelType = 1}) => ProviderScope(
  overrides: [
    hotelLockDetailNotifierProvider(
      const HotelLockDetailArgs(lock: _lock),
    ).overrideWith(() => _FakeHotelLockDetailNotifier(state)),
  ],
  child: MaterialApp(
    home: HotelLockDetailScreen(
      lockId: 7,
      hotelLock: _lock,
      hotelType: hotelType,
    ),
  ),
);

void main() {
  testWidgets('cloudPending 时展示可重试横幅', (tester) async {
    await tester.pumpWidget(
      wrap(
        const HotelLockDetailState(
          lock: _lock,
          cloudPending: true,
          pendingSector: '3,4',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('hotel_cloud_pending_banner')), findsOneWidget);
    expect(find.byKey(const Key('hotel_cloud_retry')), findsOneWidget);
  });

  testWidgets('非 cloudPending 时不展示横幅', (tester) async {
    await tester.pumpWidget(wrap(const HotelLockDetailState(lock: _lock)));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('hotel_cloud_pending_banner')), findsNothing);
  });

  testWidgets('展示锁信息区与四个操作入口', (tester) async {
    await tester.pumpWidget(wrap(const HotelLockDetailState(lock: _lock)));
    await tester.pumpAndSettle();

    expect(find.text('大门锁'), findsWidgets);
    expect(find.byKey(const Key('hotel_action_sector')), findsOneWidget);
    expect(find.byKey(const Key('hotel_action_building')), findsOneWidget);
    expect(find.byKey(const Key('hotel_action_ic_key')), findsOneWidget);
    expect(find.byKey(const Key('hotel_action_open_lock')), findsOneWidget);
    expect(find.byKey(const Key('hotel_action_lift_work_mode')), findsNothing);
    expect(find.byKey(const Key('hotel_action_lift_controlable')), findsNothing);
    expect(find.byKey(const Key('hotel_action_lift_activate')), findsNothing);
  });

  testWidgets('hotelType=2：展示梯控三入口', (tester) async {
    await tester.pumpWidget(
      wrap(const HotelLockDetailState(lock: _lock), hotelType: 2),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('hotel_action_lift_work_mode')), findsOneWidget);
    expect(
      find.byKey(const Key('hotel_action_lift_controlable')),
      findsOneWidget,
    );
    expect(find.byKey(const Key('hotel_action_lift_activate')), findsOneWidget);
  });

  testWidgets('state.lock 更新后扇区副标题跟着变', (tester) async {
    await tester.pumpWidget(
      wrap(
        HotelLockDetailState(lock: _lock.copyWith(sector: '3,4,5')),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('3,4,5'), findsOneWidget);
  });
}
