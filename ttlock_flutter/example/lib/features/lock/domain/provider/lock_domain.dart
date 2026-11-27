import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/config/device_server_endpoint.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_record_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/data/repository/wifi_lock_repository.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/hotel_sector.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/lock_record_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/lock_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/wifi_lock_repository_interface.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config_domain.dart';
part 'lock_domain.g.dart';

/// 锁域编排：BLE 与 Cloud 双轨（spec §3.1/§3.2）。
@Riverpod(keepAlive: true)
class LockDomain extends _$LockDomain {
  late final LockRepositoryInterface _repo;
  late final LockRecordRepositoryInterface _recordRepo;
  late final WifiLockRepositoryInterface _wifiRepo;
  @override
  void build() {
    _repo = ref.watch(lockRepositoryProvider.notifier);
    _recordRepo = ref.watch(lockRecordRepositoryProvider.notifier);
    _wifiRepo = ref.watch(wifiLockRepositoryProvider.notifier);
  }

  // ---- 列表 / 详情 ----

  TaskEither<AppException, PageState<LockEntity>> listLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => _repo.getLocks(pageNo: pageNo, pageSize: pageSize, groupId: groupId);

  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _repo.getLockDetail(lockId);

  /// 一次 detail：基础 Entity + 云端设置快照（设置页云端优先加载用）。
  TaskEither<AppException, ({LockEntity lock, LockCloudSettings settings})>
  getLockDetailWithSettings(int lockId) =>
      _repo.getLockDetailWithSettings(lockId);

  // ---- 酒店（P6） ----

  /// 酒店锁列表（纯云端）。
  ///
  /// [type]：1-酒店锁、2-梯控、3-取电。**不传与传 1 等价** —— 开放平台
  /// 无「全部」取值（`cloud/lock/listByHotel.md:25`），页面因此不提供「全部」选项。
  TaskEither<AppException, PageState<HotelLockEntity>> listHotelLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? type,
    String? lockAlias,
    int? groupId,
  }) => _repo.listByHotel(
    pageNo: pageNo,
    pageSize: pageSize,
    type: type,
    lockAlias: lockAlias,
    groupId: groupId,
  );

  /// 设置酒店卡扇区：**BLE 必先，云端确认**。
  ///
  /// 开放平台明确要求「通过 APP SDK 修改了锁的酒店卡扇区后再调用该接口」
  /// （`cloud/lock/setHotelCardSector.md:7`），故与凭证类「远程优先」方向相反。
  ///
  /// 两条失败路径靠错误码区分：
  /// - **BLE 失败** → 透传 BLE 的 [AppException]，云端不会被调用，锁未改动
  /// - **云端失败** → [kHotelSectorCloudPendingCode]，`data` 携带 sector；
  ///   此时锁的扇区**已改**，页面须显示「待同步」并提供重试
  ///
  /// BLE 侧返回 `Future<void>`，不产生新 lockData，**无需 `updateLockData` 保鲜**。
  TaskEither<AppException, Unit> applyHotelCardSector({
    required int lockId,
    required String lockData,
    required String sector,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await runBle(() => TTLock.lock.setHotelCardSector(sector, lockData));
    final r = await _repo.setHotelCardSector(lockId, sector).run();
    r.fold(
      (_) => throw AppException.business(
        code: kHotelSectorCloudPendingCode,
        message: 'hotel_sector_cloud_pending',
        data: sector,
      ),
      (_) {},
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 扇区云端同步重试：**只重发云端**那一步（BLE 已完成，不重复下发）。
  TaskEither<AppException, Unit> syncHotelCardSector(
    int lockId,
    String sector,
  ) => _repo.setHotelCardSector(lockId, sector);

  /// 把酒店信息（hotelInfo + 楼栋/楼层号）写入锁 —— **BLE 单轨**。
  ///
  /// 开放平台无楼栋/楼层号的云端写入端点，故只走 BLE。
  /// [hotelInfo] 只能来自 `/v3/cardEncoder/getHotelInfo`，且**有 10 分钟时效**，
  /// 调用方必须在提交时实时获取，不可使用缓存或占位值（写进真锁不可逆）。
  TaskEither<AppException, Unit> writeHotelInfo({
    required String lockData,
    required String hotelInfo,
    required int buildingNumber,
    required int floorNumber,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    if (hotelInfo.isEmpty) {
      throw AppException.business(
        code: kCardEncoderUnavailableCode,
        message: 'card_encoder_unavailable',
      );
    }
    await runBle(
      () => TTLock.lock.setHotel(
        hotelInfo,
        buildingNumber,
        floorNumber,
        lockData,
      ),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  // ---- 加锁（失败回滚）----

  /// 门锁扫描加锁：放行 scene 12（梯控）与 13（取电），与普通锁同一 init 流程；
  /// 初始化后分别在酒店锁详情 `type=2/3` 下使用梯控 / 取电入口。
  /// scene 全集见 SDK「应用场景」表（1–17）；表计等仍走各自 feature 扫描。
  static const _deferredScenes = <int>{};

  bool isLockScene(int scene) => !_deferredScenes.contains(scene);

  TaskEither<AppException, LockEntity> addLockByScan(TTLockScanModel scan) =>
      TaskEither.tryCatch(() async {
        if (scan.isInited) {
          throw AppException.business(
            code: -1,
            message: 'lock_already_initialized',
          );
        }
        if (!isLockScene(scan.lockVersion.scene)) {
          throw AppException.business(
            code: -2,
            message: 'unsupported_lock_scene',
          );
        }
        final lockData = await runBle(
          () => TTLock.lock.initLock(
            TTLockInitParams(
              lockMac: scan.lockMac,
              isInited: false,
              lockVersion: scan.lockVersion,
            ),
          ),
        );
        final either = await _repo
            .initializeLock(lockData, lockAlias: scan.lockName)
            .run();
        return await either.fold(
          (err) async {
            // 必须 await，保证回滚完成后再抛；reset 失败吞掉。
            try {
              await runBle(() => TTLock.lock.resetLock(lockData));
            } on Object {
              // ignore
            }
            throw err;
          },
          (init) async {
            final lock = LockEntity(
              lockId: init.lockId,
              lockName: scan.lockName,
              lockAlias: scan.lockName,
              lockMac: scan.lockMac,
              lockData: lockData,
            );
            // 初值上报失败不回滚添加成功。
            await syncSettingsFromLock(lock).run();
            return lock;
          },
        );
      }, ExceptionUtils.extractAppException);

  /// 从锁读取需初始态的设置项并上报云端（best-effort，单项失败不中断）。
  ///
  /// 覆盖：反锁/防撬/重置键/声音/音量/开门方向/自动闭锁/WiFi 省电/常开。
  /// 不含 remoteUnlock、doubleAuth（云端无对应读字段）。
  TaskEither<AppException, Unit> syncSettingsFromLock(LockEntity lock) =>
      TaskEither.tryCatch(() async {
        final ld = lock.lockData;
        if (ld.isEmpty) return unit;

        Future<bool> supports(TTLockFunction fn) async {
          try {
            return await runBle(() => TTLock.lock.supportFunction(fn, ld));
          } on Object {
            return false;
          }
        }

        Future<void> uploadBool({
          required int type,
          required TTLockConfig config,
        }) async {
          try {
            final on = await runBle(
              () => TTLock.lock.getLockConfig(config, ld),
            );
            await _runOrThrow(
              _repo.updateSetting(
                lock.lockId,
                LockSettingUpdate(
                  type: type,
                  value: on ? 1 : 2,
                  channel: ChannelType.bleSynced,
                ),
              ),
            );
          } on Object {
            // best-effort
          }
        }

        if (await supports(TTLockFunction.privacyLock)) {
          await uploadBool(type: 2, config: TTLockConfig.privacyLock);
        }
        if (await supports(TTLockFunction.tamperAlert)) {
          await uploadBool(type: 3, config: TTLockConfig.tamperAlert);
        }
        if (await supports(TTLockFunction.resetButton)) {
          await uploadBool(type: 4, config: TTLockConfig.resetButton);
        }

        if (await supports(TTLockFunction.audioSwitch)) {
          try {
            if (await supports(TTLockFunction.soundVolumeAndLanguageSetting)) {
              final vol = await runBle(() => TTLock.lock.getSoundVolume(ld));
              final on = vol != TTSoundVolumeType.off;
              await _runOrThrow(
                _repo.updateSetting(
                  lock.lockId,
                  LockSettingUpdate(
                    type: 6,
                    value: on ? 1 : 2,
                    channel: ChannelType.bleSynced,
                  ),
                ),
              );
              if (on) {
                final level = switch (vol) {
                  TTSoundVolumeType.firstLevel => 1,
                  TTSoundVolumeType.secondLevel => 2,
                  TTSoundVolumeType.thirdLevel => 3,
                  TTSoundVolumeType.fourthLevel => 4,
                  TTSoundVolumeType.fifthLevel || TTSoundVolumeType.on => 5,
                  TTSoundVolumeType.off => 3,
                };
                await _runOrThrow(
                  _repo.updateSetting(
                    lock.lockId,
                    LockSettingUpdate(
                      type: 8,
                      value: level,
                      channel: ChannelType.bleSynced,
                    ),
                  ),
                );
              }
            } else {
              await uploadBool(type: 6, config: TTLockConfig.audio);
            }
          } on Object {
            // best-effort
          }
        }

        if (await supports(TTLockFunction.unlockDirection)) {
          try {
            final dir = await runBle(() => TTLock.lock.getLockDirection(ld));
            await _runOrThrow(
              _repo.updateSetting(
                lock.lockId,
                LockSettingUpdate(
                  type: 7,
                  value: dir == TTLockDirection.left ? 1 : 2,
                  channel: ChannelType.bleSynced,
                ),
              ),
            );
          } on Object {
            // best-effort
          }
        }

        if (await supports(TTLockFunction.autoLock)) {
          try {
            final t = await runBle(
              () => TTLock.lock.getAutoLockingPeriodicTime(ld),
            );
            await _runOrThrow(
              _repo.setAutoLockTime(
                lock.lockId,
                t.currentTime,
                channel: ChannelType.bleSynced,
              ),
            );
          } on Object {
            // best-effort
          }
        }

        if (await supports(TTLockFunction.wifiLock)) {
          try {
            final on = await runBle(
              () => TTLock.lock.getLockConfig(
                TTLockConfig.wifiLockPowerSavingMode,
                ld,
              ),
            );
            await _runOrThrow(
              _repo.updateSetting(
                lock.lockId,
                LockSettingUpdate(
                  type: 10,
                  value: on ? 1 : 2,
                  channel: ChannelType.bleSynced,
                ),
              ),
            );
          } on Object {
            // best-effort
          }
        }

        if (await supports(TTLockFunction.passageMode)) {
          try {
            final modes = await runBle(() => TTLock.lock.getPassageModes(ld));
            if (modes.isEmpty) {
              await _runOrThrow(
                _repo.configPassageMode(
                  lock.lockId,
                  passageMode: 2,
                  channel: ChannelType.bleSynced,
                ),
              );
            } else {
              final m = modes.first;
              final weekDays = (m.weekly == null || m.weekly!.isEmpty)
                  ? const [1, 2, 3, 4, 5, 6, 7]
                  : m.weekly!;
              final allDay = m.startDate == 0 && m.endDate == 0;
              var autoUnlock = 2;
              if (await supports(TTLockFunction.passageModeAutoUnlockSetting)) {
                try {
                  final on = await runBle(
                    () => TTLock.lock.getLockConfig(
                      TTLockConfig.passageModeAutoUnlock,
                      ld,
                    ),
                  );
                  autoUnlock = on ? 1 : 2;
                } on Object {
                  // keep default
                }
              }
              await _runOrThrow(
                _repo.configPassageMode(
                  lock.lockId,
                  passageMode: 1,
                  startDate: allDay ? 0 : m.startDate,
                  endDate: allDay ? 0 : m.endDate,
                  isAllDay: allDay ? 1 : 2,
                  weekDays: weekDays,
                  autoUnlock: autoUnlock,
                  channel: ChannelType.bleSynced,
                ),
              );
            }
          } on Object {
            // best-effort
          }
        }

        return unit;
      }, ExceptionUtils.extractAppException);

  // ---- 开关锁（远程优先，BLE 回退 + 返回更新后 Entity；无 bleSynced）----

  TaskEither<AppException, LockEntity> unlockLock(LockEntity lock) =>
      _controlLock(lock, unlock: true);

  TaskEither<AppException, LockEntity> lockLock(LockEntity lock) =>
      _controlLock(lock, unlock: false);

  TaskEither<AppException, LockEntity> _controlLock(
    LockEntity lock, {
    required bool unlock,
  }) => TaskEither.tryCatch(() async {
    if (lock.hasGateway) {
      final remote =
          await (unlock ? _repo.unlock(lock.lockId) : _repo.lock(lock.lockId))
              .run();
      if (remote.isRight()) return lock;
    }
    final result = await runBle(
      () => TTLock.lock.controlLock(
        lock.lockData,
        unlock ? TTControlAction.unlock : TTControlAction.lock,
      ),
    );
    var updated = lock;
    if (result.lockData != null &&
        result.lockData!.isNotEmpty &&
        result.lockData != lock.lockData) {
      await _runOrThrow(
        _repo.updateLockData(lock.lockId, lockData: result.lockData!),
      );
      updated = updated.copyWith(lockData: result.lockData!);
    }
    // 电量合法范围含 0（耗尽）；有返回即回写，勿用 `> 0` 跳过。
    if (result.electricQuantity >= 0) {
      await _runOrThrow(
        _repo.updateElectricQuantity(lock.lockId, result.electricQuantity),
      );
      updated = updated.copyWith(electricQuantity: result.electricQuantity);
    }
    return updated;
  }, ExceptionUtils.extractAppException);

  // ---- lockData 保鲜 / 命名 / 删除 / 转让 ----

  TaskEither<AppException, Unit> syncLockData(int lockId, String lockData) =>
      _repo.updateLockData(lockId, lockData: lockData);

  TaskEither<AppException, Unit> renameLock(int lockId, String alias) =>
      _repo.renameLock(lockId, alias);

  /// 删除锁：对齐开源语义——BLE reset **成功**或错误码为 `TTLockError.reseted`
  /// （锁已被物理重置）才继续云端 delete；其余 reset 失败 → 返回错误、不删，
  /// 避免把物理上仍可用的锁从云端除名（孤儿锁）。
  TaskEither<AppException, Unit> deleteLockFlow(
    LockEntity lock,
  ) => TaskEither.tryCatch(() async {
    try {
      await runBle(() => TTLock.lock.resetLock(lock.lockData));
    } on Object catch (e) {
      final mapped = ExceptionUtils.extractAppException(e, StackTrace.current);
      final bleError = (mapped is AppFirmwareException) ? mapped.error : null;
      final isReseted =
          bleError is TTLockException && bleError.code == TTLockError.reseted;
      if (!isReseted) {
        throw mapped;
      }
    }
    await _runOrThrow(_repo.deleteLock(lock.lockId));
    return unit;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> transferLock(
    List<int> lockIdList,
    String receiverUsername,
  ) => _repo.transfer(lockIdList, receiverUsername);

  // ---- 基础设置（远程优先，失败 BLE 回退 + bleSynced 确认）----

  TaskEither<AppException, AutoLockingTime> getAutoLockTime(String lockData) =>
      TaskEither.tryCatch(
        () => runBle(() => TTLock.lock.getAutoLockingPeriodicTime(lockData)),
        ExceptionUtils.extractAppException,
      );

  TaskEither<AppException, Unit> setAutoLockTime(
    LockEntity lock,
    int seconds,
  ) => TaskEither.tryCatch(() async {
    if (lock.hasGateway) {
      final remote = await _repo
          .setAutoLockTime(
            lock.lockId,
            seconds,
            channel: ChannelType.gatewayWifi,
          )
          .run();
      if (remote.isRight()) return unit;
    }
    await runBle(
      () => TTLock.lock.setAutoLockingPeriodicTime(seconds, lock.lockData),
    );
    return _runOrThrow(
      _repo.setAutoLockTime(
        lock.lockId,
        seconds,
        channel: ChannelType.bleSynced,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> setSound(
    LockEntity lock, {
    required bool on,
  }) =>
      _setBoolSetting(lock: lock, type: 6, config: TTLockConfig.audio, on: on);

  TaskEither<AppException, Unit> setSoundVolume(
    LockEntity lock, {
    required bool on,
    int level = 3,
  }) => TaskEither.tryCatch(() async {
    final clamped = level.clamp(1, 5);
    Future<void> cloudConfirm(ChannelType ch) async {
      if (!on) {
        await _runOrThrow(
          _repo.updateSetting(
            lock.lockId,
            LockSettingUpdate(type: 6, value: 2, channel: ch),
          ),
        );
        return;
      }
      await _runOrThrow(
        _repo.updateSetting(
          lock.lockId,
          LockSettingUpdate(type: 6, value: 1, channel: ch),
        ),
      );
      await _runOrThrow(
        _repo.updateSetting(
          lock.lockId,
          LockSettingUpdate(type: 8, value: clamped, channel: ch),
        ),
      );
    }

    if (lock.hasGateway) {
      final first = await _repo
          .updateSetting(
            lock.lockId,
            LockSettingUpdate(
              type: 6,
              value: on ? 1 : 2,
              channel: ChannelType.gatewayWifi,
            ),
          )
          .run();
      if (first.isRight()) {
        if (on) {
          await _runOrThrow(
            _repo.updateSetting(
              lock.lockId,
              LockSettingUpdate(
                type: 8,
                value: clamped,
                channel: ChannelType.gatewayWifi,
              ),
            ),
          );
        }
        return unit;
      }
    }

    final vol = !on
        ? TTSoundVolumeType.off
        : TTSoundVolumeType.values[clamped - 1];
    await runBle(() => TTLock.lock.setSoundVolume(vol, lock.lockData));
    await cloudConfirm(ChannelType.bleSynced);
    return unit;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> setPrivacyLock(
    LockEntity lock, {
    required bool on,
  }) => _setBoolSetting(
    lock: lock,
    type: 2,
    config: TTLockConfig.privacyLock,
    on: on,
  );

  TaskEither<AppException, Unit> setTamperAlert(
    LockEntity lock, {
    required bool on,
  }) => _setBoolSetting(
    lock: lock,
    type: 3,
    config: TTLockConfig.tamperAlert,
    on: on,
  );

  TaskEither<AppException, Unit> setResetButton(
    LockEntity lock, {
    required bool on,
  }) => _setBoolSetting(
    lock: lock,
    type: 4,
    config: TTLockConfig.resetButton,
    on: on,
  );

  TaskEither<AppException, Unit> setOpenDirection(
    LockEntity lock,
    TTLockDirection direction,
  ) => TaskEither.tryCatch(() async {
    final value = direction == TTLockDirection.left ? 1 : 2;
    if (lock.hasGateway) {
      final remote = await _repo
          .updateSetting(
            lock.lockId,
            LockSettingUpdate(
              type: 7,
              value: value,
              channel: ChannelType.gatewayWifi,
            ),
          )
          .run();
      if (remote.isRight()) return unit;
    }
    await runBle(() => TTLock.lock.setLockDirection(direction, lock.lockData));
    return _runOrThrow(
      _repo.updateSetting(
        lock.lockId,
        LockSettingUpdate(
          type: 7,
          value: value,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> _setBoolSetting({
    required LockEntity lock,
    required int type,
    required TTLockConfig config,
    required bool on,
  }) => TaskEither.tryCatch(() async {
    final value = on ? 1 : 2;
    if (lock.hasGateway) {
      final remote = await _repo
          .updateSetting(
            lock.lockId,
            LockSettingUpdate(
              type: type,
              value: value,
              channel: ChannelType.gatewayWifi,
            ),
          )
          .run();
      if (remote.isRight()) return unit;
    }
    await runBle(() => TTLock.lock.setLockConfig(config, on, lock.lockData));
    return _runOrThrow(
      _repo.updateSetting(
        lock.lockId,
        LockSettingUpdate(
          type: type,
          value: value,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 远程开锁：BLE 返回新 lockData → 保鲜；不调 updateSetting。
  TaskEither<AppException, LockEntity> setRemoteUnlock(
    LockEntity lock, {
    required bool on,
  }) => TaskEither.tryCatch(() async {
    final newData = await runBle(
      () => TTLock.lock.setRemoteUnlockSwitchState(on, lock.lockData),
    );
    await _runOrThrow(_repo.updateLockData(lock.lockId, lockData: newData));
    return lock.copyWith(lockData: newData);
  }, ExceptionUtils.extractAppException);

  /// 双重认证：仅近场 setLockConfig；不 updateLockData / updateSetting。
  TaskEither<AppException, Unit> setDoubleAuth(
    LockEntity lock, {
    required bool on,
  }) => TaskEither.tryCatch(() async {
    await runBle(
      () =>
          TTLock.lock.setLockConfig(TTLockConfig.doubleAuth, on, lock.lockData),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  /// WiFi 省电：强制近场轨。禁止 gatewayWifi，即使 hasGateway。
  TaskEither<AppException, Unit> setWifiPowerSaving(
    LockEntity lock, {
    required bool on,
  }) => TaskEither.tryCatch(() async {
    await runBle(
      () => TTLock.lock.setLockConfig(
        TTLockConfig.wifiLockPowerSavingMode,
        on,
        lock.lockData,
      ),
    );
    return _runOrThrow(
      _repo.updateSetting(
        lock.lockId,
        LockSettingUpdate(
          type: 10,
          value: on ? 1 : 2,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 门未关报警秒数：标准设置轨。type=11；0=关。
  TaskEither<AppException, Unit> setDoorNotClosedAlert(
    LockEntity lock,
    int seconds,
  ) => TaskEither.tryCatch(() async {
    if (lock.hasGateway) {
      final remote = await _repo
          .updateSetting(
            lock.lockId,
            LockSettingUpdate(
              type: 11,
              value: seconds,
              channel: ChannelType.gatewayWifi,
            ),
          )
          .run();
      if (remote.isRight()) return unit;
    }
    await runBle(
      () => TTLock.lock.setDoorSensorAlertTime(seconds, lock.lockData),
    );
    return _runOrThrow(
      _repo.updateSetting(
        lock.lockId,
        LockSettingUpdate(
          type: 11,
          value: seconds,
          channel: ChannelType.bleSynced,
        ),
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, PassageModeConfigEntity> getPassageMode(
    int lockId,
  ) => _repo.getPassageModeConfig(lockId);

  TaskEither<AppException, WorkingModeEntity> getWorkingMode(int lockId) =>
      _repo.getWorkingMode(lockId);

  /// Open API `getExtraSetting.type`：0=云端缓存，1=经网关/WiFi 拉最新。
  static const _extraSettingFromCloud = 0;

  /// 非法尝试告警：云端优先 `getExtraSetting`（type=0）。
  TaskEither<AppException, ExtraSettingEntity> getUnauthorizedAttempt(
    int lockId,
  ) => _repo.getExtraSetting(lockId, type: _extraSettingFromCloud);

  /// 非法尝试告警：仅远程 `updateUnauthorizedAttemptAlert`。
  ///
  /// Pigeon 无完整 BLE 读写；无网关一律业务失败（code **-4**，勿与工作模式 -3 混用）。
  /// 有网关只走 `gatewayWifi`（Open API type=2），禁止 bleSynced / type=1。
  TaskEither<AppException, Unit> setUnauthorizedAttempt(
    LockEntity lock,
    ExtraSettingEntity e,
  ) => TaskEither.tryCatch(() async {
    if (!lock.hasGateway) {
      throw const AppException.business(
        code: -4,
        message: 'unauthorized_attempt_needs_gateway',
      );
    }
    return _runOrThrow(
      _repo.updateUnauthorizedAttemptAlert(
        lock.lockId,
        channel: ChannelType.gatewayWifi,
        flag: e.flag,
        count: e.count,
        lockTime: e.lockTime,
        pwd: e.pwd,
        card: e.card,
        fingerprint: e.fingerprint,
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 工作模式：仅远程 `configWorkingMode`。
  ///
  /// Open API：1=全天工作、2=全天不工作、3=自定义 cyclic。
  /// 插件仅有 `setLockWorkingTime(ms 起止)`，无法安全表达 mode 1/2/3，
  /// 故无网关一律业务失败；有网关只走 `gatewayWifi`，失败不假装 BLE cyclic。
  TaskEither<AppException, Unit> setWorkingMode(
    LockEntity lock,
    WorkingModeEntity mode,
  ) => TaskEither.tryCatch(() async {
    if (!lock.hasGateway) {
      throw const AppException.business(
        code: -3,
        message: 'working_mode_needs_gateway',
      );
    }
    return _runOrThrow(
      _repo.configWorkingMode(
        lock.lockId,
        workingMode: mode.workingMode,
        cyclicConfig: mode.workingMode == 3 ? mode.cyclicConfig : const [],
        channel: ChannelType.gatewayWifi,
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 常开模式：远程优先；失败或无网关 → BLE（开启先 clear 再 add）→ bleSynced 同步。
  TaskEither<AppException, Unit> setPassageMode(
    LockEntity lock,
    PassageModeConfigEntity config,
  ) => TaskEither.tryCatch(() async {
    Future<Unit> cloud(ChannelType ch) => _runOrThrow(
      _repo.configPassageMode(
        lock.lockId,
        passageMode: config.passageMode,
        startDate: config.startDate,
        endDate: config.endDate,
        isAllDay: config.isAllDay,
        weekDays: config.weekDays,
        autoUnlock: config.autoUnlock,
        channel: ch,
      ),
    );

    if (lock.hasGateway) {
      final remote = await _repo
          .configPassageMode(
            lock.lockId,
            passageMode: config.passageMode,
            startDate: config.startDate,
            endDate: config.endDate,
            isAllDay: config.isAllDay,
            weekDays: config.weekDays,
            autoUnlock: config.autoUnlock,
            channel: ChannelType.gatewayWifi,
          )
          .run();
      if (remote.isRight()) return unit;
    }

    final on = config.passageMode == 1;
    if (!on) {
      await runBle(() => TTLock.lock.clearAllPassageModes(lock.lockData));
    } else {
      await runBle(() => TTLock.lock.clearAllPassageModes(lock.lockData));
      final allDay = config.isAllDay == 1;
      await runBle(
        () => TTLock.lock.addPassageMode(
          TTPassageModeType.weekly,
          config.weekDays.isEmpty
              ? const [1, 2, 3, 4, 5, 6, 7]
              : config.weekDays,
          null,
          allDay ? 0 : config.startDate,
          allDay ? 0 : config.endDate,
          lock.lockData,
        ),
      );
      if (config.autoUnlock == 1 || config.autoUnlock == 2) {
        await runBle(
          () => TTLock.lock.setLockConfig(
            TTLockConfig.passageModeAutoUnlock,
            config.autoUnlock == 1,
            lock.lockData,
          ),
        );
      }
    }
    return cloud(ChannelType.bleSynced);
  }, ExceptionUtils.extractAppException);

  /// 读取系统信息 → 新 lockData 保鲜 + 电量回写 → 返回 Entity 与型号/固件等字段。
  TaskEither<AppException, LockSystemInfoResult> refreshSystemInfo(
    LockEntity lock,
  ) => TaskEither.tryCatch(() async {
    final info = await runBle(
      () => TTLock.lock.getLockSystemInfo(lock.lockData),
    );
    var updated = lock;
    if (info.lockData != null &&
        info.lockData!.isNotEmpty &&
        info.lockData != lock.lockData) {
      await _runOrThrow(
        _repo.updateLockData(lock.lockId, lockData: info.lockData!),
      );
      updated = updated.copyWith(lockData: info.lockData!);
    }
    final qty = info.electricQuantity;
    if (qty != null && qty >= 0) {
      await _runOrThrow(_repo.updateElectricQuantity(lock.lockId, qty));
      updated = updated.copyWith(electricQuantity: qty);
    }
    return LockSystemInfoResult(
      lock: updated,
      modelNum: info.modelNum ?? '',
      hardwareRevision: info.hardwareRevision ?? '',
      firmwareRevision: info.firmwareRevision ?? '',
      nbOperator: info.nbOperator ?? '',
      nbNodeId: info.nbNodeId ?? '',
      nbCardNumber: info.nbCardNumber ?? '',
      nbRssi: info.nbRssi ?? '',
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, LockEntity> refreshBattery(LockEntity lock) =>
      TaskEither.tryCatch(() async {
        final power = await runBle(
          () => TTLock.lock.getLockPower(lock.lockData),
        );
        await _runOrThrow(_repo.updateElectricQuantity(lock.lockId, power));
        return lock.copyWith(electricQuantity: power);
      }, ExceptionUtils.extractAppException);

  /// 同步锁时间：BLE setLockTime 近场必做；云端 updateDate 是**网关远程校准**
  /// （cloud gateway/adjustLockDatetime.md，需网关/WiFi 锁），仅 hasGateway 时尝试、
  /// 失败不致命（BLE 已生效），无网关纯 BLE 锁直接成功返回。
  TaskEither<AppException, Unit> syncLockDate(LockEntity lock) =>
      TaskEither.tryCatch(() async {
        await runBle(
          () => TTLock.lock.setLockTime(
            DateTime.now().millisecondsSinceEpoch,
            lock.lockData,
          ),
        );
        if (lock.hasGateway) {
          try {
            await _repo.updateDate(lock.lockId).run();
          } on Object {
            // 云端校准失败不回滚 BLE 结果（近场时间已同步）
          }
        }
        return unit;
      }, ExceptionUtils.extractAppException);

  /// 读取锁内时间（毫秒时间戳）。
  TaskEither<AppException, int> getLockTime(LockEntity lock) =>
      TaskEither.tryCatch(
        () => runBle(() => TTLock.lock.getLockTime(lock.lockData)),
        ExceptionUtils.extractAppException,
      );

  TaskEither<AppException, Unit> setSensitivity(
    LockEntity lock,
    TTSensitivityValue value,
  ) => TaskEither.tryCatch(() async {
    await runBle(() => TTLock.lock.setSensitivity(value, lock.lockData));
    return unit;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, TTSensitivityValue> getSensitivity(
    LockEntity lock,
  ) => TaskEither.tryCatch(
    () => runBle(() => TTLock.lock.getSensitivity(lock.lockData)),
    ExceptionUtils.extractAppException,
  );

  TaskEither<AppException, Unit> setLightTime(LockEntity lock, int seconds) =>
      TaskEither.tryCatch(() async {
        await runBle(() => TTLock.lock.setLightTime(seconds, lock.lockData));
        return unit;
      }, ExceptionUtils.extractAppException);

  TaskEither<AppException, int> getLightTime(LockEntity lock) =>
      TaskEither.tryCatch(
        () => runBle(() => TTLock.lock.getLightTime(lock.lockData)),
        ExceptionUtils.extractAppException,
      );

  TaskEither<AppException, Unit> setMotorTorqueLevel(
    LockEntity lock,
    int level,
  ) => TaskEither.tryCatch(() async {
    await runBle(() => TTLock.lock.setMotorTorqueLevel(level, lock.lockData));
    return unit;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> setLockLatchBolt(
    LockEntity lock,
    int driveLevel,
    int keepTimeSeconds,
  ) => TaskEither.tryCatch(() async {
    await runBle(
      () => TTLock.lock.setLockLatchBolt(
        driveLevel,
        keepTimeSeconds,
        lock.lockData,
      ),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, String> getAdminPasscode(LockEntity lock) =>
      TaskEither.tryCatch(
        () => runBle(() => TTLock.lock.getAdminPasscode(lock.lockData)),
        ExceptionUtils.extractAppException,
      );

  /// 修改管理员密码。原生成功回调返回的是新密码字符串（非 lockData）。
  TaskEither<AppException, String> modifyAdminPasscode(
    LockEntity lock,
    String adminPasscode,
  ) => TaskEither.tryCatch(() async {
    final result = await runBle(
      () => TTLock.lock.modifyAdminPasscode(adminPasscode, lock.lockData),
    );
    return (result != null && result.isNotEmpty) ? result : adminPasscode;
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, LockUpgradeCheckEntity> checkUpgrade(int lockId) =>
      _repo.upgradeCheck(lockId);

  /// P2：纯云端手填注册（无 BLE 预填 / getNbDeviceInfo）。
  TaskEither<AppException, Unit> registerNb(
    int lockId, {
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  }) => _repo.registerNb(
    lockId,
    nbNodeId: nbNodeId,
    nbCardNumber: nbCardNumber,
    nbOperator: nbOperator,
    nbRssi: nbRssi,
  );

  // ---- 操作记录 ----

  TaskEither<AppException, PageState<LockRecordEntity>> listRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? recordType,
  }) => _recordRepo.getRecords(
    lockId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  );

  TaskEither<AppException, Unit> deleteRecords(
    int lockId,
    List<int> recordIdList,
  ) => _recordRepo.delete(lockId, recordIdList: recordIdList);

  TaskEither<AppException, Unit> clearRecords(int lockId) =>
      _recordRepo.clear(lockId);

  /// 读取锁内离线记录（JSON 字符串）。
  TaskEither<AppException, String> fetchOfflineRecords(
    String lockData, {
    TTOperateRecordType type = TTOperateRecordType.latest,
  }) => TaskEither.tryCatch(
    () => runBle(
      () => TTLock.lock.getLockOperateRecord(
        type,
        lockData,
        timeout: Duration(minutes: 10),
      ),
    ),
    ExceptionUtils.extractAppException,
  );

  TaskEither<AppException, Unit> uploadRecords(int lockId, String records) =>
      _recordRepo.upload(lockId, records: records);

  // ---- WiFi 信息 ----

  TaskEither<AppException, WifiLockEntity> getWifiInfo(int lockId) =>
      _wifiRepo.detail(lockId);

  /// WiFi 锁配网：下发 SSID/密码与站点服务器端点，可选静态 IP/DNS 与省电模式，
  /// 最后把网络信息同步到云端（`/v3/wifiLock/updateNetwork`）。
  ///
  /// 服务器地址/端口由站点表内部注入，**不对外暴露**。
  /// 任一步 BLE 失败 → 整体 Left（不回滚已写入设备的部分）。
  TaskEither<AppException, Unit> configureWifiNetwork({
    required LockEntity lock,
    required String wifiName,
    required String wifiPassword,
    String? staticIp,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
    bool? powerSavingModeOn,
  }) => TaskEither.tryCatch(() async {
    final ld = lock.lockData;
    final ep = await _runOrThrow(
      ref
          .read(appConfigDomainProvider.notifier)
          .endpointFor(DeviceServerKind.wifiLock),
    );
    if (wifiPassword.isNotEmpty) {
      await runBle(
        () => TTLock.lock.configWifi(wifiName, wifiPassword, lock.lockMac, ld),
      );
      await runBle(
        () => TTLock.lock.configServer(ep.address, ep.portString, ld),
      );
    }
    // 静态 IP 开关只看 staticIp 是否有值；仅填 DNS 时按 DHCP 下发。
    final useStaticIp = staticIp != null && staticIp.isNotEmpty;
    final hasIpFields =
        useStaticIp ||
        (subnetMask != null && subnetMask.isNotEmpty) ||
        (defaultGateway != null && defaultGateway.isNotEmpty);
    final hasDnsFields =
        (preferredDns != null && preferredDns.isNotEmpty) ||
        (alternateDns != null && alternateDns.isNotEmpty);
    if (hasIpFields || hasDnsFields) {
      await runBle(
        () => TTLock.lock.configIp(
          TTIpSetting(
            // 0 = staticIp，1 = dhcp（见 TTIpSettingType 枚举顺序）。
            type: useStaticIp
                ? TTIpSettingType.staticIp.index
                : TTIpSettingType.dhcp.index,
            ipAddress: staticIp,
            subnetMask: subnetMask,
            router: defaultGateway,
            preferredDns: preferredDns,
            alternateDns: alternateDns,
          ),
          ld,
        ),
      );
    }

    if (powerSavingModeOn != null) {
      await runBle(
        () => TTLock.lock.setLockConfig(
          TTLockConfig.wifiLockPowerSavingMode,
          powerSavingModeOn,
          ld,
        ),
      );
    }

    final info = await runBle(() => TTLock.lock.getWifiInfo(ld));
    final rssi = info.wifiRssi;
    final rssiGrade = rssi == -127
        ? 0
        : rssi >= -50
        ? 3
        : rssi >= -70
        ? 2
        : 1;

    return _runOrThrow(
      _wifiRepo.updateNetwork(
        lock.lockId,
        networkName: wifiName,
        wifiMac: info.wifiMac,
        rssi: rssiGrade,
        useStaticIp: useStaticIp,
        ip: staticIp,
        subnetMask: subnetMask,
        defaultGateway: defaultGateway,
        preferredDns: preferredDns,
        alternateDns: alternateDns,
      ),
    );
  }, ExceptionUtils.extractAppException);

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async =>
      (await task.run()).fold((err) => throw err, (value) => value);
}
