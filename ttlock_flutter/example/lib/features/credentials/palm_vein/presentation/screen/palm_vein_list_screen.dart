import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/palm_vein_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/palm_vein_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class PalmVeinListScreen extends ConsumerWidget {
  const PalmVeinListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = palmVeinListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('palm_vein_list'),
      appBar: AppBar(title: Text(l10n.palmVein)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.palmVein,
        onPressed: () async {
          final added = await PalmVeinAddRoute(
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
            return Center(child: Text(l10n.noPalmVeins));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, i) {
                final item = data.items[i];
                return _PalmVeinTile(
                  palmVein: item,
                  l10n: l10n,
                  onTap: () async {
                    await PalmVeinDetailRoute(
                      $extra: PalmVeinDetailArgs(lock: currentLock, item: item),
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

class _PalmVeinTile extends StatelessWidget {
  const _PalmVeinTile({
    required this.palmVein,
    required this.l10n,
    required this.onTap,
  });
  final PalmVeinEntity palmVein;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = palmVein.name.isNotEmpty
        ? palmVein.name
        : (palmVein.number.isNotEmpty ? palmVein.number : l10n.palmVein);
    return ListTile(
      leading: const Icon(Icons.back_hand_outlined),
      title: Text(title),
      subtitle: Text(formatPalmVeinPeriod(palmVein, l10n)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
