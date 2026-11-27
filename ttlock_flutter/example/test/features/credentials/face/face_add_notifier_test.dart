import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockFaceDomain extends Mock implements FaceDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFaceDomain extends FaceDomain {
  _FakeFaceDomain(this._mock);
  final _MockFaceDomain _mock;

  @override
  void build() {}

  @override
  Stream<AddFaceEvent> addViaBle({
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
    required String lockData,
    required String faceNumber,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => _mock.confirmAdd(
    lockId: lockId,
    lockData: lockData,
    faceNumber: faceNumber,
    name: name,
    kind: kind,
    start: start,
    end: end,
    schedule: schedule,
  );
}

void main() {
  const lock = LockEntity(lockId: 1, lockData: 'ld');

  setUpAll(() {
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(CredentialValidityKind.permanent);
    registerFallbackValue(<TTCycleModel>[]);
  });

  /// 让事件流回调和 confirmAdd 的 Future 全部落定。
  Future<void> settle() => Future<void>.delayed(Duration.zero);

  Future<void> waitFor(
    FaceAddNotifier n,
    bool Function(FaceAddState) pred,
  ) async {
    for (var i = 0; i < 200; i++) {
      if (pred(n.state)) return;
      await settle();
    }
    fail('state did not satisfy predicate: ${n.state}');
  }

  test('showCyclic 默认 true，不探测能力位', () {
    final domain = _MockFaceDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(faceAddProvider(lock), (_, _) {});
    final n = container.read(faceAddProvider(lock).notifier);
    expect(n.state.showCyclic, isTrue);
  });

  test(
    '相位驱动 state：canStartAdd/collecting/error；error 非终止可继续到 success',
    () async {
      final domain = _MockFaceDomain();
      final controller = StreamController<AddFaceEvent>();
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
          lockData: 'ld',
          faceNumber: 'F1',
          name: 'n',
          kind: any(named: 'kind'),
          start: any(named: 'start'),
          end: any(named: 'end'),
          schedule: any(named: 'schedule'),
        ),
      ).thenAnswer((_) => TaskEither.right(8));
      final container = ProviderContainer(
        overrides: [
          faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
        ],
      );
      addTearDown(() async {
        container.dispose();
        if (!controller.isClosed) await controller.close();
      });
      container.listen(faceAddProvider(lock), (_, _) {});
      final n = container.read(faceAddProvider(lock).notifier);
      expect(await n.start(name: 'n'), isTrue);

      controller.add(AddFaceEvent(phase: TTAddFacePhase.canStartAdd));
      await settle();
      expect(n.state.phase, TTAddFacePhase.canStartAdd);
      expect(n.state.isRunning, isTrue);

      controller.add(AddFaceEvent(phase: TTAddFacePhase.collecting));
      await settle();
      expect(n.state.phase, TTAddFacePhase.collecting);

      // error 相位是采集反馈，不终止录入：仍保持 isRunning，且给出 hint。
      controller.add(
        AddFaceEvent(
          phase: TTAddFacePhase.error,
          errorCode: TTFaceErrorCode.noFaceDetected,
        ),
      );
      await settle();
      expect(n.state.phase, TTAddFacePhase.error);
      expect(n.state.isRunning, isTrue);
      expect(n.state.hint, isNotEmpty);
      expect(n.state.error, isNull);

      // error 之后可继续成功。
      controller.add(
        AddFaceEvent(phase: TTAddFacePhase.success, faceNumber: 'F1'),
      );
      await controller.close();
      await waitFor(n, (s) => s.succeeded);
      expect(n.state.faceNumber, 'F1');
      expect(n.state.succeeded, isTrue);
      verify(
        () => domain.confirmAdd(
          lockId: 1,
          lockData: 'ld',
          faceNumber: 'F1',
          name: 'n',
          kind: CredentialValidityKind.permanent,
          start: any(named: 'start'),
          end: any(named: 'end'),
          schedule: any(named: 'schedule'),
        ),
      ).called(1);
    },
  );

  test('cancel 停止采集：不调 confirmAdd，后续 success 事件被忽略', () async {
    final domain = _MockFaceDomain();
    final controller = StreamController<AddFaceEvent>();
    when(
      () => domain.addViaBle(
        lockData: any(named: 'lockData'),
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer((_) => controller.stream);
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(() async {
      container.dispose();
      if (!controller.isClosed) await controller.close();
    });
    container.listen(faceAddProvider(lock), (_, _) {});
    final n = container.read(faceAddProvider(lock).notifier);
    await n.start(name: 'n');
    controller.add(AddFaceEvent(phase: TTAddFacePhase.canStartAdd));
    await settle();
    n.cancel();
    expect(n.state.isRunning, isFalse);

    controller.add(
      AddFaceEvent(phase: TTAddFacePhase.success, faceNumber: 'F1'),
    );
    await controller.close();
    await settle();
    expect(n.state.succeeded, isFalse);
    verifyNever(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        faceNumber: any(named: 'faceNumber'),
        name: any(named: 'name'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    );
  });

  test('流结束无 success：isRunning false、未成功，可重新添加', () async {
    final domain = _MockFaceDomain();
    when(
      () => domain.addViaBle(
        lockData: 'ld',
        startMs: any(named: 'startMs'),
        endMs: any(named: 'endMs'),
        cycleList: any(named: 'cycleList'),
      ),
    ).thenAnswer(
      (_) => Stream.fromIterable([
        AddFaceEvent(phase: TTAddFacePhase.canStartAdd),
      ]),
    );
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(faceAddProvider(lock), (_, _) {});
    final n = container.read(faceAddProvider(lock).notifier);
    expect(await n.start(name: 'n'), isTrue);
    await waitFor(n, (s) => !s.isRunning);
    expect(n.state.succeeded, isFalse);
    expect(n.state.phase, TTAddFacePhase.canStartAdd);
    verifyNever(
      () => domain.confirmAdd(
        lockId: any(named: 'lockId'),
        lockData: any(named: 'lockData'),
        faceNumber: any(named: 'faceNumber'),
        name: any(named: 'name'),
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    );
  });

  test('lockData 空 → ble_unreachable，不开始 Stream', () async {
    final domain = _MockFaceDomain();
    when(() => domain.cancelAdd()).thenReturn(null);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    const empty = LockEntity(lockId: 1);
    container.listen(faceAddProvider(empty), (_, _) {});
    final n = container.read(faceAddProvider(empty).notifier);
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
    final domain = _MockFaceDomain();
    final controller = StreamController<AddFaceEvent>();
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
        lockData: 'ld',
        faceNumber: 'F1',
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
          : TaskEither.right(8);
    });
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(() async {
      container.dispose();
      if (!controller.isClosed) await controller.close();
    });
    container.listen(faceAddProvider(lock), (_, _) {});
    final n = container.read(faceAddProvider(lock).notifier);
    await n.start(name: 'n');
    controller.add(AddFaceEvent(phase: TTAddFacePhase.canStartAdd));
    await settle();
    controller.add(
      AddFaceEvent(phase: TTAddFacePhase.success, faceNumber: 'F1'),
    );
    await controller.close();
    await waitFor(n, (s) => s.error != null);
    expect(n.state.succeeded, isFalse);
    expect(n.state.faceNumber, 'F1');
    expect(confirmCalls, 1);

    // faceNumber 已存在 → retry 只重提云端，不再触发 addViaBle。
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
