import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockFingerprintDomain extends Mock implements FingerprintDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeFingerprintDomain extends FingerprintDomain {
  _FakeFingerprintDomain(this._mock);
  final _MockFingerprintDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required FingerprintEntity fingerprint,
    required String name,
  }) => _mock.rename(lock: lock, fingerprint: fingerprint, name: name);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const FingerprintEntity());
  });

  test('rename 转发 domain.rename，不经过 BLE', () async {
    final domain = _MockFingerprintDomain();
    when(
      () => domain.rename(
        lock: any(named: 'lock'),
        fingerprint: any(named: 'fingerprint'),
        name: any(named: 'name'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const args = FingerprintDetailArgs(
      lock: LockEntity(lockId: 1, lockData: 'ld'),
      item: FingerprintEntity(
        fingerprintId: 3,
        fingerprintNumber: 'FP1',
        fingerprintName: 'old',
      ),
    );
    final container = ProviderContainer(
      overrides: [
        fingerprintDomainProvider.overrideWith(
          () => _FakeFingerprintDomain(domain),
        ),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(fingerprintDetailProvider(args).notifier);
    await n.rename('new');
    expect(n.state.item.fingerprintName, 'new');
    verify(
      () => domain.rename(
        lock: args.lock,
        fingerprint: any(named: 'fingerprint'),
        name: 'new',
      ),
    ).called(1);
  });
}
