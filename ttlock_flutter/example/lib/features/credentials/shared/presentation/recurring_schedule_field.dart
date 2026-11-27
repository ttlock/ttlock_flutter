import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class RecurringScheduleField extends StatelessWidget {
  const RecurringScheduleField({
    super.key,
    this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final CyclicSchedule? value;
  final ValueChanged<CyclicSchedule?> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final subtitle = value == null || !value!.isValid
        ? ''
        : formatCyclicConfig(value!.toCyclicConfig(), l10n);
    return ListTile(
      leading: const Icon(Icons.repeat),
      title: Text(l10n.recurring),
      subtitle: Text(subtitle.isEmpty ? l10n.selectRecurringDays : subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: enabled
          ? () async {
              final result = await RecurringScheduleSheetRoute(
                $extra: value,
              ).push<CyclicSchedule>(context);
              if (result != null) onChanged(result);
            }
          : null,
    );
  }
}
