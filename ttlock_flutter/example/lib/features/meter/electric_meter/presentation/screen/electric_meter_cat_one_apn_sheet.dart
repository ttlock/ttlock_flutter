import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 海外站点的 APN 输入（spec §6.3）。国内站点不弹这一页，直接执行。
///
/// pop 出 trim 后的 APN 字符串；取消则不 pop。
class ElectricMeterCatOneApnSheet extends ConsumerStatefulWidget {
  const ElectricMeterCatOneApnSheet({super.key});

  @override
  ConsumerState<ElectricMeterCatOneApnSheet> createState() =>
      _ElectricMeterCatOneApnSheetState();
}

class _ElectricMeterCatOneApnSheetState
    extends ConsumerState<ElectricMeterCatOneApnSheet> {
  final _apn = TextEditingController();
  var _valid = false;

  @override
  void initState() {
    super.initState();
    _apn.addListener(_onChanged);
  }

  void _onChanged() {
    final valid = _apn.text.trim().isNotEmpty;
    if (valid != _valid) setState(() => _valid = valid);
  }

  @override
  void dispose() {
    _apn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.meterCatOneApnSheetTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.meterCatOneApnSheetHint),
          const SizedBox(height: 16),
          TextField(
            key: const Key('electric_meter_cat_one_apn'),
            controller: _apn,
            autofocus: true,
            autocorrect: false,
            decoration: InputDecoration(labelText: l10n.meterCatOneApnLabel),
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_cat_one_apn_submit'),
            onPressed: _valid
                ? () => Navigator.of(context).pop(_apn.text.trim())
                : null,
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
  }
}
