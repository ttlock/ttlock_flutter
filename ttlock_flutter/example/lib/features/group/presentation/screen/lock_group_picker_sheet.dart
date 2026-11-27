import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/provider/group_manage_notifier.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 选择锁所属分组；返回 groupId。选中「未分组」返回 0（云端取消分组），
/// 关闭 sheet（返回 null）表示取消操作。
class LockGroupPickerSheet extends ConsumerWidget {
  const LockGroupPickerSheet({super.key, this.groupId});
  final int? groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(groupManageProvider);
    return BaseBottomSheet(
      title: l10n.changeGroup,
      child: state.when(
        loading: () => const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => SizedBox(
          height: 200,
          child: Center(
            child: Text(
              e is AppException ? getUserFriendlyMessage(e, l10n) : '$e',
            ),
          ),
        ),
        data: (data) => MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            shrinkWrap: true,
            children: data.groups.map(
                (GroupEntity g) => ListTile(
                  selected: g.groupId == groupId,
                  title: Text(g.groupId == 0 ? l10n.noGroup : g.name),
                  trailing: g.groupId == groupId ? const Icon(Icons.check) : null,
                  onTap: () => Navigator.of(context).pop(g),
                ),
              ).toList(),
          ),
        ),
      ),
    );
  }
}
