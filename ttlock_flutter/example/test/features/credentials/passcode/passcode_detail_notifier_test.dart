import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class _MockPasscodeDomain extends Mock implements PasscodeDomain {}

class _FakePasscodeDomain extends PasscodeDomain {
  _FakePasscodeDomain(this._mock);
  final _MockPasscodeDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, Unit> change({
    required LockEntity lock,
    required KeyboardPwdEntity pwd,
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? start,
    DateTime? end,
  }) => _mock.change(
    lock: lock,
    pwd: pwd,
    keyboardPwdName: keyboardPwdName,
    newKeyboardPwd: newKeyboardPwd,
    start: start,
    end: end,
  );
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity());
    registerFallbackValue(
      const KeyboardPwdEntity(keyboardPwdId: 1, keyboardPwd: '123456'),
    );
  });

  test('changePassword：非法 4–9 位数字 → error，不调 domain', () async {
    final domain = _MockPasscodeDomain();
    const args = PasscodeDetailArgs(
      lock: LockEntity(lockId: 1, lockData: 'ld', hasGateway: true),
      pwd: KeyboardPwdEntity(keyboardPwdId: 7, keyboardPwd: '123456'),
    );
    final container = ProviderContainer(
      overrides: [
        passcodeDomainProvider.overrideWith(() => _FakePasscodeDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    final n = container.read(passcodeDetailProvider(args).notifier);
    await n.changePassword('12');
    expect(n.state.error, isA<AppBusinessException>());
    expect(
      (n.state.error! as AppBusinessException).message,
      'invalid_passcode',
    );
    verifyNever(
      () => domain.change(
        lock: any(named: 'lock'),
        pwd: any(named: 'pwd'),
        keyboardPwdName: any(named: 'keyboardPwdName'),
        newKeyboardPwd: any(named: 'newKeyboardPwd'),
        start: any(named: 'start'),
        end: any(named: 'end'),
      ),
    );
  });
}
