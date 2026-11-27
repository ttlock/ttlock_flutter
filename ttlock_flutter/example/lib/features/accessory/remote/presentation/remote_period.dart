import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

bool isRemotePermanent(RemoteEntity remote) {
  if (remote.type == CredentialType.cycle) return false;
  bool isZero(DateTime? d) => d == null || d.millisecondsSinceEpoch == 0;
  return isZero(remote.startDate) && isZero(remote.endDate);
}

String formatRemotePeriod(RemoteEntity remote, AppLocalizations l10n) {
  if (remote.type == CredentialType.cycle) {
    final cyclic = formatCyclicConfig(remote.cyclicConfig, l10n);
    return '$cyclic\n${_fmtYmd(remote.startDate)} – ${_fmtYmd(remote.endDate)}';
  }
  if (isRemotePermanent(remote)) return l10n.permanent;
  return '${_fmt(remote.startDate)} – ${_fmt(remote.endDate)}';
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
