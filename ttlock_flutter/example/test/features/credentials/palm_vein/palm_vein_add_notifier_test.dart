import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockPalmVeinDomain extends Mock implements PalmVeinDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakePalmVeinDomain extends PalmVeinDomain {
  _FakePalmVeinDomain(this._mock);
  final _MockPalmVeinDomain _mock;

  @override
  void build() {}

  @override
  Stream<AddPalmVeinEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) => _mock.addViaBle(
    lockData: lockData,
    startMs: startMs,
    endMs: endMs,
    cycleList: cycleList,
  );

  @override
  void cancelAdd() => _mock.cancelAdd();

  @override
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String number,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => _mock.confirmAdd(
    lockId: lockId,
    number: number,
    name: name,
    kind: kind,
    start: start,
    end: end,
    schedule: schedule,
  );
}

void main() {
  const lock = LockEntity(lockId: 1, lockData: 'ld');

  tearDown(resetTtLockTestHooks);

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(CredentialValidityKind.permanent);
    registerFallbackValue(TTLockFunction.cyclicCardOrFingerprint);
    registerFallbackValue(<TTCycleModel>[]);
  });

  /// 让事件流回调和 confirmAdd 的 Future 全部落定。
  Future<void> settle() => Future<void>.delayed(Duration.zero);

  Future<void> waitFor(
    PalmVeinAddNotifier n,
    bool Function(PalmVeinAddState) pred,
  ) async {
    for (var i = 0; i < 200; i++) {
      if (pred(n.state)) return;
      await settle();
    }
    fail('state did not satisfy predicate: ${n.state}');
  }

  ProviderContainer containerOf({
    required _MockPalmVeinDomain domain,
    MockTTLockApi? ttlock,
  }) {
    final mockTtlock = ttlock ?? MockTTLockApi();
    installMockLockApi(mockTtlock);
    if (ttlock == null) {
      when(
        () => mockTtlock.supportFunction(
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) async => false);
    }
    return ProviderContainer(
      overrides: [
        palmVeinDomainProvider.overrideWith(() => _FakePalmVeinDomain(domain)),
      ],
    );
  }

  test('showCyclic 默认 false；探测 cyclicCardOrFingerprint 后更新', () async {
    final domain = _MockPalmVeinDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.supportFunction(
        TTLockFunction.cyclicCardOrFingerprint,
        'ld',
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => true);
    final container = containerOf(domain: domain, ttlock: ttlock);
    addTearDown(container.dispose);
    container.listen(palmVeinAddProvider(lock), (_, _) {});
    final n = container.read(palmVeinAddProvider(lock).notifier);
    expect(n.state.showCyclic, isFalse);
    await Future<void>.delayed(Duration.zero);
    expect(n.state.showCyclic, isTrue);
  });

  test('lockData 空时 showCyclic 保持 false', () async {
    final domain = _MockPalmVeinDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const empty = LockEntity(lockId: 1);
    container.listen(palmVeinAddProvider(empty), (_, _) {});
    final n = container.read(palmVeinAddProvider(empty).notifier);
    await Future<void>.delayed(Duration.zero);
    expect(n.state.showCyclic, isFalse);
  });

  test('相位驱动 state：canStartAdd/error；error 非终止可继续到 success', () async {
    final domain = _MockPalmVeinDomain();
    final controller = StreamController<AddPalmVeinEvent>();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) => controller.stream);
    when(() => domain.cancelAdd()).thenReturn(null);
    when(
      () => domain.confirmAdd(
        lockId: 1,
        number: 'PV1',
        name: 'n',
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(4));
    final container = containerOf(domain: domain);
    addTearDown(() async {
      container.dispose();
      if (!controller.isClosed) await controller.close();
    });
    container.listen(palmVeinAddProvider(lock), (_, _) {});
    final n = container.read(palmVeinAddProvider(lock).notifier);
    expect(await n.start(name: 'n'), isTrue);

    controller.add(AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd));
    await settle();
    expect(n.state.phase, TTAddPalmVeinPhase.canStartAdd);
    expect(n.state.isRunning, isTrue);
    expect(n.state.hint, isNotEmpty);

    // 掌静脉无 collecting 相位，error 就是每帧采集反馈，不终止录入。
    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.error,
        errorCode: TTPalmVeinErrorCode.noPalmVeinDetected,
      ),
    );
    await settle();
    expect(n.state.phase, TTAddPalmVeinPhase.error);
    expect(n.state.isRunning, isTrue);
    expect(n.state.error, isNull);
    final l = lookupAppLocalizations(const Locale('zh'));
    expect(n.state.hint, l.errorFirmwarePalmVeinNoPalmDetected);

    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.error,
        errorCode: TTPalmVeinErrorCode.palmBack,
      ),
    );
    await settle();
    expect(n.state.isRunning, isTrue);
    expect(n.state.hint, l.errorFirmwarePalmVeinBack);

    // error 之后可继续成功。
    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.success,
        palmVeinNumber: 'PV1',
      ),
    );
    await controller.close();
    await waitFor(n, (s) => s.succeeded);
    expect(n.state.palmVeinNumber, 'PV1');
    expect(n.state.succeeded, isTrue);
    verify(
      () => domain.confirmAdd(
        lockId: 1,
        number: 'PV1',
        name: 'n',
        kind: CredentialValidityKind.permanent,
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).called(1);
  });

  test('cancel 停止采集：不调 confirmAdd，后续 success 事件被忽略，保留取消提示', () async {
    final domain = _MockPalmVeinDomain();
    final controller = StreamController<AddPalmVeinEvent>();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) => controller.stream);
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(() async {
      container.dispose();
      if (!controller.isClosed) await controller.close();
    });
    container.listen(palmVeinAddProvider(lock), (_, _) {});
    final n = container.read(palmVeinAddProvider(lock).notifier);
    await n.start(name: 'n');
    controller.add(AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd));
    await settle();
    n.cancel();
    expect(n.state.isRunning, isFalse);
    expect(
      n.state.hint,
      lookupAppLocalizations(const Locale('zh')).enrollCancelHint,
    );

    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.success,
        palmVeinNumber: 'PV1',
      ),
    );
    await controller.close();
    await settle();
    expect(n.state.succeeded, isFalse);
    verifyNever(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        number: any(named: 'number'),
        name: any(named: 'name'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    );
  });

  test('流结束无 success：isRunning false、未成功，可重新添加', () async {
    final domain = _MockPalmVeinDomain();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    container.listen(palmVeinAddProvider(lock), (_, _) {});
    final n = container.read(palmVeinAddProvider(lock).notifier);
    expect(await n.start(name: 'n'), isTrue);
    await waitFor(n, (s) => !s.isRunning);
    expect(n.state.succeeded, isFalse);
    expect(n.state.phase, TTAddPalmVeinPhase.canStartAdd);
    verifyNever(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        number: any(named: 'number'),
        name: any(named: 'name'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    );
  });

  test('lockData 空 → ble_unreachable，不开始 Stream', () async {
    final domain = _MockPalmVeinDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = containerOf(domain: domain);
    addTearDown(container.dispose);
    const empty = LockEntity(lockId: 1);
    container.listen(palmVeinAddProvider(empty), (_, _) {});
    final n = container.read(palmVeinAddProvider(empty).notifier);
    expect(await n.start(name: 'n'), isFalse);
    expect((n.state.error! as AppBusinessException).code, -21);
    verifyNever(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    );
  });

  test('云端确认失败后可重试：仅重提 submit，不重跑 addViaBle', () async {
    final domain = _MockPalmVeinDomain();
    final controller = StreamController<AddPalmVeinEvent>();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) => controller.stream);
    when(() => domain.cancelAdd()).thenReturn(null);
    var confirmCalls = 0;
    when(
      () => domain.confirmAdd(
        lockId: 1,
        number: 'PV1',
        name: 'n',
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) {
      confirmCalls++;
      return confirmCalls == 1
          ? TaskEither.left(
              AppException.business(code: -1, message: 'upload_fail'),
            )
          : TaskEither.right(4);
    });
    final container = containerOf(domain: domain);
    addTearDown(() async {
      container.dispose();
      if (!controller.isClosed) await controller.close();
    });
    container.listen(palmVeinAddProvider(lock), (_, _) {});
    final n = container.read(palmVeinAddProvider(lock).notifier);
    await n.start(name: 'n');
    controller.add(AddPalmVeinEvent(phase: TTAddPalmVeinPhase.canStartAdd));
    await settle();
    controller.add(
      AddPalmVeinEvent(
        phase: TTAddPalmVeinPhase.success,
        palmVeinNumber: 'PV1',
      ),
    );
    await controller.close();
    await waitFor(n, (s) => s.error != null);
    expect(n.state.succeeded, isFalse);
    expect(n.state.palmVeinNumber, 'PV1');
    expect(confirmCalls, 1);

    // palmVeinNumber 已存在 → retry 只重提云端，不再触发 addViaBle。
    await n.start(name: 'n');
    await waitFor(n, (s) => s.succeeded);
    expect(n.state.succeeded, isTrue);
    expect(confirmCalls, 2);
    verify(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).called(1);
  });
}
