import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/section_header.dart';
import '../capabilities/lock_capabilities_provider.dart';
import '../../../core/storage/lock_local_cache.dart';

class CredentialEntrySection extends ConsumerWidget {
  const CredentialEntrySection({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cache = ref.watch(lockLocalCacheNotifierProvider(lockMac)).valueOrNull;
    final caps = ref.watch(lockCapabilitiesProvider(lockMac)).valueOrNull ?? {};

    final passcodeCount = cache?.passcodes?.length;
    final cardCount = cache?.cards?.length;
    final fpCount = cache?.fingerprints?.length;
    final faceCount = cache?.faces?.length ?? 0;
    final pvCount = cache?.palmVeins.length ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Credentials', icon: Icons.badge),
        if (caps.has(TTLockFunction.passcode) || caps.has(TTLockFunction.managePasscode))
          _EntryTile(
            icon: Icons.pin,
            label: 'Passcodes',
            count: passcodeCount,
            onTap: () => PasscodeListRoute(lockMac).push(context),
          ),
        if (caps.has(TTLockFunction.icCard))
          _EntryTile(
            icon: Icons.credit_card,
            label: 'Cards',
            count: cardCount,
            onTap: () => CardListRoute(lockMac).push(context),
          ),
        if (caps.has(TTLockFunction.fingerprint))
          _EntryTile(
            icon: Icons.fingerprint,
            label: 'Fingerprints',
            count: fpCount,
            onTap: () => FingerprintListRoute(lockMac).push(context),
          ),
        if (caps.has(TTLockFunction.face))
          _EntryTile(
            icon: Icons.face,
            label: 'Faces',
            count: faceCount,
            onTap: () => FaceManageRoute(lockMac).push(context),
          ),
        if (caps.has(TTLockFunction.palmVein))
          _EntryTile(
            icon: Icons.pan_tool_alt,
            label: 'Palm Veins',
            count: pvCount,
            onTap: () => PalmVeinListRoute(lockMac).push(context),
          ),
        if (caps.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Loading capabilities…'),
          ),
      ],
    );
  }
}

class _EntryTile extends StatelessWidget {
  const _EntryTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.count,
  });

  final IconData icon;
  final String label;
  final int? count;
  final VoidCallback onTap;

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
            if (count != null) Text('($count)', style: AppTextStyles.bodySmall),
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
