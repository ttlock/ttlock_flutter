import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_local_cache.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../providers/ttlock_providers.dart';
import '../../../core/widgets/error_display.dart';
import '../../../core/widgets/loading_overlay.dart';
import '../../../core/widgets/section_header.dart';
import '../capabilities/lock_capabilities_provider.dart';
import '../lock_cache_initializer.dart';
import '../lock_provider.dart';
import 'lock_settings_provider.dart';
import 'lock_settings_state.dart';
import 'settings_operation.dart';
import 'widgets/settings_switch_tile.dart';

class LockSettingsPage extends ConsumerWidget {
  const LockSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  Future<void> _pickAutoLock(
    BuildContext context,
    WidgetRef ref,
    LockSettingsState s,
  ) async {
    final presets = [0, 5, 10, 15, 30, 60];
    final picked = await showModalBottomSheet<int>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...presets.map(
              (sec) => ListTile(
                title: Text(sec == 0 ? 'Off' : '${sec}s'),
                onTap: () => Navigator.pop(ctx, sec),
              ),
            ),
            ListTile(
              title: const Text('Custom…'),
              onTap: () async {
                Navigator.pop(ctx);
                var value = s.autoLockSeconds.toDouble().clamp(
                      s.autoLockMin.toDouble(),
                      s.autoLockMax.toDouble(),
                    );
                final custom = await showDialog<int>(
                  context: context,
                  builder: (dCtx) => StatefulBuilder(
                    builder: (dCtx, setState) => AlertDialog(
                      title: const Text('Auto lock (seconds)'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Slider(
                            value: value,
                            min: s.autoLockMin.toDouble(),
                            max: s.autoLockMax.toDouble(),
                            divisions:
                                (s.autoLockMax - s.autoLockMin).clamp(1, 895),
                            label: '${value.toInt()}s',
                            onChanged: (v) => setState(() => value = v),
                          ),
                          Text('${s.autoLockMin}s – ${s.autoLockMax}s'),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(dCtx), child: const Text('Cancel')),
                        FilledButton(
                          onPressed: () => Navigator.pop(dCtx, value.toInt()),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                );
                if (custom != null && context.mounted) {
                  await runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setAutoLock(custom),
                    successMessage: 'Auto lock updated',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
    if (picked != null && context.mounted) {
      await runSettingsOperation(
        context,
        action: () => ref.read(lockSettingsProvider(lockMac).notifier).setAutoLock(picked),
        successMessage: 'Auto lock updated',
      );
    }
  }

  Future<void> _refreshCapabilities(BuildContext context, WidgetRef ref) async {
    await runSettingsOperation(
      context,
      action: () => ref.read(lockCapabilitiesProvider(lockMac).notifier).refresh(),
      successMessage: 'Capabilities refreshed',
    );
  }

  Future<void> _refreshSettings(BuildContext context, WidgetRef ref) async {
    await runSettingsOperation(
      context,
      action: () => ref.read(lockSettingsProvider(lockMac).notifier).refreshSettingsFromLock(),
      successMessage: 'Settings refreshed from lock',
    );
  }

  Future<void> _resetLock(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset lock?'),
        content: const Text('This will reset the lock on the device.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Reset')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await runSettingsOperation(
      context,
      action: () async {
        await ref.read(lockApiProvider).resetLock(lock.lockData);
        await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).clear();
      },
      successMessage: 'Lock reset',
    );
    if (context.mounted) context.pop();
  }

  Future<void> _resetEkey(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset ekey?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Reset')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await runSettingsOperation(
      context,
      action: () async {
        final newData = await ref.read(lockApiProvider).resetEkey(lock.lockData);
        await ref.read(lockListNotifierProvider.notifier).updateDevice(
              lock.copyWith(lockData: newData),
            );
        await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).clear();
        final api = ref.read(lockApiProvider);
        await initializeLockLocalCache(api: api, lockMac: lockMac, lockData: newData);
        ref.read(lockNotifierProvider.notifier).setContext(newData, lockMac: lockMac, lockName: lock.name);
      },
      successMessage: 'Ekey reset',
    );
  }

  Future<void> _removeFromApp(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove from app?'),
        content: const Text('Local data will be deleted. The lock on device is not affected.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Remove')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await ref.read(lockListNotifierProvider.notifier).removeDevice(lockMac);
    if (context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final settingsAsync = ref.watch(lockSettingsProvider(lockMac));
    final capsAsync = ref.watch(lockCapabilitiesProvider(lockMac));
    final cacheAsync = ref.watch(lockLocalCacheNotifierProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text('${l?.name ?? 'Lock'} Settings'),
          loading: () => const Text('Lock Settings'),
          error: (_, __) => const Text('Lock Settings'),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'capabilities':
                  _refreshCapabilities(context, ref);
                case 'settings':
                  _refreshSettings(context, ref);
              }
            },
            itemBuilder: (ctx) => const [
              PopupMenuItem(value: 'capabilities', child: Text('Refresh capabilities')),
              PopupMenuItem(value: 'settings', child: Text('Refresh settings from lock')),
            ],
          ),
        ],
      ),
      body: settingsAsync.when(
        loading: () => const LoadingOverlay(message: 'Loading settings…'),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (s) {
          final caps = capsAsync.valueOrNull ?? {};
          String? fetchedHint;
          cacheAsync.whenData((c) {
            if (c.settingsFetchedAt != null) {
              fetchedHint = 'Settings cached: ${c.settingsFetchedAt!.toLocal()}';
            }
          });

          return ListView(
            children: [
              if (fetchedHint != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(fetchedHint!, style: Theme.of(context).textTheme.bodySmall),
                ),
              const SectionHeader(title: 'General', icon: Icons.info_outline),
              ListTile(
                title: const Text('Basic info'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => LockBasicInfoRoute(lockMac).push(context),
              ),
              if (caps.has(TTLockFunction.wifiLock) ||
                  caps.has(TTLockFunction.wifiLockStaticIP) ||
                  caps.has(TTLockFunction.nbIoT))
                ListTile(
                  title: const Text('Network'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => LockNetworkSettingsRoute(lockMac).push(context),
                ),
              if (caps.has(TTLockFunction.passageMode))
                ListTile(
                  title: const Text('Passage mode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => LockPassageModeRoute(lockMac).push(context),
                ),
              ListTile(
                title: const Text('Advanced'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => LockAdvancedSettingsRoute(lockMac).push(context),
              ),
              const SectionHeader(title: 'Security & switches', icon: Icons.security),
              if (caps.has(TTLockFunction.audioSwitch))
                SettingsSwitchTile(
                  title: 'Audio',
                  value: s.audio,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.audio, v),
                  ),
                ),
              if (caps.has(TTLockFunction.tamperAlert))
                SettingsSwitchTile(
                  title: 'Tamper alert',
                  value: s.tamperAlert,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.tamperAlert, v),
                  ),
                ),
              if (caps.has(TTLockFunction.doubleAuth))
                SettingsSwitchTile(
                  title: 'Double authentication',
                  value: s.doubleAuth,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.doubleAuth, v),
                  ),
                ),
              if (caps.has(TTLockFunction.privacyLock))
                SettingsSwitchTile(
                  title: 'Privacy lock',
                  value: s.privacyLock,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.privacyLock, v),
                  ),
                ),
              if (caps.has(TTLockFunction.resetButton))
                SettingsSwitchTile(
                  title: 'Reset button',
                  value: s.resetButton,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.resetButton, v),
                  ),
                ),
              if (caps.has(TTLockFunction.unlockSwitch))
                SettingsSwitchTile(
                  title: 'Remote unlock',
                  value: s.remoteUnlock,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setRemoteUnlock(v),
                  ),
                ),
              if (caps.has(TTLockFunction.passcodeVisible))
                SettingsSwitchTile(
                  title: 'Passcode visible',
                  value: s.passcodeVisible,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.passcodeVisible, v),
                  ),
                ),
              if (caps.has(TTLockFunction.lockFreeze))
                SettingsSwitchTile(
                  title: 'Freeze',
                  value: s.freeze,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.freeze, v),
                  ),
                ),
              if (caps.has(TTLockFunction.passageModeAutoUnlockSetting))
                SettingsSwitchTile(
                  title: 'Passage auto unlock',
                  value: s.passageModeAutoUnlock,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.passageModeAutoUnlock, v),
                  ),
                ),
              if (caps.has(TTLockFunction.wifiPowerSavingTime))
                SettingsSwitchTile(
                  title: 'WiFi power saving',
                  value: s.wifiLockPowerSavingMode,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.wifiLockPowerSavingMode, v),
                  ),
                ),
              if (caps.has(TTLockFunction.publicMode))
                SettingsSwitchTile(
                  title: 'Public mode',
                  value: s.publicMode,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.publicMode, v),
                  ),
                ),
              if (caps.has(TTLockFunction.lowBatteryAutoUnlock))
                SettingsSwitchTile(
                  title: 'Low battery auto unlock',
                  value: s.lowBatteryAutoUnlock,
                  onChanged: (v) => runSettingsOperation(
                    context,
                    action: () => ref.read(lockSettingsProvider(lockMac).notifier).setConfig(TTLockConfig.lowBatteryAutoUnlock, v),
                  ),
                ),
              const SectionHeader(title: 'Behavior', icon: Icons.tune),
              if (caps.has(TTLockFunction.autoLock))
                ListTile(
                  title: const Text('Auto lock'),
                  subtitle: Text(s.autoLockSeconds == 0 ? 'Off' : '${s.autoLockSeconds}s'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _pickAutoLock(context, ref, s),
                ),
              ListTile(
                title: const Text('Lock direction'),
                subtitle: Text(s.direction?.name ?? '—'),
                trailing: const Icon(Icons.chevron_right),
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
                    await runSettingsOperation(
                      context,
                      action: () => ref.read(lockSettingsProvider(lockMac).notifier).setDirection(d),
                      successMessage: 'Direction updated',
                    );
                  }
                },
              ),
              if (caps.has(TTLockFunction.soundVolumeAndLanguageSetting))
                ListTile(
                  title: const Text('Sound volume'),
                  subtitle: Text(s.soundVolume?.name ?? '—'),
                  trailing: const Icon(Icons.chevron_right),
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
                      await runSettingsOperation(
                        context,
                        action: () => ref.read(lockSettingsProvider(lockMac).notifier).setSoundVolume(v),
                        successMessage: 'Volume updated',
                      );
                    }
                  },
                ),
              const SectionHeader(title: 'Danger zone', icon: Icons.warning_amber),
              ListTile(
                title: const Text('Reset lock'),
                textColor: Theme.of(context).colorScheme.error,
                onTap: () => _resetLock(context, ref),
              ),
              ListTile(
                title: const Text('Reset ekey'),
                textColor: Theme.of(context).colorScheme.error,
                onTap: () => _resetEkey(context, ref),
              ),
              ListTile(
                title: const Text('Remove from app'),
                textColor: Theme.of(context).colorScheme.error,
                onTap: () => _removeFromApp(context, ref),
              ),
            ],
          );
        },
      ),
    );
  }
}
