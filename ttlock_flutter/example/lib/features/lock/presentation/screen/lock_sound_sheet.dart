import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class LockSoundSheetResult {
  const LockSoundSheetResult({required this.on, required this.level});
  final bool on;
  final int level;
}

class LockSoundSheet extends ConsumerStatefulWidget {
  const LockSoundSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockSoundSheet> createState() => _LockSoundSheetState();
}

class _LockSoundSheetState extends ConsumerState<LockSoundSheet> {
  bool _on = true;
  int _level = 3;
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
      final vol = await runBle(
        () => TTLock.lock.getSoundVolume(widget.lock.lockData),
      );
      if (!mounted) return;
      setState(() {
        _on = vol != TTSoundVolumeType.off;
        _level = _levelFromVolume(vol);
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

  static int _levelFromVolume(TTSoundVolumeType vol) => switch (vol) {
    TTSoundVolumeType.firstLevel => 1,
    TTSoundVolumeType.secondLevel => 2,
    TTSoundVolumeType.thirdLevel => 3,
    TTSoundVolumeType.fourthLevel => 4,
    TTSoundVolumeType.fifthLevel => 5,
    TTSoundVolumeType.off || TTSoundVolumeType.on => 3,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.sound,
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
            SwitchListTile(
              key: const Key('sound_sheet_on'),
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.sound),
              value: _on,
              onChanged: _unknown ? null : (v) => setState(() => _on = v),
            ),
            if (_on) ...[
              const SizedBox(height: 8),
              Text(l10n.soundVolume),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  for (var i = 1; i <= 5; i++)
                    ChoiceChip(
                      key: Key('sound_sheet_level_$i'),
                      label: Text(l10n.soundVolumeLevel(i)),
                      selected: _level == i,
                      onSelected: _unknown
                          ? null
                          : (_) => setState(() => _level = i),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('sound_sheet_save'),
              onPressed: _loading || _unknown
                  ? null
                  : () => Navigator.of(
                      context,
                    ).pop(LockSoundSheetResult(on: _on, level: _level)),
              child: Text(l10n.commonSave),
            ),
          ],
        ],
      ),
    );
  }
}
