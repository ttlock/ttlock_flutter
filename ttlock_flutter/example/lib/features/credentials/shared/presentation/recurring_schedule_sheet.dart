import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class RecurringScheduleSheet extends StatefulWidget {
  const RecurringScheduleSheet({super.key, this.initial});

  final CyclicSchedule? initial;

  @override
  State<RecurringScheduleSheet> createState() => _RecurringScheduleSheetState();
}

class _RecurringScheduleSheetState extends State<RecurringScheduleSheet> {
  late Set<int> _days;
  late int _startMinutes;
  late int _endMinutes;

  @override
  void initState() {
    super.initState();
    final i = widget.initial;
    _days = {...?i?.weekDays};
    _startMinutes = i?.startMinutes ?? 480;
    _endMinutes = i?.endMinutes ?? 1080;
  }

  String _label(int d, AppLocalizations l10n) => switch (d) {
    1 => l10n.weekdayMon,
    2 => l10n.weekdayTue,
    3 => l10n.weekdayWed,
    4 => l10n.weekdayThu,
    5 => l10n.weekdayFri,
    6 => l10n.weekdaySat,
    _ => l10n.weekdaySun,
  };

  String _fmt(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  Future<void> _pickStart(AppLocalizations l10n) async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _startMinutes ~/ 60,
        minute: _startMinutes % 60,
      ),
    );
    if (t == null) return;
    setState(() => _startMinutes = t.hour * 60 + t.minute);
  }

  Future<void> _pickEnd(AppLocalizations l10n) async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _endMinutes ~/ 60, minute: _endMinutes % 60),
    );
    if (t == null) return;
    setState(() => _endMinutes = t.hour * 60 + t.minute);
  }

  void _confirm(AppLocalizations l10n) {
    final schedule = CyclicSchedule(
      weekDays: _days,
      startMinutes: _startMinutes,
      endMinutes: _endMinutes,
    );
    if (_days.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.selectRecurringDays)));
      return;
    }
    if (!schedule.isValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.endTimeMustAfterStart)));
      return;
    }
    Navigator.of(context).pop(schedule);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BaseBottomSheet(
      title: l10n.recurring,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.4,
            children: [
              for (var d = 1; d <= 7; d++)
                FilterChip(
                  label: Text(_label(d, l10n)),
                  selected: _days.contains(d),
                  onSelected: (sel) {
                    setState(() {
                      if (sel) {
                        _days.add(d);
                      } else {
                        _days.remove(d);
                      }
                    });
                  },
                ),
            ],
          ),
          ListTile(
            title: Text(l10n.startTimeOfDay),
            subtitle: Text(_fmt(_startMinutes)),
            onTap: () => _pickStart(l10n),
          ),
          ListTile(
            title: Text(l10n.endTimeOfDay),
            subtitle: Text(_fmt(_endMinutes)),
            onTap: () => _pickEnd(l10n),
          ),
          FilledButton(
            onPressed: () => _confirm(l10n),
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
  }
}
