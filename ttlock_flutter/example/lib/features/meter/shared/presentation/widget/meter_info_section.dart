import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_labeled_value_tile.dart';

/// 信息分区：标题 + 若干 label/value 行。
///
/// 行内复用 [MeterLabeledValueTile]，于是空值统一落到其 `emptyPlaceholder`
/// （`—`），各 feature 不必自己判空拼占位符。
class MeterInfoSection extends StatelessWidget {
  const MeterInfoSection({super.key, required this.title, required this.rows});

  final String title;
  final List<({String label, String value})> rows;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
      for (final row in rows)
        MeterLabeledValueTile(label: row.label, value: row.value),
      const Divider(),
    ],
  );
}
