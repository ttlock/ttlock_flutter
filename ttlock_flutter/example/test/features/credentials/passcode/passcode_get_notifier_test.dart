import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_get_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_get_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import '../../../helpers/mock_tt_lock_api.dart';

class _MockPasscodeDomain extends Mock implements PasscodeDomain {}

class _FakePasscodeDomain extends PasscodeDomain {
  _FakePasscodeDomain(this._mock);
  final _MockPasscodeDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, KeyboardPwdEntity> getRandom({
    required int lockId,
    required KeyboardPwdType type,
    DateTime? start,
    DateTime? end,
    String? keyboardPwdName,
  }) => _mock.getRandom(
    lockId: lockId,
    type: type,
    start: start,
    end: end,
    keyboardPwdName: keyboardPwdName,
  );
}

void main() {
  tearDown(resetTtLockTestHooks);

  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(Duration.zero);
    registerFallbackValue(KeyboardPwdType.limited);
    registerFallbackValue(DateTime(2026));
  });

  test('submit：invalid_cyclic_window 不调 getRandom', () async {
    final domain = _MockPasscodeDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.supportFunction(
        TTLockFunction.cyclePassword,
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => true);
    const lock = LockEntity(lockId: 1, lockData: 'ld');
    final container = ProviderContainer(
      overrides: [
        passcodeDomainProvider.overrideWith(() => _FakePasscodeDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(passcodeGetProvider(lock), (_, _) {});
    final n = container.read(passcodeGetProvider(lock).notifier);
    await Future<void>.delayed(Duration.zero);
    expect(n.state.showCyclic, isTrue);
    n.setKind(PasscodeGetKind.cyclic);
    n.setStartMinutes(600);
    n.setEndMinutes(600);
    final ok = await n.submit();
    expect(ok, isFalse);
    expect(
      (n.state.error! as AppBusinessException).message,
      'invalid_cyclic_window',
    );
    verifyNever(
      () => domain.getRandom(
        lockId: any(named: 'lockId'),
        type: any(named: 'type'),
        start: any(named: 'start'),
        end: any(named: 'end'),
        keyboardPwdName: any(named: 'keyboardPwdName'),
      ),
    );
  });
}
