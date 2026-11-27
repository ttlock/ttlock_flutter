import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_add_state.dart';

class StandaloneDoorSensorAddScreen extends ConsumerStatefulWidget {
  const StandaloneDoorSensorAddScreen({super.key});

  @override
  ConsumerState<StandaloneDoorSensorAddScreen> createState() =>
      _StandaloneDoorSensorAddScreenState();
}

class _StandaloneDoorSensorAddScreenState
    extends ConsumerState<StandaloneDoorSensorAddScreen> {
  final _deviceName = TextEditingController();
  final _wifiName = TextEditingController();
  final _wifiPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(standaloneDoorSensorAddProvider.notifier).startScan(),
    );
  }

  @override
  void dispose() {
    _deviceName.dispose();
    _wifiName.dispose();
    _wifiPassword.dispose();
    super.dispose();
  }

  StandaloneDoorSensorAddNotifier get _notifier =>
      ref.read(standaloneDoorSensorAddProvider.notifier);

  void _onPick(TTStandaloneDoorSensorScanModel scan) {
    // 名称默认取扫描模型 name；用户可编辑后提交。
    _deviceName.text = scan.name;
    _notifier.pick(scan);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(standaloneDoorSensorAddProvider);
    final step =
        state.value?.step ?? const StandaloneDoorSensorAddStep.scanning();

    // done → 配网成功，弹回上一页（返回 true）。
    ref.listen(standaloneDoorSensorAddProvider, (prev, next) {
      final prevStep = prev?.value?.step;
      final nextStep = next.value?.step;
      if (nextStep is StandaloneAddStepDone &&
          prevStep is! StandaloneAddStepDone) {
        Navigator.of(context).pop(true);
      }
    });

    return Scaffold(
      key: const Key('standalone_add'),
      appBar: AppBar(title: Text(l10n.addStandaloneDoorSensor)),
      body: switch (step) {
        StandaloneAddStepScanning(:final devices) => _ScanningView(
          hint: l10n.standaloneDoorScanHint,
          emptyText: l10n.standaloneDoorNoDevice,
          devices: devices.values.toList()
            ..sort((a, b) => b.rssi.compareTo(a.rssi)),
          onPick: _onPick,
        ),
        StandaloneAddStepCredential() => _CredentialForm(
          deviceNameController: _deviceName,
          wifiNameController: _wifiName,
          wifiPasswordController: _wifiPassword,
          deviceNameLabel: l10n.standaloneDoorDeviceName,
          wifiNameLabel: l10n.standaloneDoorWifiName,
          wifiPasswordLabel: l10n.standaloneDoorWifiPassword,
          submitLabel: l10n.commonConfirm,
          onSubmit: () => _notifier.submit(
            name: _deviceName.text,
            wifiName: _wifiName.text,
            wifiPassword: _wifiPassword.text,
          ),
        ),
        StandaloneAddStepInitializing() => _BusyView(
          label: l10n.standaloneDoorInitializing,
        ),
        StandaloneAddStepDone() => const SizedBox.shrink(),
        StandaloneAddStepFailure(:final error) => _FailureView(
          title: l10n.standaloneDoorAddFailed,
          message: getUserFriendlyMessage(error, l10n),
          retryLabel: l10n.commonRetry,
          onRetry: _notifier.restart,
        ),
      },
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
  final List<TTStandaloneDoorSensorScanModel> devices;
  final ValueChanged<TTStandaloneDoorSensorScanModel> onPick;

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
                    (s) => ListTile(
                      key: Key('standalone_scan_${s.mac}'),
                      leading: const Icon(Icons.sensor_door_outlined),
                      title: Text(s.name.isEmpty ? s.mac : s.name),
                      subtitle: Text('${s.mac}  RSSI ${s.rssi}'),
                      onTap: () => onPick(s),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class _CredentialForm extends StatelessWidget {
  const _CredentialForm({
    required this.deviceNameController,
    required this.wifiNameController,
    required this.wifiPasswordController,
    required this.deviceNameLabel,
    required this.wifiNameLabel,
    required this.wifiPasswordLabel,
    required this.submitLabel,
    required this.onSubmit,
  });

  final TextEditingController deviceNameController;
  final TextEditingController wifiNameController;
  final TextEditingController wifiPasswordController;
  final String deviceNameLabel;
  final String wifiNameLabel;
  final String wifiPasswordLabel;
  final String submitLabel;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          key: const Key('standalone_device_name'),
          controller: deviceNameController,
          decoration: InputDecoration(labelText: deviceNameLabel),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('standalone_wifi_name'),
          controller: wifiNameController,
          decoration: InputDecoration(labelText: wifiNameLabel),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('standalone_wifi_password'),
          controller: wifiPasswordController,
          obscureText: true,
          decoration: InputDecoration(labelText: wifiPasswordLabel),
        ),
        const SizedBox(height: 16),
        FilledButton(
          key: const Key('standalone_submit'),
          onPressed: onSubmit,
          child: Text(submitLabel),
        ),
      ],
    );
  }
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

class _FailureView extends StatelessWidget {
  const _FailureView({
    required this.title,
    required this.message,
    required this.retryLabel,
    required this.onRetry,
  });

  final String title;
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
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TextButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
