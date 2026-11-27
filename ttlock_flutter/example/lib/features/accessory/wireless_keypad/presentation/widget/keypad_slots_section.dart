import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';

/// 键盘槽位区（仅多功能键盘）。
///
/// 数据来自云端 `listSlot`：含**其他锁**占用的槽位与未绑定槽位（空串别名）。
/// 本锁占用的槽位打「本锁」标记；解绑动作不在这里，走详情页的破坏性入口。
class KeypadSlotsSection extends ConsumerWidget {
  const KeypadSlotsSection({
    super.key,
    required this.slots,
    required this.mySlotNumber,
    required this.slotLimit,
    this.loading = false,
    this.error,
    this.onRetry,
  });

  final List<KeypadSlot> slots;
  final int mySlotNumber;
  final int slotLimit;
  final bool loading;
  final AppException? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Column(
      key: const Key('keypad_slots'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(l10n.keypadSlots),
          subtitle: slotLimit > 0
              ? Text(l10n.keypadSlotLimit(slotLimit))
              : null,
        ),
        if (loading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
        else if (error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // 带原因，而不是一句笼统的「读取失败」——否则用户看不出是
                  // 网络问题、权限问题还是别的。
                  l10n.keypadSlotsLoadFailed(
                    getUserFriendlyMessage(error!, l10n),
                  ),
                ),
                TextButton(
                  key: const Key('keypad_slots_retry'),
                  onPressed: onRetry,
                  child: Text(l10n.commonRetry),
                ),
              ],
            ),
          )
        else if (slots.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(l10n.keypadSlotsUnavailable),
          )
        else
          ...slots.map(
            (s) => ListTile(
              key: Key('keypad_slot_${s.slotNumber}'),
              dense: true,
              title: Text(l10n.keypadSlotLabel(s.slotNumber)),
              subtitle: Text(s.isBound ? s.lockAlias : l10n.keypadSlotEmpty),
              trailing: s.slotNumber == mySlotNumber
                  ? Text(l10n.keypadSlotMine)
                  : null,
            ),
          ),
      ],
    );
  }
}
