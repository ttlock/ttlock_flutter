import 'package:flutter/material.dart';

/// 「标签 + 值」展示行。值为空时回落到占位符。
class MeterLabeledValueTile extends StatelessWidget {
  const MeterLabeledValueTile({
    super.key,
    required this.label,
    required this.value,
    this.emptyPlaceholder = '—',
  });

  final String label;
  final String value;
  final String emptyPlaceholder;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(label),
    subtitle: Text(value.isEmpty ? emptyPlaceholder : value),
  );
}
