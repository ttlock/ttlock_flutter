import 'package:flutter/material.dart';

/// 一个操作项。`onTap == null` ⇒ 当前不可用（操作进行中），渲染为禁用态。
@immutable
class MeterOpsItem {
  const MeterOpsItem({
    required this.itemKey,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Key itemKey;
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
}

/// 设备设置页的「操作」分区。
///
/// 显隐由各 feature 自己决定后传入 [items]（spec §4.3：widget 内不写表型分支）：
/// 电表传「最大功率」、水表传「总用量」；电价调整与清零**仅在预付费时**传入
/// （spec §6.2 —— 计能模式只统计用量，没有可清除的剩余量）。
class MeterOpsSection extends StatelessWidget {
  const MeterOpsSection({super.key, required this.title, required this.items});

  final String title;
  final List<MeterOpsItem> items;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
      for (final item in items)
        ListTile(
          key: item.itemKey,
          leading: Icon(item.icon),
          title: Text(item.label),
          enabled: item.onTap != null,
          onTap: item.onTap,
        ),
      const Divider(),
    ],
  );
}
