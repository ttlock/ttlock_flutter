import 'package:flutter/material.dart';

/// 添加成功步骤 —— 嵌在添加屏状态机内，**不新开路由**（spec §6.5：
/// `configureCatOne` 依赖添加流程那条长活的 BLE 连接）。
///
/// 名称非必填（需求 1）；[needsApn] 为真时多一个**必填** APN 字段
/// （仅 Cat.1 + 海外站点，spec §6.5）。
/// [enabled] 为假表示正在配置服务器，此时「完成」不可点。
class MeterAddSuccessStep extends StatefulWidget {
  const MeterAddSuccessStep({
    super.key,
    required this.title,
    required this.nameLabel,
    required this.nameHint,
    required this.apnLabel,
    required this.apnHint,
    required this.doneLabel,
    required this.needsApn,
    required this.enabled,
    required this.onDone,
  });

  final String title;
  final String nameLabel;
  final String nameHint;
  final String apnLabel;
  final String apnHint;
  final String doneLabel;
  final bool needsApn;
  final bool enabled;

  /// [apn] 仅在 [needsApn] 为真时非空。
  final void Function(String name, String? apn) onDone;

  @override
  State<MeterAddSuccessStep> createState() => _MeterAddSuccessStepState();
}

class _MeterAddSuccessStepState extends State<MeterAddSuccessStep> {
  final _name = TextEditingController();
  final _apn = TextEditingController();
  var _apnFilled = false;

  @override
  void initState() {
    super.initState();
    _apn.addListener(_onApnChanged);
  }

  void _onApnChanged() {
    final filled = _apn.text.trim().isNotEmpty;
    if (filled != _apnFilled) setState(() => _apnFilled = filled);
  }

  @override
  void dispose() {
    _name.dispose();
    _apn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canSubmit = widget.enabled && (!widget.needsApn || _apnFilled);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.green),
            const SizedBox(width: 8),
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          key: const Key('meter_add_success_name'),
          controller: _name,
          decoration: InputDecoration(
            labelText: widget.nameLabel,
            hintText: widget.nameHint.isEmpty ? null : widget.nameHint,
          ),
        ),
        if (widget.needsApn) ...[
          const SizedBox(height: 12),
          Text(widget.apnHint, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          TextField(
            key: const Key('meter_add_success_apn'),
            controller: _apn,
            autocorrect: false,
            decoration: InputDecoration(labelText: widget.apnLabel),
          ),
        ],
        const SizedBox(height: 16),
        FilledButton(
          key: const Key('meter_add_success_done'),
          onPressed: canSubmit
              ? () => widget.onDone(
                  _name.text.trim(),
                  widget.needsApn ? _apn.text.trim() : null,
                )
              : null,
          child: Text(widget.doneLabel),
        ),
      ],
    );
  }
}
