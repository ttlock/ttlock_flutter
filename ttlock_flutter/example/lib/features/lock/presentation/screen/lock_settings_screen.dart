import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/door_sensor_args.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_settings_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_nb_register_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_open_direction_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_sound_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_latch_bolt_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 设置页：能力位、初值探测与全部 domain 写操作统一由 [LockSettingsNotifier]
/// 负责，界面只读 `supportedFunctions` 判断显示、用 state 填充开关，
/// 并把 Notifier 返回的结果转成提示 / 跳转。
class LockSettingsScreen extends HookConsumerWidget {
  const LockSettingsScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = lockSettingsProvider(lockId, lock);
    final stateAsync = ref.watch(provider);
    final fallbackLock = lock ?? LockEntity(lockId: lockId);

    /// 与 withRouteBackGuard 的 PopScope 叠加：先拦住系统/AppBar 返回，再带出本地 Entity。
    final allowPop = useState(false);
    final popResult = useState<Object?>(null);

    void popWith(Object? result) {
      popResult.value = result;
      if (allowPop.value) {
        Navigator.of(context).pop(result);
        return;
      }
      allowPop.value = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) Navigator.of(context).pop(popResult.value);
      });
    }

    return PopScope(
      canPop: allowPop.value,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        popWith(result == true ? true : stateAsync.value?.lock ?? fallbackLock);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.settings)),
        body: stateAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('$e')),
          data: (data) {
            final lock = data.lock ?? fallbackLock;
            final supported = data.supportedFunctions;
            final canBle = lock.lockData.isNotEmpty;
            final settingsNotifier = ref.read(provider.notifier);

            /// 统一提示：Notifier 已发起请求并写回 state，这里只把结果转成 SnackBar。
            Future<void> run(
              Future<Either<AppException, dynamic>> Function() action,
            ) async {
              final r = await action();
              if (!context.mounted) return;
              r.fold(
                (err) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
                ),
                (_) {},
              );
            }

            Widget maybeCapability({
              required TTLockFunction function,
              bool showWhenSupport = true,
              required Widget Function() child,

              /// 空 lockData 只藏需 BLE 的项；仅远程项（工作模式/非法尝试）传 false。
              bool requireLockData = true,
            }) {
              if (requireLockData && !canBle) return const SizedBox.shrink();
              // 仅远程项且无 lockData：无法 probe 能力位，仍展示（写权限由子页 hasGateway 控制）。
              if (!requireLockData && !canBle) return child();
              return supported.contains(function) && showWhenSupport
                  ? child()
                  : const SizedBox.shrink();
            }

            Widget anyCapability({
              required List<TTLockFunction> functions,
              required Widget Function() child,
            }) {
              if (!canBle) return const SizedBox.shrink();
              if (functions.any(supported.contains)) return child();
              return const SizedBox.shrink();
            }

            Widget soundEntry() {
              if (!supported.contains(TTLockFunction.audioSwitch)) {
                return const SizedBox.shrink();
              }
              // 音量和语言设置 → 打开音量 sheet；否则走纯声音开关。
              if (supported.contains(
                TTLockFunction.soundVolumeAndLanguageSetting,
              )) {
                return ListTile(
                  key: const Key('settings_sound'),
                  leading: const Icon(Icons.volume_up_outlined),
                  title: Text(l10n.sound),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        data.soundOn
                            ? switch (data.soundVolume) {
                                1 => l10n.low,
                                2 => l10n.medium,
                                3 => l10n.high,
                                4 => l10n.veryHigh,
                                5 => l10n.extreme,
                                _ => l10n.medium,
                              }
                            : l10n.off,
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () async {
                    final r = await LockSoundSheetRoute(
                      $extra: lock,
                    ).push<LockSoundSheetResult>(context);
                    if (r != null && context.mounted) {
                      await run(
                        () => settingsNotifier.setSoundVolume(
                          on: r.on,
                          level: r.level,
                        ),
                      );
                    }
                  },
                );
              }
              return _BoolSettingTile(
                key: ValueKey('sound_${lock.lockData}'),
                tileKey: const Key('settings_sound'),
                title: l10n.sound,
                icon: Icons.volume_up_outlined,
                value: data.soundOn,
                commit: (on) => settingsNotifier.setSound(on: on),
              );
            }

            return ListView(
              children: [
                if (!canBle) ...[
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: ListTile(
                      key: const Key('incomplete_lock_data'),
                      leading: const Icon(Icons.info_outline),
                      title: Text(l10n.incompleteLockData),
                    ),
                  ),
                ],
                soundEntry(),
                maybeCapability(
                  function: TTLockFunction.privacyLock,
                  child: () => _BoolSettingTile(
                    key: ValueKey('privacy_${lock.lockData}'),
                    tileKey: const Key('settings_privacy_lock'),
                    title: l10n.privacyLock,
                    icon: Icons.lock_outline,
                    value: data.privacyLockOn,
                    commit: (on) => settingsNotifier.setPrivacyLock(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.tamperAlert,
                  child: () => _BoolSettingTile(
                    key: ValueKey('tamper_${lock.lockData}'),
                    tileKey: const Key('settings_tamper_alert'),
                    title: l10n.tamperAlert,
                    icon: Icons.security,
                    value: data.tamperAlertOn,
                    commit: (on) => settingsNotifier.setTamperAlert(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.resetButton,
                  child: () => _BoolSettingTile(
                    key: ValueKey('reset_${lock.lockData}'),
                    tileKey: const Key('settings_reset_button'),
                    title: l10n.resetButton,
                    icon: Icons.restart_alt,
                    value: data.resetButtonOn,
                    commit: (on) => settingsNotifier.setResetButton(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.unlockSwitch,
                  child: () => _BoolSettingTile(
                    key: ValueKey('remote_${lock.lockData}'),
                    tileKey: const Key('settings_remote_unlock'),
                    title: l10n.remoteUnlock,
                    icon: Icons.settings_remote_outlined,
                    value: data.remoteUnlockOn,
                    commit: (on) => settingsNotifier.setRemoteUnlock(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.doubleAuth,
                  child: () => _BoolSettingTile(
                    key: ValueKey('double_${lock.lockData}'),
                    tileKey: const Key('settings_double_auth'),
                    title: l10n.doubleAuth,
                    icon: Icons.verified_user_outlined,
                    value: data.doubleAuthOn,
                    commit: (on) => settingsNotifier.setDoubleAuth(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.unlockDirection,
                  child: () => ListTile(
                    key: const Key('settings_open_direction'),
                    leading: const Icon(Icons.swap_horiz),
                    title: Text(l10n.openDirection),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final d = await LockOpenDirectionSheetRoute(
                        $extra: LockOpenDirectionArgs(
                          lock: lock,
                          openDirection: data.openDirection,
                        ),
                      ).push<TTLockDirection>(context);
                      if (d != null && context.mounted) {
                        await run(() => settingsNotifier.setOpenDirection(d));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.autoLock,
                  child: () => ListTile(
                    key: const Key('settings_auto_lock'),
                    leading: const Icon(Icons.timer_outlined),
                    title: Text(l10n.autoLockTime),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        Text(
                          (data.autoLockingTime?.currentTime ?? 0) == 0
                              ? l10n.autoLockOff
                              : '${data.autoLockingTime?.currentTime ?? 0}${l10n.secondsUnit}',
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () async {
                      final r = await LockAutoLockTimeSheetRoute(
                        $extra: data.autoLockingTime,
                      ).push<int>(context);
                      if (r != null && context.mounted) {
                        await run(() => settingsNotifier.setAutoLockTime(r));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.passageMode,
                  child: () => ListTile(
                    key: const Key('settings_passage_mode'),
                    leading: const Icon(Icons.door_sliding_outlined),
                    title: Text(l10n.passageMode),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final cfg = await LockPassageModeSheetRoute(
                        $extra: lock,
                      ).push<PassageModeConfigEntity>(context);
                      if (cfg != null && context.mounted) {
                        await run(() => settingsNotifier.setPassageMode(cfg));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.sensitivity,
                  child: () => ListTile(
                    key: const Key('settings_sensitivity'),
                    leading: const Icon(Icons.vibration),
                    title: Text(l10n.sensitivity),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final v = await LockSensitivitySheetRoute(
                        $extra: lock,
                      ).push<TTSensitivityValue>(context);
                      if (v != null && context.mounted) {
                        await run(() => settingsNotifier.setSensitivity(v));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.light,
                  child: () => ListTile(
                    key: const Key('settings_light_time'),
                    leading: const Icon(Icons.lightbulb_outline),
                    title: Text(l10n.lightTime),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final s = await LockLightTimeSheetRoute(
                        $extra: lock,
                      ).push<int>(context);
                      if (s != null && context.mounted) {
                        await run(() => settingsNotifier.setLightTime(s));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.bluetoothAdvertisingSetting,
                  child: () => ListTile(
                    key: const Key('settings_ble_adv_interval'),
                    leading: const Icon(Icons.bluetooth_searching_outlined),
                    title: Text(l10n.bluetoothAdvertisingInterval),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => LockBluetoothAdvertisingIntervalRoute(
                      lockId: lockId,
                      $extra: lock,
                    ).push(context),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.motorTorque,
                  child: () => ListTile(
                    key: const Key('settings_motor_torque'),
                    leading: const Icon(Icons.settings_suggest_outlined),
                    title: Text(l10n.motorTorque),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final level = await const LockMotorTorqueSheetRoute()
                          .push<int>(context);
                      if (level != null && context.mounted) {
                        await run(
                          () => settingsNotifier.setMotorTorqueLevel(level),
                        );
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.controlLatchBolt,
                  child: () => ListTile(
                    key: const Key('settings_latch_bolt'),
                    leading: const Icon(Icons.lock_clock_outlined),
                    title: Text(l10n.latchBolt),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final result = await const LockLatchBoltSheetRoute()
                          .push<LockLatchBoltResult>(context);
                      if (result != null && context.mounted) {
                        await run(
                          () => settingsNotifier.setLockLatchBolt(
                            driveLevel: result.driveLevel,
                            keepTimeSeconds: result.keepTime,
                          ),
                        );
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.getAdminPasscode,
                  child: () => ListTile(
                    key: const Key('settings_admin_passcode'),
                    leading: const Icon(Icons.password_outlined),
                    title: Text(l10n.adminPasscode),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => LockAdminPasscodeRoute(
                      lockId: lockId,
                      $extra: lock,
                    ).push(context),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.wifiLock,
                  child: () => ListTile(
                    key: const Key('settings_wifi'),
                    leading: const Icon(Icons.wifi),
                    title: Text(l10n.wifiConfig),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => LockWifiRoute(
                      lockId: lockId,
                      $extra: lock,
                    ).push(context),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.hideWifiCatOneSleepModeSetting,
                  showWhenSupport: false,
                  child: () => _BoolSettingTile(
                    key: ValueKey('wifi_ps_${lock.lockData}'),
                    tileKey: const Key('settings_wifi_power_saving'),
                    title: l10n.wifiPowerSaving,
                    icon: Icons.battery_saver_outlined,
                    value: data.wifiPowerSavingOn,
                    commit: (on) => settingsNotifier.setWifiPowerSaving(on: on),
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.workingMode,
                  requireLockData: false,
                  child: () => ListTile(
                    key: const Key('settings_working_mode'),
                    leading: const Icon(Icons.work_history_outlined),
                    title: Text(l10n.workingMode),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final mode = await LockWorkingModeSheetRoute(
                        $extra: lock,
                      ).push<WorkingModeEntity>(context);
                      if (mode != null && context.mounted) {
                        await run(() => settingsNotifier.setWorkingMode(mode));
                      }
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.unauthorizedAttemptAlarm,
                  requireLockData: false,
                  child: () => ListTile(
                    key: const Key('settings_unauthorized_attempt'),
                    leading: const Icon(Icons.warning_amber_outlined),
                    title: Text(l10n.unauthorizedAttempt),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final extra = await LockUnauthorizedAttemptSheetRoute(
                        $extra: lock,
                      ).push<ExtraSettingEntity>(context);
                      if (extra != null && context.mounted) {
                        await run(
                          () => settingsNotifier.setUnauthorizedAttempt(extra),
                        );
                      }
                    },
                  ),
                ),
                const Divider(key: Key('settings_accessories_divider')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text(
                    l10n.accessories,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.remoteKey,
                  child: () => ListTile(
                    key: const Key('entry_accessory_remote'),
                    leading: const Icon(Icons.settings_remote_outlined),
                    title: Text(l10n.remote),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => RemoteListRoute(
                      lockId: lockId,
                      $extra: lock,
                    ).push(context),
                  ),
                ),
                anyCapability(
                  functions: const [
                    TTLockFunction.wirelessKeypad,
                    TTLockFunction.multiFunctionKeypad,
                  ],
                  child: () => ListTile(
                    key: const Key('entry_accessory_keypad'),
                    leading: const Icon(Icons.keyboard_alt_outlined),
                    title: Text(l10n.wirelessKeypad),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      WirelessKeypadListRoute(
                        lockId: lockId,
                        $extra: lock,
                      ).push(context);
                    },
                  ),
                ),
                maybeCapability(
                  function: TTLockFunction.doorSensor,
                  child: () {
                    final bound = data.doorSensor;
                    final subtitle = bound == null
                        ? l10n.doorSensorUnbound
                        : (bound.name.isNotEmpty
                              ? '${bound.name} · ${bound.electricQuantity}%'
                              : '${bound.mac} · ${bound.electricQuantity}%');
                    return ListTile(
                      key: const Key('entry_accessory_door_sensor'),
                      leading: const Icon(Icons.sensors_outlined),
                      title: Text(l10n.doorSensor),
                      subtitle: Text(subtitle),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        if (bound == null) {
                          await DoorSensorAddRoute($extra: lock).push(context);
                        } else {
                          await DoorSensorDetailRoute(
                            $extra: DoorSensorDetailArgs(
                              lock: lock,
                              item: bound,
                            ),
                          ).push(context);
                        }
                        if (context.mounted) {
                          settingsNotifier.refreshDoorSensor();
                        }
                      },
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  key: const Key('settings_lock_info'),
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.lockInfo),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final updated = await LockInfoRoute(
                      lockId: lockId,
                      $extra: lock,
                    ).push<LockEntity>(context);
                    if (updated != null && context.mounted) {
                      await settingsNotifier.applyLock(updated);
                    }
                  },
                ),
                ListTile(
                  key: const Key('settings_sync_from_lock'),
                  enabled: canBle,
                  leading: const Icon(Icons.sync_alt),
                  title: Text(l10n.syncSettingsFromLock),
                  onTap: !canBle
                      ? null
                      : () => run(settingsNotifier.syncFromLock),
                ),
                ListTile(
                  key: const Key('settings_lock_time'),
                  enabled: canBle,
                  leading: const Icon(Icons.schedule),
                  title: Text(l10n.lockTime),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: !canBle
                      ? null
                      : () => LockTimeRoute(
                          lockId: lockId,
                          $extra: lock,
                        ).push(context),
                ),
                ListTile(
                  key: const Key('settings_check_upgrade'),
                  leading: const Icon(Icons.system_update_alt),
                  title: Text(l10n.checkUpgrade),
                  onTap: () async {
                    final r = await settingsNotifier.checkUpgrade();
                    if (!context.mounted) return;
                    r.fold(
                      (err) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(getUserFriendlyMessage(err, l10n)),
                        ),
                      ),
                      (up) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            up.needUpgrade == 1
                                ? '${l10n.upgradeAvailable} ${up.version}'
                                : l10n.upgradeNone,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                maybeCapability(
                  function: TTLockFunction.nbIoT,
                  child: () => ListTile(
                    key: const Key('settings_nb_register'),
                    leading: const Icon(Icons.sim_card_outlined),
                    title: Text(l10n.nbRegister),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final input = await LockNbRegisterSheetRoute(
                        $extra: lock,
                      ).push<RegisterNbInput>(context);
                      if (input != null) {
                        await run(
                          () => settingsNotifier.registerNb(
                            nbNodeId: input.nbNodeId,
                            nbCardNumber: input.nbCardNumber,
                            nbOperator: input.nbOperator,
                            nbRssi: input.nbRssi,
                          ),
                        );
                      }
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  key: const Key('settings_change_group'),
                  leading: const Icon(Icons.folder_outlined),
                  title: Text(l10n.changeGroup),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(lock.groupId == 0 ? l10n.noGroup : lock.groupName),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () async {
                    final group = await LockGroupPickerSheetRoute(
                      groupId: lock.groupId,
                    ).push<GroupEntity>(context);
                    if (group != null) {
                      await run(() => settingsNotifier.changeGroup(group));
                    }
                  },
                ),
                ListTile(
                  key: const Key('settings_rename'),
                  leading: const Icon(Icons.drive_file_rename_outline),
                  title: Text(l10n.rename),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final alias = await LockRenameSheetRoute(
                      $extra: lock,
                    ).push<String>(context);
                    if (alias != null && alias.isNotEmpty) {
                      await run(() => settingsNotifier.renameLock(alias));
                    }
                  },
                ),
                ListTile(
                  key: const Key('settings_transfer'),
                  leading: const Icon(Icons.forward_outlined),
                  title: Text(l10n.transfer),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final username = await LockTransferSheetRoute(
                      $extra: lock,
                    ).push<String>(context);
                    if (username != null && username.isNotEmpty) {
                      await run(() => settingsNotifier.transferLock(username));
                    }
                  },
                ),
                ListTile(
                  key: const Key('settings_delete'),
                  enabled: canBle,
                  leading: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  title: Text(
                    l10n.deleteLock,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onTap: !canBle
                      ? null
                      : () async {
                          final ok = await LockDeleteConfirmSheetRoute(
                            $extra: lock,
                          ).push<bool>(context);
                          if (ok != true || !context.mounted) return;
                          final r = await settingsNotifier.deleteLock();
                          if (!context.mounted) return;
                          r.fold(
                            (err) => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getUserFriendlyMessage(err, l10n),
                                ),
                              ),
                            ),
                            (_) => popWith(true),
                          );
                        },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BoolSettingTile extends ConsumerStatefulWidget {
  const _BoolSettingTile({
    super.key,
    required this.tileKey,
    required this.title,
    required this.icon,
    required this.value,
    required this.commit,
  });

  final Key tileKey;
  final String title;
  final IconData icon;

  /// provider 统一读到的初值（不支持/失败已默认关）。
  final bool value;

  /// Notifier 写操作：内部发起 domain 请求并写回 state，此处只消费结果。
  final Future<Either<AppException, dynamic>> Function(bool on) commit;

  @override
  ConsumerState<_BoolSettingTile> createState() => _BoolSettingTileState();
}

class _BoolSettingTileState extends ConsumerState<_BoolSettingTile> {
  late bool _on = widget.value;

  @override
  void didUpdateWidget(_BoolSettingTile old) {
    super.didUpdateWidget(old);
    // lockData 变化后 provider 重读初值 → 同步本地开关。
    if (old.value != widget.value) _on = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      key: widget.tileKey,
      secondary: Icon(widget.icon),
      title: Text(widget.title),
      value: _on,
      onChanged: (v) async {
        final r = await widget.commit(v);
        if (!mounted) return;
        r.fold((err) {
          final l10n = ref.read(l10nProvider);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
          );
        }, (_) => setState(() => _on = v));
      },
    );
  }
}
