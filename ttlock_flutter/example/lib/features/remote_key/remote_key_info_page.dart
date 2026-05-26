import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/accessory_storage.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../features/settings/model/saved_remote_key.dart';
import 'remote_key_provider.dart';

class RemoteKeyInfoPage extends ConsumerStatefulWidget {
  final String mac;

  const RemoteKeyInfoPage({super.key, required this.mac});

  @override
  ConsumerState<RemoteKeyInfoPage> createState() => _RemoteKeyInfoPageState();
}

class _RemoteKeyInfoPageState extends ConsumerState<RemoteKeyInfoPage> {
  SavedRemoteKey? _device;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final all = await AccessoryStorage().loadRemoteKeys();
    setState(() {
      _device = all.where((d) => d.mac == widget.mac).firstOrNull;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(remoteKeyNotifierProvider);
    final device = _device;

    if (device == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Remote Key')),
        body: const ErrorDisplay(message: 'Device not found'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _rename(device),
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
                    title: Text(device.name, style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: ${device.mac}',
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
                  onPressed: () => _delete(device),
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

  Future<void> _rename(SavedRemoteKey device) async {
    final ctrl = TextEditingController(text: device.name);
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
        .read(remoteKeyListNotifierProvider(device.boundLockMac).notifier)
        .updateDevice(device.copyWith(name: name));
    await _load();
  }

  Future<void> _delete(SavedRemoteKey device) async {
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
    if (ok != true || !mounted) return;
    await ref
        .read(remoteKeyListNotifierProvider(device.boundLockMac).notifier)
        .remove(device.mac);
    if (mounted) Navigator.pop(context);
  }
}
