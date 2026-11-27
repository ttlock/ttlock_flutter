import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class LockRenameSheet extends ConsumerStatefulWidget {
  const LockRenameSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockRenameSheet> createState() => _LockRenameSheetState();
}

class _LockRenameSheetState extends ConsumerState<LockRenameSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initial = widget.lock.lockAlias.isNotEmpty
        ? widget.lock.lockAlias
        : widget.lock.lockName;
    _controller = TextEditingController(text: initial);
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
            decoration: InputDecoration(hintText: l10n.renameHint),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(_controller.text.trim()),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
