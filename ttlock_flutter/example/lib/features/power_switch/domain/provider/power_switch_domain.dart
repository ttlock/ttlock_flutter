import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';

part 'power_switch_domain.g.dart';

/// 取电开关编排：工作模式 / 关联门锁（均 BLE 单轨，无云端配置回写）。
///
/// 开放平台 `listByHotel` 不返回 `hotelLockId`/`electric`，故与梯控工作模式一致，
/// 仅近场写设备；`lockData` 空 → -21。
@Riverpod(keepAlive: true)
class PowerSwitchDomain extends _$PowerSwitchDomain {
  @override
  void build() {}

  /// 设置取电工作模式（BLE）。
  ///
  /// [TTPowerSaverWorkType.allCards]：任意卡取电；
  /// [TTPowerSaverWorkType.hotelCard]：本酒店卡取电；
  /// [TTPowerSaverWorkType.roomCard]：房卡取电。
  TaskEither<AppException, Unit> setWorkMode({
    required TTPowerSaverWorkType type,
    required String lockData,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await runBle(() => TTLock.lock.setPowerSaverWorkMode(type, lockData));
    return unit;
  }, ExceptionUtils.extractAppException);

  /// 关联可控酒店锁（BLE；写入目标锁 MAC）。
  TaskEither<AppException, Unit> setControlableLock({
    required String lockMac,
    required String lockData,
  }) => TaskEither.tryCatch(() async {
    if (lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    if (lockMac.isEmpty) {
      throw AppException.business(code: -100, message: 'power_switch_mac_empty');
    }
    await runBle(
      () => TTLock.lock.setPowerSaverControlableLock(lockMac, lockData),
    );
    return unit;
  }, ExceptionUtils.extractAppException);
}
