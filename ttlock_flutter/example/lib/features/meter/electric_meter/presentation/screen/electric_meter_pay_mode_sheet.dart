import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 计费模式切换（spec §6.2）。选预付费时可**同步输电价**。
///
/// pop 出 `({MeterPayMode mode, double? price})`：计能模式 `price` 为 null。
class ElectricMeterPayModeSheet extends ConsumerStatefulWidget {
  const ElectricMeterPayModeSheet({super.key, required this.item});

  final ElectricMeterEntity item;

  @override
  ConsumerState<ElectricMeterPayModeSheet> createState() =>
      _ElectricMeterPayModeSheetState();
}

class _ElectricMeterPayModeSheetState
    extends ConsumerState<ElectricMeterPayModeSheet> {
  late MeterPayMode _mode;
  late final TextEditingController _price;

  @override
  void initState() {
    super.initState();
    _mode = widget.item.payMode;
    _price = TextEditingController(text: widget.item.price);
  }

  @override
  void dispose() {
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.meterPayModeSwitchTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 仓库既有形态：RadioGroup 持有 groupValue/onChanged，RadioListTile
          // 只管 value（照 ekey_send_screen.dart:67-84）。
          RadioGroup<MeterPayMode>(
            groupValue: _mode,
            onChanged: (m) {
              if (m != null) setState(() => _mode = m);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RadioListTile<MeterPayMode>(
                  key: const Key('electric_meter_pay_mode_energy'),
                  value: MeterPayMode.energy,
                  title: Text(l10n.electricMeterPayModeEnergy),
                ),
                RadioListTile<MeterPayMode>(
                  key: const Key('electric_meter_pay_mode_prepaid'),
                  value: MeterPayMode.prepaid,
                  title: Text(l10n.electricMeterPayModePrepaid),
                ),
              ],
            ),
          ),
          if (_mode == MeterPayMode.prepaid) ...[
            const SizedBox(height: 8),
            TextField(
              key: const Key('electric_meter_pay_mode_price'),
              controller: _price,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                hintText: l10n.meterPriceHint,
                suffixText: l10n.electricMeterPriceUnit,
              ),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_pay_mode_submit'),
            onPressed: () {
              if (_mode == MeterPayMode.prepaid) {
                final v = double.tryParse(_price.text.trim());
                // 预付费必须带一个 > 0 的电价（spec §9 风险 2）。
                if (v == null || v <= 0) return;
                Navigator.of(context).pop((mode: _mode, price: v));
                return;
              }
              // 计能模式不输电价。
              Navigator.of(context).pop((mode: _mode, price: null));
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
