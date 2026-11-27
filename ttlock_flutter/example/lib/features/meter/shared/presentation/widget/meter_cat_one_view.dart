import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';

/// 4G 网络双态视图。
///
/// [info] 为 null ⇒ 「未配置成功」，展示区整体替换为配置按钮（spec §6.3）。
/// 网络类失败（重试态）由页面自己渲染，**不进本 widget** —— 那份状态里没有
/// 可展示的信息，也不该给出「配置服务器」按钮。
class MeterCatOneView extends StatelessWidget {
  const MeterCatOneView({
    super.key,
    required this.info,
    required this.onConfigure,
    required this.label,
    required this.rssiGradeLabel,
    required this.overseaYesLabel,
    required this.overseaNoLabel,
    required this.configureLabel,
    required this.reconfigureLabel,
  });

  final MeterCatOneInfoEntity? info;
  final VoidCallback onConfigure;

  /// 字段 key → 本地化标签（key 与 l10n getter 同名）。
  final String Function(String key) label;

  /// `rssiGrade` 0–3 → 本地化等级（0 未知 / 1 差 / 2 中 / 3 强）。
  final String Function(int grade) rssiGradeLabel;
  final String overseaYesLabel;
  final String overseaNoLabel;
  final String configureLabel;
  final String reconfigureLabel;

  @override
  Widget build(BuildContext context) {
    final current = info;
    if (current == null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(label('meterCatOneUnconfigured')),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('meter_cat_one_configure'),
              onPressed: onConfigure,
              child: Text(configureLabel),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          title: Text(label('meterCatOneRssiGrade')),
          subtitle: Text(rssiGradeLabel(current.rssiGrade)),
        ),
        ListTile(
          title: Text(label('meterCatOneNodeId')),
          subtitle: Text(current.catOneNodeId),
        ),
        ListTile(
          title: Text(label('meterCatOneCardNumber')),
          subtitle: Text(current.catOneCardNumber),
        ),
        ListTile(
          title: Text(label('meterCatOneOperator')),
          subtitle: Text(current.catOneOperator),
        ),
        ListTile(
          title: Text(label('meterCatOneImsi')),
          subtitle: Text(current.catOneImsi),
        ),
        ListTile(
          title: Text(label('meterCatOneApn')),
          subtitle: Text(current.catOneApn),
        ),
        ListTile(
          title: Text(label('meterCatOneOverseaCard')),
          subtitle: Text(current.overseaCard ? overseaYesLabel : overseaNoLabel),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: OutlinedButton(
            key: const Key('meter_cat_one_reconfigure'),
            onPressed: onConfigure,
            child: Text(reconfigureLabel),
          ),
        ),
      ],
    );
  }
}
