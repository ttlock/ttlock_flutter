import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_photo_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockFaceDomain extends Mock implements FaceDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFaceDomain extends FaceDomain {
  _FakeFaceDomain(this._mock);
  final _MockFaceDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, String> extractFeature(
    int lockId,
    List<int> imageBytes,
  ) => _mock.extractFeature(lockId, imageBytes);

  @override
  TaskEither<AppException, int> addByPhoto({
    required int lockId,
    required String lockData,
    required bool hasGateway,
    required bool isYiNuo,
    required String featureData,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => _mock.addByPhoto(
    lockId: lockId,
    lockData: lockData,
    hasGateway: hasGateway,
    isYiNuo: isYiNuo,
    featureData: featureData,
    name: name,
    kind: kind,
    start: start,
    end: end,
    schedule: schedule,
  );
}

void main() {
  const lock = LockEntity(lockId: 1, lockData: 'ld', hasGateway: true);

  tearDown(resetTtLockTestHooks);

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(CredentialValidityKind.permanent);
    registerFallbackValue(TTLockFunction.yiNuoPhotoFace);
    registerFallbackValue(TTAliasType.face);
  });

  test('showCyclic 默认 true', () {
    final domain = _MockFaceDomain();
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(facePhotoAddProvider(lock).notifier);
    expect(n.state.showCyclic, isTrue);
  });

  test('>2MB 拒绝，不保留 imageBytes', () {
    final domain = _MockFaceDomain();
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(facePhotoAddProvider(lock).notifier);
    n.setPhoto(List<int>.filled(2 * 1024 * 1024 + 1, 0));
    expect(n.state.photoTooLarge, isTrue);
    expect(n.state.imageBytes, isNull);
  });

  test('submit：extractFeature 再 addByPhoto，不走 setAlias', () async {
    final domain = _MockFaceDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => domain.extractFeature(1, [1, 2, 3]),
    ).thenAnswer((_) => TaskEither.right('AABB'));
    when(
      () => domain.addByPhoto(
        lockId: 1,
        lockData: 'ld',
        hasGateway: true,
        isYiNuo: false,
        featureData: 'AABB',
        name: 'n',
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    when(
      () => ttlock.supportFunction(TTLockFunction.yiNuoPhotoFace, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => false);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(facePhotoAddProvider(lock).notifier);
    n.setPhoto(const [1, 2, 3]);
    final ok = await n.submit(name: 'n');
    expect(ok, isTrue);
    verify(
      () => domain.addByPhoto(
        lockId: 1,
        lockData: 'ld',
        hasGateway: true,
        isYiNuo: false,
        featureData: 'AABB',
        name: 'n',
        kind: CredentialValidityKind.permanent,
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).called(1);
    verifyNever(
      () => ttlock.setAlias(
        any(),
        any(),
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  test('submit cyclic 转发 kind/schedule', () async {
    final domain = _MockFaceDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    const schedule = CyclicSchedule(
      weekDays: {1},
      startMinutes: 480,
      endMinutes: 1080,
    );
    when(
      () => domain.extractFeature(1, [1, 2, 3]),
    ).thenAnswer((_) => TaskEither.right('AABB'));
    when(
      () => domain.addByPhoto(
        lockId: 1,
        lockData: 'ld',
        hasGateway: true,
        isYiNuo: false,
        featureData: 'AABB',
        name: 'n',
        kind: any(named: 'kind'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: any(named: 'schedule'),
      ),
    ).thenAnswer((_) => TaskEither.right(8));
    when(
      () => ttlock.supportFunction(TTLockFunction.yiNuoPhotoFace, 'ld', timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => false);
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(facePhotoAddProvider(lock).notifier);
    n.setKind(CredentialValidityKind.cyclic);
    n.setSchedule(schedule);
    n.setPhoto(const [1, 2, 3]);
    final ok = await n.submit(name: 'n');
    expect(ok, isTrue);
    verify(
      () => domain.addByPhoto(
        lockId: 1,
        lockData: 'ld',
        hasGateway: true,
        isYiNuo: false,
        featureData: 'AABB',
        name: 'n',
        kind: CredentialValidityKind.cyclic,
        start: any(named: 'start'),
        end: any(named: 'end'),
        schedule: schedule,
      ),
    ).called(1);
  });
}
