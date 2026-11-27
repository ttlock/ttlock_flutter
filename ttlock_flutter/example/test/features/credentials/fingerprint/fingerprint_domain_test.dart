import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/repository/fingerprint_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockFingerprintRepo extends Mock implements FingerprintRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFingerprintRepository extends FingerprintRepository {
  _FakeFingerprintRepository(this._mock);
  final _MockFingerprintRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<FingerprintEntity>> list(int lockId) =>
      _mock.list(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String fingerprintNumber, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.add(
    lockId,
    fingerprintNumber,
    fingerprintName: fingerprintName,
    startDate: startDate,
    endDate: endDate,
    fingerprintType: fingerprintType,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, int> addByGateway(
    int lockId,
    String fingerprintData, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
  }) => _mock.addByGateway(
    lockId,
    fingerprintData,
    fingerprintName: fingerprintName,
    startDate: startDate,
    endDate: endDate,
    fingerprintType: fingerprintType,
    cyclicConfig: cyclicConfig,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int fingerprintId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.changePeriod(
    lockId,
    fingerprintId,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int fingerprintId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.delete(lockId, fingerprintId, channel: channel);

  @override
  TaskEither<AppException, Unit> rename(
    int lockId,
    int fingerprintId,
    String fingerprintName,
  ) => _mock.rename(lockId, fingerprintId, fingerprintName);
}

FingerprintEntity _limitedFp() => FingerprintEntity(
  fingerprintId: 3,
  fingerprintNumber: 'FP1',
  startDate: DateTime(2026, 1, 1),
  endDate: DateTime(2026, 2, 1),
);

void main() {
  late _MockFingerprintRepo repo;
  late MockTTLockApi ttlock;
  late MockTTRemoteKeypadApi keypad;
  late ProviderContainer container;
  late FingerprintDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(TTLockFunction.fingerprint);
    registerFallbackValue(TTAliasType.fingerprint);
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(<TTCycleModel>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockFingerprintRepo();
    ttlock = MockTTLockApi();
    keypad = MockTTRemoteKeypadApi();
    installMockAccessoryApis(lockApi: ttlock, remoteKeypadApi: keypad);
    container = ProviderContainer(
      overrides: [
        fingerprintRepositoryProvider.overrideWith(
          () => _FakeFingerprintRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(fingerprintDomainProvider.notifier);
  });

  test('addViaBle 转发 collecting 进度', () async {
    when(
      () => ttlock.lockAddFingerprint('ld', cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddFingerprintEvent(
          phase: TTAddFingerprintPhase.waiting,
        ),
        AddFingerprintEvent(
          phase: TTAddFingerprintPhase.collecting,
          currentCount: 1,
          totalCount: 4,
        ),
        AddFingerprintEvent(
          phase: TTAddFingerprintPhase.success,
          fingerprintNumber: 'FP1',
        ),
      ]),
    );
    final events = await domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .toList();
    expect(events[1].currentCount, 1);
    expect(events.last.fingerprintNumber, 'FP1');
  });

  test('confirmAdd 不因 hasGateway 改走 addByGateway', () async {
    when(
      () => repo.add(
        any(),
        any(),
        fingerprintName: any(named: 'fingerprintName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        fingerprintType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(1));
    await domain
        .confirmAdd(
          lockId: 1,
          fingerprintNumber: 'FP1',
          name: 'n',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    verifyNever(() => repo.addByGateway(any(), any()));
  });

  test('confirmAdd 永久 start/end 为 epoch 0，channel=bleSynced', () async {
    when(
      () => repo.add(
        any(),
        any(),
        fingerprintName: any(named: 'fingerprintName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        fingerprintType: any(named: 'fingerprintType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((_) => TaskEither.right(1));
    await domain
        .confirmAdd(
          lockId: 1,
          fingerprintNumber: 'FP1',
          name: 'n',
          kind: CredentialValidityKind.permanent,
          start: null,
          end: null,
        )
        .run();
    final captured = verify(
      () => repo.add(
        1,
        'FP1',
        fingerprintName: 'n',
        startDate: captureAny(named: 'startDate'),
        endDate: captureAny(named: 'endDate'),
        fingerprintType: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).captured;
    expect((captured[0] as DateTime).millisecondsSinceEpoch, 0);
    expect((captured[1] as DateTime).millisecondsSinceEpoch, 0);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('cancelAdd 后不再 emit，且不经过云端 add', () async {
    final controller = StreamController<AddFingerprintEvent>();
    when(
      () => ttlock.lockAddFingerprint(any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((_) => controller.stream);
    final events = <AddFingerprintEvent>[];
    final sub = domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .listen(events.add);
    addTearDown(() async {
      await sub.cancel();
      await controller.close();
    });
    controller.add(
      AddFingerprintEvent(phase: TTAddFingerprintPhase.waiting),
    );
    await Future<void>.delayed(Duration.zero);
    domain.cancelAdd();
    controller.add(
      AddFingerprintEvent(
        phase: TTAddFingerprintPhase.success,
        fingerprintNumber: 'FP1',
      ),
    );
    await Future<void>.delayed(Duration.zero);
    expect(events.where((e) => e.fingerprintNumber == 'FP1'), isEmpty);
    verifyNever(
      () => repo.add(
        any(),
        any(),
        fingerprintName: any(named: 'fingerprintName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        fingerprintType: any(named: 'fingerprintType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('delete：有网关只调 repo channel=gatewayWifi', () async {
    when(
      () => repo.delete(1, 3, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          fingerprint: const FingerprintEntity(
            fingerprintId: 3,
            fingerprintNumber: 'FP1',
          ),
        )
        .run();
    verifyNever(() => ttlock.deleteFingerprint(any(), any(), timeout: any(named: 'timeout')));
  });

  test('changePeriod：有网关只调 repo channel=gatewayWifi', () async {
    when(
      () => repo.changePeriod(
        1,
        3,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          fingerprint: _limitedFp(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    verifyNever(
      () => ttlock.modifyFingerprintValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod：网关失败且有 lockData → BLE 再 bleSynced', () async {
    when(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer(
      (_) => TaskEither.left(
        AppException.network(exception: Exception('down'), message: 'down'),
      ),
    );
    when(
      () => ttlock.modifyFingerprintValidityPeriod(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          fingerprint: _limitedFp(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyFingerprintValidityPeriod('FP1', any(), any(), any(), 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('rename 只调云端，不 setAlias', () async {
    when(
      () => repo.rename(1, 3, 'n2'),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .rename(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          fingerprint: const FingerprintEntity(
            fingerprintId: 3,
            fingerprintNumber: 'FP1',
          ),
          name: 'n2',
        )
        .run();
    verify(() => repo.rename(1, 3, 'n2')).called(1);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('confirmAdd cyclic forwards fingerprintType and cyclicConfig', () async {
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    when(
      () => repo.add(
        any(),
        any(),
        fingerprintName: any(named: 'fingerprintName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        fingerprintType: any(named: 'fingerprintType'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((inv) {
      gotType = inv.namedArguments[#fingerprintType] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(1);
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 2},
      startMinutes: 480,
      endMinutes: 1080,
    );
    await domain
        .confirmAdd(
          lockId: 1,
          fingerprintNumber: 'FP1',
          name: 'n',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg, hasLength(2));
  });

  test('changePeriod permanent fingerprint returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          fingerprint: const FingerprintEntity(
            fingerprintId: 3,
            fingerprintNumber: 'FP1',
          ),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
  });

  test('changePeriod cyclic forwards cyclicConfig', () async {
    List<CyclicConfig>? gotCfg;
    when(
      () => repo.changePeriod(
        any(),
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((inv) {
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(unit);
    });
    const schedule = CyclicSchedule(
      weekDays: {1},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          fingerprint: FingerprintEntity(
            fingerprintId: 3,
            fingerprintNumber: 'FP1',
            fingerprintType: CredentialType.cycle,
            startDate: DateTime(2026, 1, 1),
            endDate: DateTime(2026, 2, 1),
          ),
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
          schedule: schedule,
        )
        .run();
    expect(gotCfg!.single.weekDay, 1);
  });

  test('list 透传 repo.list', () async {
    when(() => repo.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        FingerprintEntity(fingerprintId: 3, fingerprintNumber: 'FP1'),
      ]),
    );
    final items = (await domain.list(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(items.single.fingerprintId, 3);
  });

  test('addViaKeypad 转发给 accessoryAddKeypadFingerprint', () async {
    when(
      () => keypad.accessoryAddKeypadFingerprint(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        cycleList: any(named: 'cycleList'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddFingerprintEvent(phase: TTAddFingerprintPhase.waiting),
        AddFingerprintEvent(
          phase: TTAddFingerprintPhase.success,
          fingerprintNumber: 'KFP1',
        ),
      ]),
    );

    final events = await domain
        .addViaKeypad(
          keypadMac: 'AA:BB',
          lockData: 'ld',
          startMs: 0,
          endMs: 0,
        )
        .toList();

    expect(events.last.fingerprintNumber, 'KFP1');
    verify(
      () => keypad.accessoryAddKeypadFingerprint(
        keypadMac: 'AA:BB',
        lockData: 'ld',
        cycleList: null,
        startDate: 0,
        endDate: 0,
      ),
    ).called(1);
  });

  test('addViaKeypad：原生 TIMEOUT 转成 -28 业务码', () async {
    when(
      () => keypad.accessoryAddKeypadFingerprint(
        keypadMac: any(named: 'keypadMac'),
        lockData: any(named: 'lockData'),
        cycleList: any(named: 'cycleList'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.error(
        TTMultifunctionalKeypadException(
          TTMultifunctionalKeypadError.timeout,
          '等待键盘录入指纹超时',
        ),
      ),
    );

    Object? caught;
    try {
      await domain
          .addViaKeypad(
            keypadMac: 'AA:BB',
            lockData: 'ld',
            startMs: 0,
            endMs: 0,
          )
          .toList();
    } on Object catch (e) {
      caught = e;
    }

    expect(caught, isA<AppBusinessException>());
    expect((caught! as AppBusinessException).code, kKeypadEnrollTimeoutCode);
  });
}
