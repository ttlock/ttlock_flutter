import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_period.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class EkeyChangePeriodResult {
  const EkeyChangePeriodResult({required this.start, required this.end});
  final DateTime start;
  final DateTime end;
}

class EkeyChangePeriodSheet extends ConsumerStatefulWidget {
  const EkeyChangePeriodSheet({super.key, required this.keyEntity});
  final KeyEntity keyEntity;

  @override
  ConsumerState<EkeyChangePeriodSheet> createState() =>
      _EkeyChangePeriodSheetState();
}

class _EkeyChangePeriodSheetState extends ConsumerState<EkeyChangePeriodSheet> {
  late DateTime _start;
  late DateTime _end;

  @override
  void initState() {
    super.initState();
    final key = widget.keyEntity;
    _start =
        (key.startDate == null || key.startDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now()
        : key.startDate!;
    _end = (key.endDate == null || key.endDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now().add(const Duration(days: 7))
        : key.endDate!;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.validityPeriod,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(l10n.startDate),
            subtitle: Text(_start.toLocal().toString().substring(0, 16)),
            onTap: () async {
              final picked = await pickEkeyDateTime(context, _start);
              if (picked != null) setState(() => _start = picked);
            },
          ),
          ListTile(
            title: Text(l10n.endDate),
            subtitle: Text(_end.toLocal().toString().substring(0, 16)),
            onTap: () async {
              final picked = await pickEkeyDateTime(context, _end);
              if (picked != null) setState(() => _end = picked);
            },
          ),
          FilledButton(
            onPressed: () => Navigator.of(
              context,
            ).pop(EkeyChangePeriodResult(start: _start, end: _end)),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
