import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class LockAutoLockTimeSheet extends ConsumerStatefulWidget {
  const LockAutoLockTimeSheet({
    super.key,
    this.autoLockingTime,
    this.step = 5,
  });
  final AutoLockingTime? autoLockingTime;
  final int step;

  @override
  ConsumerState<LockAutoLockTimeSheet> createState() =>
      _LockAutoLockTimeSheetState();
}

class _LockAutoLockTimeSheetState extends ConsumerState<LockAutoLockTimeSheet> {
  List<int> _presets = [0, 5, 10, 30, 60, 120]; // 0 = 关闭自动闭锁
  int _selected = 0;

  @override
  void initState() {
    super.initState();
    _selected = widget.autoLockingTime?.currentTime ?? 0;
    _presets = List.generate(
      ((widget.autoLockingTime?.maxTime ?? 0) - (widget.autoLockingTime?.minTime ?? 0)) ~/ widget.step + 1,
      (index) => (widget.autoLockingTime?.minTime ?? 0) + index * widget.step,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.autoLockTime,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                children: _presets
                    .map(
                      (s) => ChoiceChip(
                        label: Text(
                          s == 0 ? l10n.autoLockOff : '$s${l10n.secondsUnit}',
                        ),
                        selected: _selected == s,
                        onSelected: (_) => setState(() => _selected = s),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(_selected),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
