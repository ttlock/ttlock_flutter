import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 电价调整（独立入口，仅预付费模式，spec §6.2）。
///
/// 与「计费模式切换」sheet 里可输电价那条路径并存 —— 两条路径都指向同一设备
/// 状态，互不替代：已处于预付费、只想改单价时不必重走一次切模式。
class ElectricMeterPriceSheet extends ConsumerStatefulWidget {
  const ElectricMeterPriceSheet({super.key, required this.item});

  final ElectricMeterEntity item;

  @override
  ConsumerState<ElectricMeterPriceSheet> createState() =>
      _ElectricMeterPriceSheetState();
}

class _ElectricMeterPriceSheetState
    extends ConsumerState<ElectricMeterPriceSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.item.price);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.electricMeterPriceEdit,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('electric_meter_price_field'),
            controller: _controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: l10n.meterPriceHint,
              suffixText: l10n.electricMeterPriceUnit,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_price_submit'),
            onPressed: () {
              final v = double.tryParse(_controller.text.trim());
              // 单价须 > 0（spec §9 风险 2：可以为极小值，但不能为 0）。
              if (v == null || v <= 0) return;
              Navigator.of(context).pop(v);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
