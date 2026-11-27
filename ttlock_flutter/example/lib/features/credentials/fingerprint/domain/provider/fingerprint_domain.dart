import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/repository/fingerprint_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/repository/fingerprint_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';

part 'fingerprint_domain.g.dart';

@Riverpod(keepAlive: true)
class FingerprintDomain extends _$FingerprintDomain {
  late final FingerprintRepositoryInterface _repo;
  StreamSubscription<AddFingerprintEvent>? _addSub;
  StreamController<AddFingerprintEvent>? _addCtrl;

  @override
  void build() {
    _repo = ref.watch(fingerprintRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<FingerprintEntity>> list(int lockId) =>
      _repo.list(lockId);

  Stream<AddFingerprintEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    final controller = StreamController<AddFingerprintEvent>();
    return _pump(
      controller,
      () => TTLock.lock.lockAddFingerprint(
        lockData,
        cycleList: cycleList,
        startDate: startMs,
        endDate: endMs,
      ),
    );
  }

  /// 多功能键盘录入指纹（**BLE 经键盘中继**）。
  ///
  /// 与 [addViaBle] 并列；空值校验由调用方前置完成（原因见 `CardDomain.addViaKeypad`）。
  Stream<AddFingerprintEvent> addViaKeypad({
    required String keypadMac,
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    final controller = StreamController<AddFingerprintEvent>();
    return _pump(
      controller,
      () => mapKeypadEnrollTimeout(
        TTLock.remoteKeypad.accessoryAddKeypadFingerprint(
          keypadMac: keypadMac,
          lockData: lockData,
          cycleList: cycleList,
          startDate: startMs,
          endDate: endMs,
        ),
      ),
    );
  }

  void cancelAdd() {
    _addSub?.cancel();
    _addSub = null;
    final ctrl = _addCtrl;
    _addCtrl = null;
    if (ctrl != null && !ctrl.isClosed) {
      ctrl.close();
    }
  }

  /// 把 SDK 事件流接进 [controller]，统一录入流的生命周期契约：
  /// 先 [cancelAdd] 掉上一次订阅 → 登记新的 `_addCtrl` / `_addSub` →
  /// 在 `isClosed` 守卫下转发事件、错误与关闭。
  ///
  /// [addViaBle] 与 [addViaKeypad] 只差一个 `create` 闭包；抽成一处，
  /// 避免这段契约在多处漂移。调用方必须先建好 [controller]。
  Stream<AddFingerprintEvent> _pump(
    StreamController<AddFingerprintEvent> controller,
    Stream<AddFingerprintEvent> Function() create,
  ) {
    cancelAdd();
    _addCtrl = controller;
    _addSub = gateBleStream(create).listen(
      (event) {
        if (!controller.isClosed) controller.add(event);
      },
      onError: (Object error, StackTrace st) {
        if (!controller.  isClosed) controller.addError(error, st);
      },
      onDone: () {
        if (!controller.isClosed) controller.close();
      },
    );
    return controller.stream;
  }

  /// BLE 录入成功后云端确认。永不走 addByGateway / setAlias。
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String fingerprintNumber,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    final resolved = resolveValidity(
      kind: kind,
      start: start,
      end: end,
      schedule: schedule,
    );
    return _runOrThrow(
      _repo.add(
        lockId,
        fingerprintNumber,
        fingerprintName: name,
        startDate: resolved.start,
        endDate: resolved.end,
        fingerprintType: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
        channel: ChannelType.bleSynced,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required FingerprintEntity fingerprint,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (fingerprint.fingerprintType == CredentialType.normal &&
        isFingerprintPermanent(fingerprint)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (fingerprint.fingerprintType == CredentialType.cycle) {
      if (schedule == null || !schedule.isValid) {
        throw AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        );
      }
      // 循环指纹禁止 NB 通道；本 Demo 远程仅用 gatewayWifi / bleSynced。
      resolvedStart = cyclicDayStart(start);
      resolvedEnd = cyclicDayEnd(end);
      cfg = schedule.toCyclicConfig();
      cycles = schedule.toCycleModels();
    } else {
      resolvedStart = start;
      resolvedEnd = end;
      cfg = const [];
      cycles = null;
    }
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.changePeriod(
          lock.lockId,
          fingerprint.fingerprintId,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.modifyFingerprintValidityPeriod(
          fingerprint.fingerprintNumber,
          cycles,
          resolvedStart.millisecondsSinceEpoch,
          resolvedEnd.millisecondsSinceEpoch,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.changePeriod(
          lock.lockId,
          fingerprint.fingerprintId,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> delete({
    required LockEntity lock,
    required FingerprintEntity fingerprint,
  }) => TaskEither.tryCatch(() async {
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          fingerprint.fingerprintId,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.deleteFingerprint(
          fingerprint.fingerprintNumber,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          fingerprint.fingerprintId,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required FingerprintEntity fingerprint,
    required String name,
  }) => _repo.rename(lock.lockId, fingerprint.fingerprintId, name);

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
