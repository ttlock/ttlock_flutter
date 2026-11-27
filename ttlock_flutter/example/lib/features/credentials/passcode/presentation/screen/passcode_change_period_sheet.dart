import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_period.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class PasscodeChangePeriodResult {
  const PasscodeChangePeriodResult({required this.start, required this.end});
  final DateTime start;
  final DateTime end;
}

class PasscodeChangePeriodSheet extends ConsumerStatefulWidget {
  const PasscodeChangePeriodSheet({super.key, required this.pwd});
  final KeyboardPwdEntity pwd;

  @override
  ConsumerState<PasscodeChangePeriodSheet> createState() =>
      _PasscodeChangePeriodSheetState();
}

class _PasscodeChangePeriodSheetState
    extends ConsumerState<PasscodeChangePeriodSheet> {
  late DateTime _start;
  late DateTime _end;

  @override
  void initState() {
    super.initState();
    final pwd = widget.pwd;
    _start =
        (pwd.startDate == null || pwd.startDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now()
        : pwd.startDate!;
    _end = (pwd.endDate == null || pwd.endDate!.millisecondsSinceEpoch == 0)
        ? DateTime.now().add(const Duration(days: 7))
        : pwd.endDate!;
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
              final picked = await pickPasscodeDateTime(context, _start);
              if (picked != null) setState(() => _start = picked);
            },
          ),
          ListTile(
            title: Text(l10n.endDate),
            subtitle: Text(_end.toLocal().toString().substring(0, 16)),
            onTap: () async {
              final picked = await pickPasscodeDateTime(context, _end);
              if (picked != null) setState(() => _end = picked);
            },
          ),
          FilledButton(
            onPressed: () => Navigator.of(
              context,
            ).pop(PasscodeChangePeriodResult(start: _start, end: _end)),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
