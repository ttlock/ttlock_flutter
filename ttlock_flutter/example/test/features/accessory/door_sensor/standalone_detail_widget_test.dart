import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_alert_config_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_detail_screen.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_user_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/screen/standalone_wifi_config_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/standalone_door_sensor_args.dart';

class _FakeDoorSensorDomain extends StandaloneDoorSensorDomain {
  _FakeDoorSensorDomain({
    this.alertFlag = const StandaloneDoorSensorAlertFlagEntity(),
    List<StandaloneDoorSensorUserEntity> users = const [],
  }) : _users = users;

  final StandaloneDoorSensorAlertFlagEntity alertFlag;
  final List<StandaloneDoorSensorUserEntity> _users;

  final wifiCalls = <(StandaloneDoorSensorEntity, String, String)>[];
  final addUserCalls = <(int, String, String)>[];
  final configAlertCalls = <(int, int, int?, int, int?)>[];

  @override
  void build() {}

  @override
  TaskEither<AppException, StandaloneDoorSensorAlertFlagEntity> getAlertFlag(
    int doorSensorId,
  ) => TaskEither.right(alertFlag);

  @override
  TaskEither<AppException, Unit> configAlertFlag(
    int doorSensorId, {
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  }) {
    configAlertCalls.add((
      doorSensorId,
      notCloseAlertFlag,
      notCloseAlertSecondNum,
      longTimeNotOpenAlertFlag,
      longTimeNotOpenDayNum,
    ));
    return TaskEither.right(unit);
  }

  @override
  TaskEither<AppException, Unit> reconfigWifiViaBle({
    required StandaloneDoorSensorEntity item,
    required String wifiName,
    required String wifiPassword,
  }) {
    wifiCalls.add((item, wifiName, wifiPassword));
    return TaskEither.right(unit);
  }

  @override
  TaskEither<AppException, Unit> addDoorSensorUser(
    int doorSensorId, {
    required String account,
    required String username,
  }) {
    addUserCalls.add((doorSensorId, account, username));
    return TaskEither.right(unit);
  }

  @override
  TaskEither<AppException, List<StandaloneDoorSensorUserEntity>>
  listDoorSensorUser(int doorSensorId, {String? searchStr}) =>
      TaskEither.right(_users);
}

const _item = StandaloneDoorSensorEntity(
  name: '门磁',
  mac: 'AA',
  doorSensorId: 9,
  wifiName: 'my-wifi',
);

/// 将 sheet 作为一个被 push 的 route 挂载，保证 pop 安全。
Future<_FakeDoorSensorDomain> _pumpSheet(
  WidgetTester tester,
  Widget sheet, {
  _FakeDoorSensorDomain? domain,
}) async {
  final d = domain ?? _FakeDoorSensorDomain();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [standaloneDoorSensorDomainProvider.overrideWith(() => d)],
      child: MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => sheet)),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
  return d;
}

void main() {
  testWidgets('detail shows info and action tiles', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          standaloneDoorSensorDomainProvider.overrideWith(
            _FakeDoorSensorDomain.new,
          ),
        ],
        child: const MaterialApp(
          home: StandaloneDoorSensorDetailScreen(
            args: StandaloneDoorSensorDetailArgs(item: _item),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('门磁'), findsWidgets);
    await tester.scrollUntilVisible(
      find.byKey(const Key('standalone_delete')),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('standalone_rename')), findsOneWidget);
    expect(find.byKey(const Key('standalone_delete')), findsOneWidget);
    expect(find.byKey(const Key('standalone_alert')), findsOneWidget);
    expect(find.byKey(const Key('standalone_wifi')), findsOneWidget);
    expect(find.byKey(const Key('standalone_users')), findsOneWidget);
  });

  testWidgets('rename sheet prefills name', (tester) async {
    final d = await _pumpSheet(
      tester,
      const StandaloneDoorSensorRenameSheet(item: _item),
    );
    final field = tester.widget<TextField>(
      find.byKey(const Key('standalone_rename_field')),
    );
    expect(field.controller!.text, '门磁');
    await tester.tap(find.byKey(const Key('standalone_rename_save')));
    await tester.pumpAndSettle();
    expect(d.wifiCalls, isEmpty);
  });

  testWidgets('delete confirm sheet renders confirm action', (tester) async {
    await _pumpSheet(
      tester,
      const StandaloneDoorSensorDeleteConfirmSheet(item: _item),
    );
    expect(find.byKey(const Key('standalone_delete_confirm')), findsOneWidget);
    await tester.tap(find.byKey(const Key('standalone_delete_confirm')));
    await tester.pumpAndSettle();
  });

  testWidgets('wifi config sheet saves via reconfigWifiViaBle', (tester) async {
    final d = await _pumpSheet(
      tester,
      const StandaloneDoorSensorWifiConfigSheet(item: _item),
    );
    await tester.enterText(
      find.byKey(const Key('standalone_wifi_name_field')),
      'new-wifi',
    );
    await tester.enterText(
      find.byKey(const Key('standalone_wifi_password_field')),
      'secret',
    );
    await tester.tap(find.byKey(const Key('standalone_wifi_save')));
    await tester.pumpAndSettle();
    expect(d.wifiCalls, [(_item, 'new-wifi', 'secret')]);
  });

  testWidgets('alert config sheet prefills and saves via domain', (
    tester,
  ) async {
    final d = await _pumpSheet(
      tester,
      const StandaloneDoorSensorAlertConfigSheet(item: _item),
    );
    await tester.tap(find.byKey(const Key('standalone_not_close_switch')));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('standalone_not_close_seconds')),
      '30',
    );
    await tester.tap(find.byKey(const Key('standalone_alert_save')));
    await tester.pumpAndSettle();
    expect(d.configAlertCalls, [(9, 1, 30, 0, null)]);
  });

  testWidgets('user sheet lists users and adds a new one', (tester) async {
    final d = await _pumpSheet(
      tester,
      const StandaloneDoorSensorUserSheet(item: _item),
      domain: _FakeDoorSensorDomain(
        users: const [StandaloneDoorSensorUserEntity(id: 1, username: 'alice')],
      ),
    );
    expect(find.text('alice'), findsOneWidget);
    await tester.enterText(
      find.byKey(const Key('standalone_add_user_account_field')),
      'bob@email.com',
    );
    await tester.enterText(
      find.byKey(const Key('standalone_add_user_field')),
      'bob',
    );
    await tester.tap(find.byKey(const Key('standalone_add_user')));
    await tester.pumpAndSettle();
    expect(d.addUserCalls, [(9, 'bob@email.com', 'bob')]);
  });
}
