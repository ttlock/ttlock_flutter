import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/accessory_storage.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../features/settings/model/saved_remote_key.dart';
import 'remote_key_provider.dart';

class RemoteKeyInfoPage extends HookConsumerWidget {
  final String mac;

  const RemoteKeyInfoPage({super.key, required this.mac});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = useState<SavedRemoteKey?>(null);
    final state = ref.watch(remoteKeyNotifierProvider);

    Future<void> reload() async {
      final all = await AccessoryStorage().loadRemoteKeys();
      device.value = all.where((d) => d.mac == mac).firstOrNull;
    }

    useEffect(() {
      reload();
      return null;
    }, [mac]);

    Future<void> rename(SavedRemoteKey savedDevice) async {
      final ctrl = TextEditingController(text: savedDevice.name);
      final name = await showDialog<String>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Rename'),
          content: TextField(
              controller: ctrl,
              decoration: const InputDecoration(labelText: 'Name')),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, ctrl.text),
                child: const Text('Save')),
          ],
        ),
      );
      if (name == null || name.isEmpty) return;
      await ref
          .read(remoteKeyListNotifierProvider(savedDevice.boundLockMac).notifier)
          .updateDevice(savedDevice.copyWith(name: name));
      await reload();
    }

    Future<void> delete(SavedRemoteKey savedDevice) async {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Remove remote key?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Remove')),
          ],
        ),
      );
      if (ok != true || !context.mounted) return;
      await ref
          .read(remoteKeyListNotifierProvider(savedDevice.boundLockMac).notifier)
          .remove(savedDevice.mac);
      if (context.mounted) Navigator.pop(context);
    }

    final savedDevice = device.value;
    if (savedDevice == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Remote Key')),
        body: const ErrorDisplay(message: 'Device not found'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(savedDevice.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => rename(savedDevice),
          ),
        ],
      ),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.key, color: AppColors.primary),
                    title: Text(savedDevice.name, style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: ${savedDevice.mac}',
                        style: AppTextStyles.bodySmall),
                  ),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ErrorDisplay(message: state.error),
                  ),
                if (state.result != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(state.result!,
                          style: AppTextStyles.codeMedium),
                    ),
                  ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => delete(savedDevice),
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Remove'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.error,
                  ),
                ),
              ],
            ),
    );
  }
}
