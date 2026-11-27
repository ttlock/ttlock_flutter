import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

bool isPalmVeinPermanent(PalmVeinEntity palmVein) {
  if (palmVein.type == CredentialType.cycle) return false;
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return isZero(palmVein.startDate) && isZero(palmVein.endDate);
}

String formatPalmVeinPeriod(PalmVeinEntity palmVein, AppLocalizations l10n) {
  if (palmVein.type == CredentialType.cycle) {
    final cyclic = formatCyclicConfig(palmVein.cyclicConfig, l10n);
    return '$cyclic\n${_fmtYmd(palmVein.startDate)} – ${_fmtYmd(palmVein.endDate)}';
  }
  if (isPalmVeinPermanent(palmVein)) return l10n.permanent;
  return '${_fmt(palmVein.startDate)} – ${_fmt(palmVein.endDate)}';
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
