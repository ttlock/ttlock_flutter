import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/provider/lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(lockListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.locksTab),
        actions: [
          IconButton(
            icon: const Icon(Icons.folder_outlined),
            tooltip: l10n.groups,
            onPressed: () => const GroupManageRoute().push(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final added = await const LockScanRoute().push<bool>(context);
          if (added == true) ref.invalidate(lockListProvider);
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
            return Center(child: Text(l10n.noLocks));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(lockListProvider.notifier).refresh(),
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                    data.pageState.hasMore) {
                  ref.read(lockListProvider.notifier).loadMore();
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
                  return _LockTile(
                    lock: data.pageState.data[i],
                    onTap: () async {
                      await LockDetailRoute(
                        lockId: data.pageState.data[i].lockId,
                        $extra: data.pageState.data[i],
                      ).push(context);
                      ref.invalidate(lockListProvider);
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

class _LockTile extends StatelessWidget {
  const _LockTile({required this.lock, required this.onTap});
  final LockEntity lock;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('lock_card_${lock.lockId}'),
      leading: const Icon(Icons.lock_outline),
      title: Text(lock.lockAlias.isEmpty ? lock.lockName : lock.lockAlias),
      subtitle: Text(lock.lockName.isEmpty ? lock.lockMac : lock.lockName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.battery_std, size: 18),
          const SizedBox(width: 4),
          Text('${lock.electricQuantity}%'),
          const SizedBox(width: 8),
          if (lock.groupName.isNotEmpty) Chip(label: Text(lock.groupName)),
        ],
      ),
      onTap: onTap,
    );
  }
}
