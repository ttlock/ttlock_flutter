import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/keypad_detail_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_unbind_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/widget/keypad_slots_section.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class WirelessKeypadDetailScreen extends HookConsumerWidget {
  const WirelessKeypadDetailScreen({super.key, required this.args});
  final WirelessKeypadDetailArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = keypadDetailProvider(args);
    final async = ref.watch(provider);
    final isLockSupprtCard = useState(false);
    useEffect(() {
      final lock = args.lock;
      TTLock.lock.supportFunction(TTLockFunction.icCard, lock.lockData).then((value) {
          isLockSupprtCard.value = value;
        });
      return (){};
      },
      [args.lock],
    );

    ref.listen(provider, (prev, next) {
      final err = next.value?.actionError;
      if (err != null && err != prev?.value?.actionError) {
        // 只报**刚刚失败的那次操作**。不按 `pendingCloudSync` 分流：它是粘性的
        // （云推送失败后一直为 true，直到推送成功），而 `actionError` 是每次操作
        // 覆盖的——按前者分流会让解绑失败之后的任何一次失败（重命名 / 检查固件 /
        // 第二次 BLE 清槽）都被报成「云端未同步」，真实原因被吞掉。
        // 云端未同步这件事由下面的常驻横幅负责，它自带重试按钮。
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
      }
    });

    return Scaffold(
      key: const Key('wireless_keypad_detail'),
      appBar: AppBar(title: Text(l10n.wirelessKeypad)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        // build 不会抛异常（错误都折叠进 state.slotsError），此分支不可达。
        error: (_, _) => const SizedBox.shrink(),
        data: (state) {
          final keypad = state.keypad;
          final busy = state.unbinding || state.renaming;
          return ListView(
            children: [
              ListTile(
                title: Text(l10n.wirelessKeypadName),
                subtitle: Text(
                  keypad.wirelessKeypadName.isEmpty
                      ? '—'
                      : keypad.wirelessKeypadName,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: busy ? null : () => _rename(context, ref, state),
                ),
              ),
              ListTile(
                title: Text(l10n.remoteMac),
                subtitle: Text(keypad.wirelessKeypadMac),
              ),
              ListTile(
                title: Text(l10n.keypadTypeLabel),
                subtitle: Text(
                  keypad.isMultifunctionalKeypad
                      ? l10n.keypadTypeMulti
                      : l10n.keypadTypeNormal,
                ),
              ),
              if (keypad.isMultifunctionalKeypad) ...[
                const Divider(),
                if(!isLockSupprtCard.value)
                ListTile(
                  key: const Key('keypad_enroll_card'),
                  leading: const Icon(Icons.credit_card),
                  title: Text(l10n.keypadEnrollCard),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => CardAddRoute(
                    $extra: args.lock,
                    keypadMac: keypad.wirelessKeypadMac,
                  ).push(context),
                ),
                ListTile(
                  key: const Key('keypad_enroll_fingerprint'),
                  leading: const Icon(Icons.fingerprint),
                  title: Text(l10n.keypadEnrollFingerprint),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => FingerprintAddRoute(
                    $extra: args.lock,
                    keypadMac: keypad.wirelessKeypadMac,
                  ).push(context),
                ),
                const Divider(),
                KeypadSlotsSection(
                  slots: state.slots,
                  mySlotNumber: keypad.slotNumber,
                  slotLimit: keypad.slotLimit,
                  loading: state.slotsLoading,
                  error: state.slotsError,
                  onRetry: () => ref.read(provider.notifier).reloadSlots(),
                ),
                ListTile(
                  key: const Key('keypad_check_upgrade'),
                  leading: const Icon(Icons.system_update_alt),
                  enabled: !busy,
                  title: Text(l10n.checkUpgrade),
                  trailing: state.checkingUpgrade
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : null,
                  onTap: () => _checkUpgrade(context, ref),
                ),
              ],
              if (state.pendingCloudSync) ...[
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.keypadCloudPending,
                        key: const Key('keypad_cloud_pending'),
                      ),
                      TextButton(
                        key: const Key('keypad_cloud_retry'),
                        onPressed: state.unbinding
                            ? null
                            : () => _retryCloudSync(context, ref),
                        child: Text(l10n.keypadCloudRetry),
                      ),
                    ],
                  ),
                ),
              ],
              const Divider(),
              ListTile(
                key: const Key('keypad_unbind'),
                // 云端未同步时禁用：BLE 清槽已经跑过，槽位是空的，再点一次会
                // 对同一个空槽重跑 clearKeypadSlot —— 正是 pendingCloudSync
                // 要避开的那次「幂等性未经验证」的调用（恢复入口是上面的重试同步）。
                enabled: !busy && !state.pendingCloudSync,
                leading: Icon(
                  Icons.link_off,
                  color: Theme.of(context).colorScheme.error,
                ),
                title: Text(
                  keypad.isMultifunctionalKeypad
                      ? l10n.keypadUnbindFromLock
                      : l10n.deleteWirelessKeypad,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                onTap: busy ? null : () => _unbind(context, ref, state),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _rename(
    BuildContext context,
    WidgetRef ref,
    KeypadDetailState state,
  ) async {
    final name = await KeypadRenameSheetRoute(
      $extra: KeypadRenameArgs(
        wirelessKeypadId: state.keypad.wirelessKeypadId,
        initialName: state.keypad.wirelessKeypadName,
      ),
    ).push<String>(context);
    if (name == null || !context.mounted) return;
    await ref.read(keypadDetailProvider(args).notifier).rename(name);
  }

  Future<void> _unbind(
    BuildContext context,
    WidgetRef ref,
    KeypadDetailState state,
  ) async {
    final ok = await KeypadUnbindConfirmRoute(
      $extra: KeypadUnbindArgs(
        wirelessKeypadId: state.keypad.wirelessKeypadId,
        isMultifunctionalKeypad: state.keypad.isMultifunctionalKeypad,
      ),
    ).push<bool>(context);
    if (ok != true || !context.mounted) return;
    final done = await ref.read(keypadDetailProvider(args).notifier).unbind();
    if (done && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }

  /// 只重发云端解绑。成功即「本锁与该键盘已彻底解绑」，与 [_unbind] 一样关页——
  /// 否则会留下一个仍然显示「已绑定」的页面，以及一条会把 BLE 清槽重跑一遍的
  /// 解除绑定入口（对已经空掉的槽位再清一次，正是设计要避开的）。
  Future<void> _retryCloudSync(BuildContext context, WidgetRef ref) async {
    final done = await ref
        .read(keypadDetailProvider(args).notifier)
        .retryCloudSync();
    if (done && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _checkUpgrade(BuildContext context, WidgetRef ref) async {
    final l10n = ref.read(l10nProvider);
    final check = await ref
        .read(keypadDetailProvider(args).notifier)
        .checkUpgrade();
    if (!context.mounted || check == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          check.needUpgrade
              ? '${l10n.upgradeAvailable} ${check.version}'
              : l10n.upgradeNone,
        ),
      ),
    );
  }
}
