import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class ElectricMeterRechargeResult {
  const ElectricMeterRechargeResult({required this.amount, required this.kwh});

  final double amount;
  final double kwh;
}

/// 电表充值：只让用户输**金额**，电量由「金额 ÷ 单价」自动算。
///
/// 算出的电量只读展示，且**展示值与发出的值是同一个数**（都取 2 位小数），
/// 避免「看到的和充进去的不一致」。
class ElectricMeterRechargeSheet extends ConsumerStatefulWidget {
  const ElectricMeterRechargeSheet({super.key, required this.item});

  final ElectricMeterEntity item;

  @override
  ConsumerState<ElectricMeterRechargeSheet> createState() =>
      _ElectricMeterRechargeSheetState();
}

class _ElectricMeterRechargeSheetState
    extends ConsumerState<ElectricMeterRechargeSheet> {
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

  /// 充值电量 = 金额 ÷ 单价。金额或单价不可用时为 `null`。
  double? get _kwh {
    final price = _price;
    final amount = double.tryParse(_amountText.trim());
    if (price == null || amount == null || amount <= 0) return null;
    return double.parse((amount / price).toStringAsFixed(2));
  }

  void _submit() {
    final amount = double.tryParse(_amountText.trim());
    final kwh = _kwh;
    if (amount == null || amount <= 0 || kwh == null) return;
    Navigator.of(context).pop(
      ElectricMeterRechargeResult(amount: amount, kwh: kwh),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final kwh = _kwh;
    return BaseBottomSheet(
      title: l10n.electricMeterRecharge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('electric_meter_recharge_amount'),
            controller: _amount,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l10n.electricMeterRechargeAmount,
            ),
          ),
          const SizedBox(height: 16),
          // 只读：电量由金额与单价算出，不由用户输入。
          Row(
            children: [
              Text(
                l10n.electricMeterRechargeKwh,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                kwh == null
                    ? '—'
                    : '${kwh.toStringAsFixed(2)} ${l10n.meterUnitKwh}',
                key: const Key('electric_meter_recharge_kwh_value'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_recharge_submit'),
            onPressed: _submit,
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
  }
}
