import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/data/repository/keyboard_pwd_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/repository/keyboard_pwd_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'passcode_domain.g.dart';

final _customPwd = RegExp(r'^\d{4,9}$');

@Riverpod(keepAlive: true)
class PasscodeDomain extends _$PasscodeDomain {
  late final KeyboardPwdRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(keyboardPwdRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _repo.list(lockId, pageNo: pageNo, pageSize: pageSize);

  TaskEither<AppException, KeyboardPwdEntity> getRandom({
    required int lockId,
    required KeyboardPwdType type,
    DateTime? start,
    DateTime? end,
    String? keyboardPwdName,
  }) {
    if (type == KeyboardPwdType.delete) {
      return TaskEither.left(
        AppException.business(code: 0, message: 'unsupported_passcode_type'),
      );
    }
    return _repo.getRandom(
      lockId,
      keyboardPwdType: type,
      keyboardPwdName: keyboardPwdName,
      startDate: start ?? DateTime.now(),
      endDate: end,
    );
  }

  TaskEither<AppException, int> addCustom({
    required LockEntity lock,
    required String keyboardPwd,
    required KeyboardPwdType type,
    String? keyboardPwdName,
    DateTime? start,
    DateTime? end,
  }) => TaskEither.tryCatch(() async {
    if (!_customPwd.hasMatch(keyboardPwd)) {
      throw AppException.business(code: 0, message: 'invalid_passcode');
    }
    if (type != KeyboardPwdType.permanent && type != KeyboardPwdType.limited) {
      throw AppException.business(
        code: 0,
        message: 'unsupported_passcode_type',
      );
    }
    final epochZero = DateTime.fromMillisecondsSinceEpoch(0);
    final cloudStart = type == KeyboardPwdType.permanent ? epochZero : start;
    final cloudEnd = type == KeyboardPwdType.permanent ? epochZero : end;
    final bleStart = type == KeyboardPwdType.permanent
        ? 0
        : start!.millisecondsSinceEpoch;
    final bleEnd = type == KeyboardPwdType.permanent
        ? 0
        : end!.millisecondsSinceEpoch;

    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.add(
          lock.lockId,
          keyboardPwd: keyboardPwd,
          keyboardPwdName: keyboardPwdName,
          keyboardPwdType: type,
          startDate: cloudStart,
          endDate: cloudEnd,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.createCustomPasscode(
          keyboardPwd,
          bleStart,
          bleEnd,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.add(
          lock.lockId,
          keyboardPwd: keyboardPwd,
          keyboardPwdName: keyboardPwdName,
          keyboardPwdType: type,
          startDate: cloudStart,
          endDate: cloudEnd,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> change({
    required LockEntity lock,
    required KeyboardPwdEntity pwd,
    String? keyboardPwdName,
    String? newKeyboardPwd,
    DateTime? start,
    DateTime? end,
  }) => TaskEither.tryCatch(() async {
    if (newKeyboardPwd != null &&
        newKeyboardPwd.isNotEmpty &&
        !_customPwd.hasMatch(newKeyboardPwd)) {
      throw AppException.business(code: 0, message: 'invalid_passcode');
    }
    final needsBle =
        (newKeyboardPwd != null &&
            newKeyboardPwd.isNotEmpty &&
            newKeyboardPwd != pwd.keyboardPwd) ||
        start != null ||
        end != null;
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.change(
          lock.lockId,
          pwd.keyboardPwdId,
          keyboardPwdName: keyboardPwdName,
          newKeyboardPwd: newKeyboardPwd,
          startDate: start,
          endDate: end,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () async {
        if (!needsBle) return;
        await runBle(
          () => TTLock.lock.modifyPasscode(
            pwd.keyboardPwd,
            newKeyboardPwd,
            (start ?? pwd.startDate)?.millisecondsSinceEpoch ?? 0,
            (end ?? pwd.endDate)?.millisecondsSinceEpoch ?? 0,
            lock.lockData,
          ),
        );
      },
      sync: () => _runOrThrow(
        _repo.change(
          lock.lockId,
          pwd.keyboardPwdId,
          keyboardPwdName: keyboardPwdName,
          newKeyboardPwd: newKeyboardPwd,
          startDate: start,
          endDate: end,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> delete({
    required LockEntity lock,
    required KeyboardPwdEntity pwd,
  }) => TaskEither.tryCatch(() async {
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          pwd.keyboardPwdId,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.deletePasscode(pwd.keyboardPwd, lock.lockData),
      ),
      sync: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          pwd.keyboardPwdId,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  Future<T> _remoteFirst<T>({
    required LockEntity lock,
    required Future<T> Function() remote,
    required Future<void> Function() ble,
    required Future<T> Function() sync,
  }) async {
    if (lock.hasGateway) {
      try {
        return await remote();
      } on Object {
        if (lock.lockData.isEmpty) rethrow;
      }
    } else if (lock.lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await ble();
    return sync();
  }

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async =>
      (await task.run()).fold((err) => throw err, (value) => value);
}
