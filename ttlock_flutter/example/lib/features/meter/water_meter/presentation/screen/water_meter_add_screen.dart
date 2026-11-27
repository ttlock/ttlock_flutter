import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/meter_connection_confirm_args.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_add_success_step.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_add_state.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class WaterMeterAddScreen extends ConsumerStatefulWidget {
  const WaterMeterAddScreen({super.key});

  @override
  ConsumerState<WaterMeterAddScreen> createState() =>
      _WaterMeterAddScreenState();
}

class _WaterMeterAddScreenState extends ConsumerState<WaterMeterAddScreen> {
  MeterPayMode _payMode = MeterPayMode.energy;
  final _price = TextEditingController();
  var _priceValid = false;

  @override
  void initState() {
    super.initState();
    _price.addListener(_onPriceChanged);
  }

  /// 预付费时单价必填且须 > 0（价格不能为 0，spec §9 风险 2）。
  void _onPriceChanged() {
    final v = double.tryParse(_price.text.trim());
    final valid = v != null && v > 0;
    if (valid != _priceValid) setState(() => _priceValid = valid);
  }

  @override
  void dispose() {
    _price.dispose();
    super.dispose();
  }

  /// 表单是否可提交：计能模式不需要单价；预付费必须填合法单价。
  bool get _formValid =>
      _payMode == MeterPayMode.energy || _priceValid;

  WaterMeterAddNotifier get _notifier =>
      ref.read(waterMeterAddProvider.notifier);

  String _failureText(AppException e, AppLocalizations l10n) =>
      getUserFriendlyMessage(e, l10n);

  /// 选中设备 → BLE 连接 → 弹窗让用户核对指示灯 → 依结果确认或回扫描。
  Future<void> _pick(TTMeterScanModel scan) async {
    await _notifier.connect(scan);
    if (!mounted) return;
    if (ref.read(waterMeterAddProvider).value?.step
        is! WaterMeterAddStepConfirmConnection) {
      return;
    }
    final confirmed = await const MeterConnectionConfirmRoute(
      $extra: MeterConnectionConfirmArgs(isWaterMeter: true),
    ).push<bool>(context);
    if (!mounted) return;
    if (confirmed ?? false) {
      await _notifier.confirmConnected();
    } else {
      await _notifier.cancelConnection();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(waterMeterAddProvider);
    final step = state.value?.step ?? const WaterMeterAddStep.form();
    final busy =
        step is WaterMeterAddStepConnecting ||
        step is WaterMeterAddStepSubmitting ||
        step is WaterMeterAddStepConfiguring;

    // 改名失败这类非阻断错误经一次性通道提示，不把用户推进 failure。
    ref.listen(waterMeterAddErrorProvider, (prev, next) {
      if (next != null && next != prev) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(next, l10n))),
        );
        ref.read(waterMeterAddErrorProvider.notifier).clear();
      }
    });

    return PopScope(
      // success 页不提供「回扫描」：init 成功时表已注册，往回退会留下残局
      // （spec §6.5 行为 1）。返回键同样落到 done。
      canPop: !busy && step is! WaterMeterAddStepSuccess,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (step is WaterMeterAddStepSuccess) {
          _notifier.skipSuccess();
        }
      },
      child: Scaffold(
        key: const Key('water_meter_add'),
        appBar: AppBar(
          title: Text(l10n.waterMeterAdd),
          automaticallyImplyLeading: !busy,
        ),
        body: switch (step) {
          WaterMeterAddStepForm() => _MeterForm(
            payMode: _payMode,
            priceController: _price,
            priceLabel: l10n.waterMeterPrice,
            priceUnit: l10n.waterMeterPriceUnit,
            formValid: _formValid,
            payModeLabel: l10n.waterMeterPayMode,
            payModeEnergyLabel: l10n.waterMeterPayModeEnergy,
            payModePrepaidLabel: l10n.waterMeterPayModePrepaid,
            submitLabel: l10n.commonConfirm,
            onPayModeChanged: (m) => setState(() => _payMode = m),
            onSubmit: () => _notifier.beginAdd(
              payMode: _payMode,
              price: double.tryParse(_price.text.trim()) ?? 0,
            ),
          ),
          WaterMeterAddStepScanning(:final devices) => _ScanningView(
            hint: l10n.waterMeterScanHint,
            emptyText: l10n.waterMeterNoDevice,
            devices: devices.values.toList()
              ..sort((a, b) => b.rssi.compareTo(a.rssi)),
            onPick: _pick,
          ),
          WaterMeterAddStepConnecting() => _BusyView(
            label: l10n.waterMeterConnecting,
          ),
          WaterMeterAddStepConfirmConnection() => _BusyView(
            label: l10n.waterMeterAwaitConfirm,
          ),
          WaterMeterAddStepSubmitting() => _BusyView(
            label: l10n.waterMeterSubmitting,
          ),
          WaterMeterAddStepSuccess(:final needsApn) => MeterAddSuccessStep(
            title: l10n.meterAddSuccessTitle,
            nameLabel: l10n.meterAddSuccessNameLabel,
            nameHint: '',
            apnLabel: l10n.meterAddSuccessApnLabel,
            apnHint: l10n.meterAddSuccessApnHint,
            doneLabel: l10n.meterAddSuccessDone,
            needsApn: needsApn,
            enabled: true,
            onDone: (name, apn) =>
                _notifier.finishSuccess(name: name, apn: apn),
          ),
          WaterMeterAddStepConfiguring() => _BusyView(
            label: l10n.waterMeterConfiguring,
          ),
          WaterMeterAddStepDone(:final catOneFailed) => _DoneView(
            label: l10n.waterMeterAddDone,
            hint: catOneFailed ? l10n.meterAddSuccessCatOneHint : null,
            doneLabel: l10n.meterAddSuccessDone,
            onDone: () => Navigator.of(context).pop(true),
          ),
          WaterMeterAddStepFailure(:final error) => _FailureView(
            message: _failureText(error, l10n),
            retryLabel: l10n.commonRetry,
            onRetry: _notifier.restart,
          ),
        },
      ),
    );
  }
}

class _ScanningView extends StatelessWidget {
  const _ScanningView({
    required this.hint,
    required this.emptyText,
    required this.devices,
    required this.onPick,
  });

  final String hint;
  final String emptyText;
  final List<TTMeterScanModel> devices;
  final ValueChanged<TTMeterScanModel> onPick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(hint)),
            ],
          ),
        ),
        if (devices.isEmpty)
          Padding(padding: const EdgeInsets.all(16), child: Text(emptyText))
        else
          Expanded(
            child: ListView(
              children: devices
                  .map(
                    (s) {
                      final canAdd = !s.isInited;
                      return ListTile(
                        key: Key('water_meter_scan_${s.mac}'),
                        enabled: canAdd,
                        leading: Icon(
                          Icons.water_drop_outlined,
                          color: canAdd ? null : Colors.grey,
                        ),
                        title: Text(s.name.isEmpty ? s.mac : s.name),
                        subtitle: Text(
                          canAdd
                              ? '${s.mac}  RSSI ${s.rssi}'
                              : '${s.mac}  已初始化',
                        ),
                        onTap: canAdd ? () => onPick(s) : null,
                      );
                    },
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

/// 表单：计费模式 + （仅预付费）单价。
///
/// 名称已从表单移除，改由成功页非必填补录（需求 1）。
class _MeterForm extends StatelessWidget {
  const _MeterForm({
    required this.payMode,
    required this.priceController,
    required this.priceLabel,
    required this.priceUnit,
    required this.formValid,
    required this.payModeLabel,
    required this.payModeEnergyLabel,
    required this.payModePrepaidLabel,
    required this.submitLabel,
    required this.onPayModeChanged,
    required this.onSubmit,
  });

  final MeterPayMode payMode;
  final TextEditingController priceController;
  final String priceLabel;
  final String priceUnit;

  /// 预付费时单价是否已填且合法 —— 决定「下一步」是否可点。
  final bool formValid;
  final String payModeLabel;
  final String payModeEnergyLabel;
  final String payModePrepaidLabel;
  final String submitLabel;
  final ValueChanged<MeterPayMode> onPayModeChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      DropdownButtonFormField<MeterPayMode>(
        key: const Key('water_meter_pay_mode'),
        initialValue: payMode,
        decoration: InputDecoration(labelText: payModeLabel),
        items: [
          DropdownMenuItem(
            value: MeterPayMode.energy,
            child: Text(payModeEnergyLabel),
          ),
          DropdownMenuItem(
            value: MeterPayMode.prepaid,
            child: Text(payModePrepaidLabel),
          ),
        ],
        onChanged: (m) {
          if (m != null) onPayModeChanged(m);
        },
      ),
      // 预付费必须带单价（价格不能为 0），计能模式没有单价概念。
      if (payMode == MeterPayMode.prepaid) ...[
        const SizedBox(height: 12),
        TextField(
          key: const Key('water_meter_price'),
          controller: priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: priceLabel,
            suffixText: priceUnit,
          ),
        ),
      ],
      const SizedBox(height: 16),
      FilledButton(
        key: const Key('water_meter_submit'),
        onPressed: formValid ? onSubmit : null,
        child: Text(submitLabel),
      ),
    ],
  );
}

class _BusyView extends StatelessWidget {
  const _BusyView({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(label),
        ],
      ),
    );
  }
}

class _DoneView extends StatelessWidget {
  const _DoneView({
    required this.label,
    required this.doneLabel,
    required this.onDone,
    this.hint,
  });

  final String label;
  final String doneLabel;
  final VoidCallback onDone;

  /// `configureCatOne` 失败时的补充提示（spec §6.5）。
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            Text(label),
            if (hint != null) ...[
              const SizedBox(height: 8),
              Text(
                hint!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('water_meter_add_done'),
              onPressed: onDone,
              child: Text(doneLabel),
            ),
          ],
        ),
      ),
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TextButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
