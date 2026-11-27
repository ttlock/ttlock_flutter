import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/data/repository/identity_card_repository.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/repository/identity_card_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/card_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_alias.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';

part 'card_domain.g.dart';

@Riverpod(keepAlive: true)
class CardDomain extends _$CardDomain {
  late final IdentityCardRepositoryInterface _repo;
  StreamSubscription<AddCardEvent>? _addSub;
  StreamController<AddCardEvent>? _addCtrl;

  @override
  void build() {
    _repo = ref.watch(identityCardRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId) =>
      _repo.list(lockId);

  Stream<AddCardEvent> addViaBle({
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    final controller = StreamController<AddCardEvent>();
    return _pump(
      controller,
      () => TTLock.lock.lockAddCard(
        lockData,
        cycleList: cycleList,
        startDate: startMs,
        endDate: endMs,
      ),
    );
  }

  /// 多功能键盘录入 IC 卡（**BLE 经键盘中继**）。
  ///
  /// 与 [addViaBle] 并列：BLE 录入与云端登记同由本 Domain 编排，
  /// 调用方拿到成功事件的卡号后走 [confirmAdd] 登记。
  ///
  /// **空值校验由调用方（Notifier）前置完成** —— SDK 对空入参是同步
  /// `throw ArgumentError`，而 Stream 方法无法返回 `Left`。
  Stream<AddCardEvent> addViaKeypad({
    required String keypadMac,
    required String lockData,
    required int startMs,
    required int endMs,
    List<TTCycleModel>? cycleList,
  }) {
    final controller = StreamController<AddCardEvent>();
    return _pump(
      controller,
      () => mapKeypadEnrollTimeout(
        TTLock.remoteKeypad.accessoryAddKeypadCard(
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
  Stream<AddCardEvent> _pump(
    StreamController<AddCardEvent> controller,
    Stream<AddCardEvent> Function() create,
  ) {
    cancelAdd();
    _addCtrl = controller;
    _addSub = gateBleStream(create).listen(
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

  TaskEither<AppException, int> confirmAdd({
    required int lockId,
    required String lockData,
    required String cardNumber,
    String? cardName,
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
    final alias = cardName ?? '';
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
          TTAliasType.card,
          cardNumber,
          alias.trim(),
          lockData,
        ),
      );
    }
    return _runOrThrow(
      _repo.add(
        lockId,
        cardNumber,
        cardName: cardName,
        startDate: resolved.start,
        endDate: resolved.end,
        cardType: resolved.type,
        cyclicConfig: resolved.cyclicConfig,
        channel: ChannelType.bleSynced,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> changePeriod({
    required LockEntity lock,
    required IdentityCardEntity card,
    required DateTime start,
    required DateTime end,
    CyclicSchedule? schedule,
  }) => TaskEither.tryCatch(() async {
    if (card.cardType == CredentialType.normal && isCardPermanent(card)) {
      throw AppException.business(
        code: -23,
        message: 'permanent_period_readonly',
      );
    }
    late final List<CyclicConfig> cfg;
    late final List<TTCycleModel>? cycles;
    late final DateTime resolvedStart;
    late final DateTime resolvedEnd;
    if (card.cardType == CredentialType.cycle) {
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
          card.cardId,
          startDate: resolvedStart,
          endDate: resolvedEnd,
          cyclicConfig: cfg,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.modifyCardValidityPeriod(
          card.cardNumber,
          cycles,
          resolvedStart.millisecondsSinceEpoch,
          resolvedEnd.millisecondsSinceEpoch,
          lock.lockData,
        ),
      ),
      sync: () => _runOrThrow(
        _repo.changePeriod(
          lock.lockId,
          card.cardId,
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
    required IdentityCardEntity card,
  }) => TaskEither.tryCatch(() async {
    return _remoteFirst(
      lock: lock,
      remote: () => _runOrThrow(
        _repo.delete(
          lock.lockId,
          card.cardId,
          channel: ChannelType.gatewayWifi,
        ),
      ),
      ble: () => runBle(
        () => TTLock.lock.deleteCard(card.cardNumber, lock.lockData),
      ),
      sync: () => _runOrThrow(
        _repo.delete(lock.lockId, card.cardId, channel: ChannelType.bleSynced),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename({
    required LockEntity lock,
    required IdentityCardEntity card,
    required String name,
  }) => _repo.rename(lock.lockId, card.cardId, name);

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
