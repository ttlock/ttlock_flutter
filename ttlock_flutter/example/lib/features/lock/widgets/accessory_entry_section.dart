import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/router/routes.dart';
import '../../../core/storage/accessory_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/section_header.dart';

class AccessoryEntrySection extends ConsumerWidget {
  final String lockMac;

  const AccessoryEntrySection({super.key, required this.lockMac});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countsAsync = ref.watch(accessoryCountsProvider(lockMac));

    return countsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (counts) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Accessories', icon: Icons.link),
          _AccessoryTile(
            icon: Icons.sensors,
            label: 'Door Sensor',
            count: counts.doorSensors,
            onTap: () => DoorSensorListRoute(lockMac).push(context),
          ),
          _AccessoryTile(
            icon: Icons.key,
            label: 'Remote Keys',
            count: counts.remoteKeys,
            onTap: () => RemoteKeyListRoute(lockMac).push(context),
          ),
          _AccessoryTile(
            icon: Icons.keyboard,
            label: 'Keypad',
            count: counts.keypads,
            onTap: () => KeypadListRoute(lockMac).push(context),
          ),
        ],
      ),
    );
  }
}

class _AccessoryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback onTap;

  const _AccessoryTile({
    required this.icon,
    required this.label,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: ListTile(
        leading: Icon(icon),
        title: Text(label, style: AppTextStyles.bodyMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('($count)', style: AppTextStyles.bodySmall),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 18),
          ],
        ),
        onTap: onTap,
        dense: true,
      ),
    );
  }
}
