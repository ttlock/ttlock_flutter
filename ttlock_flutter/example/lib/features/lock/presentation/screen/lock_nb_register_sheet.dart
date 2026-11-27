import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class RegisterNbInput {
  const RegisterNbInput({
    required this.nbNodeId,
    required this.nbCardNumber,
    required this.nbOperator,
    required this.nbRssi,
  });
  final String nbNodeId;
  final String nbCardNumber;
  final String nbOperator;
  final int nbRssi;
}

class LockNbRegisterSheet extends ConsumerStatefulWidget {
  const LockNbRegisterSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockNbRegisterSheet> createState() =>
      _LockNbRegisterSheetState();
}

class _LockNbRegisterSheetState extends ConsumerState<LockNbRegisterSheet> {
  final _node = TextEditingController();
  final _card = TextEditingController();
  final _op = TextEditingController();
  final _rssi = TextEditingController(text: '0');

  @override
  void dispose() {
    _node.dispose();
    _card.dispose();
    _op.dispose();
    _rssi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      key: ValueKey('lock_nb_${widget.lock.lockId}'),
      title: l10n.nbRegister,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _node,
              decoration: InputDecoration(labelText: l10n.nbNodeId),
            ),
            TextField(
              controller: _card,
              decoration: InputDecoration(labelText: l10n.nbCardNumber),
            ),
            TextField(
              controller: _op,
              decoration: InputDecoration(labelText: l10n.nbOperator),
            ),
            TextField(
              controller: _rssi,
              decoration: InputDecoration(labelText: l10n.nbRssi),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(
                  RegisterNbInput(
                    nbNodeId: _node.text.trim(),
                    nbCardNumber: _card.text.trim(),
                    nbOperator: _op.text.trim(),
                    nbRssi: int.tryParse(_rssi.text.trim()) ?? 0,
                  ),
                );
              },
              child: Text(l10n.commonSave),
            ),
          ],
        ),
      ),
    );
  }
}
