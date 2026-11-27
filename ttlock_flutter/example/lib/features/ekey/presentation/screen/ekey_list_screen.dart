import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_args.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_period.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class EkeyListScreen extends ConsumerWidget {
  const EkeyListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = ekeyListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('ekey_list'),
      appBar: AppBar(title: Text(l10n.eKey)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.sendEkey,
        onPressed: () async {
          final sent = await EkeySendRoute(
            $extra: currentLock,
          ).push<bool>(context);
          if (sent == true) {
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
          if (data.pageState.data.isEmpty) {
            return Center(child: Text(l10n.noEkeys));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                    data.pageState.hasMore) {
                  ref.read(provider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.builder(
                itemCount:
                    data.pageState.data.length +
                    (data.pageState.hasMore ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i >= data.pageState.data.length) {
                    return const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final item = data.pageState.data[i];
                  return _EkeyTile(
                    keyEntity: item,
                    l10n: l10n,
                    onTap: () async {
                      await EkeyDetailRoute(
                        $extra: EkeyDetailArgs(lock: currentLock, key: item),
                      ).push<bool>(context);
                      await ref.read(provider.notifier).refresh();
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EkeyTile extends StatelessWidget {
  const _EkeyTile({
    required this.keyEntity,
    required this.l10n,
    required this.onTap,
  });
  final KeyEntity keyEntity;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = keyEntity.username.isNotEmpty
        ? keyEntity.username
        : (keyEntity.keyName.isNotEmpty ? keyEntity.keyName : l10n.eKey);
    final showBadges =
        keyEntity.keyStatus == KeyStatus.frozen || keyEntity.keyRight;
    return ListTile(
      leading: const Icon(Icons.vpn_key_outlined),
      title: Text(title),
      isThreeLine: showBadges,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            [
              if (keyEntity.keyName.isNotEmpty && keyEntity.username.isNotEmpty)
                keyEntity.keyName,
              formatEkeyPeriod(keyEntity, l10n),
            ].join('  '),
          ),
          if (keyEntity.keyStatus == KeyStatus.frozen || keyEntity.keyRight)
            Wrap(
              spacing: 8,
              children: [
                if (keyEntity.keyStatus == KeyStatus.frozen)
                  Chip(
                    label: Text(l10n.freeze),
                    visualDensity: VisualDensity.compact,
                  ),
                if (keyEntity.keyRight)
                  Chip(
                    label: Text(l10n.authorizedAdmin),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
