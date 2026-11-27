import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/data/repository/qr_code_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/repository/qr_code_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'qr_code_domain.g.dart';

/// 二维码云端 type：永久 2 / 限期 1 / 循环 4（与 CredentialType 不同）。
QrCodeType qrCodeTypeFor(CredentialValidityKind kind) => switch (kind) {
  CredentialValidityKind.permanent => QrCodeType.permanent,
  CredentialValidityKind.limited => QrCodeType.limited,
  CredentialValidityKind.cyclic => QrCodeType.cycle,
};

/// 自定义二维码号：秒级时间戳，需在 (65535, 4294967295]。
String generateCustomQrCodeNumber([DateTime? now]) {
  final seconds = (now ?? DateTime.now()).millisecondsSinceEpoch ~/ 1000;
  final clamped = seconds.clamp(65536, 4294967295);
  return '$clamped';
}

@Riverpod(keepAlive: true)
class QrCodeDomain extends _$QrCodeDomain {
  late final QrCodeRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(qrCodeRepositoryProvider.notifier);
  }

  TaskEither<AppException, PageState<QrCodeEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  }) => _repo.list(lockId, pageNo: pageNo, pageSize: pageSize, name: name);

  /// 按锁能力分支：
  /// - 仅 `qrCode`：云端随机（`cloudOnly`）
  /// - 有 `customQRCode`：网关优先，否则 SDK 下发再 `bleSynced`
  TaskEither<AppException, QrCodeEntity> add({
    required LockEntity lock,
    String? name,
    required CredentialValidityKind kind,
    DateTime? start,
    DateTime? end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    late final DateTime? startDate;
    late final DateTime? endDate;
    late final List<CyclicConfig> cyclicConfig;
    late final List<TTCycleModel>? cycles;
    late final int bleStart;
    late final int bleEnd;
    switch (kind) {
      case CredentialValidityKind.permanent:
        startDate = null;
        endDate = null;
        cyclicConfig = const [];
        cycles = null;
        bleStart = 0;
        bleEnd = 0;
      case CredentialValidityKind.limited:
        if (start == null || end == null) {
          throw ArgumentError('limited needs dates');
        }
        startDate = start;
        endDate = end;
        cyclicConfig = const [];
        cycles = null;
        bleStart = start.millisecondsSinceEpoch;
        bleEnd = end.millisecondsSinceEpoch;
      case CredentialValidityKind.cyclic:
        final resolved = resolveValidity(
          kind: kind,
          start: start,
          end: end,
          schedule: schedule,
        );
        startDate = resolved.start;
        endDate = resolved.end;
        cyclicConfig = resolved.cyclicConfig;
        cycles = schedule?.toCycleModels();
        bleStart = startDate!.millisecondsSinceEpoch;
        bleEnd = endDate!.millisecondsSinceEpoch;
    }

    final custom = await _supportsCustom(lock);
    if (!custom) {
      return _runOrThrow(
        _repo.add(
          lock.lockId,
          qrCodeName: name,
          startDate: startDate,
          endDate: endDate,
          type: qrCodeTypeFor(kind),
          cyclicConfig: cyclicConfig,
          channel: ChannelType.cloudOnly,
        ),
      );
    }

    final qrCodeNumber = generateCustomQrCodeNumber();
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.add(
          lock.lockId,
          qrCodeName: name,
          qrCodeNumber: qrCodeNumber,
          startDate: startDate,
          endDate: endDate,
          type: qrCodeTypeFor(kind),
          cyclicConfig: cyclicConfig,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.addQrCode(
          qrCodeNumber,
          cycles,
          bleStart,
          bleEnd,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.add(
          lock.lockId,
          qrCodeName: name,
          qrCodeNumber: qrCodeNumber,
          startDate: startDate,
          endDate: endDate,
          type: qrCodeTypeFor(kind),
          cyclicConfig: cyclicConfig,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, QrCodeEntity> getData(int qrCodeId) =>
      _repo.getData(qrCodeId);

  /// 改期：仅 `qrCode` 走云端；有 `customQRCode` 走网关优先 / SDK 再同步。
  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required QrCodeEntity qrCode,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (qrCode.type == QrCodeType.permanent || isQrCodePermanent(qrCode)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (qrCode.type == QrCodeType.cycle) {
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

    final custom = await _supportsCustom(lock);
    if (!custom) {
      return _runOrThrow(
        _repo.update(
          qrCode.qrCodeId,
          type: qrCode.type,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.cloudOnly,
        ),
      );
    }

    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.update(
          qrCode.qrCodeId,
          type: qrCode.type,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.modifyQrCodeValidityPeriod(
          qrCode.qrCodeNumber,
          cycles,
          resolvedStart.millisecondsSinceEpoch,
          resolvedEnd.millisecondsSinceEpoch,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.update(
          qrCode.qrCodeId,
          type: qrCode.type,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 仅 `qrCode`：云端删除；有 `customQRCode`：网关优先 / SDK 再同步。
  TaskEither<AppException, Unit> delete({
    required LockEntity lock,
    required QrCodeEntity qrCode,
  }) => TaskEither.tryCatch(() async {
    final custom = await _supportsCustom(lock);
    if (!custom) {
      return _runOrThrow(
        _repo.delete(
          lock.lockId,
          qrCode.qrCodeId,
          channel: ChannelType.cloudOnly,
        ),
      );
    }
    final endMs = qrCode.endDate?.millisecondsSinceEpoch ?? 0;
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          qrCode.qrCodeId,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.deleteQrCode(
          qrCode.qrCodeNumber,
          endMs,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          qrCode.qrCodeId,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  Future<bool> _supportsCustom(LockEntity lock) async {
    if (lock.lockData.isEmpty) return false;
    try {
      return await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.customQRCode,
          lock.lockData,
        ),
      );
    } on Object {
      return false;
    }
  }

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
      (await task.run()).fold((err) {
        throw err;
      }, (value) => value);
}
