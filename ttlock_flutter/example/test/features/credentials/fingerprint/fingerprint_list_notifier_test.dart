import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_list_notifier.dart';

class _MockFingerprintDomain extends Mock implements FingerprintDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFingerprintDomain extends FingerprintDomain {
  _FakeFingerprintDomain(this._mock);
  final _MockFingerprintDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<FingerprintEntity>> list(int lockId) =>
      _mock.list(lockId);
}

void main() {
  test('build 加载列表，refresh 重载', () async {
    final domain = _MockFingerprintDomain();
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        FingerprintEntity(fingerprintId: 3, fingerprintNumber: 'FP1'),
      ]),
    );
    final container = ProviderContainer(
      overrides: [
        fingerprintDomainProvider.overrideWith(
          () => _FakeFingerprintDomain(domain),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.listen(fingerprintListProvider(1), (_, _) {});
    final n = container.read(fingerprintListProvider(1).notifier);
    await container.read(fingerprintListProvider(1).future);
    expect(n.state.value!.items.single.fingerprintId, 3);
    when(() => domain.list(1)).thenAnswer(
      (_) => TaskEither.right(const [
        FingerprintEntity(fingerprintId: 9, fingerprintNumber: 'FP2'),
      ]),
    );
    await n.refresh();
    expect(n.state.value!.items.single.fingerprintId, 9);
  });
}
