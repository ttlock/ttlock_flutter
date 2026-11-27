import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class ElectricMeterMaxPowerSheet extends ConsumerStatefulWidget {
  const ElectricMeterMaxPowerSheet({super.key, required this.item});

  final ElectricMeterEntity item;

  @override
  ConsumerState<ElectricMeterMaxPowerSheet> createState() =>
      _ElectricMeterMaxPowerSheetState();
}

class _ElectricMeterMaxPowerSheetState
    extends ConsumerState<ElectricMeterMaxPowerSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.item.maxPower);
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
      title: l10n.electricMeterMaxPower,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('electric_meter_max_power_field'),
            controller: _controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: l10n.electricMeterMaxPowerHint,
              suffixText: l10n.meterUnitKw,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_max_power_submit'),
            onPressed: () {
              final v = int.tryParse(_controller.text.trim());
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
