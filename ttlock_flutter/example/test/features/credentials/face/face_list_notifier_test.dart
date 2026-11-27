import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_list_notifier.dart';

class _MockFaceDomain extends Mock implements FaceDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFaceDomain extends FaceDomain {
  _FakeFaceDomain(this._mock);
  final _MockFaceDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<FaceEntity>> list(int lockId) =>
      _mock.list(lockId);
}

void main() {
  test('build 加载列表，refresh 重载', () async {
    final domain = _MockFaceDomain();
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [FaceEntity(faceId: 3, faceNumber: 'F1')]),
    );
    final container = ProviderContainer(
      overrides: [
        faceDomainProvider.overrideWith(() => _FakeFaceDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(faceListProvider(1), (_, _) {});
    final n = container.read(faceListProvider(1).notifier);
    await container.read(faceListProvider(1).future);
    expect(n.state.value!.items.single.faceId, 3);
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [FaceEntity(faceId: 9, faceNumber: 'F2')]),
    );
    await n.refresh();
    expect(n.state.value!.items.single.faceId, 9);
  });
}
