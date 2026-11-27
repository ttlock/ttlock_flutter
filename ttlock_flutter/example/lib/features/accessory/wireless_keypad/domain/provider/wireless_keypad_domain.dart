import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/data/repository/wireless_keypad_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/repository/wireless_keypad_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'wireless_keypad_domain.g.dart';

enum WirelessKeypadType { normal, multifunctional }

/// 云端 `hasSlot` 取值。
class KeypadHasSlot {
  const KeypadHasSlot._();
  static const multifunctional = 1;
  static const normal = 2;
}

@Riverpod(keepAlive: true)
class WirelessKeypadDomain extends _$WirelessKeypadDomain {
  late final WirelessKeypadRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(wirelessKeypadRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<WirelessKeypadEntity>> listByLock(int lockId) =>
      _repo.listByLock(lockId);

  /// 键盘的所有槽位（含其他锁占用的、以及未绑定的）。
  ///
  /// 云端已按权限过滤：若当前用户对该键盘所有槽位关联的锁均无权限，返回空列表。
  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId) =>
      _repo.listSlots(wirelessKeypadId);

  /// 重命名。[slotNumber] 仅多功能键盘需要（云端据此定位**当前锁槽位**的名称）。
  TaskEither<AppException, Unit> rename(
    int wirelessKeypadId,
    String name, {
    int? slotNumber,
  }) => _repo.rename(wirelessKeypadId, name, slotNumber: slotNumber);

  TaskEither<AppException, int> addNormal({
    required LockEntity lock,
    required String mac,
    required String number,
    String? name,
  }) => TaskEither.tryCatch(() async {
    if (lock.lockMac.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    final init = await runBle(
      () => TTLock.remoteKeypad.initRemoteKeypad(mac, lock.lockMac),
    );
    return _runOrThrow(
      _repo.add(
        lock.lockId,
        mac,
        wirelessKeypadName: _defaultName(lock, number, name),
        wirelessKeypadNumber: number,
        wirelessKeypadFeatureValue: init.wirelessKeypadFeatureValue,
        electricQuantity: init.electricQuantity,
        hasSlot: KeypadHasSlot.normal,
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// 多功能键盘绑定。
  ///
  /// 必须把 `init` 返回的槽位与版本字段**如实上报云端**：`slotNumber` 是云端
  /// `add` 对多功能键盘的必填项，不上报则槽位绑定关系在云端缺失；
  /// `modelNum` / `hardwareRevision` / `firmwareRevision` 供云端做固件升级检测。
  TaskEither<AppException, int> addMulti({
    required LockEntity lock,
    required String mac,
    required String number,
    String? name,
  }) => TaskEither.tryCatch(() async {
    if (lock.lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    final init = await runBle(
      () => TTLock.remoteKeypad.initMultifunctionalKeypad(mac, lock.lockData),
    );
    return _runOrThrow(
      _repo.add(
        lock.lockId,
        mac,
        wirelessKeypadName: _defaultName(lock, number, name),
        wirelessKeypadNumber: number,
        wirelessKeypadFeatureValue: init.wirelessKeypadFeatureValue,
        electricQuantity: init.electricQuantity,
        hasSlot: KeypadHasSlot.multifunctional,
        slotNumber: init.slotNumber,
        slotLimit: init.slotLimit,
        modelNum: init.modelNum,
        hardwareRevision: init.hardwareRevision,
        firmwareRevision: init.firmwareRevision,
      ),
    );
  }, ExceptionUtils.extractAppException);

  /// **解绑第 ① 步**：清空键盘上的该槽位（仅多功能键盘）。
  ///
  /// 与 [unbindFromCloud] 拆开是为了让调用方能分辨失败发生在哪一步 ——
  /// BLE 成功、云端失败时须把重试限定在云端（键盘槽位已经清空了）。
  TaskEither<AppException, Unit> clearKeypadSlot({
    required String keypadMac,
    required int slotNumber,
  }) => TaskEither.tryCatch(() async {
    await runBle(
      () => TTLock.remoteKeypad.deleteStoredLock(keypadMac, slotNumber),
    );
    return unit;
  }, ExceptionUtils.extractAppException);

  /// **解绑第 ② 步**：云端解绑。
  ///
  /// [slotNumber] 仅多功能键盘传；云端据此只解绑该槽位，全部槽位解绑后
  /// 云端自动删除键盘主记录。
  TaskEither<AppException, Unit> unbindFromCloud({
    required int wirelessKeypadId,
    int? slotNumber,
  }) => _repo.delete(wirelessKeypadId, slotNumber: slotNumber);

  /// 检查键盘固件是否有新版。
  ///
  /// 只查不刷：SDK 无键盘固件升级能力（见 spec §4.6）。
  TaskEither<AppException, WirelessKeypadUpgradeCheck> checkUpgrade({
    required int wirelessKeypadId,
    required int slotNumber,
  }) => _repo.checkUpgrade(
    wirelessKeypadId: wirelessKeypadId,
    slotNumber: slotNumber,
  );

  String _defaultName(LockEntity lock, String number, String? name) {
    if (name != null && name.trim().isNotEmpty) return name.trim();
    if (lock.lockAlias.isNotEmpty) return lock.lockAlias;
    return number;
  }

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((l) => throw l, (r) => r);
  }
}
