import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/repository/palm_vein_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/repository/palm_vein_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/palm_vein_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'palm_vein_domain.g.dart';

@Riverpod(keepAlive: true)
class PalmVeinDomain extends _$PalmVeinDomain {
  late final PalmVeinRepositoryInterface _repo;
  StreamSubscription<AddPalmVeinEvent>? _addSub;
  StreamController<AddPalmVeinEvent>? _addCtrl;

  @override
  void build() {
    _repo = ref.watch(palmVeinRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<PalmVeinEntity>> list(int lockId) =>
      _repo.list(lockId);

  Stream<AddPalmVeinEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    cancelAdd();
    final controller = StreamController<AddPalmVeinEvent>();
    _addCtrl = controller;
    _addSub = gateBleStream(
      () => TTLock.lock.lockAddPalmVein(
        lockData,
        cycleList: cycleList,
        startDate: startMs,
        endDate: endMs,
      ),
    ).listen(
      (event) {
        if (!controller.isClosed) controller.add(event);
      },
      onError: (Object error, StackTrace st) {
        if (!controller.isClosed) controller.addError(error, st);
      },
      onDone: () {
        if (!controller.isClosed) controller.close();
      },
    );
    return controller.stream;
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

  /// BLE 录入成功后云端确认。永久传 0,0；无 addType、不调 setAlias。
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String number,
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
        number,
        name: name,
        startDate: resolved.start?.millisecondsSinceEpoch ?? 0,
        endDate: resolved.end?.millisecondsSinceEpoch ?? 0,
        type: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required PalmVeinEntity palmVein,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (palmVein.type == CredentialType.normal &&
        isPalmVeinPermanent(palmVein)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (palmVein.type == CredentialType.cycle) {
      if (schedule == null || !schedule.isValid) {
        throw AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        );
      }
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
    final startMs = resolvedStart.millisecondsSinceEpoch;
    final endMs = resolvedEnd.millisecondsSinceEpoch;
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.changePeriod(
          palmVein.id,
          startDate: startMs,
          endDate: endMs,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.modifyPalmVein(
          palmVein.number,
          lock.lockData,
          cycleList: cycles,
          startDate: startMs,
          endDate: endMs,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.changePeriod(
          palmVein.id,
          startDate: startMs,
          endDate: endMs,
          cyclicConfig: cfg,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> delete({
    required LockEntity lock,
    required PalmVeinEntity palmVein,
  }) => TaskEither.tryCatch(() async {
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(palmVein.id, channel: ChannelType.gatewayWifi),
      ),
      ble: () => runBle(
        () => TTLock.lock.deletePalmVein(palmVein.number, lock.lockData),
      ),
      sync: () => _runOrThrow(
        _repo.delete(palmVein.id, channel: ChannelType.bleSynced),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required PalmVeinEntity palmVein,
    required String name,
  }) => _repo.rename(palmVein.id, name);

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
