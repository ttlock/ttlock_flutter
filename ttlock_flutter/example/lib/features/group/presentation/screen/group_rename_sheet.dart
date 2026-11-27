import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class GroupRenameSheet extends ConsumerStatefulWidget {
  const GroupRenameSheet({super.key, required this.group});
  final GroupEntity group;

  @override
  ConsumerState<GroupRenameSheet> createState() => _GroupRenameSheetState();
}

class _GroupRenameSheetState extends ConsumerState<GroupRenameSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.group.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.rename,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: l10n.groupNameHint),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              final name = _controller.text.trim();
              if (name.isEmpty) return;
              Navigator.of(context).pop(name);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
