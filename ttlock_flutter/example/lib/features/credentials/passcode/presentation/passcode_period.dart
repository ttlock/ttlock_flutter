import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/cyclic_passcode_window.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

const cyclicPasscodePickerOrder = <KeyboardPwdType>[
  KeyboardPwdType.cyclicMonday,
  KeyboardPwdType.cyclicTuesday,
  KeyboardPwdType.cyclicWednesday,
  KeyboardPwdType.cyclicThursday,
  KeyboardPwdType.cyclicFriday,
  KeyboardPwdType.cyclicSaturday,
  KeyboardPwdType.cyclicSunday,
  KeyboardPwdType.cyclicDaily,
  KeyboardPwdType.cyclicWorkday,
  KeyboardPwdType.cyclicWeekend,
];

String formatPasscodeType(KeyboardPwdType type, AppLocalizations l10n) =>
    switch (type) {
      KeyboardPwdType.once => l10n.once,
      KeyboardPwdType.permanent => l10n.permanent,
      KeyboardPwdType.limited => l10n.limited,
      KeyboardPwdType.delete => l10n.passcode,
      KeyboardPwdType.cyclicWeekend => l10n.recurringWeekend,
      KeyboardPwdType.cyclicDaily => l10n.recurringDaily,
      KeyboardPwdType.cyclicWorkday => l10n.recurringWorkday,
      KeyboardPwdType.cyclicMonday => l10n.weekdayMon,
      KeyboardPwdType.cyclicTuesday => l10n.weekdayTue,
      KeyboardPwdType.cyclicWednesday => l10n.weekdayWed,
      KeyboardPwdType.cyclicThursday => l10n.weekdayThu,
      KeyboardPwdType.cyclicFriday => l10n.weekdayFri,
      KeyboardPwdType.cyclicSaturday => l10n.weekdaySat,
      KeyboardPwdType.cyclicSunday => l10n.weekdaySun,
    };

String formatPasscodePeriod(KeyboardPwdEntity pwd, AppLocalizations l10n) {
  if (isCyclicKeyboardPwdType(pwd.keyboardPwdType)) {
    final start = _fmtTime(pwd.startDate);
    final end = _fmtTime(pwd.endDate);
    return '${formatPasscodeType(pwd.keyboardPwdType, l10n)}  $start–$end';
  }
  if (_isPermanent(pwd)) return l10n.permanent;
  return '${_fmtDate(pwd.startDate)} – ${_fmtDate(pwd.endDate)}';
}

bool _isPermanent(KeyboardPwdEntity pwd) {
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return pwd.keyboardPwdType == KeyboardPwdType.permanent ||
      (isZero(pwd.startDate) && isZero(pwd.endDate));
}

String _fmtDate(DateTime? d) {
  if (d == null) return '';
  final local = d.toLocal().toString();
  return local.length >= 16 ? local.substring(0, 16) : local;
}

String _fmtTime(DateTime? d) {
  if (d == null) return '';
  final local = d.toLocal();
  final h = local.hour.toString().padLeft(2, '0');
  final m = local.minute.toString().padLeft(2, '0');
  return '$h:$m';
}

String formatMinutesOfDay(int minutes) {
  final h = (minutes ~/ 60).toString().padLeft(2, '0');
  final m = (minutes % 60).toString().padLeft(2, '0');
  return '$h:$m';
}

Future<DateTime?> pickPasscodeDateTime(
  BuildContext context,
  DateTime initial,
) async {
  final date = await showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: DateTime(2020),
    lastDate: DateTime(2099),
  );
  if (date == null || !context.mounted) return null;
  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initial),
  );
  if (time == null) {
    return DateTime(date.year, date.month, date.day);
  }
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}

/// 循环密码云端仅支持整点；用小时列表代替 [showTimePicker]，避免选分钟。
Future<int?> pickHourMinutes(BuildContext context, int currentMinutes) async {
  final l10n = AppLocalizations.of(context)!;
  final initialHour = (currentMinutes ~/ 60).clamp(0, 23);
  return showDialog<int>(
    context: context,
    builder: (ctx) => _HourOnlyPickerDialog(
      initialHour: initialHour,
      cancelLabel: l10n.commonCancel,
    ),
  );
}

class _HourOnlyPickerDialog extends StatefulWidget {
  const _HourOnlyPickerDialog({
    required this.initialHour,
    required this.cancelLabel,
  });

  final int initialHour;
  final String cancelLabel;

  @override
  State<_HourOnlyPickerDialog> createState() => _HourOnlyPickerDialogState();
}

class _HourOnlyPickerDialogState extends State<_HourOnlyPickerDialog> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(
      initialScrollOffset: ((widget.initialHour - 2) * 56.0).clamp(
        0,
        23 * 56.0,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      content: SizedBox(
        width: 280,
        height: 320,
        child: ListView.builder(
          controller: _controller,
          itemExtent: 56,
          itemCount: 24,
          itemBuilder: (_, hour) {
            final label = '${hour.toString().padLeft(2, '0')}:00';
            return ListTile(
              selected: hour == widget.initialHour,
              title: Text(label, textAlign: TextAlign.center),
              onTap: () => Navigator.of(context).pop(hour * 60),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelLabel),
        ),
      ],
    );
  }
}
