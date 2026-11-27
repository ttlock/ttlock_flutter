import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/repository/palm_vein_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockPalmVeinRepo extends Mock implements PalmVeinRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakePalmVeinRepository extends PalmVeinRepository {
  _FakePalmVeinRepository(this._mock);
  final _MockPalmVeinRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<PalmVeinEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _mock.list(
    lockId,
    pageNo: pageNo,
    pageSize: pageSize,
    searchStr: searchStr,
  );

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String number, {
    String? name,
    required int startDate,
    required int endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig> cyclicConfig = const [],
  }) => _mock.add(
    lockId,
    number,
    name: name,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int id, {
    required int startDate,
    required int endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType? channel,
  }) => _mock.changePeriod(
    id,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(int id, {ChannelType? channel}) =>
      _mock.delete(id, channel: channel);

  @override
  TaskEither<AppException, Unit> rename(int id, String name) =>
      _mock.rename(id, name);
}

PalmVeinEntity _limitedPalmVein() => PalmVeinEntity(
  id: 3,
  number: 'PV1',
  startDate: DateTime(2026, 1, 1),
  endDate: DateTime(2026, 2, 1),
);

void main() {
  late _MockPalmVeinRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late PalmVeinDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(TTLockFunction.palmVein);
    registerFallbackValue(TTAliasType.face);
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(<TTCycleModel>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockPalmVeinRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer(
      overrides: [
        palmVeinRepositoryProvider.overrideWith(
          () => _FakePalmVeinRepository(repo),
        ),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(palmVeinDomainProvider.notifier);
  });

  test('confirmAdd 调 repo.add(number:) 且永久日期为毫秒 0', () async {
    when(
      () => repo.add(
        1,
        'PV1',
        name: 'n',
        startDate: 0,
        endDate: 0,
        type: CredentialType.normal,
        cyclicConfig: const [],
      ),
    ).thenAnswer((_) => TaskEither.right(4));
    final id =
        (await domain
                .confirmAdd(
                  lockId: 1,
                  number: 'PV1',
                  name: 'n',
                  kind: CredentialValidityKind.permanent,
                )
                .run())
            .getOrElse((_) => throw TestFailure('left'));
    expect(id, 4);
  });

  test('confirmAdd cyclic forwards type and cyclicConfig', () async {
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    int? gotStart;
    int? gotEnd;
    when(
      () => repo.add(
        any(),
        any(),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).thenAnswer((inv) {
      gotStart = inv.namedArguments[#startDate] as int?;
      gotEnd = inv.namedArguments[#endDate] as int?;
      gotType = inv.namedArguments[#type] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(4);
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 3},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .confirmAdd(
          lockId: 1,
          number: 'PV1',
          name: 'n',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1, 15),
          end: DateTime(2026, 4, 1, 15),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg!.length, 2);
    expect(DateTime.fromMillisecondsSinceEpoch(gotStart!).hour, 0);
    expect(DateTime.fromMillisecondsSinceEpoch(gotEnd!).hour, 23);
  });

  test('addViaBle 映射 canStartAdd/error/success，无 collecting', () async {
    when(
      () => ttlock.lockAddPalmVein('ld', cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd),
        AddPalmVeinEvent(
          phase: TTAddPalmVeinPhase.success,
          palmVeinNumber: 'PV1',
        ),
      ]),
    );
    final events = await domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .toList();
    expect(events.first.phase, TTAddPalmVeinPhase.canStartAdd);
    expect(events.last.palmVeinNumber, 'PV1');
    expect(events.any((e) => e.phase.name == 'collecting'), isFalse);
  });

  test('addViaBle cyclic 转发非空 cycleList', () async {
    List<TTCycleModel>? gotCycles;
    when(
      () => ttlock.lockAddPalmVein('ld', cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((inv) {
      gotCycles = inv.namedArguments[#cycleList] as List<TTCycleModel>?;
      return const Stream.empty();
    });
    final cycles = [TTCycleModel(weekDay: 1, startTime: 60, endTime: 120)];
    await domain
        .addViaBle(lockData: 'ld', startMs: 1, endMs: 2, cycleList: cycles)
        .toList();
    expect(gotCycles, cycles);
  });

  test('addViaBle lockData 空 → 抛 -21', () {
    expect(
      () => domain.addViaBle(lockData: '', startMs: 0, endMs: 0),
      throwsA(isA<AppBusinessException>().having((e) => e.code, 'code', -21)),
    );
  });

  test('cancelAdd 后不再 emit，且不经过云端 add', () async {
    final controller = StreamController<AddPalmVeinEvent>();
    when(
      () => ttlock.lockAddPalmVein(any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((_) => controller.stream);
    final events = <AddPalmVeinEvent>[];
    final sub = domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .listen(events.add);
    addTearDown(() async {
      await sub.cancel();
      await controller.close();
    });
    controller.add(
      AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd),
    );
    await Future<void>.delayed(Duration.zero);
    domain.cancelAdd();
    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.success,
        palmVeinNumber: 'PV1',
      ),
    );
    await Future<void>.delayed(Duration.zero);
    expect(events.where((e) => e.palmVeinNumber == 'PV1'), isEmpty);
    verifyNever(
      () => repo.add(
        any(),
        any(),
        name: any(named: 'name'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    );
  });

  test('delete：有网关只调 repo channel=gatewayWifi', () async {
    when(
      () => repo.delete(3, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          palmVein: const PalmVeinEntity(id: 3, number: 'PV1'),
        )
        .run();
    verifyNever(() => ttlock.deletePalmVein(any(), any(), timeout: any(named: 'timeout')));
  });

  test('changePeriod permanent palmVein returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          palmVein: const PalmVeinEntity(id: 3, number: 'PV1'),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.modifyPalmVein(any(), any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'), timeout: any(named: 'timeout')),
    );
    verifyNever(
      () => repo.changePeriod(
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('changePeriod：有网关只调 repo channel=gatewayWifi', () async {
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
          palmVein: _limitedPalmVein(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    verifyNever(
      () => ttlock.modifyPalmVein(any(), any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod cyclic forwards cyclicConfig and cycleList', () async {
    List<CyclicConfig>? gotCfg;
    int? gotStart;
    int? gotEnd;
    when(
      () => repo.changePeriod(
        any(),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).thenAnswer((inv) {
      gotStart = inv.namedArguments[#startDate] as int?;
      gotEnd = inv.namedArguments[#endDate] as int?;
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
          palmVein: PalmVeinEntity(
            id: 3,
            number: 'PV1',
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
    expect(DateTime.fromMillisecondsSinceEpoch(gotStart!).hour, 0);
    expect(DateTime.fromMillisecondsSinceEpoch(gotEnd!).hour, 23);
    expect(gotCfg!.single.weekDay, 1);
    // 通道字段经 data source 映射为 type=ChannelType，非 CredentialType
    verify(
      () => repo.changePeriod(
        3,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.gatewayWifi,
      ),
    ).called(1);
  });

  test('changePeriod cyclic invalid schedule → -24', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          palmVein: const PalmVeinEntity(
            id: 3,
            number: 'PV1',
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

  test('changePeriod：网关失败且有 lockData → BLE 再 bleSynced', () async {
    when(
      () => repo.changePeriod(
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
      () => ttlock.modifyPalmVein(any(), any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.changePeriod(
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
          palmVein: _limitedPalmVein(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyPalmVein('PV1', 'ld', cycleList: null, startDate: any(named: 'startDate'), endDate: any(named: 'endDate'), timeout: any(named: 'timeout')),
    ).called(1);
    verify(
      () => repo.changePeriod(
        3,
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).called(1);
  });

  test('rename 只调云端，不 setAlias', () async {
    when(() => repo.rename(3, 'n2')).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .rename(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          palmVein: const PalmVeinEntity(id: 3, number: 'PV1'),
          name: 'n2',
        )
        .run();
    verify(() => repo.rename(3, 'n2')).called(1);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('list 透传 repo.list', () async {
    when(
      () => repo.list(
        1,
        pageNo: any(named: 'pageNo'),
        pageSize: any(named: 'pageSize'),
        searchStr: any(named: 'searchStr'),
      ),
    ).thenAnswer(
      (_) => TaskEither.right(const [PalmVeinEntity(id: 3, number: 'PV1')]),
    );
    final items = (await domain.list(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(items.single.id, 3);
  });
}
