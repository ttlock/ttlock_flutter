import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

/// 限期 YMDHM；循环仅 YMD；永久不展示。
class CredentialDateRangeFields extends StatelessWidget {
  const CredentialDateRangeFields({
    super.key,
    required this.kind,
    this.start,
    this.end,
    required this.onStart,
    required this.onEnd,
    this.enabled = true,
  });

  final CredentialValidityKind kind;
  final DateTime? start;
  final DateTime? end;
  final ValueChanged<DateTime> onStart;
  final ValueChanged<DateTime> onEnd;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (kind == CredentialValidityKind.permanent) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context)!;
    final ymdOnly = kind == CredentialValidityKind.cyclic;
    return Column(
      children: [
        ListTile(
          title: Text(l10n.startDate),
          subtitle: Text(_fmt(start, ymdOnly: ymdOnly)),
          onTap: enabled
              ? () async {
                  final picked = await _pick(
                    context,
                    start ?? DateTime.now(),
                    ymdOnly: ymdOnly,
                  );
                  if (picked != null) onStart(picked);
                }
              : null,
        ),
        ListTile(
          title: Text(l10n.endDate),
          subtitle: Text(_fmt(end, ymdOnly: ymdOnly)),
          onTap: enabled
              ? () async {
                  final picked = await _pick(
                    context,
                    end ?? DateTime.now().add(const Duration(days: 7)),
                    ymdOnly: ymdOnly,
                  );
                  if (picked != null) onEnd(picked);
                }
              : null,
        ),
      ],
    );
  }

  static String _fmt(DateTime? d, {required bool ymdOnly}) {
    if (d == null) return '';
    final local = d.toLocal().toString();
    if (ymdOnly) {
      return local.length >= 10 ? local.substring(0, 10) : local;
    }
    return local.length >= 16 ? local.substring(0, 16) : local;
  }

  static Future<DateTime?> _pick(
    BuildContext context,
    DateTime initial, {
    required bool ymdOnly,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    );
    if (date == null || !context.mounted) return null;
    if (ymdOnly) {
      return DateTime(date.year, date.month, date.day);
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) {
      return DateTime(date.year, date.month, date.day);
    }
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
