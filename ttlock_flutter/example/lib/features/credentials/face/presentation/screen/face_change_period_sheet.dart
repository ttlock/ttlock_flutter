import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class FaceChangePeriodResult {
  const FaceChangePeriodResult({
    required this.start,
    required this.end,
    this.schedule,
  });
  final DateTime start;
  final DateTime end;
  final CyclicSchedule? schedule;
}

class FaceChangePeriodSheet extends ConsumerStatefulWidget {
  const FaceChangePeriodSheet({super.key, required this.item});
  final FaceEntity item;

  @override
  ConsumerState<FaceChangePeriodSheet> createState() =>
      _FaceChangePeriodSheetState();
}

class _FaceChangePeriodSheetState extends ConsumerState<FaceChangePeriodSheet> {
  late DateTime _start;
  late DateTime _end;
  late final bool _cyclic;
  CyclicSchedule? _schedule;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _cyclic = item.type == CredentialType.cycle;
    _start =
        (item.startDate == null || item.startDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now()
        : item.startDate!;
    _end = (item.endDate == null || item.endDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now().add(const Duration(days: 7))
        : item.endDate!;
    _schedule = CyclicSchedule.tryFrom(item.cyclicConfig);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final kind = _cyclic
        ? CredentialValidityKind.cyclic
        : CredentialValidityKind.limited;
    return BaseBottomSheet(
      title: l10n.validityPeriod,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CredentialDateRangeFields(
            kind: kind,
            start: _start,
            end: _end,
            onStart: (v) => setState(() => _start = v),
            onEnd: (v) => setState(() => _end = v),
          ),
          if (_cyclic)
            RecurringScheduleField(
              value: _schedule,
              onChanged: (v) => setState(() => _schedule = v),
            ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(
              FaceChangePeriodResult(
                start: _start,
                end: _end,
                schedule: _cyclic ? _schedule : null,
              ),
            ),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
