import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../providers/ttlock_providers.dart';
import 'settings_operation.dart';

class LockPassageModePage extends ConsumerStatefulWidget {
  const LockPassageModePage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<LockPassageModePage> createState() => _LockPassageModePageState();
}

class _LockPassageModePageState extends ConsumerState<LockPassageModePage> {
  TTPassageModeType _type = TTPassageModeType.weekly;
  final Set<int> _weekdays = {1, 2, 3, 4, 5};
  TimeOfDay _start = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 18, minute: 0);

  int _minutes(TimeOfDay t) => t.hour * 60 + t.minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passage mode')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<TTPassageModeType>(
            value: _type,
            decoration: const InputDecoration(labelText: 'Type'),
            items: TTPassageModeType.values
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onChanged: (v) => setState(() => _type = v ?? _type),
          ),
          const SizedBox(height: 16),
          const Text('Weekdays'),
          Wrap(
            spacing: 8,
            children: List.generate(7, (i) {
              final day = i + 1;
              final selected = _weekdays.contains(day);
              return FilterChip(
                label: Text('Day $day'),
                selected: selected,
                onSelected: (v) {
                  setState(() {
                    if (v) {
                      _weekdays.add(day);
                    } else {
                      _weekdays.remove(day);
                    }
                  });
                },
              );
            }),
          ),
          ListTile(
            title: const Text('Start time'),
            subtitle: Text(_start.format(context)),
            onTap: () async {
              final t = await showTimePicker(context: context, initialTime: _start);
              if (t != null) setState(() => _start = t);
            },
          ),
          ListTile(
            title: const Text('End time'),
            subtitle: Text(_end.format(context)),
            onTap: () async {
              final t = await showTimePicker(context: context, initialTime: _end);
              if (t != null) setState(() => _end = t);
            },
          ),
          FilledButton(
            onPressed: () async {
              final lock = await ref.read(lockByMacProvider(widget.lockMac).future);
              if (lock == null) return;
              await runSettingsOperation(
                context,
                action: () => ref.read(lockApiProvider).addPassageMode(
                      _type,
                      _weekdays.toList()..sort(),
                      null,
                      _minutes(_start),
                      _minutes(_end),
                      lock.lockData,
                    ),
                successMessage: 'Passage mode added',
              );
            },
            child: const Text('Add passage mode'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () async {
              final lock = await ref.read(lockByMacProvider(widget.lockMac).future);
              if (lock == null) return;
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
                    ref.read(lockApiProvider).clearAllPassageModes(lock.lockData),
                successMessage: 'Passage modes cleared',
              );
            },
            child: const Text('Clear all passage modes'),
          ),
        ],
      ),
    );
  }
}
