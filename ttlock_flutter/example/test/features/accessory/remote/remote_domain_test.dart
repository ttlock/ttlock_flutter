import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/repository/remote_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/provider/remote_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockRemoteRepo extends Mock implements RemoteRepository {}

class _FakeRemoteRepository extends RemoteRepository {
  _FakeRemoteRepository(this._mock);
  final _MockRemoteRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<RemoteEntity>> listByLock(int lockId) =>
      _mock.listByLock(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    int electricQuantity = 100,
    String? firmwareInfo,
    String? number,
  }) => _mock.add(
    lockId,
    mac,
    name: name,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    electricQuantity: electricQuantity,
    firmwareInfo: firmwareInfo,
    number: number,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int remoteId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.changePeriod(
    remoteId,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(int remoteId) => _mock.delete(remoteId);

  @override
  TaskEither<AppException, Unit> rename(int remoteId, String name) =>
      _mock.rename(remoteId, name);
}

RemoteEntity _limitedRemote() => RemoteEntity(
  remoteId: 3,
  mac: 'AA:BB',
  startDate: DateTime(2026, 1, 1),
  endDate: DateTime(2026, 2, 1),
);

void main() {
  late _MockRemoteRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late RemoteDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const <CyclicConfig>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockRemoteRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer(
      overrides: [
        remoteRepositoryProvider.overrideWith(
          () => _FakeRemoteRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(remoteDomainProvider.notifier);
  });

  test('confirmAdd permanent uses epoch 0 and type normal', () async {
    when(
      () => repo.add(
        1,
        'AA:BB',
        name: 'n',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        number: any(named: 'number'),
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    await domain
        .confirmAdd(
          lockId: 1,
          mac: 'AA:BB',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    final captured = verify(
      () => repo.add(
        1,
        'AA:BB',
        name: 'n',
        startDate: captureAny(named: 'startDate'),
        endDate: captureAny(named: 'endDate'),
        type: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        number: any(named: 'number'),
      ),
    ).captured;
    expect((captured[0] as DateTime).millisecondsSinceEpoch, 0);
    expect((captured[1] as DateTime).millisecondsSinceEpoch, 0);
  });

  test('confirmAdd cyclic forwards type=4 and cyclicConfig', () async {
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    when(
      () => repo.add(
        any(),
        any(),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        number: any(named: 'number'),
      ),
    ).thenAnswer((inv) {
      gotType = inv.namedArguments[#type] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(8);
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 3},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .confirmAdd(
          lockId: 1,
          mac: 'AA:BB',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1, 15),
          end: DateTime(2026, 4, 1, 15),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg!.length, 2);
  });

  test('addViaBle lockData 空 → Left -21', () async {
    final r = await domain
        .addViaBle(lockData: '', remoteKeyMac: 'AA:BB', startMs: 0, endMs: 0)
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -21);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.addRemoteKey(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('addViaBle cyclic 转发非空 cycleList', () async {
    final cycles = [TTCycleModel(weekDay: 1, startTime: 60, endTime: 120)];
    List<TTCycleModel>? gotCycles;
    when(
      () => ttlock.addRemoteKey(
        'AA:BB',
        any(),
        1,
        2,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((inv) async {
      gotCycles = inv.positionalArguments[1] as List<TTCycleModel>?;
    });
    await domain
        .addViaBle(
          lockData: 'ld',
          remoteKeyMac: 'AA:BB',
          startMs: 1,
          endMs: 2,
          cycleList: cycles,
        )
        .run();
    expect(gotCycles, cycles);
  });

  test('changePeriod permanent remote returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          remote: const RemoteEntity(remoteId: 3, mac: 'AA:BB'),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.setRemoteKeyValidDate(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test(
    'changePeriod：有网关只调 repo channel=gatewayWifi（非 CredentialType）',
    () async {
      when(
        () => repo.changePeriod(
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
            remote: _limitedRemote(),
            start: DateTime(2026, 1, 1),
            end: DateTime(2026, 2, 1),
          )
          .run();
      verifyNever(
        () => ttlock.setRemoteKeyValidDate(
          any(),
          any(),
          any(),
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      );
      verify(
        () => repo.changePeriod(
          3,
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          cyclicConfig: any(named: 'cyclicConfig'),
          channel: ChannelType.gatewayWifi,
        ),
      ).called(1);
    },
  );

  test('changePeriod cyclic forwards cyclicConfig and BLE cycleList', () async {
    List<CyclicConfig>? gotCfg;
    List<TTCycleModel>? gotCycles;
    when(
      () => repo.changePeriod(
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((inv) {
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(unit);
    });
    when(
      () => ttlock.setRemoteKeyValidDate(
        'AA:BB',
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((inv) async {
      gotCycles = inv.positionalArguments[1] as List<TTCycleModel>?;
    });
    const schedule = CyclicSchedule(
      weekDays: {1},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          remote: RemoteEntity(
            remoteId: 3,
            mac: 'AA:BB',
            type: CredentialType.cycle,
            startDate: DateTime(2026, 1, 1),
            endDate: DateTime(2026, 2, 1),
            cyclicConfig: const [
              CyclicConfig(weekDay: 1, startTime: 60, endTime: 120),
            ],
          ),
          start: DateTime(2026, 3, 1, 15),
          end: DateTime(2026, 4, 1, 15),
          schedule: schedule,
        )
        .run();
    expect(gotCfg!.single.weekDay, 1);
    expect(gotCycles!.single.weekDay, 1);
  });

  test('changePeriod cyclic invalid schedule → -24', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          remote: const RemoteEntity(
            remoteId: 3,
            mac: 'AA:BB',
            type: CredentialType.cycle,
          ),
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -24);
    }, (_) => fail('expected left'));
  });

  test('changePeriod limited 走 BLE 时 cycleList 为 null', () async {
    List<TTCycleModel>? gotCycles = const [];
    when(
      () => ttlock.setRemoteKeyValidDate(
        'AA:BB',
        any(),
        any(),
        any(),
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((inv) async {
      gotCycles = inv.positionalArguments[1] as List<TTCycleModel>?;
    });
    when(
      () => repo.changePeriod(
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          remote: _limitedRemote(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(gotCycles, isNull);
  });
}
