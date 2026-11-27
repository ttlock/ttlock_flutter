import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

bool isCardPermanent(IdentityCardEntity card) {
  if (card.cardType == CredentialType.cycle) return false;
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return isZero(card.startDate) && isZero(card.endDate);
}

String formatCardPeriod(IdentityCardEntity card, AppLocalizations l10n) {
  if (card.cardType == CredentialType.cycle) {
    final cyclic = formatCyclicConfig(card.cyclicConfig, l10n);
    return '$cyclic\n${_fmtYmd(card.startDate)} – ${_fmtYmd(card.endDate)}';
  }
  if (isCardPermanent(card)) return l10n.permanent;
  return '${_fmt(card.startDate)} – ${_fmt(card.endDate)}';
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

Future<DateTime?> pickCardDateTime(
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
