import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockFaceDomain extends Mock implements FaceDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFaceDomain extends FaceDomain {
  _FakeFaceDomain(this._mock);
  final _MockFaceDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required FaceEntity face,
    required String name,
  }) => _mock.rename(lock: lock, face: face, name: name);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const FaceEntity());
  });

  test('rename 转发 domain.rename，不经过 BLE', () async {
    final domain = _MockFaceDomain();
    when(
      () => domain.rename(
        lock: any(named: 'lock'),
        face: any(named: 'face'),
        name: any(named: 'name'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const args = FaceDetailArgs(
      lock: LockEntity(lockId: 1, lockData: 'ld'),
      item: FaceEntity(faceId: 3, faceNumber: 'F1', name: 'old'),
    );
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(faceDetailProvider(args).notifier);
    await n.rename('new');
    expect(n.state.item.name, 'new');
    verify(
      () => domain.rename(
        lock: args.lock,
        face: any(named: 'face'),
        name: 'new',
      ),
    ).called(1);
  });
}
