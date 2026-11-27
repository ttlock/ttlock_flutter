import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 计费模式切换（spec §6.2）。选预付费时可**同步输电价**。
///
/// pop 出 `({MeterPayMode mode, double? price})`：计能模式 `price` 为 null。
class WaterMeterPayModeSheet extends ConsumerStatefulWidget {
  const WaterMeterPayModeSheet({super.key, required this.item});

  final WaterMeterEntity item;

  @override
  ConsumerState<WaterMeterPayModeSheet> createState() =>
      _WaterMeterPayModeSheetState();
}

class _WaterMeterPayModeSheetState
    extends ConsumerState<WaterMeterPayModeSheet> {
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
          RadioGroup<MeterPayMode>(
            groupValue: _mode,
            onChanged: (m) {
              if (m != null) setState(() => _mode = m);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RadioListTile<MeterPayMode>(
                  key: const Key('water_meter_pay_mode_energy'),
                  value: MeterPayMode.energy,
                  title: Text(l10n.waterMeterPayModeEnergy),
                ),
                RadioListTile<MeterPayMode>(
                  key: const Key('water_meter_pay_mode_prepaid'),
                  value: MeterPayMode.prepaid,
                  title: Text(l10n.waterMeterPayModePrepaid),
                ),
              ],
            ),
          ),
          if (_mode == MeterPayMode.prepaid) ...[
            const SizedBox(height: 8),
            TextField(
              key: const Key('water_meter_pay_mode_price'),
              controller: _price,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                hintText: l10n.meterPriceHint,
                suffixText: l10n.waterMeterPriceUnit,
              ),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('water_meter_pay_mode_submit'),
            onPressed: () {
              if (_mode == MeterPayMode.prepaid) {
                final v = double.tryParse(_price.text.trim());
                // 预付费必须带一个 > 0 的电价（spec §9 风险 2）。
                if (v == null || v <= 0) return;
                Navigator.of(context).pop((mode: _mode, price: v));
                return;
              }
              Navigator.of(context).pop((mode: _mode, price: null));
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
