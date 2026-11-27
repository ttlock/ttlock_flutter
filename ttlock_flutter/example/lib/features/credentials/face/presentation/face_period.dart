import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

bool isFacePermanent(FaceEntity face) {
  if (face.type == CredentialType.cycle) return false;
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return isZero(face.startDate) && isZero(face.endDate);
}

String formatFacePeriod(FaceEntity face, AppLocalizations l10n) {
  if (face.type == CredentialType.cycle) {
    final cyclic = formatCyclicConfig(face.cyclicConfig, l10n);
    return '$cyclic\n${_fmtYmd(face.startDate)} – ${_fmtYmd(face.endDate)}';
  }
  if (isFacePermanent(face)) return l10n.permanent;
  return '${_fmt(face.startDate)} – ${_fmt(face.endDate)}';
}

String _fmt(DateTime? d) {
  if (d == null) return '';
  final local = d.toLocal().toString();
  return local.length >= 16 ? local.substring(0, 16) : local;
}

String _fmtYmd(DateTime? d) {
  if (d == null) return '';
  final local = d.toLocal().toString();
  return local.length >= 10 ? local.substring(0, 10) : local;
}

Future<DateTime?> pickFaceDateTime(
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
