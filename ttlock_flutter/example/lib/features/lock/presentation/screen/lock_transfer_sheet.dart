import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class LockTransferSheet extends ConsumerStatefulWidget {
  const LockTransferSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockTransferSheet> createState() => _LockTransferSheetState();
}

class _LockTransferSheetState extends ConsumerState<LockTransferSheet> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      key: ValueKey('lock_transfer_${widget.lock.lockId}'),
      title: l10n.transfer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: l10n.receiverUsername),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {
              final u = _controller.text.trim();
              if (u.isEmpty) return;
              Navigator.of(context).pop(u);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
