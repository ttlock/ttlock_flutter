import 'package:flutter/material.dart';

/// 记录列表的单行。
class MeterRecordTile extends StatelessWidget {
  const MeterRecordTile({
    super.key,
    required this.title,
    required this.trailing,
    this.subtitle,
  });

  final String title;
  final String trailing;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => ListTile(
    dense: true,
    title: Text(title),
    subtitle: subtitle == null ? null : Text(subtitle!),
    trailing: Text(trailing),
  );
}
