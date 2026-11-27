import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 斜舌设置结果：回转距离 + 保持时间。
class LockLatchBoltResult {
  const LockLatchBoltResult({
    required this.driveLevel,
    required this.keepTime,
  });

  /// 斜舌回转距离。0 不控制；1–20 有效。
  final int driveLevel;

  /// 斜舌保持时间（秒）。有效范围 2–10。
  final int keepTime;
}

/// 斜舌设置 sheet；SDK 无读取接口，默认 driveLevel=0、keepTime=2。
class LockLatchBoltSheet extends ConsumerStatefulWidget {
  const LockLatchBoltSheet({
    super.key,
    this.initialDriveLevel = 0,
    this.initialKeepTime = 2,
  });

  final int initialDriveLevel;
  final int initialKeepTime;

  @override
  ConsumerState<LockLatchBoltSheet> createState() => _LockLatchBoltSheetState();
}

class _LockLatchBoltSheetState extends ConsumerState<LockLatchBoltSheet> {
  /// driveLevel：0 不控制；1–20 有效范围。
  static final _driveLevels = List<int>.generate(21, (i) => i);

  /// keepTime：有效范围 2–10。
  static final _keepTimes = List<int>.generate(9, (i) => i + 2);

  late int _driveLevel = widget.initialDriveLevel.clamp(0, 20);
  late int _keepTime = widget.initialKeepTime.clamp(2, 10);

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.latchBolt,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.latchBoltDriveLevelHint),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final level in _driveLevels)
                ChoiceChip(
                  key: Key('latch_bolt_drive_$level'),
                  label: Text(
                    level == 0
                        ? l10n.latchBoltDriveLevelNoControl
                        : '$level',
                  ),
                  selected: _driveLevel == level,
                  onSelected: (_) => setState(() => _driveLevel = level),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(l10n.latchBoltKeepTimeHint),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final s in _keepTimes)
                ChoiceChip(
                  key: Key('latch_bolt_keep_$s'),
                  label: Text('$s${l10n.secondsUnit}'),
                  selected: _keepTime == s,
                  onSelected: (_) => setState(() => _keepTime = s),
                ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('latch_bolt_sheet_save'),
            onPressed: () => Navigator.of(context).pop(
              LockLatchBoltResult(
                driveLevel: _driveLevel,
                keepTime: _keepTime,
              ),
            ),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
