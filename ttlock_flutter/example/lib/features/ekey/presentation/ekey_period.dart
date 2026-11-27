import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

bool isEkeyPermanent(KeyEntity key) {
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return isZero(key.startDate) && isZero(key.endDate);
}

String formatEkeyPeriod(KeyEntity key, AppLocalizations l10n) {
  if (isEkeyPermanent(key)) return l10n.permanent;
  final start = _fmt(key.startDate);
  final end = _fmt(key.endDate);
  return '$start – $end';
}

String _fmt(DateTime? d) {
  if (d == null) return '';
  final local = d.toLocal().toString();
  return local.length >= 16 ? local.substring(0, 16) : local;
}

Future<DateTime?> pickEkeyDateTime(
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
