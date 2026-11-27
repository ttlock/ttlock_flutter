import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/provider/group_manage_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class GroupManageScreen extends ConsumerWidget {
  const GroupManageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(groupManageProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.groups)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await GroupAddSheetRoute().push<String>(context);
          if (name != null && name.isNotEmpty) {
            await ref.read(groupManageProvider.notifier).add(name);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            e is AppException ? getUserFriendlyMessage(e, l10n) : '$e',
          ),
        ),
        data: (data) => data.groups.isEmpty
            ? Center(child: Text(l10n.noGroups))
            : ListView.builder(
                itemCount: data.groups.length,
                itemBuilder: (context, i) {
                  final g = data.groups[i];
                  return ListTile(
                    leading: const Icon(Icons.folder_outlined),
                    title: Text(g.groupId == 0 ? l10n.noGroup : g.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${g.lockNum} ${l10n.groupLockCount}'),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () async {
                            final name = await GroupRenameSheetRoute(
                              $extra: g,
                            ).push<String>(context);
                            if (name != null && name.isNotEmpty) {
                              await ref
                                  .read(groupManageProvider.notifier)
                                  .rename(g.groupId, name);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () async {
                            await ref
                                .read(groupManageProvider.notifier)
                                .delete(g.groupId);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
