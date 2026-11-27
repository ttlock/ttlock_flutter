import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class FingerprintListScreen extends ConsumerWidget {
  const FingerprintListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = fingerprintListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('fingerprint_list'),
      appBar: AppBar(title: Text(l10n.fingerprint)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.fingerprint,
        onPressed: () async {
          final added = await FingerprintAddRoute(
            $extra: currentLock,
          ).push<bool>(context);
          if (added == true) {
            await ref.read(provider.notifier).refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
        data: (data) {
          if (data.items.isEmpty) {
            return Center(child: Text(l10n.noFingerprints));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, i) {
                final item = data.items[i];
                return _FingerprintTile(
                  fingerprint: item,
                  l10n: l10n,
                  onTap: () async {
                    await FingerprintDetailRoute(
                      $extra: FingerprintDetailArgs(
                        lock: currentLock,
                        item: item,
                      ),
                    ).push<bool>(context);
                    await ref.read(provider.notifier).refresh();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _FingerprintTile extends StatelessWidget {
  const _FingerprintTile({
    required this.fingerprint,
    required this.l10n,
    required this.onTap,
  });
  final FingerprintEntity fingerprint;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = fingerprint.fingerprintName.isNotEmpty
        ? fingerprint.fingerprintName
        : (fingerprint.fingerprintNumber.isNotEmpty
              ? fingerprint.fingerprintNumber
              : l10n.fingerprint);
    return ListTile(
      leading: const Icon(Icons.fingerprint),
      title: Text(title),
      subtitle: Text(formatFingerprintPeriod(fingerprint, l10n)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
