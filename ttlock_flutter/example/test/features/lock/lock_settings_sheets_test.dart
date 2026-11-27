import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_auto_lock_time_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_door_not_closed_alert_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_nb_register_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_open_direction_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_passage_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_working_mode_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_unauthorized_alert_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_sound_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_transfer_sheet.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import '../../helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}

class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, AutoLockingTime> getAutoLockTime(String lockData) =>
      _mock.getAutoLockTime(lockData);
  @override
  TaskEither<AppException, PassageModeConfigEntity> getPassageMode(
    int lockId,
  ) => _mock.getPassageMode(lockId);
  @override
  TaskEither<AppException, WorkingModeEntity> getWorkingMode(int lockId) =>
      _mock.getWorkingMode(lockId);
  @override
  TaskEither<AppException, ExtraSettingEntity> getUnauthorizedAttempt(
    int lockId,
  ) => _mock.getUnauthorizedAttempt(lockId);
}

const lock = LockEntity(
  lockId: 1,
  lockAlias: 'A',
  lockName: 'Lock-1',
  lockData: 'ld',
);

final l10n = lookupAppLocalizations(const Locale('zh'));

void main() {
  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(const LockEntity(lockId: 0));
    registerFallbackValue(const PassageModeConfigEntity());
    registerFallbackValue(const WorkingModeEntity());
    registerFallbackValue(const ExtraSettingEntity());
  });

  tearDown(resetTtLockTestHooks);

  testWidgets('转让 sheet 空账号不 pop，填写后 pop username', (tester) async {
    String? popped;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<String>(
                    MaterialPageRoute(
                      builder: (_) => const LockTransferSheet(lock: lock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.transfer), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await tester.pumpAndSettle();
    expect(popped, isNull);
    expect(find.byType(LockTransferSheet), findsOneWidget);

    await tester.enterText(find.byType(TextField), '  bob@x.com  ');
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await tester.pumpAndSettle();
    expect(popped, 'bob@x.com');
  });

  testWidgets('删除确认 sheet 确认 pop true，取消 pop false', (tester) async {
    bool? popped;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<bool>(
                    MaterialPageRoute(
                      builder: (_) => const LockDeleteConfirmSheet(lock: lock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text('A'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, l10n.commonCancel));
    await tester.pumpAndSettle();
    expect(popped, isFalse);

    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, l10n.deleteLock));
    await tester.pumpAndSettle();
    expect(popped, isTrue);
  });

  testWidgets('自动闭锁 sheet 读当前值后 pop 所选秒数，不调 setAutoLockTime', (tester) async {
    final domain = _MockLockDomain();
    when(() => domain.getAutoLockTime('ld')).thenAnswer(
      (_) => TaskEither.right(
        AutoLockingTime(currentTime: 10, minTime: 0, maxTime: 120),
      ),
    );
    when(
      () => domain.setAutoLockTime(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    int? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<int>(
                    MaterialPageRoute(
                      builder: (_) => LockAutoLockTimeSheet(autoLockingTime: AutoLockingTime(currentTime: 10, minTime: 0, maxTime: 120)),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.autoLockTime), findsOneWidget);
    await tester.tap(find.widgetWithText(ChoiceChip, '30${l10n.secondsUnit}'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await tester.pumpAndSettle();
    expect(popped, 30);
    verifyNever(() => domain.setAutoLockTime(any(), any()));
  });

  testWidgets('门未关报警 sheet pop 所选秒数，不调 setDoorNotClosedAlert', (tester) async {
    final domain = _MockLockDomain();
    when(
      () => domain.setDoorNotClosedAlert(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    int? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<int>(
                    MaterialPageRoute(
                      builder: (_) =>
                          const LockDoorNotClosedAlertSheet(lock: lock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.doorNotClosedAlert), findsOneWidget);
    await tester.tap(find.widgetWithText(ChoiceChip, '30${l10n.secondsUnit}'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await tester.pumpAndSettle();
    expect(popped, 30);
    verifyNever(() => domain.setDoorNotClosedAlert(any(), any()));
  });

  testWidgets('常开全屏读当前值后 pop PassageModeConfigEntity，不调 setPassageMode', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(() => domain.getPassageMode(1)).thenAnswer(
      (_) => TaskEither.right(
        const PassageModeConfigEntity(
          passageMode: 2,
          isAllDay: 2,
          startDate: 480,
          endDate: 1080,
          weekDays: [1, 2, 3],
        ),
      ),
    );
    when(
      () => domain.setPassageMode(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));
    when(
      () => ttlock.supportFunction(
        TTLockFunction.passageModeAutoUnlockSetting,
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => false);

    PassageModeConfigEntity? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context)
                      .push<PassageModeConfigEntity>(
                        MaterialPageRoute(
                          builder: (_) =>
                              const LockPassageModeScreen(lock: lock),
                        ),
                      );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('passage_mode_on')), findsOneWidget);
    expect(find.byKey(const Key('passage_mode_auto_unlock')), findsNothing);
    await tester.tap(find.byKey(const Key('passage_mode_on')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('passage_mode_all_day')), findsOneWidget);
    final allDay = tester.widget<SwitchListTile>(
      find.byKey(const Key('passage_mode_all_day')),
    );
    expect(allDay.value, isFalse);
    await tester.tap(find.byKey(const Key('passage_mode_save')));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.passageMode, 1);
    expect(popped!.isAllDay, 2);
    expect(popped!.startDate, 480);
    expect(popped!.endDate, 1080);
    expect(popped!.weekDays, [1, 2, 3]);
    expect(popped!.autoUnlock, 0);
    verifyNever(() => domain.setPassageMode(any(), any()));
  });

  testWidgets('常开水合：isAllDay=2 + 全周 + 0/0 视为全天，保存不写 08:00–18:00', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(() => domain.getPassageMode(1)).thenAnswer(
      (_) => TaskEither.right(
        const PassageModeConfigEntity(
          passageMode: 1,
          isAllDay: 2,
          startDate: 0,
          endDate: 0,
          weekDays: [1, 2, 3, 4, 5, 6, 7],
        ),
      ),
    );
    when(
      () => ttlock.supportFunction(
        TTLockFunction.passageModeAutoUnlockSetting,
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => false);

    PassageModeConfigEntity? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context)
                      .push<PassageModeConfigEntity>(
                        MaterialPageRoute(
                          builder: (_) =>
                              const LockPassageModeScreen(lock: lock),
                        ),
                      );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    final allDay = tester.widget<SwitchListTile>(
      find.byKey(const Key('passage_mode_all_day')),
    );
    expect(allDay.value, isTrue);
    expect(find.byKey(const Key('passage_mode_start')), findsNothing);
    await tester.tap(find.byKey(const Key('passage_mode_save')));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.passageMode, 1);
    expect(popped!.isAllDay, 1);
    expect(popped!.startDate, 0);
    expect(popped!.endDate, 0);
    expect(popped!.weekDays, [1, 2, 3, 4, 5, 6, 7]);
  });

  testWidgets('工作模式全屏读当前值后 pop WorkingModeEntity，不调 setWorkingMode', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    when(() => domain.getWorkingMode(1)).thenAnswer(
      (_) => TaskEither.right(const WorkingModeEntity(workingMode: 2)),
    );
    when(
      () => domain.setWorkingMode(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    const gwLock = LockEntity(
      lockId: 1,
      lockAlias: 'A',
      lockName: 'Lock-1',
      lockData: 'ld',
      hasGateway: true,
    );
    WorkingModeEntity? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<WorkingModeEntity>(
                    MaterialPageRoute(
                      builder: (_) => LockWorkingModeScreen(lock: gwLock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.workingMode), findsWidgets);
    expect(find.byKey(const Key('working_mode_option_3')), findsOneWidget);
    await tester.tap(find.byKey(const Key('working_mode_option_1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('working_mode_save')));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.workingMode, 1);
    expect(popped!.cyclicConfig, isEmpty);
    verifyNever(() => domain.setWorkingMode(any(), any()));
  });

  testWidgets('工作模式：无网关隐藏自定义选项', (tester) async {
    final domain = _MockLockDomain();
    when(() => domain.getWorkingMode(1)).thenAnswer(
      (_) => TaskEither.right(const WorkingModeEntity(workingMode: 1)),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: LockWorkingModeScreen(lock: lock)),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('working_mode_option_1')), findsOneWidget);
    expect(find.byKey(const Key('working_mode_option_2')), findsOneWidget);
    expect(find.byKey(const Key('working_mode_option_3')), findsNothing);
    expect(find.byKey(const Key('working_mode_needs_gateway')), findsOneWidget);
    expect(find.byKey(const Key('working_mode_save')), findsNothing);
    final option1 = tester.widget<RadioListTile<int>>(
      find.byKey(const Key('working_mode_option_1')),
    );
    expect(option1.enabled, isFalse);
  });

  testWidgets('非法尝试全屏读当前值后 pop ExtraSettingEntity，不调 setUnauthorizedAttempt', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    when(() => domain.getUnauthorizedAttempt(1)).thenAnswer(
      (_) => TaskEither.right(
        const ExtraSettingEntity(
          flag: 1,
          count: 5,
          lockTime: 60,
          pwd: 1,
          card: 0,
          fingerprint: 1,
        ),
      ),
    );
    when(
      () => domain.setUnauthorizedAttempt(any(), any()),
    ).thenAnswer((_) => TaskEither.right(unit));

    const gwLock = LockEntity(
      lockId: 1,
      lockAlias: 'A',
      lockName: 'Lock-1',
      lockData: 'ld',
      hasGateway: true,
    );
    ExtraSettingEntity? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<ExtraSettingEntity>(
                    MaterialPageRoute(
                      builder: (_) => LockUnauthorizedAlertScreen(lock: gwLock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.unauthorizedAttempt), findsWidgets);
    expect(find.byKey(const Key('unauthorized_attempt_save')), findsOneWidget);
    await tester.tap(find.byKey(const Key('unauthorized_attempt_save')));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.flag, 1);
    expect(popped!.count, 5);
    expect(popped!.lockTime, 60);
    expect(popped!.pwd, 1);
    expect(popped!.card, 0);
    expect(popped!.fingerprint, 1);
    verifyNever(() => domain.setUnauthorizedAttempt(any(), any()));
  });

  testWidgets('非法尝试：无网关隐藏写入口', (tester) async {
    final domain = _MockLockDomain();
    when(() => domain.getUnauthorizedAttempt(1)).thenAnswer(
      (_) => TaskEither.right(
        const ExtraSettingEntity(flag: 1, count: 5, lockTime: 60),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: LockUnauthorizedAlertScreen(lock: lock)),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.byKey(const Key('unauthorized_attempt_switch')),
      findsOneWidget,
    );
    expect(find.byKey(const Key('unauthorized_attempt_save')), findsNothing);
    expect(
      find.byKey(const Key('unauthorized_attempt_needs_gateway')),
      findsOneWidget,
    );
    expect(
      tester
          .widget<SwitchListTile>(
            find.byKey(const Key('unauthorized_attempt_switch')),
          )
          .onChanged,
      isNull,
    );
  });

  testWidgets('音量 sheet pop on+level，不写 Domain', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.getSoundVolume(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => TTSoundVolumeType.off);

    LockSoundSheetResult? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context)
                      .push<LockSoundSheetResult>(
                        MaterialPageRoute(
                          builder: (_) => const LockSoundSheet(lock: lock),
                        ),
                      );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('sound_sheet_on')), findsOneWidget);
    expect(find.byKey(const Key('sound_sheet_level_4')), findsNothing);
    await tester.tap(find.byKey(const Key('sound_sheet_on')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('sound_sheet_level_4')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('sound_sheet_save')));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.on, isTrue);
    expect(popped!.level, 4);
    verifyNever(() => domain.setSound(any(), on: any(named: 'on')));
  });

  testWidgets('开门方向 sheet pop 所选方向', (tester) async {
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.getLockDirection(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => TTLockDirection.left);

    TTLockDirection? popped;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<TTLockDirection>(
                    MaterialPageRoute(
                      builder: (_) => const LockOpenDirectionSheet(args: LockOpenDirectionArgs(lock: lock)),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('direction_sheet_right')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('direction_sheet_save')));
    await tester.pumpAndSettle();
    expect(popped, TTLockDirection.right);
  });

  testWidgets('NB 注册 sheet pop RegisterNbInput', (tester) async {
    RegisterNbInput? popped;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_sheet'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<RegisterNbInput>(
                    MaterialPageRoute(
                      builder: (_) => const LockNbRegisterSheet(lock: lock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_sheet')));
    await tester.pumpAndSettle();
    expect(find.text(l10n.nbRegister), findsOneWidget);
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'node-1');
    await tester.enterText(fields.at(1), 'card-2');
    await tester.enterText(fields.at(2), 'op-3');
    await tester.enterText(fields.at(3), '-80');
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.nbNodeId, 'node-1');
    expect(popped!.nbCardNumber, 'card-2');
    expect(popped!.nbOperator, 'op-3');
    expect(popped!.nbRssi, -80);
  });
}
