import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 开门方向 sheet 入参：云端初值优先，未知再 BLE。
class LockOpenDirectionArgs {
  const LockOpenDirectionArgs({required this.lock, this.openDirection});

  final LockEntity lock;

  /// 云端 1 左开 / 2 右开；`null` = 未知。
  final int? openDirection;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LockOpenDirectionArgs &&
          other.lock == lock &&
          other.openDirection == openDirection;

  @override
  int get hashCode => Object.hash(lock, openDirection);
}

class LockOpenDirectionSheet extends ConsumerStatefulWidget {
  const LockOpenDirectionSheet({super.key, required this.args});
  final LockOpenDirectionArgs args;

  @override
  ConsumerState<LockOpenDirectionSheet> createState() =>
      _LockOpenDirectionSheetState();
}

class _LockOpenDirectionSheetState
    extends ConsumerState<LockOpenDirectionSheet> {
  TTLockDirection _direction = TTLockDirection.left;
  bool _loading = true;
  bool _unknown = false;

  LockEntity get _lock => widget.args.lock;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final cloud = widget.args.openDirection;
    if (cloud == 1 || cloud == 2) {
      if (mounted) {
        setState(() {
          _direction = cloud == 1
              ? TTLockDirection.left
              : TTLockDirection.right;
          _loading = false;
        });
      }
      return;
    }

    if (_lock.lockData.isEmpty) {
      if (mounted) {
        setState(() {
          _unknown = true;
          _loading = false;
        });
      }
      return;
    }
    try {
      final d = await runBle(
        () => TTLock.lock.getLockDirection(_lock.lockData),
      );
      if (mounted) {
        setState(() {
          _direction = d;
          _loading = false;
        });
      }
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
      title: l10n.openDirection,
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
                ChoiceChip(
                  key: const Key('direction_sheet_left'),
                  label: Text(l10n.openDirectionLeft),
                  selected: _direction == TTLockDirection.left,
                  onSelected: _unknown
                      ? null
                      : (_) =>
                            setState(() => _direction = TTLockDirection.left),
                ),
                ChoiceChip(
                  key: const Key('direction_sheet_right'),
                  label: Text(l10n.openDirectionRight),
                  selected: _direction == TTLockDirection.right,
                  onSelected: _unknown
                      ? null
                      : (_) =>
                            setState(() => _direction = TTLockDirection.right),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('direction_sheet_save'),
              onPressed: _loading || _unknown
                  ? null
                  : () => Navigator.of(context).pop(_direction),
              child: Text(l10n.commonSave),
            ),
          ],
        ],
      ),
    );
  }
}
