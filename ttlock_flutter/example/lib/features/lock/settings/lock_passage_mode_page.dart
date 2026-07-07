import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/widgets/async_value_view.dart';
import 'settings_operation.dart';

class LockPassageModePage extends HookConsumerWidget {
  const LockPassageModePage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));

    return Scaffold(
      appBar: AppBar(title: const Text('Passage mode')),
      body: lockAsync.when(
        loading: () => AsyncValueView.loading(),
        error: (e, _) => AsyncValueView.error(message: '$e'),
        data: (lock) {
          if (lock == null) {
            return AsyncValueView.error(message: 'Lock not found');
          }
          return _LockPassageModeBody(lockData: lock.lockData);
        },
      ),
    );
  }
}

class _LockPassageModeBody extends HookConsumerWidget {
  const _LockPassageModeBody({required this.lockData});

  final String lockData;

  int _minutes(TimeOfDay t) => t.hour * 60 + t.minute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = useState(TTPassageModeType.weekly);
    final weekdays = useState<Set<int>>({1, 2, 3, 4, 5});
    final start = useState(const TimeOfDay(hour: 8, minute: 0));
    final end = useState(const TimeOfDay(hour: 18, minute: 0));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<TTPassageModeType>(
          value: type.value,
          decoration: const InputDecoration(labelText: 'Type'),
          items: TTPassageModeType.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (v) => type.value = v ?? type.value,
        ),
        const SizedBox(height: 16),
        const Text('Weekdays'),
        Wrap(
          spacing: 8,
          children: List.generate(7, (i) {
            final day = i + 1;
            final selected = weekdays.value.contains(day);
            return FilterChip(
              label: Text('Day $day'),
              selected: selected,
              onSelected: (v) {
                final next = Set<int>.from(weekdays.value);
                if (v) {
                  next.add(day);
                } else {
                  next.remove(day);
                }
                weekdays.value = next;
              },
            );
          }),
        ),
        ListTile(
          title: const Text('Start time'),
          subtitle: Text(start.value.format(context)),
          onTap: () async {
            final t = await showTimePicker(context: context, initialTime: start.value);
            if (t != null) start.value = t;
          },
        ),
        ListTile(
          title: const Text('End time'),
          subtitle: Text(end.value.format(context)),
          onTap: () async {
            final t = await showTimePicker(context: context, initialTime: end.value);
            if (t != null) end.value = t;
          },
        ),
        FilledButton(
          onPressed: () async {
            await runSettingsOperation(
              context,
              action: () => TTLock.lock.addPassageMode(
                    type.value,
                    weekdays.value.toList()..sort(),
                    null,
                    _minutes(start.value),
                    _minutes(end.value),
                    lockData,
                  ),
              successMessage: 'Passage mode added',
            );
          },
          child: const Text('Add passage mode'),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () async {
            final ok = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Clear all passage modes?'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                  FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
                ],
              ),
            );
            if (ok != true || !context.mounted) return;
            await runSettingsOperation(
              context,
              action: () =>
                  TTLock.lock.clearAllPassageModes(lockData),
              successMessage: 'Passage modes cleared',
            );
          },
          child: const Text('Clear all passage modes'),
        ),
      ],
    );
  }
}
