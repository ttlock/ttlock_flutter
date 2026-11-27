import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class WaterMeterRechargeResult {
  const WaterMeterRechargeResult({required this.amount, required this.m3});

  final double amount;
  final double m3;
}

/// 水表充值：只让用户输**金额**，水量由「金额 ÷ 单价」自动算。
///
/// 算出的水量只读展示，且**展示值与发出的值是同一个数**（都取 2 位小数），
/// 避免「看到的和充进去的不一致」。
class WaterMeterRechargeSheet extends ConsumerStatefulWidget {
  const WaterMeterRechargeSheet({super.key, required this.item});

  final WaterMeterEntity item;

  @override
  ConsumerState<WaterMeterRechargeSheet> createState() =>
      _WaterMeterRechargeSheetState();
}

class _WaterMeterRechargeSheetState
    extends ConsumerState<WaterMeterRechargeSheet> {
  final _amount = TextEditingController();
  var _amountText = '';

  @override
  void initState() {
    super.initState();
    _amount.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    if (_amount.text != _amountText) {
      setState(() => _amountText = _amount.text);
    }
  }

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  /// 单价不可用（空 / 非数 / ≤ 0）⇒ `null`，此时无法换算、不发起充值。
  double? get _price {
    final p = double.tryParse(widget.item.price.trim());
    return (p == null || p <= 0) ? null : p;
  }

  /// 充值水量 = 金额 ÷ 单价。金额或单价不可用时为 `null`。
  double? get _m3 {
    final price = _price;
    final amount = double.tryParse(_amountText.trim());
    if (price == null || amount == null || amount <= 0) return null;
    return double.parse((amount / price).toStringAsFixed(2));
  }

  void _submit() {
    final amount = double.tryParse(_amountText.trim());
    final m3 = _m3;
    if (amount == null || amount <= 0 || m3 == null) return;
    Navigator.of(context).pop(
      WaterMeterRechargeResult(amount: amount, m3: m3),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final m3 = _m3;
    return BaseBottomSheet(
      title: l10n.waterMeterRecharge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('water_meter_recharge_amount'),
            controller: _amount,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l10n.waterMeterRechargeAmount,
            ),
          ),
          const SizedBox(height: 16),
          // 只读：水量由金额与单价算出，不由用户输入。
          Row(
            children: [
              Text(
                l10n.waterMeterRechargeM3,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                m3 == null
                    ? '—'
                    : '${m3.toStringAsFixed(2)} ${l10n.meterUnitTon}',
                key: const Key('water_meter_recharge_m3_value'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('water_meter_recharge_submit'),
            onPressed: _submit,
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
  }
}
