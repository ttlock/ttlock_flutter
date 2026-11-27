import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 照明时长 sheet：读取当前秒数，确认后 pop `int` 秒。
class LockLightTimeSheet extends ConsumerStatefulWidget {
  const LockLightTimeSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockLightTimeSheet> createState() => _LockLightTimeSheetState();
}

class _LockLightTimeSheetState extends ConsumerState<LockLightTimeSheet> {
  static const _presets = [0, 5, 10, 15, 20, 30, 60];
  int _seconds = 10;
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
        () => TTLock.lock.getLightTime(widget.lock.lockData),
      );
      if (!mounted) return;
      setState(() {
        _seconds = v.clamp(0, 900);
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
    return BaseBottomSheet(
      title: l10n.lightTime,
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
            Text(l10n.lightTimeHint),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final s in _presets)
                  ChoiceChip(
                    key: Key('light_time_$s'),
                    label: Text(s == 0 ? l10n.off : '$s${l10n.secondsUnit}'),
                    selected: _seconds == s,
                    onSelected:
                        _unknown ? null : (_) => setState(() => _seconds = s),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('light_time_sheet_save'),
              onPressed: _loading || _unknown
                  ? null
                  : () => Navigator.of(context).pop(_seconds),
              child: Text(l10n.commonSave),
            ),
          ],
        ],
      ),
    );
  }
}
