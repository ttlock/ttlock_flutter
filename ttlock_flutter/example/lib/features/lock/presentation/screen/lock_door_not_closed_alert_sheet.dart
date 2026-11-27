import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 门未关报警秒数。无 BLE get API，默认 0=关；Save 只 pop [int]，由父页写 Domain。
class LockDoorNotClosedAlertSheet extends ConsumerStatefulWidget {
  const LockDoorNotClosedAlertSheet({
    super.key,
    required this.lock,
    this.initialSeconds = 0,
  });
  final LockEntity lock;

  /// 打开时预选秒数（无 BLE get API，由调用方带当前值；不在预设内回退 0）。
  final int initialSeconds;

  @override
  ConsumerState<LockDoorNotClosedAlertSheet> createState() =>
      _LockDoorNotClosedAlertSheetState();
}

class _LockDoorNotClosedAlertSheetState
    extends ConsumerState<LockDoorNotClosedAlertSheet> {
  static const _presets = <int>[0, 5, 10, 30, 60, 120];
  late int _selected = _presets.contains(widget.initialSeconds)
      ? widget.initialSeconds
      : 0;

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.doorNotClosedAlert,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            children: _presets
                .map(
                  (s) => ChoiceChip(
                    key: Key('door_not_closed_alert_$s'),
                    label: Text(
                      s == 0 ? l10n.autoLockOff : '$s${l10n.secondsUnit}',
                    ),
                    selected: _selected == s,
                    onSelected: (_) => setState(() => _selected = s),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('door_not_closed_alert_save'),
            onPressed: () => Navigator.of(context).pop(_selected),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
