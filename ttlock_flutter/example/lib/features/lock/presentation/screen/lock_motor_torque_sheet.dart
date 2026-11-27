import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 电机扭矩等级 sheet（1–5）；SDK 无读取接口，默认选中 3。
class LockMotorTorqueSheet extends ConsumerStatefulWidget {
  const LockMotorTorqueSheet({super.key, this.initialLevel = 3});
  final int initialLevel;

  @override
  ConsumerState<LockMotorTorqueSheet> createState() =>
      _LockMotorTorqueSheetState();
}

class _LockMotorTorqueSheetState extends ConsumerState<LockMotorTorqueSheet> {
  late int _level = widget.initialLevel.clamp(1, 5);

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.motorTorque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            children: [
              for (var i = 1; i <= 5; i++)
                ChoiceChip(
                  key: Key('motor_torque_$i'),
                  label: Text(l10n.motorTorqueLevel(i)),
                  selected: _level == i,
                  onSelected: (_) => setState(() => _level = i),
                ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('motor_torque_sheet_save'),
            onPressed: () => Navigator.of(context).pop(_level),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
