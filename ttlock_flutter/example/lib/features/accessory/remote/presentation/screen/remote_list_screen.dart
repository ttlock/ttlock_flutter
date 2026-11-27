import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_args.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_period.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class RemoteListScreen extends ConsumerWidget {
  const RemoteListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = remoteListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('remote_list'),
      appBar: AppBar(title: Text(l10n.remote)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.addRemote,
        onPressed: () async {
          final added = await RemoteAddRoute(
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
            return Center(child: Text(l10n.noRemotes));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, i) {
                final item = data.items[i];
                return _RemoteTile(
                  remote: item,
                  l10n: l10n,
                  onTap: () async {
                    await RemoteDetailRoute(
                      $extra: RemoteDetailArgs(lock: currentLock, item: item),
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

class _RemoteTile extends StatelessWidget {
  const _RemoteTile({
    required this.remote,
    required this.l10n,
    required this.onTap,
  });
  final RemoteEntity remote;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = remote.name.isNotEmpty
        ? remote.name
        : (remote.mac.isNotEmpty ? remote.mac : l10n.remote);
    return ListTile(
      leading: const Icon(Icons.settings_remote_outlined),
      title: Text(title),
      subtitle: Text(formatRemotePeriod(remote, l10n)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
