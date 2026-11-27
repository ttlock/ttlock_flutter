import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/palm_vein_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockPalmVeinDomain extends Mock implements PalmVeinDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakePalmVeinDomain extends PalmVeinDomain {
  _FakePalmVeinDomain(this._mock);
  final _MockPalmVeinDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required PalmVeinEntity palmVein,
    required String name,
  }) => _mock.rename(lock: lock, palmVein: palmVein, name: name);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity());
    registerFallbackValue(const PalmVeinEntity());
  });

  test('rename 转发 domain.rename，不经过 BLE', () async {
    final domain = _MockPalmVeinDomain();
    when(
      () => domain.rename(
        lock: any(named: 'lock'),
        palmVein: any(named: 'palmVein'),
        name: any(named: 'name'),
      ),
    ).thenAnswer((_) => TaskEither.right(unit));
    const args = PalmVeinDetailArgs(
      lock: LockEntity(lockId: 1, lockData: 'ld'),
      item: PalmVeinEntity(id: 3, number: 'PV1', name: 'old'),
    );
    final container = ProviderContainer(
      overrides: [
        palmVeinDomainProvider.overrideWith(() => _FakePalmVeinDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(palmVeinDetailProvider(args).notifier);
    await n.rename('new');
    expect(n.state.item.name, 'new');
    verify(
      () => domain.rename(
        lock: args.lock,
        palmVein: any(named: 'palmVein'),
        name: 'new',
      ),
    ).called(1);
  });
}
