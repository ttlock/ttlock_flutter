import 'package:flutter/material.dart';

class PresetSecondsSheet extends StatelessWidget {
  const PresetSecondsSheet({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final int selected;
  final ValueChanged<int> onSelected;

  static const _presets = [0, 5, 10, 15, 30, 60, 120, 300, 600, 900];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _presets.map((sec) {
            final isSelected = sec == selected;
            return ChoiceChip(
              label: Text(sec == 0 ? 'Off' : '${sec}s'),
              selected: isSelected,
              onSelected: (_) {
                onSelected(sec);
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
