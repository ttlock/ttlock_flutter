import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/storage/lock_list_provider.dart';
import 'widgets/accessory_entry_section.dart';
import 'widgets/command_dialog.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/error_display.dart';
import '../../providers/ttlock_providers.dart';
import 'lock_provider.dart';
import 'model/lock_state.dart' as lock_model;

class LockCommand {
  final String label;
  final IconData icon;
  final CommandParamType? paramType;
  final Future<void> Function(String lockData, TTLockApi api) execute;

  const LockCommand({
    required this.label,
    required this.icon,
    required this.execute,
    this.paramType,
  });
}

final List<Map<String, dynamic>> commandGroups = [
  {
    'title': 'Control',
    'icon': Icons.play_circle_outline,
    'commands': [
      LockCommand(label: 'Unlock', icon: Icons.lock_open, execute: (d, api) async {
        await api.controlLock(d, TTControlAction.unlock);
      }),
      LockCommand(label: 'Lock', icon: Icons.lock, execute: (d, api) async {
        await api.controlLock(d, TTControlAction.lock);
      }),
      LockCommand(label: 'Get Switch State', icon: Icons.toggle_on_outlined, execute: (d, api) async {
        await api.getLockSwitchState(d);
      }),
      LockCommand(label: 'Get Power', icon: Icons.battery_std, execute: (d, api) async {
        await api.getLockPower(d);
      }),
      LockCommand(label: 'Set Time', icon: Icons.schedule, execute: (d, api) async {
        await api.setLockTime(DateTime.now().millisecondsSinceEpoch ~/ 1000, d);
      }),
      LockCommand(label: 'Get Time', icon: Icons.access_time, execute: (d, api) async {
        await api.getLockTime(d);
      }),
      LockCommand(label: 'Get Operate Record', icon: Icons.history, execute: (d, api) async {
        await api.getLockOperateRecord(TTOperateRecordType.total, d);
      }),
    ],
  },
  {
    'title': 'Passcode',
    'icon': Icons.pin,
    'commands': [
      LockCommand(
        label: 'Create Custom Passcode',
        icon: Icons.add,
        paramType: CommandParamType.passcode,
        execute: (d, api) async {
          await api.createCustomPasscode('123456', 0, 0, d);
        },
      ),
      LockCommand(label: 'Get All Passcodes', icon: Icons.list, execute: (d, api) async {
        await api.getAllValidPasscodes(d);
      }),
      LockCommand(label: 'Get Admin Passcode', icon: Icons.admin_panel_settings, execute: (d, api) async {
        await api.getAdminPasscode(d);
      }),
      LockCommand(label: 'Modify Admin Passcode', icon: Icons.edit, execute: (d, api) async {
        await api.modifyAdminPasscode('123456', d);
      }),
      LockCommand(label: 'Modify Passcode', icon: Icons.edit_note, execute: (d, api) async {
        await api.modifyPasscode('123456', '654321', 0, 0, d);
      }),
      LockCommand(label: 'Delete Passcode', icon: Icons.delete, execute: (d, api) async {
        await api.deletePasscode('123456', d);
      }),
      LockCommand(label: 'Reset Passcode', icon: Icons.restart_alt, execute: (d, api) async {
        await api.resetPasscode(d);
      }),
      LockCommand(label: 'Set Erase Passcode', icon: Icons.lock_reset, execute: (d, api) async {
        await api.setErasePasscode('999999', d);
      }),
    ],
  },
  {
    'title': 'Card',
    'icon': Icons.credit_card,
    'commands': [
      LockCommand(label: 'Get All Cards', icon: Icons.list, execute: (d, api) async {
        await api.getAllValidCards(d);
      }),
      LockCommand(label: 'Clear All Cards', icon: Icons.delete_sweep, execute: (d, api) async {
        await api.clearAllCards(d);
      }),
    ],
  },
  {
    'title': 'Fingerprint',
    'icon': Icons.fingerprint,
    'commands': [
      LockCommand(label: 'Get All Fingerprints', icon: Icons.list, execute: (d, api) async {
        await api.getAllValidFingerprints(d);
      }),
      LockCommand(label: 'Clear All Fingerprints', icon: Icons.delete_sweep, execute: (d, api) async {
        await api.clearAllFingerprints(d);
      }),
    ],
  },
  {
    'title': 'Face',
    'icon': Icons.face,
    'commands': [
      LockCommand(label: 'Clear Face', icon: Icons.delete, execute: (d, api) async {
        await api.clearFace(d);
      }),
    ],
  },
  {
    'title': 'Config',
    'icon': Icons.tune,
    'commands': [
      LockCommand(label: 'Get Auto Lock Time', icon: Icons.timer, execute: (d, api) async {
        await api.getAutoLockingPeriodicTime(d);
      }),
      LockCommand(
        label: 'Set Auto Lock Time',
        icon: Icons.timer_off,
        paramType: CommandParamType.autoLockSeconds,
        execute: (d, api) async {
          await api.setAutoLockingPeriodicTime(10, d);
        },
      ),
      LockCommand(label: 'Get Remote Unlock State', icon: Icons.wifi_tethering, execute: (d, api) async {
        await api.getRemoteUnlockSwitchState(d);
      }),
      LockCommand(label: 'Set Remote Unlock ON', icon: Icons.wifi_tethering, execute: (d, api) async {
        await api.setRemoteUnlockSwitchState(true, d);
      }),
      LockCommand(label: 'Get Audio State', icon: Icons.volume_up, execute: (d, api) async {
        await api.getLockConfig(TTLockConfig.audio, d);
      }),
      LockCommand(label: 'Set Audio ON', icon: Icons.volume_up, execute: (d, api) async {
        await api.setLockConfig(TTLockConfig.audio, true, d);
      }),
      LockCommand(label: 'Get Direction', icon: Icons.swap_horiz, execute: (d, api) async {
        await api.getLockDirection(d);
      }),
      LockCommand(label: 'Set Direction Left', icon: Icons.arrow_left, execute: (d, api) async {
        await api.setLockDirection(TTLockDirection.left, d);
      }),
      LockCommand(label: 'Get Sound Volume', icon: Icons.speaker, execute: (d, api) async {
        await api.getSoundVolume(d);
      }),
      LockCommand(label: 'Set Sound Volume High', icon: Icons.speaker, execute: (d, api) async {
        await api.setSoundVolume(TTSoundVolumeType.fifthLevel, d);
      }),
      LockCommand(label: 'Get Sensitivity', icon: Icons.sensors, execute: (d, api) async {
        await api.setSensitivity(TTSensitivityValue.medium, d);
      }),
    ],
  },
  {
    'title': 'System',
    'icon': Icons.info_outline,
    'commands': [
      LockCommand(label: 'Get System Info', icon: Icons.info, execute: (d, api) async {
        await api.getLockSystemInfo(d);
      }),
      LockCommand(label: 'Get Feature Value', icon: Icons.code, execute: (d, api) async {
        await api.getLockFeatureValue(d);
      }),
      LockCommand(label: 'Reset Lock', icon: Icons.restart_alt, execute: (d, api) async {
        await api.resetLock(d);
      }),
      LockCommand(label: 'Reset Ekey', icon: Icons.key_off, execute: (d, api) async {
        await api.resetEkey(d);
      }),
    ],
  },
  {
    'title': 'Network',
    'icon': Icons.wifi,
    'commands': [
      LockCommand(
        label: 'Config WiFi',
        icon: Icons.wifi,
        paramType: CommandParamType.wifi,
        execute: (d, api) async {
          await api.configWifi('MyWiFi', 'password', d);
        },
      ),
      LockCommand(label: 'Get WiFi Info', icon: Icons.wifi_find, execute: (d, api) async {
        await api.getWifiInfo(d);
      }),
      LockCommand(
        label: 'Config Server',
        icon: Icons.dns,
        paramType: CommandParamType.server,
        execute: (d, api) async {
          await api.configServer('192.168.1.100', '2229', d);
        },
      ),
    ],
  },
  {
    'title': 'Advanced',
    'icon': Icons.build,
    'commands': [
      LockCommand(label: 'Add Passage Mode', icon: Icons.door_sliding, execute: (d, api) async {
        await api.addPassageMode(TTPassageModeType.weekly, [1, 2, 3, 4, 5], null, 480, 1080, d);
      }),
      LockCommand(label: 'Clear Passage Modes', icon: Icons.door_sliding, execute: (d, api) async {
        await api.clearAllPassageModes(d);
      }),
      LockCommand(label: 'Activate Lift', icon: Icons.elevator, execute: (d, api) async {
        await api.activateLift('1-10', d);
      }),
      LockCommand(label: 'Config IP (DHCP)', icon: Icons.settings_ethernet, execute: (d, api) async {
        await api.configIp(TTIpSetting(type: 0), d);
      }),
    ],
  },
];

class LockPage extends ConsumerStatefulWidget {
  final String mac;

  const LockPage({super.key, required this.mac});

  @override
  ConsumerState<LockPage> createState() => _LockPageState();
}

class _LockPageState extends ConsumerState<LockPage> {
  @override
  void initState() {
    super.initState();
    // Cannot modify providers during initState (Riverpod invariant).
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final device = await ref.read(lockByMacProvider(widget.mac).future);
      if (device != null) {
        ref
            .read(lockNotifierProvider.notifier)
            .setContext(device.lockData, lockMac: device.mac, lockName: device.name);
      }
    });
  }

  Future<void> _executeCommand(LockCommand cmd) async {
    final lockState = ref.read(lockNotifierProvider);
    if (lockState.lockData == null) return;

    final api = ref.read(lockApiProvider);
    try {
      if (cmd.paramType != null) {
        final params = await CommandDialog.show(
          context,
          title: cmd.label,
          type: cmd.paramType!,
        );
        if (params == null || !mounted) return;
        context.loaderOverlay.show();
        await _runWithParams(cmd, lockState.lockData!, api, params);
      } else {
        context.loaderOverlay.show();
        await cmd.execute(lockState.lockData!, api);
      }
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text('${cmd.label}: success'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text('${cmd.label}: $e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  Future<void> _runWithParams(
    LockCommand cmd,
    String lockData,
    TTLockApi api,
    Map<String, dynamic> params,
  ) async {
    switch (cmd.paramType) {
      case CommandParamType.passcode:
        await api.createCustomPasscode(
          params['passcode'] as String,
          params['startDate'] as int,
          params['endDate'] as int,
          lockData,
        );
      case CommandParamType.autoLockSeconds:
        await api.setAutoLockingPeriodicTime(params['seconds'] as int, lockData);
      case CommandParamType.wifi:
        await api.configWifi(
          params['ssid'] as String,
          params['password'] as String,
          lockData,
        );
      case CommandParamType.server:
        await api.configServer(
          params['ip'] as String,
          params['port'] as String,
          lockData,
        );
      default:
        await cmd.execute(lockData, api);
    }
  }

  Future<void> _quickControl(TTControlAction action) async {
    final lockState = ref.read(lockNotifierProvider);
    if (lockState.lockData == null) return;
    final api = ref.read(lockApiProvider);
    try {
      context.loaderOverlay.show();
      await api.controlLock(lockState.lockData!, action);
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text(action == TTControlAction.unlock ? 'Unlocked' : 'Locked'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text('$e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lockState = ref.watch(lockNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(lockState.lockName ?? 'Lock Control')),
      body: lockState.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              children: [
                if (lockState.lockData != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () =>
                                _quickControl(TTControlAction.unlock),
                            icon: const Icon(Icons.lock_open),
                            label: const Text('Unlock'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () =>
                                _quickControl(TTControlAction.lock),
                            icon: const Icon(Icons.lock),
                            label: const Text('Lock'),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.onSurfaceSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Connected',
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: AppColors.success)),
                          const SizedBox(height: 4),
                          Text('lockMac: ${lockState.lockMac!}',
                              style: AppTextStyles.codeMedium),
                        ],
                      ),
                    ),
                  ),
                ],
                if (lockState.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ErrorDisplay(message: lockState.errorMessage),
                  ),
                ...commandGroups.map((group) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: group['title'] as String,
                      icon: group['icon'] as IconData,
                    ),
                    ...(group['commands'] as List<LockCommand>).map((cmd) => Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      child: ListTile(
                        leading: Icon(cmd.icon, color: AppColors.primary),
                        title: Text(cmd.label, style: AppTextStyles.bodyMedium),
                        trailing: const Icon(Icons.chevron_right, size: 18),
                        onTap: () => _executeCommand(cmd),
                        dense: true,
                      ),
                    )),
                  ],
                )),
                AccessoryEntrySection(lockMac: widget.mac),
                const SectionHeader(title: 'Lock Config', icon: Icons.tune),
                ..._configTiles(lockState),
              ],
            ),
    );
  }

  List<Widget> _configTiles(lock_model.LockState lockState) {
    if (lockState.lockData == null) return [];
    final d = lockState.lockData!;
    final api = ref.read(lockApiProvider);
    return [
      _configTile('Audio ON', Icons.volume_up, () async {
        await api.setLockConfig(TTLockConfig.audio, true, d);
      }),
      _configTile('Volume High', Icons.speaker, () async {
        await api.setSoundVolume(TTSoundVolumeType.fifthLevel, d);
      }),
      _configTile('Direction Left', Icons.arrow_left, () async {
        await api.setLockDirection(TTLockDirection.left, d);
      }),
      _configTile('Remote Unlock ON', Icons.wifi_tethering, () async {
        await api.setRemoteUnlockSwitchState(true, d);
      }),
      _configTile('Config WiFi', Icons.wifi, () async {
        final params = await CommandDialog.show(
          context,
          title: 'Config WiFi',
          type: CommandParamType.wifi,
        );
        if (params != null) {
          await api.configWifi(
            params['ssid'] as String,
            params['password'] as String,
            d,
          );
        }
      }),
      _configTile('Reset Lock', Icons.restart_alt, () async {
        await api.resetLock(d);
      }),
    ];
  }

  Widget _configTile(String label, IconData icon, Future<void> Function() fn) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label, style: AppTextStyles.bodyMedium),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: () async {
          try {
            context.loaderOverlay.show();
            await fn();
            if (mounted) {
              context.loaderOverlay.hide();
              toastification.show(
                title: Text('$label: success'),
                type: ToastificationType.success,
                autoCloseDuration: const Duration(seconds: 2),
              );
            }
          } catch (e) {
            if (mounted) {
              context.loaderOverlay.hide();
              toastification.show(
                title: Text('$label: $e'),
                type: ToastificationType.error,
                autoCloseDuration: const Duration(seconds: 3),
              );
            }
          }
        },
        dense: true,
      ),
    );
  }
}
