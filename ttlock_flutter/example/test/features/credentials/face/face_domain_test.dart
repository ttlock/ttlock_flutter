import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/repository/face_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockFaceRepo extends Mock implements FaceRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFaceRepository extends FaceRepository {
  _FakeFaceRepository(this._mock);
  final _MockFaceRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<FaceEntity>> list(int lockId) =>
      _mock.list(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId, {
    String? faceName,
    String? faceNumber,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
    String? featureData,
  }) => _mock.add(
    lockId,
    faceName: faceName,
    faceNumber: faceNumber,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    channel: channel,
    featureData: featureData,
  );

  @override
  TaskEither<AppException, String> getFeatureDataByPhoto(
    int lockId,
    List<int> imageBytes,
  ) => _mock.getFeatureDataByPhoto(lockId, imageBytes);

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int faceId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.changePeriod(
    lockId,
    faceId,
    startDate: startDate,
    endDate: endDate,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int faceId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _mock.delete(lockId, faceId, channel: channel);

  @override
  TaskEither<AppException, Unit> rename(int lockId, int faceId, String name) =>
      _mock.rename(lockId, faceId, name);
}

FaceEntity _limitedFace() => FaceEntity(
  faceId: 3,
  faceNumber: 'F1',
  startDate: DateTime(2026, 1, 1),
  endDate: DateTime(2026, 2, 1),
);

void main() {
  late _MockFaceRepo repo;
  late MockTTLockApi ttlock;
  late ProviderContainer container;
  late FaceDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TTAliasType.card);
    registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(ChannelType.bleSynced);
    registerFallbackValue(CredentialType.normal);
    registerFallbackValue(TTLockFunction.face);
    registerFallbackValue(TTAliasType.face);
    registerFallbackValue(const LockEntity());
    registerFallbackValue(<TTCycleModel>[]);
    registerFallbackValue(const <CyclicConfig>[]);
    registerFallbackValue(const <int>[]);
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockFaceRepo();
    ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    container = ProviderContainer(
      overrides: [
        faceRepositoryProvider.overrideWith(() => _FakeFaceRepository(repo)),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(faceDomainProvider.notifier);
  });

  test('confirmAdd 必须带 faceNumber 且 bleSynced，永久日期为 epoch 0', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    when(
      () => repo.add(
        1,
        faceName: any(named: 'faceName'),
        faceNumber: 'F1',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          faceNumber: 'F1',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    final captured = verify(
      () => repo.add(
        1,
        faceNumber: 'F1',
        channel: ChannelType.bleSynced,
        faceName: any(named: 'faceName'),
        startDate: captureAny(named: 'startDate'),
        endDate: captureAny(named: 'endDate'),
        type: CredentialType.normal,
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).captured;
    expect((captured[0] as DateTime).millisecondsSinceEpoch, 0);
    expect((captured[1] as DateTime).millisecondsSinceEpoch, 0);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('无 lockData 时 addViaBle 不调用 ttlock', () async {
    expect(
      () => domain.addViaBle(lockData: '', startMs: 0, endMs: 0),
      throwsA(isA<AppBusinessException>()),
    );
    verifyNever(() => ttlock.lockAddFace(any()));
  });

  test('confirmAdd 奕诺+supportSetAlias：先 setAlias(face) 再云端 add', () async {
    when(
      () => ttlock.supportFunction(TTLockFunction.yiNuoPhotoFace, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.supportFunction(TTLockFunction.supportSetAlias, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.setAlias(TTAliasType.face, 'F1', 'n', 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        1,
        faceName: any(named: 'faceName'),
        faceNumber: 'F1',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          faceNumber: 'F1',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    verify(
      () => ttlock.setAlias(TTAliasType.face, 'F1', 'n', 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('confirmAdd cyclic forwards type and cyclicConfig', () async {
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
    when(
      () => repo.add(
        any(),
        faceName: any(named: 'faceName'),
        faceNumber: any(named: 'faceNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((inv) {
      gotStart = inv.namedArguments[#startDate] as DateTime?;
      gotEnd = inv.namedArguments[#endDate] as DateTime?;
      gotType = inv.namedArguments[#type] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(8);
    });
    const schedule = CyclicSchedule(
      weekDays: {1, 2},
      startMinutes: 480,
      endMinutes: 1080,
    );
    await domain
        .confirmAdd(
          lockId: 1,
          lockData: 'ld',
          faceNumber: 'F1',
          name: 'n',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg, hasLength(2));
    expect(gotStart!.hour, 0);
    expect(gotEnd!.hour, 23);
  });

  test(
    'addByPhoto 有网关：cloud addType=2 + featureData，不调 addFaceData/setAlias',
    () async {
      when(
        () => repo.add(
          1,
          faceName: any(named: 'faceName'),
          faceNumber: null,
          featureData: 'AABB',
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          type: any(named: 'type'),
          cyclicConfig: any(named: 'cyclicConfig'),
          channel: ChannelType.gatewayWifi,
        ),
      ).thenAnswer((_) => TaskEither.right(8));
      await domain
          .addByPhoto(
            lockId: 1,
            lockData: 'ld',
            hasGateway: true,
            isYiNuo: false,
            featureData: 'AABB',
            name: 'n',
            kind: CredentialValidityKind.permanent,
          )
          .run();
      verifyNever(
        () => ttlock.addFaceData(
          any(),
          any(),
          any(),
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      );
      verifyNever(
        () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
      );
      verify(
        () => repo.add(
          1,
          featureData: 'AABB',
          channel: ChannelType.gatewayWifi,
          faceName: any(named: 'faceName'),
          faceNumber: null,
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
          type: any(named: 'type'),
          cyclicConfig: any(named: 'cyclicConfig'),
        ),
      ).called(1);
    },
  );

  test('addByPhoto cyclic 转发 type/cyclicConfig', () async {
    CredentialType? gotType;
    List<CyclicConfig>? gotCfg;
    when(
      () => repo.add(
        any(),
        faceName: any(named: 'faceName'),
        faceNumber: any(named: 'faceNumber'),
        featureData: any(named: 'featureData'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    ).thenAnswer((inv) {
      gotType = inv.namedArguments[#type] as CredentialType?;
      gotCfg = inv.namedArguments[#cyclicConfig] as List<CyclicConfig>?;
      return TaskEither.right(8);
    });
    const schedule = CyclicSchedule(
      weekDays: {3},
      startMinutes: 60,
      endMinutes: 120,
    );
    await domain
        .addByPhoto(
          lockId: 1,
          lockData: 'ld',
          hasGateway: true,
          isYiNuo: false,
          featureData: 'AABB',
          name: 'n',
          kind: CredentialValidityKind.cyclic,
          start: DateTime(2026, 3, 1),
          end: DateTime(2026, 4, 1),
          schedule: schedule,
        )
        .run();
    expect(gotType, CredentialType.cycle);
    expect(gotCfg!.single.weekDay, 3);
  });

  test('addByPhoto 无网关非奕诺：BLE addFaceData 再 addType=1', () async {
    when(
      () => ttlock.addFaceData(
        any(),
        0,
        0,
        'AABB',
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => 'F77');
    when(
      () => repo.add(
        1,
        faceName: any(named: 'faceName'),
        faceNumber: 'F77',
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: ChannelType.bleSynced,
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    await domain
        .addByPhoto(
          lockId: 1,
          lockData: 'ld',
          hasGateway: false,
          isYiNuo: false,
          featureData: 'AABB',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    verify(
      () => repo.add(
        1,
        faceNumber: 'F77',
        channel: ChannelType.bleSynced,
        faceName: any(named: 'faceName'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
      ),
    ).called(1);
  });

  test('addByPhoto 奕诺无网关：Left -22，不调 addFaceData', () async {
    final r = await domain
        .addByPhoto(
          lockId: 1,
          lockData: 'ld',
          hasGateway: false,
          isYiNuo: true,
          featureData: 'AABB',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    expect(
      r.fold((e) => e is AppBusinessException ? e.code : 0, (_) => 0),
      -22,
    );
    verifyNever(
      () => ttlock.addFaceData(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('addByPhoto 无网关非奕诺空 lockData：Left -21，不调 addFaceData', () async {
    final r = await domain
        .addByPhoto(
          lockId: 1,
          lockData: '',
          hasGateway: false,
          isYiNuo: false,
          featureData: 'AABB',
          name: 'n',
          kind: CredentialValidityKind.permanent,
        )
        .run();
    expect(
      r.fold((e) => e is AppBusinessException ? e.code : 0, (_) => 0),
      -21,
    );
    verifyNever(
      () => ttlock.addFaceData(
        any(),
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('addViaBle 转发 canStartAdd/success', () async {
    when(
      () => ttlock.lockAddFace('ld', cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddFaceEvent(phase: TTAddFacePhase.canStartAdd),
        AddFaceEvent(
          phase: TTAddFacePhase.success,
          faceNumber: 'F1',
        ),
      ]),
    );
    final events = await domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .toList();
    expect(events.first.phase, TTAddFacePhase.canStartAdd);
    expect(events.last.faceNumber, 'F1');
  });

  test('cancelAdd 后不再 emit，且不经过云端 add', () async {
    final controller = StreamController<AddFaceEvent>();
    when(
      () => ttlock.lockAddFace(any(), cycleList: any(named: 'cycleList'), startDate: any(named: 'startDate'), endDate: any(named: 'endDate'),
      ),
    ).thenAnswer((_) => controller.stream);
    final events = <AddFaceEvent>[];
    final sub = domain
        .addViaBle(lockData: 'ld', startMs: 0, endMs: 0)
        .listen(events.add);
    addTearDown(() async {
      await sub.cancel();
      await controller.close();
    });
    controller.add(
      AddFaceEvent(phase: TTAddFacePhase.canStartAdd),
    );
    await Future<void>.delayed(Duration.zero);
    domain.cancelAdd();
    controller.add(
      AddFaceEvent(
        phase: TTAddFacePhase.success,
        faceNumber: 'F1',
      ),
    );
    await Future<void>.delayed(Duration.zero);
    expect(events.where((e) => e.faceNumber == 'F1'), isEmpty);
    verifyNever(
      () => repo.add(
        any(),
        faceName: any(named: 'faceName'),
        faceNumber: any(named: 'faceNumber'),
        startDate: any(named: 'startDate'),
        endDate: any(named: 'endDate'),
        type: any(named: 'type'),
        cyclicConfig: any(named: 'cyclicConfig'),
        channel: any(named: 'channel'),
      ),
    );
  });

  test('extractFeature 调 getFeatureDataByPhoto', () async {
    when(
      () => repo.getFeatureDataByPhoto(1, [1, 2, 3]),
    ).thenAnswer((_) => TaskEither.right('AABB'));
    final data = (await domain.extractFeature(1, [
      1,
      2,
      3,
    ]).run()).getOrElse((_) => throw TestFailure('left'));
    expect(data, 'AABB');
  });

  test('delete：有网关只调 repo channel=gatewayWifi', () async {
    when(
      () => repo.delete(1, 3, channel: ChannelType.gatewayWifi),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          face: const FaceEntity(faceId: 3, faceNumber: 'F1'),
        )
        .run();
    verifyNever(() => ttlock.deleteFace(any(), any(), timeout: any(named: 'timeout')));
  });

  test('changePeriod permanent face returns Left without BLE', () async {
    final r = await domain
        .changePeriod(
          lock: const LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
          face: const FaceEntity(faceId: 3, faceNumber: 'F1'),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isLeft(), isTrue);
    r.fold((err) {
      expect((err as AppBusinessException).code, -23);
    }, (_) => fail('expected left'));
    verifyNever(
      () => ttlock.modifyFace(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
    verifyNever(
      () => repo.changePeriod(
        any(),
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
          face: _limitedFace(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    verifyNever(
      () => ttlock.modifyFace(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('changePeriod cyclic forwards cyclicConfig and cycleList', () async {
    List<CyclicConfig>? gotCfg;
    DateTime? gotStart;
    DateTime? gotEnd;
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
      gotStart = inv.namedArguments[#startDate] as DateTime?;
      gotEnd = inv.namedArguments[#endDate] as DateTime?;
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
          face: FaceEntity(
            faceId: 3,
            faceNumber: 'F1',
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
    expect(gotStart!.hour, 0);
    expect(gotEnd!.hour, 23);
    expect(gotCfg!.single.weekDay, 1);
    verifyNever(
      () => ttlock.modifyFace(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
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
      () => ttlock.modifyFace(any(), any(), any(), any(), any(), timeout: any(named: 'timeout')),
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
          face: _limitedFace(),
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 2, 1),
        )
        .run();
    expect(r.isRight(), isTrue);
    verify(
      () => ttlock.modifyFace('F1', any(), any(), any(), 'ld', timeout: any(named: 'timeout')),
    ).called(1);
  });

  test('rename 只调云端，不 setAlias', () async {
    when(
      () => repo.rename(1, 3, 'n2'),
    ).thenAnswer((_) => TaskEither.right(unit));
    await domain
        .rename(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          face: const FaceEntity(faceId: 3, faceNumber: 'F1'),
          name: 'n2',
        )
        .run();
    verify(() => repo.rename(1, 3, 'n2')).called(1);
    verifyNever(
      () => ttlock.setAlias(any(), any(), any(), any(), timeout: any(named: 'timeout')),
    );
  });

  test('list 透传 repo.list', () async {
    when(() => repo.list(1)).thenAnswer(
      (_) => TaskEither.right(const [FaceEntity(faceId: 3, faceNumber: 'F1')]),
    );
    final items = (await domain.list(1).run()).getOrElse(
      (_) => throw TestFailure('left'),
    );
    expect(items.single.faceId, 3);
  });
}
