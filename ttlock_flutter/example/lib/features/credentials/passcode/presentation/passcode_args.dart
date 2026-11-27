import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class PasscodeDetailArgs {
  const PasscodeDetailArgs({required this.lock, required this.pwd});

  final LockEntity lock;
  final KeyboardPwdEntity pwd;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasscodeDetailArgs && other.lock == lock && other.pwd == pwd;

  @override
  int get hashCode => Object.hash(lock, pwd);
}
