import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_list_notifier.dart';

class _MockPalmVeinDomain extends Mock implements PalmVeinDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakePalmVeinDomain extends PalmVeinDomain {
  _FakePalmVeinDomain(this._mock);
  final _MockPalmVeinDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<PalmVeinEntity>> list(int lockId) =>
      _mock.list(lockId);
}

void main() {
  test('build 加载列表，refresh 重载', () async {
    final domain = _MockPalmVeinDomain();
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [PalmVeinEntity(id: 3, number: 'PV1')]),
    );
    final container = ProviderContainer(
      overrides: [
        palmVeinDomainProvider.overrideWith(() => _FakePalmVeinDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(palmVeinListProvider(1), (_, _) {});
    final n = container.read(palmVeinListProvider(1).notifier);
    await container.read(palmVeinListProvider(1).future);
    expect(n.state.value!.items.single.id, 3);
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [PalmVeinEntity(id: 9, number: 'PV2')]),
    );
    await n.refresh();
    expect(n.state.value!.items.single.id, 9);
  });
}
