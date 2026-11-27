import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/repository/remote_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/repository/remote_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'remote_domain.g.dart';

@Riverpod(keepAlive: true)
class RemoteDomain extends _$RemoteDomain {
  late final RemoteRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(remoteRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<RemoteEntity>> listByLock(int lockId) =>
      _repo.listByLock(lockId);

  /// BLE 绑定遥控到锁（含 cycleList）；成功后由 [confirmAdd] 上传云端。
  TaskEither<AppException, Unit> addViaBle({
    required String lockData,
    required String remoteKeyMac,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await runBle(
      () => TTLock.lock.addRemoteKey(
        remoteKeyMac,
        cycleList,
        startMs,
        endMs,
        lockData,
      ),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  /// BLE 成功后云端确认。凭证 type 仅添加时设置；永久为 epoch 0。
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String mac,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
    int electricQuantity = 100,
    String? firmwareInfo,
    String? number,
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
        mac,
        name: name,
        startDate: resolved.start,
        endDate: resolved.end,
        type: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
        electricQuantity: electricQuantity,
        firmwareInfo: firmwareInfo,
        number: number,
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 改期：通道字段 `type=ChannelType`；凭证类型不可改。永久只读。
  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required RemoteEntity remote,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (remote.type == CredentialType.normal && isRemotePermanent(remote)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (remote.type == CredentialType.cycle) {
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
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.changePeriod(
          remote.remoteId,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.setRemoteKeyValidDate(
          remote.mac,
          cycles,
          resolvedStart.millisecondsSinceEpoch,
          resolvedEnd.millisecondsSinceEpoch,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.changePeriod(
          remote.remoteId,
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
    required RemoteEntity remote,
  }) => TaskEither.tryCatch(() async {
    if (lock.lockData.isEmpty && !lock.hasGateway) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    if (lock.lockData.isNotEmpty) {
      await runBle(
        () => TTLock.lock.deleteRemoteKey(remote.mac, lock.lockData),
      );
    }
    return _runOrThrow(_repo.delete(remote.remoteId));
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename({
    required int remoteId,
    required String name,
  }) => _repo.rename(remoteId, name);

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
