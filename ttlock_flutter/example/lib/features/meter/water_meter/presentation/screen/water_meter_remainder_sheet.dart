import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 设置剩余水量 sheet。
class WaterMeterRemainderSheet extends ConsumerStatefulWidget {
  const WaterMeterRemainderSheet({super.key, required this.item});
  final WaterMeterEntity item;

  @override
  ConsumerState<WaterMeterRemainderSheet> createState() =>
      _WaterMeterRemainderSheetState();
}

class _WaterMeterRemainderSheetState
    extends ConsumerState<WaterMeterRemainderSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.item.remainderM3);
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
      title: l10n.meterSetRemainder,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('water_meter_remainder_field'),
            controller: _controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: l10n.meterSetRemainderHint,
              suffixText: l10n.meterUnitTon,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('water_meter_remainder_submit'),
            onPressed: () {
              final v = double.tryParse(_controller.text.trim());
              if (v == null || v < 0) return;
              Navigator.of(context).pop(v);
            },
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
