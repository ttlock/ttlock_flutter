import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 灵敏度设置 sheet：进入时 BLE 读取当前值，确认后 pop 所选 [TTSensitivityValue]。
class LockSensitivitySheet extends ConsumerStatefulWidget {
  const LockSensitivitySheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockSensitivitySheet> createState() =>
      _LockSensitivitySheetState();
}

class _LockSensitivitySheetState extends ConsumerState<LockSensitivitySheet> {
  TTSensitivityValue _value = TTSensitivityValue.medium;
  bool _loading = true;
  bool _unknown = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (widget.lock.lockData.isEmpty) {
      if (mounted) {
        setState(() {
          _unknown = true;
          _loading = false;
        });
      }
      return;
    }
    try {
      final v = await runBle(
        () => TTLock.lock.getSensitivity(widget.lock.lockData),
      );
      if (!mounted) return;
      setState(() {
        _value = v;
        _loading = false;
      });
    } on Object {
      if (mounted) {
        setState(() {
          _unknown = true;
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    String label(TTSensitivityValue v) => switch (v) {
      TTSensitivityValue.off => l10n.sensitivityOff,
      TTSensitivityValue.low => l10n.low,
      TTSensitivityValue.medium => l10n.medium,
      TTSensitivityValue.high => l10n.high,
    };

    return BaseBottomSheet(
      title: l10n.sensitivity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_loading)
            const Center(child: CircularProgressIndicator())
          else ...[
            if (_unknown)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(l10n.soundUnknown),
              ),
            Wrap(
              spacing: 8,
              children: [
                for (final v in TTSensitivityValue.values)
                  ChoiceChip(
                    key: Key('sensitivity_${v.name}'),
                    label: Text(label(v)),
                    selected: _value == v,
                    onSelected:
                        _unknown ? null : (_) => setState(() => _value = v),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('sensitivity_sheet_save'),
              onPressed: _loading || _unknown
                  ? null
                  : () => Navigator.of(context).pop(_value),
              child: Text(l10n.commonSave),
            ),
          ],
        ],
      ),
    );
  }
}
