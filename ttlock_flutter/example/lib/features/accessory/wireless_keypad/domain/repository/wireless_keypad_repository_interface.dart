import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';

abstract class WirelessKeypadRepositoryInterface {
  /// [hasSlot]：null 或 0 = 全部；1 = 仅多功能；2 = 仅普通。
  TaskEither<AppException, List<WirelessKeypadEntity>> listByLock(
    int lockId, {
    int? hasSlot,
  });

  /// 云端 add；`wirelessKeypadNumber` / `wirelessKeypadName` /
  /// `wirelessKeypadFeatureValue` 必填非空。
  ///
  /// [hasSlot] 非空时须为 1（多功能）或 2（普通）；多功能键盘**必须**同时给
  /// [slotNumber]，否则云端登记不完整。
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    required String wirelessKeypadName,
    required String wirelessKeypadNumber,
    required String wirelessKeypadFeatureValue,
    int? electricQuantity,
    int? hasSlot,
    int? slotNumber,
    int? slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision,
  });

  /// 多功能键盘的全部槽位（按 slotNumber 升序，含未绑定槽位）。
  TaskEither<AppException, List<KeypadSlot>> listSlots(int wirelessKeypadId);

  /// 云端解绑。[slotNumber] 仅多功能键盘需要——云端据此**只解绑该槽位**。
  TaskEither<AppException, Unit> delete(
    int wirelessKeypadId, {
    int? slotNumber,
  });

  TaskEither<AppException, Unit> rename(
    int wirelessKeypadId,
    String name, {
    int? slotNumber,
  });

  TaskEither<AppException, WirelessKeypadUpgradeCheck> checkUpgrade({
    required int wirelessKeypadId,
    required int slotNumber,
  });
}
