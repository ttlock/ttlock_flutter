import 'package:flutter/material.dart';

import '../model/credential_params.dart';
import '../model/credential_validity.dart';

/// Bottom sheet to configure credential validity (permanent / timed / recurring).
class CredentialValiditySheet {
  static Future<CredentialValidity?> show(
    BuildContext context, {
    CredentialValidity? initial,
  }) async {
    var kind = initial?.kind ?? CredentialValidityKind.permanent;
    var startMs = initial?.mapOrNull(
          timed: (s, e) => s,
          recurring: (s, e, _) => s,
          once: (s, e) => s,
        ) ??
        0;
    var endMs = initial?.mapOrNull(
          timed: (s, e) => e,
          recurring: (s, e, _) => e,
          once: (s, e) => e,
        ) ??
        0;
    var weekdays = <int>{1, 2, 3, 4, 5};
    var startMinutes = 8 * 60;
    var endMinutes = 18 * 60;

    initial?.mapOrNull(
      recurring: (_, __, cycleList) {
        weekdays = cycleList.map((c) => c.weekDay).toSet();
        if (cycleList.isNotEmpty) {
          startMinutes = cycleList.first.startTime;
          endMinutes = cycleList.first.endTime;
        }
      },
    );

    return showModalBottomSheet<CredentialValidity>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) {
          Future<void> pickDateTime(bool isStart) async {
            final base = DateTime.now();
            final date = await showDatePicker(
              context: ctx,
              firstDate: base.subtract(const Duration(days: 1)),
              lastDate: base.add(const Duration(days: 365 * 5)),
              initialDate: base,
            );
            if (date == null || !ctx.mounted) return;
            final time = await showTimePicker(
              context: ctx,
              initialTime: TimeOfDay.fromDateTime(base),
            );
            if (time == null) return;
            final ms = DateTime(
              date.year,
              date.month,
              date.day,
              time.hour,
              time.minute,
            ).millisecondsSinceEpoch;
            setState(() {
              if (isStart) {
                startMs = ms;
              } else {
                endMs = ms;
              }
            });
          }

          CredentialValidity buildResult() {
            switch (kind) {
              case CredentialValidityKind.permanent:
                return const CredentialValidity.permanent();
              case CredentialValidityKind.timed:
                return CredentialValidity.timed(
                  startDate: startMs,
                  endDate: endMs,
                );
              case CredentialValidityKind.recurring:
                return CredentialValidity.recurring(
                  startDate: startMs,
                  endDate: endMs,
                  cycleList: buildCycleListFromWeekdays(
                    weekdays: weekdays,
                    startMinutes: startMinutes,
                    endMinutes: endMinutes,
                  ),
                );
              case CredentialValidityKind.once:
                return CredentialValidity.once(
                  startDate: startMs,
                  endDate: endMs,
                );
            }
          }

          final error = validateCredentialValidity(buildResult());

          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Validity', style: Theme.of(ctx).textTheme.titleMedium),
                const SizedBox(height: 12),
                SegmentedButton<CredentialValidityKind>(
                  segments: const [
                    ButtonSegment(
                      value: CredentialValidityKind.permanent,
                      label: Text('Permanent'),
                    ),
                    ButtonSegment(
                      value: CredentialValidityKind.timed,
                      label: Text('Timed'),
                    ),
                    ButtonSegment(
                      value: CredentialValidityKind.recurring,
                      label: Text('Recurring'),
                    ),
                  ],
                  selected: {kind},
                  onSelectionChanged: (s) =>
                      setState(() => kind = s.first),
                ),
                if (kind == CredentialValidityKind.timed ||
                    kind == CredentialValidityKind.recurring) ...[
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Start'),
                    subtitle: Text(
                      startMs == 0 ? 'Not set' : _formatMs(startMs),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => pickDateTime(true),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('End'),
                    subtitle: Text(endMs == 0 ? 'Not set' : _formatMs(endMs)),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => pickDateTime(false),
                  ),
                ],
                if (kind == CredentialValidityKind.recurring) ...[
                  const Text('Weekdays'),
                  Wrap(
                    spacing: 4,
                    children: List.generate(7, (i) {
                      final day = i + 1;
                      final selected = weekdays.contains(day);
                      return FilterChip(
                        label: Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][i]),
                        selected: selected,
                        onSelected: (v) {
                          setState(() {
                            if (v) {
                              weekdays.add(day);
                            } else {
                              weekdays.remove(day);
                            }
                          });
                        },
                      );
                    }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: startMinutes,
                          decoration: const InputDecoration(labelText: 'From'),
                          items: _timeOptions(),
                          onChanged: (v) =>
                              setState(() => startMinutes = v ?? startMinutes),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: endMinutes,
                          decoration: const InputDecoration(labelText: 'To'),
                          items: _timeOptions(),
                          onChanged: (v) =>
                              setState(() => endMinutes = v ?? endMinutes),
                        ),
                      ),
                    ],
                  ),
                ],
                if (error != null) ...[
                  const SizedBox(height: 8),
                  Text(error, style: TextStyle(color: Theme.of(ctx).colorScheme.error)),
                ],
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: error == null
                      ? () => Navigator.pop(ctx, buildResult())
                      : null,
                  child: const Text('Confirm'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static List<DropdownMenuItem<int>> _timeOptions() {
    return List.generate(24, (h) {
      final m = h * 60;
      return DropdownMenuItem(value: m, child: Text('${h.toString().padLeft(2, '0')}:00'));
    });
  }

  static String _formatMs(int ms) {
    final d = DateTime.fromMillisecondsSinceEpoch(ms);
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
  }
}
