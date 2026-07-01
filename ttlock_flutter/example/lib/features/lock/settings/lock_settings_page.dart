import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../command/lock_commands.dart';
import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/section_header.dart';
import '../../../providers/ttlock_providers.dart';
import '../../lock/capabilities/lock_capabilities_provider.dart';
import 'lock_settings_provider.dart';
import 'widgets/preset_seconds_sheet.dart';
import 'widgets/settings_switch_tile.dart';

class LockSettingsPage extends ConsumerWidget {
  const LockSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  // ── Helper widgets ──

  Widget menuTile({
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget settingsSwitch({
    required Set<TTLockFunction> caps,
    required LockCommand command,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    if (!command.isVisibleFor(caps)) return const SizedBox.shrink();
    return SettingsSwitchTile(
      title: title,
      value: value,
      onChanged: onChanged,
    );
  }

  Widget dangerTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppColors.error)),
      onTap: onTap,
    );
  }

  // ── Danger zone actions ──

  Future<void> _resetLock(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset lock?'),
        content: const Text('This will reset the lock on the device.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await ref.read(lockApiProvider).resetLock(lock.lockData);
    await ref.read(lockListNotifierProvider.notifier).removeDevice(lockMac);
    if (context.mounted) context.go('/');
  }

  Future<void> _resetEkey(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset ekey?'),
        content: const Text('The ekey on the lock will be reset.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final newData = await ref.read(lockApiProvider).resetEkey(lock.lockData);
    await ref
        .read(lockListNotifierProvider.notifier)
        .updateDevice(lock.copyWith(lockData: newData));
  }

  Future<void> _removeFromApp(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove from app?'),
        content: const Text(
          'Local data will be deleted. The lock on device is not affected.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await ref.read(lockListNotifierProvider.notifier).removeDevice(lockMac);
    if (context.mounted) context.go('/');
  }

  // ── Build ──

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final settingsAsync = ref.watch(lockSettingsProvider(lockMac));
    final capsAsync = ref.watch(lockCapabilitiesProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text('${l?.name ?? 'Lock'} Settings'),
          loading: () => const Text('Lock Settings'),
          error: (_, __) => const Text('Lock Settings'),
        ),
      ),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (s) {
          final caps = capsAsync.valueOrNull ?? {};

          return ListView(
            children: [
              // ── General ──
              const SectionHeader(title: 'General', icon: Icons.info_outline),
              menuTile(
                title: 'Basic Info',
                onTap: () => LockBasicInfoRoute(lockMac).push(context),
              ),
              if (LockCommand.configWifi.isVisibleFor(caps))
                menuTile(
                  title: 'Network',
                  onTap: () => LockNetworkSettingsRoute(lockMac).push(context),
                ),
              if (LockCommand.addPassageMode.isVisibleFor(caps))
                menuTile(
                  title: 'Passage Mode',
                  onTap: () => LockPassageModeRoute(lockMac).push(context),
                ),
              menuTile(
                title: 'Advanced',
                onTap: () => LockAdvancedSettingsRoute(lockMac).push(context),
              ),

              // ── Security & Switches ──
              const SectionHeader(
                title: 'Security & Switches',
                icon: Icons.security,
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.audioSwitch,
                title: 'Audio',
                value: s.audio,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.audio, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.tamperAlertSwitch,
                title: 'Tamper Alert',
                value: s.tamperAlert,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.tamperAlert, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.doubleAuthSwitch,
                title: 'Double Authentication',
                value: s.doubleAuth,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.doubleAuth, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.privacyLockSwitch,
                title: 'Privacy Lock',
                value: s.privacyLock,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.privacyLock, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.remoteUnlockSwitch,
                title: 'Remote Unlock',
                value: s.remoteUnlock,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setRemoteUnlock(v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.lockFreezeSwitch,
                title: 'Freeze',
                value: s.freeze,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.freeze, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.passageModeAutoUnlock,
                title: 'Passage Auto Unlock',
                value: s.passageModeAutoUnlock,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.passageModeAutoUnlock, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.publicModeSwitch,
                title: 'Public Mode',
                value: s.publicMode,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.publicMode, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.lowBatteryAutoUnlockSwitch,
                title: 'Low Battery Auto Unlock',
                value: s.lowBatteryAutoUnlock,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.lowBatteryAutoUnlock, v),
              ),
              settingsSwitch(
                caps: caps,
                command: LockCommand.semiAutomaticMode,
                title: 'Semi-Automatic Mode',
                value: false,
                onChanged: (v) => ref
                    .read(lockSettingsProvider(lockMac).notifier)
                    .setConfig(TTLockConfig.semiAutomaticModeControl, v),
              ),

              // ── Behavior ──
              const SectionHeader(title: 'Behavior', icon: Icons.tune),
              if (LockCommand.setAutoLock.isVisibleFor(caps))
                menuTile(
                  title: 'Auto Lock',
                  subtitle: s.autoLockSeconds == 0
                      ? 'Off'
                      : '${s.autoLockSeconds}s',
                  onTap: () => showModalBottomSheet<int>(
                    context: context,
                    builder: (_) => PresetSecondsSheet(
                      selected: s.autoLockSeconds,
                      onSelected: (sec) {
                        ref
                            .read(lockSettingsProvider(lockMac).notifier)
                            .setAutoLock(sec);
                      },
                    ),
                  ),
                ),
              menuTile(
                title: 'Lock Direction',
                subtitle: s.direction?.name ?? '--',
                onTap: () async {
                  final d = await showDialog<TTLockDirection>(
                    context: context,
                    builder: (ctx) => SimpleDialog(
                      title: const Text('Direction'),
                      children: TTLockDirection.values
                          .map(
                            (e) => SimpleDialogOption(
                              onPressed: () => Navigator.pop(ctx, e),
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                    ),
                  );
                  if (d != null && context.mounted) {
                    await ref
                        .read(lockSettingsProvider(lockMac).notifier)
                        .setDirection(d);
                  }
                },
              ),
              if (LockCommand.setSoundVolume.isVisibleFor(caps))
                menuTile(
                  title: 'Sound Volume',
                  subtitle: s.soundVolume?.name ?? '--',
                  onTap: () async {
                    final v = await showDialog<TTSoundVolumeType>(
                      context: context,
                      builder: (ctx) => SimpleDialog(
                        title: const Text('Volume'),
                        children: TTSoundVolumeType.values
                            .map(
                              (e) => SimpleDialogOption(
                                onPressed: () => Navigator.pop(ctx, e),
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                      ),
                    );
                    if (v != null && context.mounted) {
                      await ref
                          .read(lockSettingsProvider(lockMac).notifier)
                          .setSoundVolume(v);
                    }
                  },
                ),

              // ── Danger Zone ──
              const SectionHeader(
                title: 'Danger Zone',
                icon: Icons.warning_amber,
              ),
              dangerTile(
                title: 'Reset Lock',
                onTap: () => _resetLock(context, ref),
              ),
              dangerTile(
                title: 'Reset Ekey',
                onTap: () => _resetEkey(context, ref),
              ),
              dangerTile(
                title: 'Remove from App',
                onTap: () => _removeFromApp(context, ref),
              ),
            ],
          );
        },
      ),
    );
  }
}
