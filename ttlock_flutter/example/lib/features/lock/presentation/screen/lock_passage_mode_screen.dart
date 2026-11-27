import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class LockPassageModeScreen extends ConsumerStatefulWidget {
  const LockPassageModeScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockPassageModeScreen> createState() =>
      _LockPassageModeScreenState();
}

class _LockPassageModeScreenState extends ConsumerState<LockPassageModeScreen> {
  bool _on = false;
  bool _allDay = true;
  final Set<int> _weekDays = {};
  int _startMinutes = 8 * 60;
  int _endMinutes = 18 * 60;
  bool _autoUnlock = false;
  bool _supportsAutoUnlock = false;
  bool _loading = true;
  bool _unknown = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    var supportsAuto = false;
    if (widget.lock.lockData.isNotEmpty) {
      supportsAuto = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.passageModeAutoUnlockSetting,
          widget.lock.lockData,
        ),
      ).catchError((_) => false);
    }

    final r = await ref
        .read(lockDomainProvider.notifier)
        .getPassageMode(widget.lock.lockId)
        .run();
    if (!mounted) return;

    r.fold(
      (_) => setState(() {
        _supportsAutoUnlock = supportsAuto;
        _unknown = true;
        _loading = false;
      }),
      (cfg) {
        // Spec §3.4：全天 = isAllDay=1，或周空/全选 + start=end=0。
        // 勿把后者当成自定义再填 08:00–18:00，保存会覆盖云端配置。
        final allDay = _isAllDayConfig(cfg);
        setState(() {
          _supportsAutoUnlock = supportsAuto;
          _on = cfg.passageMode == 1;
          _allDay = allDay;
          _weekDays
            ..clear()
            ..addAll(cfg.weekDays);
          if (!allDay) {
            _startMinutes = cfg.startDate;
            _endMinutes = cfg.endDate;
          }
          _autoUnlock = cfg.autoUnlock == 1;
          _loading = false;
        });
      },
    );
  }

  /// Spec：`isAllDay=1`，或 `start=end=0` 且星期为空/全周。
  static bool _isAllDayConfig(PassageModeConfigEntity cfg) {
    if (cfg.isAllDay == 1) return true;
    if (cfg.startDate != 0 || cfg.endDate != 0) return false;
    final days = cfg.weekDays.toSet();
    return days.isEmpty || days.containsAll(const {1, 2, 3, 4, 5, 6, 7});
  }

  String _fmtMinutes(int minutes) {
    final h = (minutes ~/ 60).clamp(0, 23);
    final m = (minutes % 60).clamp(0, 59);
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  Future<void> _pickTime({required bool start}) async {
    final current = start ? _startMinutes : _endMinutes;
    final hour = (current ~/ 60).clamp(0, 23);
    final minute = (current % 60).clamp(0, 59);
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hour, minute: minute),
    );
    if (picked == null || !mounted) return;
    setState(() {
      final mins = picked.hour * 60 + picked.minute;
      if (start) {
        _startMinutes = mins;
      } else {
        _endMinutes = mins;
      }
    });
  }

  void _save(AppLocalizations l10n) {
    if (_on && !_allDay) {
      if (_weekDays.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.passageModeNeedWeekdays)));
        return;
      }
      if (_endMinutes <= _startMinutes) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.passageModeInvalidTime)));
        return;
      }
    }

    final days = _weekDays.toList()..sort();
    Navigator.of(context).pop(
      PassageModeConfigEntity(
        passageMode: _on ? 1 : 2,
        isAllDay: _on && _allDay ? 1 : 2,
        startDate: _on && !_allDay ? _startMinutes : 0,
        endDate: _on && !_allDay ? _endMinutes : 0,
        weekDays: _on && !_allDay
            ? days
            : (_on && _allDay ? const [1, 2, 3, 4, 5, 6, 7] : const []),
        // 无 passageModeAutoUnlockSetting 时传 0，Domain 跳过 setLockConfig。
        autoUnlock: _supportsAutoUnlock ? (_autoUnlock ? 1 : 2) : 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final weekLabels = <int, String>{
      1: l10n.weekMon,
      2: l10n.weekTue,
      3: l10n.weekWed,
      4: l10n.weekThu,
      5: l10n.weekFri,
      6: l10n.weekSat,
      7: l10n.weekSun,
    };

    return Scaffold(
      appBar: AppBar(title: Text(l10n.passageMode)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (_unknown)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(l10n.soundUnknown),
                  ),
                SwitchListTile(
                  key: const Key('passage_mode_on'),
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.passageMode),
                  value: _on,
                  onChanged: _unknown ? null : (v) => setState(() => _on = v),
                ),
                if (_on) ...[
                  SwitchListTile(
                    key: const Key('passage_mode_all_day'),
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.passageModeAllDay),
                    value: _allDay,
                    onChanged: _unknown
                        ? null
                        : (v) => setState(() => _allDay = v),
                  ),
                  if (!_allDay) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final day in weekLabels.keys)
                          FilterChip(
                            key: Key('passage_mode_week_$day'),
                            label: Text(weekLabels[day]!),
                            selected: _weekDays.contains(day),
                            onSelected: _unknown
                                ? null
                                : (sel) => setState(() {
                                    if (sel) {
                                      _weekDays.add(day);
                                    } else {
                                      _weekDays.remove(day);
                                    }
                                  }),
                          ),
                      ],
                    ),
                    ListTile(
                      key: const Key('passage_mode_start'),
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.passageModeStartTime),
                      trailing: Text(_fmtMinutes(_startMinutes)),
                      onTap: _unknown ? null : () => _pickTime(start: true),
                    ),
                    ListTile(
                      key: const Key('passage_mode_end'),
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.passageModeEndTime),
                      trailing: Text(_fmtMinutes(_endMinutes)),
                      onTap: _unknown ? null : () => _pickTime(start: false),
                    ),
                  ],
                  if (_supportsAutoUnlock)
                    SwitchListTile(
                      key: const Key('passage_mode_auto_unlock'),
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.passageModeAutoUnlock),
                      value: _autoUnlock,
                      onChanged: _unknown
                          ? null
                          : (v) => setState(() => _autoUnlock = v),
                    ),
                ],
                const SizedBox(height: 16),
                FilledButton(
                  key: const Key('passage_mode_save'),
                  onPressed: _unknown ? null : () => _save(l10n),
                  child: Text(l10n.commonSave),
                ),
              ],
            ),
    );
  }
}
