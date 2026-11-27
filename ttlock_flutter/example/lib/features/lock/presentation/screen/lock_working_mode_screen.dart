import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

/// Open API：1=全天工作，2=全天不工作，3=自定义 cyclic。
const _modeAllDay = 1;
const _modeOff = 2;
const _modeCustom = 3;

class LockWorkingModeScreen extends ConsumerStatefulWidget {
  const LockWorkingModeScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<LockWorkingModeScreen> createState() =>
      _LockWorkingModeScreenState();
}

class _LockWorkingModeScreenState extends ConsumerState<LockWorkingModeScreen> {
  int _mode = _modeAllDay;
  bool _customAllDay = true;
  final Set<int> _weekDays = {};
  int _startMinutes = 8 * 60;
  int _endMinutes = 18 * 60;
  bool _loading = true;
  bool _unknown = false;

  bool get _canWrite => widget.lock.hasGateway;
  bool get _canCustom => _canWrite;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final r = await ref
        .read(lockDomainProvider.notifier)
        .getWorkingMode(widget.lock.lockId)
        .run();
    if (!mounted) return;

    r.fold(
      (_) => setState(() {
        _unknown = true;
        _loading = false;
      }),
      (cfg) {
        final first = cfg.cyclicConfig.isEmpty ? null : cfg.cyclicConfig.first;
        final allDay = first == null || _isAllDayCyclic(first);
        var mode = cfg.workingMode;
        // 无网关时自定义不可写：避免 groupValue=3 却无 option。
        if (!widget.lock.hasGateway && mode == _modeCustom) {
          mode = _modeAllDay;
        }
        setState(() {
          _mode = mode;
          _customAllDay = allDay;
          _weekDays
            ..clear()
            ..addAll(first?.weekDays ?? const []);
          if (first != null && !allDay) {
            _startMinutes = first.startTime;
            _endMinutes = first.endTime;
          }
          _loading = false;
        });
      },
    );
  }

  static bool _isAllDayCyclic(WorkingModeCyclicConfigEntity c) {
    if (c.isAllDay == 1) return true;
    if (c.startTime != 0 || c.endTime != 0) return false;
    final days = c.weekDays.toSet();
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
    if (!_canWrite) return;
    if (_mode == _modeCustom) {
      if (!_canCustom) return;
      if (!_customAllDay) {
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
    }

    final days = _weekDays.toList()..sort();
    Navigator.of(context).pop(
      WorkingModeEntity(
        workingMode: _mode,
        cyclicConfig: _mode == _modeCustom
            ? [
                WorkingModeCyclicConfigEntity(
                  isAllDay: _customAllDay ? 1 : 2,
                  startTime: _customAllDay ? 0 : _startMinutes,
                  endTime: _customAllDay ? 0 : _endMinutes,
                  weekDays: _customAllDay ? const [1, 2, 3, 4, 5, 6, 7] : days,
                ),
              ]
            : const [],
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
      appBar: AppBar(title: Text(l10n.workingMode)),
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
                if (!_canCustom)
                  Padding(
                    key: const Key('working_mode_needs_gateway'),
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(l10n.workingModeNeedsGateway),
                  ),
                RadioGroup<int>(
                  groupValue: _mode,
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _mode = v);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile<int>(
                        key: const Key('working_mode_option_1'),
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.workingModeAllDay),
                        value: _modeAllDay,
                        enabled: !(_unknown || !_canWrite),
                      ),
                      RadioListTile<int>(
                        key: const Key('working_mode_option_2'),
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.workingModeAllDayOff),
                        value: _modeOff,
                        enabled: !(_unknown || !_canWrite),
                      ),
                      if (_canCustom)
                        RadioListTile<int>(
                          key: const Key('working_mode_option_3'),
                          contentPadding: EdgeInsets.zero,
                          title: Text(l10n.workingModeCustom),
                          value: _modeCustom,
                          enabled: !_unknown,
                        ),
                    ],
                  ),
                ),
                if (_mode == _modeCustom && _canCustom) ...[
                  SwitchListTile(
                    key: const Key('working_mode_custom_all_day'),
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.passageModeAllDay),
                    value: _customAllDay,
                    onChanged: _unknown
                        ? null
                        : (v) => setState(() => _customAllDay = v),
                  ),
                  if (!_customAllDay) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final day in weekLabels.keys)
                          FilterChip(
                            key: Key('working_mode_week_$day'),
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
                      key: const Key('working_mode_start'),
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.passageModeStartTime),
                      trailing: Text(_fmtMinutes(_startMinutes)),
                      onTap: _unknown ? null : () => _pickTime(start: true),
                    ),
                    ListTile(
                      key: const Key('working_mode_end'),
                      contentPadding: EdgeInsets.zero,
                      title: Text(l10n.passageModeEndTime),
                      trailing: Text(_fmtMinutes(_endMinutes)),
                      onTap: _unknown ? null : () => _pickTime(start: false),
                    ),
                  ],
                ],
                if (_canWrite) ...[
                  const SizedBox(height: 16),
                  FilledButton(
                    key: const Key('working_mode_save'),
                    onPressed: _unknown ? null : () => _save(l10n),
                    child: Text(l10n.commonSave),
                  ),
                ],
              ],
            ),
    );
  }
}
