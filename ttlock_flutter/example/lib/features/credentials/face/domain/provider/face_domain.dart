import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/repository/face_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/repository/face_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/face_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_alias.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'face_domain.g.dart';

@Riverpod(keepAlive: true)
class FaceDomain extends _$FaceDomain {
  late final FaceRepositoryInterface _repo;
  StreamSubscription<AddFaceEvent>? _addSub;
  StreamController<AddFaceEvent>? _addCtrl;

  @override
  void build() {
    _repo = ref.watch(faceRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<FaceEntity>> list(int lockId) =>
      _repo.list(lockId);

  Stream<AddFaceEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    cancelAdd();
    final controller = StreamController<AddFaceEvent>();
    _addCtrl = controller;
    _addSub = gateBleStream(
      () => TTLock.lock.lockAddFace(
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

  /// BLE 锁上录入成功后云端确认。永久传 epoch 0；按需 setAlias(face)。
  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String lockData,
    required String faceNumber,
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
    final alias = name ?? '';
    final isYiNuo = await _supports(TTLockFunction.yiNuoPhotoFace, lockData);
    final supportsSetAlias = await _supports(
      TTLockFunction.supportSetAlias,
      lockData,
    );
    if (shouldSetCredentialAlias(
      isYiNuoPhotoFace: isYiNuo,
      supportsSetAlias: supportsSetAlias,
      alias: alias,
    )) {
      await runBle(
        () => TTLock.lock.setAlias(
          TTAliasType.face,
          faceNumber,
          alias.trim(),
          lockData,
        ),
      );
    }
    return _runOrThrow(
      _repo.add(
        lockId,
        faceName: name,
        faceNumber: faceNumber,
        startDate: resolved.start,
        endDate: resolved.end,
        type: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
        channel: ChannelType.bleSynced,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, String> extractFeature(
    int lockId,
    List<int> imageBytes,
  ) => _repo.getFeatureDataByPhoto(lockId, imageBytes);

  /// 照片链路：有网关走 addType=2 + featureData；非奕诺近场 addFaceData 再 addType=1；
  /// 奕诺无网关 Left -22；非奕诺无网关且 lockData 空 Left -21。永不 setAlias。
  TaskEither<AppException, int> addByPhoto({
    required int lockId,
    required String lockData,
    required bool hasGateway,
    required bool isYiNuo,
    required String featureData,
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
    final startMs = resolved.start?.millisecondsSinceEpoch ?? 0;
    final endMs = resolved.end?.millisecondsSinceEpoch ?? 0;
    if (hasGateway) {
      return _runOrThrow(
        _repo.add(
          lockId,
          faceName: name,
          faceNumber: null,
          featureData: featureData,
          startDate: resolved.start,
          endDate: resolved.end,
          type: resolved.type,
          cyclicConfig: resolved.cyclicConfig,
          channel: ChannelType.gatewayWifi,
        ),
      );
    }
    if (isYiNuo) {
      throw AppException.business(
        code: -22,
        message: 'photo_face_needs_gateway',
      );
    }
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    final faceNumber = await runBle(
      () => TTLock.lock.addFaceData(
        resolved.cycleList,
        startMs,
        endMs,
        featureData,
        lockData,
      ),
    );
    return _runOrThrow(
      _repo.add(
        lockId,
        faceName: name,
        faceNumber: faceNumber,
        startDate: resolved.start,
        endDate: resolved.end,
        type: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
        channel: ChannelType.bleSynced,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required FaceEntity face,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (face.type == CredentialType.normal && isFacePermanent(face)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (face.type == CredentialType.cycle) {
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
          lock.lockId,
          face.faceId,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.modifyFace(
          face.faceNumber,
          cycles,
          resolvedStart.millisecondsSinceEpoch,
          resolvedEnd.millisecondsSinceEpoch,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.changePeriod(
          lock.lockId,
          face.faceId,
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
    required FaceEntity face,
  }) => TaskEither.tryCatch(() async {
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          face.faceId,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () =>
          runBle(() => TTLock.lock.deleteFace(face.faceNumber, lock.lockData)),
      sync: () => _runOrThrow(
        _repo.delete(lock.lockId, face.faceId, channel: ChannelType.bleSynced),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required FaceEntity face,
    required String name,
  }) => _repo.rename(lock.lockId, face.faceId, name);

  Future<bool> _supports(TTLockFunction function, String lockData) async {
    try {
      return await runBle(
        () => TTLock.lock.supportFunction(function, lockData),
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
      (await task.run()).fold((err) => throw err, (value) => value);
}
