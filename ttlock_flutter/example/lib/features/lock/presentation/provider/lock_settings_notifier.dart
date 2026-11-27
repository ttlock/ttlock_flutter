import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_settings_state.dart';

part 'lock_settings_notifier.g.dart';

/// 设置页需要探测的功能位全集（逐个 `supportFunction`）。
const List<TTLockFunction> kSettingsLockFunctions = [
  TTLockFunction.audioSwitch,
  TTLockFunction.soundVolumeAndLanguageSetting,
  TTLockFunction.privacyLock,
  TTLockFunction.tamperAlert,
  TTLockFunction.resetButton,
  TTLockFunction.unlockSwitch,
  TTLockFunction.doubleAuth,
  TTLockFunction.unlockDirection,
  TTLockFunction.autoLock,
  TTLockFunction.passageMode,
  TTLockFunction.wifiLock,
  TTLockFunction.workingMode,
  TTLockFunction.unauthorizedAttemptAlarm,
  TTLockFunction.remoteKey,
  TTLockFunction.wirelessKeypad,
  TTLockFunction.multiFunctionKeypad,
  TTLockFunction.doorSensor,
  TTLockFunction.nbIoT,
  TTLockFunction.sensitivity,
  TTLockFunction.light,
  TTLockFunction.motorTorque,
  TTLockFunction.controlLatchBolt,
  TTLockFunction.getAdminPasscode,
  TTLockFunction.bluetoothAdvertisingSetting,
  TTLockFunction.hideWifiCatOneSleepModeSetting
];

/// 设置页能力探测 + 全部 domain 写操作。
///
/// 初值：**云端 detail 优先**；缺项/未知再 BLE；remoteUnlock/doubleAuth 仅近场。
/// 能力位：有 lockData 时本地 `supportFunction`（不连 BLE）。
@Riverpod()
class LockSettingsNotifier extends _$LockSettingsNotifier {
  LockDomain get _domain => ref.read(lockDomainProvider.notifier);

  /// 当前锁 Entity（`build` 已保证非空）。
  LockEntity get _lock => state.value!.lock!;

  @override
  Future<LockSettingsState> build(int lockId, LockEntity? extra) {
    return _load(extra ?? LockEntity(lockId: lockId));
  }

  /// 云端优先读初值 + 能力探测。返回的 state 已带 [LockSettingsState.lock]。
  Future<LockSettingsState> _load(LockEntity seed) async {
    final doorSensorFuture = _queryDoorSensor(seed.lockId);

    // 一次 detail：基础字段 + 云端设置；失败则仅用路由 seed。
    LockEntity lock = seed;
    LockCloudSettings cloud = const LockCloudSettings();
    final detailR = await _domain.getLockDetailWithSettings(seed.lockId).run();
    detailR.fold((_) {}, (pair) {
      final fromCloud = pair.lock;
      lock = fromCloud.copyWith(
        // lockData / hasGateway 以路由 $extra 为准（detail 常无 lockData）。
        lockData: seed.lockData.isNotEmpty
            ? seed.lockData
            : fromCloud.lockData,
        hasGateway: seed.hasGateway || fromCloud.hasGateway,
        groupId: seed.groupId != 0 ? seed.groupId : fromCloud.groupId,
        groupName: seed.groupName.isNotEmpty
            ? seed.groupName
            : fromCloud.groupName,
        lockAlias: seed.lockAlias.isNotEmpty
            ? seed.lockAlias
            : fromCloud.lockAlias,
        lockName: seed.lockName.isNotEmpty ? seed.lockName : fromCloud.lockName,
        lockMac: seed.lockMac.isNotEmpty ? seed.lockMac : fromCloud.lockMac,
      );
      cloud = pair.settings;
    });

    final ld = lock.lockData;
    final supported = <TTLockFunction>{};
    if (ld.isNotEmpty) {
      for (final fn in kSettingsLockFunctions) {
        if (await _supports(fn, ld)) supported.add(fn);
      }
    }
    final doorSensor = await doorSensorFuture;
    final canBle = ld.isNotEmpty;

    Future<bool> boolSetting({
      required bool? cloudValue,
      required TTLockFunction function,
      required Future<bool> Function() bleRead,
    }) async {
      if (!supported.contains(function)) return false;
      if (cloudValue != null) return cloudValue;
      if (!canBle) return false;
      return _readBool(bleRead);
    }

    final soundOn = await boolSetting(
      cloudValue: cloud.lockSoundOn,
      function: TTLockFunction.audioSwitch,
      bleRead: () => TTLock.lock.getLockConfig(TTLockConfig.audio, ld),
    );
    final privacyLockOn = await boolSetting(
      cloudValue: cloud.privacyLockOn,
      function: TTLockFunction.privacyLock,
      bleRead: () =>
          TTLock.lock.getLockConfig(TTLockConfig.privacyLock, ld),
    );
    final tamperAlertOn = await boolSetting(
      cloudValue: cloud.tamperAlertOn,
      function: TTLockFunction.tamperAlert,
      bleRead: () =>
          TTLock.lock.getLockConfig(TTLockConfig.tamperAlert, ld),
    );
    final resetButtonOn = await boolSetting(
      cloudValue: cloud.resetButtonOn,
      function: TTLockFunction.resetButton,
      bleRead: () =>
          TTLock.lock.getLockConfig(TTLockConfig.resetButton, ld),
    );

    // 云端无对应读字段：仅近场。
    final remoteUnlockOn =
        supported.contains(TTLockFunction.unlockSwitch) &&
        canBle &&
        await _readBool(() => TTLock.lock.getRemoteUnlockSwitchState(ld));
    final doubleAuthOn =
        supported.contains(TTLockFunction.doubleAuth) &&
        canBle &&
        await _readBool(
          () => TTLock.lock.getLockConfig(TTLockConfig.doubleAuth, ld),
        );

    var wifiPowerSavingOn = false;
    if (supported.contains(TTLockFunction.wifiLock) || supported.contains(TTLockFunction.xiaoCaoCamera)) {
      final wifiR = await _domain.getWifiInfo(lock.lockId).run();
      final fromWifi = wifiR.fold((_) => null, (w) {
        if (w.powerSavingMode == 1) return true;
        if (w.powerSavingMode == 2) return false;
        return null;
      });
      if (fromWifi != null) {
        wifiPowerSavingOn = fromWifi;
      } else if (canBle) {
        wifiPowerSavingOn = await _readBool(
          () => TTLock.lock.getLockConfig(
            TTLockConfig.wifiLockPowerSavingMode,
            ld,
          ),
        );
      }
    }

    AutoLockingTime? autoLockingTime;
    if (supported.contains(TTLockFunction.autoLock)) {
      if (cloud.autoLockTime != null) {
        final current = cloud.autoLockTime! <= 0 ? 0 : cloud.autoLockTime!;
        autoLockingTime = AutoLockingTime(
          currentTime: current,
          minTime: kDefaultAutoLockMinTime,
          maxTime: kDefaultAutoLockMaxTime,
        );
      } else if (canBle) {
        autoLockingTime = await _readAutoLockingTime(ld);
      }
    }

    var soundVolume = 3;
    if (supported.contains(TTLockFunction.soundVolumeAndLanguageSetting)) {
      final sv = cloud.soundVolume;
      if (sv != null && sv >= 1 && sv <= 5) {
        soundVolume = sv;
      } else if (canBle) {
        soundVolume = await _readSoundLevel(ld);
      }
    }

    int? openDirection = cloud.openDirection;
    if (openDirection == null &&
        supported.contains(TTLockFunction.unlockDirection) &&
        canBle) {
      try {
        final d = await runBle(() => TTLock.lock.getLockDirection(ld));
        openDirection = d == TTLockDirection.left ? 1 : 2;
      } on Object {
        // keep null
      }
    }

    return LockSettingsState(
      lock: lock,
      supportedFunctions: Set.unmodifiable(supported),
      soundOn: soundOn,
      privacyLockOn: privacyLockOn,
      tamperAlertOn: tamperAlertOn,
      resetButtonOn: resetButtonOn,
      remoteUnlockOn: remoteUnlockOn,
      doubleAuthOn: doubleAuthOn,
      wifiPowerSavingOn: wifiPowerSavingOn,
      autoLockingTime: autoLockingTime,
      soundVolume: soundVolume,
      openDirection: openDirection,
      doorSensor: doorSensor,
    );
  }

  /// 功能位探测：探测抛异常一律视为「不支持」（本地解析 lockData，不连 BLE）。
  Future<bool> _supports(TTLockFunction fn, String lockData) async {
    try {
      return await runBle(() => TTLock.lock.supportFunction(fn, lockData));
    } on Object {
      return false;
    }
  }

  /// 读初值：任何失败 → false（默认关）。
  Future<bool> _readBool(Future<bool> Function() read) async {
    try {
      return await runBle(read);
    } on Object {
      return false;
    }
  }

  Future<AutoLockingTime?> _readAutoLockingTime(String lockData) async {
    try {
      return await runBle(
        () => TTLock.lock.getAutoLockingPeriodicTime(lockData),
      );
    } on Object {
      return null;
    }
  }

  /// 音量等级 1–5（与云端一致）。
  Future<int> _readSoundLevel(String lockData) async {
    try {
      final volume = await runBle(() => TTLock.lock.getSoundVolume(lockData));
      return switch (volume) {
        TTSoundVolumeType.firstLevel => 1,
        TTSoundVolumeType.secondLevel => 2,
        TTSoundVolumeType.thirdLevel => 3,
        TTSoundVolumeType.fourthLevel => 4,
        TTSoundVolumeType.fifthLevel || TTSoundVolumeType.on => 5,
        TTSoundVolumeType.off => 3,
      };
    } on Object {
      return 3;
    }
  }

  Future<DoorSensorEntity?> _queryDoorSensor(int lockId) async {
    final r = await ref
        .read(doorSensorDomainProvider.notifier)
        .queryBound(lockId)
        .run();
    return r.fold((_) => null, (opt) => opt.match(() => null, (e) => e));
  }

  /// 门磁 add/detail 返回后刷新绑定状态（重查；失败/未绑 → null）。
  Future<void> refreshDoorSensor() async {
    final cur = state.value;
    final lockId = cur?.lock?.lockId;
    if (cur == null || lockId == null) return;
    state = AsyncValue.data(
      cur.copyWith(doorSensor: await _queryDoorSensor(lockId)),
    );
  }

  /// 从锁同步设置到云端并刷新本页（他端改过设置时的兜底）。
  Future<Either<AppException, Unit>> syncFromLock() async {
    final result = await _domain
        .syncSettingsFromLock(_lock)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    if (result.isLeft()) return result.map((_) => unit);
    state = AsyncValue.data(await _load(_lock));
    return const Right(unit);
  }

  // ---- 写操作：domain 请求统一在此发起，成功后写回 state ----

  /// 执行 [action]（期间展示全局 loading），成功后按 [patch]/[apply] 写回 state。
  ///
  /// 返回值原样交给界面做提示与跳转；Notifier 不产出用户可见文案。
  Future<Either<AppException, T>> _run<T>(
    TaskEither<AppException, T> Function(LockEntity lock) action, {
    LockSettingsState Function(LockSettingsState state)? patch,
    Future<void> Function(T value)? apply,
  }) async {
    final result = await action(
      _lock,
    ).runWithLoading(status: ref.read(l10nProvider).loading);
    await result.fold((_) async {}, (value) async {
      if (patch != null) _write(patch);
      if (apply != null) await apply(value);
    });
    return result;
  }

  /// 局部改写 state；provider 已销毁（无 data）时忽略。
  void _write(LockSettingsState Function(LockSettingsState state) patch) {
    final cur = state.value;
    if (cur == null) return;
    state = AsyncValue.data(patch(cur));
  }

  /// 声音开关（纯开关；音量与语言走 [setSoundVolume]）。
  Future<Either<AppException, Unit>> setSound({required bool on}) => _run(
    (lock) => _domain.setSound(lock, on: on),
    patch: (s) => s.copyWith(soundOn: on),
  );

  /// 音量/语言 sheet 结果：写回开关与音量等级（1–5）。
  Future<Either<AppException, Unit>> setSoundVolume({
    required bool on,
    required int level,
  }) => _run(
    (lock) => _domain.setSoundVolume(lock, on: on, level: level),
    patch: (s) => s.copyWith(soundOn: on, soundVolume: level.clamp(1, 5)),
  );

  Future<Either<AppException, Unit>> setPrivacyLock({required bool on}) => _run(
    (lock) => _domain.setPrivacyLock(lock, on: on),
    patch: (s) => s.copyWith(privacyLockOn: on),
  );

  Future<Either<AppException, Unit>> setTamperAlert({required bool on}) => _run(
    (lock) => _domain.setTamperAlert(lock, on: on),
    patch: (s) => s.copyWith(tamperAlertOn: on),
  );

  Future<Either<AppException, Unit>> setResetButton({required bool on}) => _run(
    (lock) => _domain.setResetButton(lock, on: on),
    patch: (s) => s.copyWith(resetButtonOn: on),
  );

  /// 远程开锁返回新 lockData：整体写回（lockData 变化会重新探测 + 重读初值）。
  Future<Either<AppException, LockEntity>> setRemoteUnlock({
    required bool on,
  }) => _run(
    (lock) => _domain.setRemoteUnlock(lock, on: on),
    apply: (updated) async {
      await _applyLock(updated);
      _write((s) => s.copyWith(remoteUnlockOn: on));
    },
  );

  Future<Either<AppException, Unit>> setDoubleAuth({required bool on}) => _run(
    (lock) => _domain.setDoubleAuth(lock, on: on),
    patch: (s) => s.copyWith(doubleAuthOn: on),
  );

  Future<Either<AppException, Unit>> setOpenDirection(
    TTLockDirection direction,
  ) => _run(
    (lock) => _domain.setOpenDirection(lock, direction),
    patch: (s) => s.copyWith(
      openDirection: direction == TTLockDirection.left ? 1 : 2,
    ),
  );

  /// 自动闭锁时间：按所选秒数改写初值，保留 sheet 需要的上下限。
  Future<Either<AppException, Unit>> setAutoLockTime(int seconds) => _run(
    (lock) => _domain.setAutoLockTime(lock, seconds),
    patch: (s) {
      final prev = s.autoLockingTime;
      return s.copyWith(
        autoLockingTime: AutoLockingTime(
          currentTime: seconds,
          minTime: prev?.minTime ?? kDefaultAutoLockMinTime,
          maxTime: prev?.maxTime ?? kDefaultAutoLockMaxTime,
        ),
      );
    },
  );

  /// 常开模式：state 无对应字段，成功后无需改写。
  Future<Either<AppException, Unit>> setPassageMode(
    PassageModeConfigEntity config,
  ) => _run((lock) => _domain.setPassageMode(lock, config));

  Future<Either<AppException, Unit>> setWifiPowerSaving({required bool on}) =>
      _run(
        (lock) => _domain.setWifiPowerSaving(lock, on: on),
        patch: (s) => s.copyWith(wifiPowerSavingOn: on),
      );

  /// 工作模式：state 无对应字段，成功后无需改写。
  Future<Either<AppException, Unit>> setWorkingMode(WorkingModeEntity mode) =>
      _run((lock) => _domain.setWorkingMode(lock, mode));

  /// 非法尝试告警：state 无对应字段，成功后无需改写。
  Future<Either<AppException, Unit>> setUnauthorizedAttempt(
    ExtraSettingEntity extra,
  ) => _run((lock) => _domain.setUnauthorizedAttempt(lock, extra));

  // ---- 系统信息 / 维护 ----

  /// 读取系统信息（含 lockData 保鲜、电量）并整体写回。
  Future<Either<AppException, LockSystemInfoResult>> refreshSystemInfo() =>
      _run(_domain.refreshSystemInfo, apply: (r) => _applyLock(r.lock));

  Future<Either<AppException, LockEntity>> refreshBattery() =>
      _run(_domain.refreshBattery, apply: _applyLock);

  /// 子页（如锁信息）返回时写回本地 Entity。
  Future<void> applyLock(LockEntity lock) => _applyLock(lock);

  /// 同步锁时间：state 无对应字段，成功后无需改写。
  Future<Either<AppException, Unit>> syncLockDate() =>
      _run(_domain.syncLockDate);

  Future<Either<AppException, Unit>> setSensitivity(TTSensitivityValue value) =>
      _run((lock) => _domain.setSensitivity(lock, value));

  Future<Either<AppException, Unit>> setLightTime(int seconds) =>
      _run((lock) => _domain.setLightTime(lock, seconds));

  Future<Either<AppException, Unit>> setMotorTorqueLevel(int level) =>
      _run((lock) => _domain.setMotorTorqueLevel(lock, level));

  Future<Either<AppException, Unit>> setLockLatchBolt({
    required int driveLevel,
    required int keepTimeSeconds,
  }) =>
      _run((lock) => _domain.setLockLatchBolt(lock, driveLevel, keepTimeSeconds));

  /// 固件升级检测：纯查询，不改 state；结果由界面提示。
  Future<Either<AppException, LockUpgradeCheckEntity>> checkUpgrade() => _domain
      .checkUpgrade(_lock.lockId)
      .runWithLoading(status: ref.read(l10nProvider).loading);

  Future<Either<AppException, Unit>> registerNb({
    required String nbNodeId,
    required String nbCardNumber,
    required String nbOperator,
    required int nbRssi,
  }) => _run(
    (lock) => _domain.registerNb(
      lock.lockId,
      nbNodeId: nbNodeId,
      nbCardNumber: nbCardNumber,
      nbOperator: nbOperator,
      nbRssi: nbRssi,
    ),
  );

  // ---- 分组 / 重命名 / 转让 / 删除 ----

  /// 变更分组：groupId=0 表示取消分组。
  Future<Either<AppException, Unit>> changeGroup(GroupEntity group) => _run(
    (lock) => ref
        .read(groupDomainProvider.notifier)
        .setDeviceGroupForLock(
          lock.lockId,
          group.groupId == 0 ? null : group.groupId,
        ),
    apply: (_) => _applyLock(
      _lock.copyWith(groupId: group.groupId, groupName: group.name),
    ),
  );

  Future<Either<AppException, Unit>> renameLock(String alias) => _run(
    (lock) => _domain.renameLock(lock.lockId, alias),
    apply: (_) => _applyLock(_lock.copyWith(lockAlias: alias)),
  );

  Future<Either<AppException, Unit>> transferLock(String username) =>
      _run((lock) => _domain.transferLock([lock.lockId], username));

  /// 删除锁：BLE reset + 云端 delete；成功后由界面决定回退。
  Future<Either<AppException, Unit>> deleteLock() =>
      _run((lock) => _domain.deleteLockFlow(lock));

  /// BLE 刷新 / 远程开锁等带回新 lockData 时写回；
  /// lockData 变化则重新探测 + 重读初值。
  Future<void> _applyLock(LockEntity lock) async {
    final cur = state.value;
    if (cur == null) return;
    if (lock.lockData != cur.lock?.lockData) {
      state = AsyncValue.data(await _load(lock));
    } else {
      state = AsyncValue.data(cur.copyWith(lock: lock));
    }
  }
}
