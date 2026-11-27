import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad_upgrade.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';

part 'keypad_detail_notifier.g.dart';

/// 键盘详情页状态（family 参数复用既有的 [WirelessKeypadDetailArgs]）。
///
/// 页面本身只渲染，业务全在这里——包括解绑的两步编排与「云端未同步」标志。
@Riverpod()
class KeypadDetailNotifier extends _$KeypadDetailNotifier {
  WirelessKeypadDomain get _domain =>
      ref.read(wirelessKeypadDomainProvider.notifier);

  /// 多功能键盘但云端记录没给槽位时，三条路径（解绑 / 重命名 / 查固件）的统一失败。
  ///
  /// 不猜槽位：一个错误的 `slotNumber` 可能落到**别的锁**的槽位上。
  /// 走 [AppException.firmware]，UI 侧统一显示 `l10n.errorBle`，无需新业务码。
  AppException get _slotUnknownError =>
      AppException.firmware(message: 'keypad_slot_unknown');

  /// 该键盘是否「多功能但槽位未知」——一个必须拒绝下发槽位的状态。
  bool _isSlotUnknown(WirelessKeypadEntity keypad) =>
      keypad.isMultifunctionalKeypad && !keypad.hasAssignedSlot;

  @override
  Future<KeypadDetailState> build(WirelessKeypadDetailArgs args) async {
    final keypad = args.item;
    if (!keypad.isMultifunctionalKeypad) {
      return KeypadDetailState(keypad: keypad);
    }
    final r = await _domain.listSlots(keypad.wirelessKeypadId).run();
    return r.fold(
      (err) => KeypadDetailState(keypad: keypad, slotsError: err),
      (slots) => KeypadDetailState(keypad: keypad, slots: slots),
    );
  }

  /// 重新拉取槽位（错误态重试）。
  Future<void> reloadSlots() async {
    final cur = state.value;
    if (cur == null || !cur.keypad.isMultifunctionalKeypad) return;
    state = AsyncValue.data(cur.copyWith(slotsLoading: true, slotsError: null));
    final r = await _domain.listSlots(cur.keypad.wirelessKeypadId).run();
    final next = state.value ?? cur;
    state = AsyncValue.data(
      r.fold(
        (err) => next.copyWith(
          slotsLoading: false,
          slotsError: err,
          slots: const [],
        ),
        (slots) =>
            next.copyWith(slotsLoading: false, slotsError: null, slots: slots),
      ),
    );
  }

  /// 解除**本锁**与该键盘的绑定。
  ///
  /// 多功能键盘：① BLE 清空本锁占用的槽位 → ② 云端解绑该槽位（**BLE 必先**）。
  /// 普通键盘：仅云端。
  ///
  /// 两步拆开是为了分辨失败位置：① 失败时云端调用次数为 0；
  /// ② 失败时置 [KeypadDetailState.pendingCloudSync]，重试只重发云端。
  ///
  /// **槽位未知的多功能键盘一步都不做**：云端没给 `slotNumber` 时它是 0，
  /// 而 SDK 把槽位 0 解释为「清空全部槽位」——传下去会连带解绑共用该键盘的
  /// **其他锁**；而针对多功能键盘的云端 `delete` 不传 `slotNumber` 会怎样，
  /// 文档并未定义（只说必填）。两边都不可预期，故整体拒绝并置错误。
  Future<bool> unbind() async {
    final cur = state.value;
    if (cur == null || cur.unbinding) return false;
    final keypad = cur.keypad;
    if (_isSlotUnknown(keypad)) {
      state = AsyncValue.data(cur.copyWith(actionError: _slotUnknownError));
      return false;
    }
    state = AsyncValue.data(cur.copyWith(unbinding: true, actionError: null));

    if (keypad.isMultifunctionalKeypad) {
      final ble = await _domain
          .clearKeypadSlot(
            keypadMac: keypad.wirelessKeypadMac,
            slotNumber: keypad.slotNumber,
          )
          .run();
      final bleError = ble.fold((err) => err, (_) => null);
      if (bleError != null) {
        state = AsyncValue.data(
          cur.copyWith(unbinding: false, actionError: bleError),
        );
        return false;
      }
    }

    return _pushUnbindToCloud(cur);
  }

  /// 只重发云端解绑（键盘槽位已清空，**不重复下发 BLE**）。
  Future<bool> retryCloudSync() async {
    final cur = state.value;
    if (cur == null || !cur.pendingCloudSync || cur.unbinding) return false;
    state = AsyncValue.data(cur.copyWith(unbinding: true, actionError: null));
    return _pushUnbindToCloud(cur);
  }

  Future<bool> _pushUnbindToCloud(KeypadDetailState cur) async {
    final keypad = cur.keypad;
    final cloud = await _domain
        .unbindFromCloud(
          wirelessKeypadId: keypad.wirelessKeypadId,
          slotNumber: keypad.isMultifunctionalKeypad ? keypad.slotNumber : null,
        )
        .run();
    return cloud.fold(
      (err) {
        state = AsyncValue.data(
          cur.copyWith(
            unbinding: false,
            actionError: err,
            pendingCloudSync: true,
          ),
        );
        return false;
      },
      (_) {
        state = AsyncValue.data(
          cur.copyWith(
            unbinding: false,
            pendingCloudSync: false,
            // 必须显式清空：`cur` 是 await 前的快照，可能带着上一次失败的
            // actionError；不清则「重试成功」也会弹出上一次的失败提示。
            actionError: null,
          ),
        );
        return true;
      },
    );
  }

  /// 重命名；多功能键盘须带槽位（云端据此定位本锁槽位上的名称）。
  ///
  /// **槽位未知时拒绝下发**（与 [unbind] 同一条规则）：把 `slotNumber: 0` 传给
  /// 云端会指向**别的锁**的槽位，重命中的是别人的键盘名，而非无操作。
  Future<bool> rename(String name) async {
    final cur = state.value;
    if (cur == null || cur.renaming) return false;
    final trimmed = name.trim();
    if (trimmed.isEmpty) return false;
    final keypad = cur.keypad;
    if (_isSlotUnknown(keypad)) {
      state = AsyncValue.data(cur.copyWith(actionError: _slotUnknownError));
      return false;
    }
    state = AsyncValue.data(cur.copyWith(renaming: true, actionError: null));
    final r = await _domain
        .rename(
          keypad.wirelessKeypadId,
          trimmed,
          slotNumber: keypad.isMultifunctionalKeypad ? keypad.slotNumber : null,
        )
        .run();
    return r.fold(
      (err) {
        state = AsyncValue.data(
          cur.copyWith(renaming: false, actionError: err),
        );
        return false;
      },
      (_) {
        state = AsyncValue.data(
          cur.copyWith(
            renaming: false,
            // 同 [_pushUnbindToCloud]：`cur` 是快照，成功须显式清掉旧的失败。
            actionError: null,
            keypad: keypad.copyWith(wirelessKeypadName: trimmed),
          ),
        );
        return true;
      },
    );
  }

  /// 检查固件升级。失败返回 null 并置 [KeypadDetailState.actionError]。
  ///
  /// `slotNumber < 1` 有两种成因，处理不同：
  /// - **普通键盘**：升级入口本就只在多功能分支渲染，静默返回 null 即可；
  /// - **多功能但槽位未知**：入口**会**渲染（键盘是多功能的），静默返回会让
  ///   用户点了没反应，故置错误让页面弹提示。
  Future<WirelessKeypadUpgradeCheck?> checkUpgrade() async {
    final cur = state.value;
    if (cur == null || cur.checkingUpgrade) return null;
    final keypad = cur.keypad;
    if (keypad.slotNumber < 1) {
      if (_isSlotUnknown(keypad)) {
        state = AsyncValue.data(cur.copyWith(actionError: _slotUnknownError));
      }
      return null;
    }
    state = AsyncValue.data(
      cur.copyWith(checkingUpgrade: true, actionError: null),
    );
    final r = await _domain
        .checkUpgrade(
          wirelessKeypadId: keypad.wirelessKeypadId,
          slotNumber: keypad.slotNumber,
        )
        .run();
    return r.fold(
      (err) {
        state = AsyncValue.data(
          cur.copyWith(checkingUpgrade: false, actionError: err),
        );
        return null;
      },
      (check) {
        state = AsyncValue.data(
          // 同 [_pushUnbindToCloud]：`cur` 是快照，成功须显式清掉旧的失败。
          cur.copyWith(checkingUpgrade: false, actionError: null),
        );
        return check;
      },
    );
  }
}
