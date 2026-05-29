import 'package:flutter/material.dart';

import '../lock_settings_state.dart';

Future<int?> showPresetSecondsSheet(
  BuildContext context,
  LockSettingsState settings, {
  List<int> presets = const [0, 5, 10, 15, 30, 60],
}) async {
  return showModalBottomSheet<int>(
    context: context,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...presets.map(
            (sec) => ListTile(
              title: Text(sec == 0 ? 'Off' : '${sec}s'),
              onTap: () => Navigator.pop(ctx, sec),
            ),
          ),
          ListTile(
            title: const Text('Custom…'),
            onTap: () async {
              Navigator.pop(ctx);
              var value = settings.autoLockSeconds.toDouble().clamp(
                    settings.autoLockMin.toDouble(),
                    settings.autoLockMax.toDouble(),
                  );
              final custom = await showDialog<int>(
                context: context,
                builder: (dCtx) => StatefulBuilder(
                  builder: (dCtx, setState) => AlertDialog(
                    title: const Text('Auto lock (seconds)'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Slider(
                          value: value,
                          min: settings.autoLockMin.toDouble(),
                          max: settings.autoLockMax.toDouble(),
                          divisions:
                              (settings.autoLockMax - settings.autoLockMin).clamp(1, 895),
                          label: '${value.toInt()}s',
                          onChanged: (v) => setState(() => value = v),
                        ),
                        Text('${settings.autoLockMin}s – ${settings.autoLockMax}s'),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(dCtx), child: const Text('Cancel')),
                      FilledButton(
                        onPressed: () => Navigator.pop(dCtx, value.toInt()),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              );
              if (custom != null && context.mounted) {
                Navigator.pop(context, custom);
              }
            },
          ),
        ],
      ),
    ),
  );
}
