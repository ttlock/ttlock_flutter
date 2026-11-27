import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/gateway_type_capabilities.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_state.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/ip_address_field.dart';

class GatewayAddScreen extends ConsumerStatefulWidget {
  const GatewayAddScreen({super.key});

  @override
  ConsumerState<GatewayAddScreen> createState() => _GatewayAddScreenState();
}

class _GatewayAddScreenState extends ConsumerState<GatewayAddScreen> {
  final _gatewayName = TextEditingController();
  final _wifiPassword = TextEditingController();
  final _loginPassword = TextEditingController();
  final _staticIp = TextEditingController();
  final _subnetMask = TextEditingController();
  final _defaultGateway = TextEditingController();
  final _preferredDns = TextEditingController();
  final _alternateDns = TextEditingController();
  final _apn = TextEditingController();
  bool _useStaticIp = false;
  bool _useApn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(gatewayAddProvider.notifier).startScan(),
    );
  }

  @override
  void dispose() {
    _gatewayName.dispose();
    _wifiPassword.dispose();
    _loginPassword.dispose();
    _staticIp.dispose();
    _subnetMask.dispose();
    _defaultGateway.dispose();
    _preferredDns.dispose();
    _alternateDns.dispose();
    _apn.dispose();
    super.dispose();
  }

  GatewayAddNotifier get _notifier => ref.read(gatewayAddProvider.notifier);

  String _failureText(AppException e, AppLocalizations l10n) {
    if (e is AppBusinessException) {
      if (e.code == GatewayAddNotifier.notConfirmedCode) {
        return l10n.gatewayInitNotConfirmed;
      }
      if (e.code == GatewayAddNotifier.connectFailedCode) {
        return l10n.gatewayConnectFailed;
      }
      if (e.code == GatewayAddNotifier.uidMissingCode) {
        return l10n.gatewayUserUidMissing;
      }
    }
    return getUserFriendlyMessage(e, l10n);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(gatewayAddProvider);
    final step = state.value?.step ?? const GatewayAddStep.scanning();
    final busy =
        step is GatewayAddStepConnecting ||
        step is GatewayAddStepInitializing ||
        step is GatewayAddStepConfirming;

    return Scaffold(
      key: const Key('gateway_add'),
      appBar: AppBar(
        title: Text(l10n.gatewayAdd),
        automaticallyImplyLeading: !busy,
      ),
      body: switch (step) {
        GatewayAddStepScanning(:final devices) => _ScanningView(
          hint: l10n.gatewayScanHint,
          emptyText: l10n.gatewayNoDevice,
          devices: devices.values.toList()
            ..sort((a, b) => b.rssi.compareTo(a.rssi)),
          onPick: _notifier.pick,
        ),
        GatewayAddStepConnecting() => _BusyView(label: l10n.gatewayConnecting),
        GatewayAddStepWifi() => _WifiListView(
          hint: l10n.gatewayWifiHint,
          emptyText: l10n.gatewayNoWifi,
          wifiList: state.value?.wifiList ?? const [],
          scanning: state.value?.wifiScanning ?? false,
          onSelect: _notifier.selectWifi,
        ),
        GatewayAddStepCredential(:final wifi) => _CredentialForm(
          wifiName: wifi?.name,
          needsWifi: state.value?.gatewayType != null &&
              gatewayNeedsWifi(state.value!.gatewayType!),
          supportsStaticIp: state.value?.gatewayType != null &&
              gatewaySupportsStaticIp(state.value!.gatewayType!),
          needsApn: state.value?.gatewayType != null &&
              gatewayNeedsApn(state.value!.gatewayType!),
          gatewayNameController: _gatewayName,
          wifiPasswordController: _wifiPassword,
          loginPasswordController: _loginPassword,
          useStaticIp: _useStaticIp,
          onUseStaticIpChanged: (v) => setState(() => _useStaticIp = v),
          staticIpController: _staticIp,
          subnetMaskController: _subnetMask,
          defaultGatewayController: _defaultGateway,
          preferredDnsController: _preferredDns,
          alternateDnsController: _alternateDns,
          useApn: _useApn,
          onUseApnChanged: (v) => setState(() => _useApn = v),
          apnController: _apn,
          gatewayNameLabel: l10n.gatewayNameLabel,
          wifiPasswordLabel: l10n.gatewayWifiPassword,
          accountPasswordLabel: l10n.gatewayAccountPassword,
          accountPasswordHelper: l10n.gatewayAccountPasswordHint,
          useStaticIpLabel: l10n.gatewayUseStaticIp,
          useApnLabel: l10n.gatewayUseApn,
          apnLabel: l10n.gatewayApn,
          apnHint: l10n.gatewayApnHint,
          staticIpLabel: l10n.staticIpAddress,
          subnetMaskLabel: l10n.subnetMask,
          defaultGatewayLabel: l10n.defaultGateway,
          preferredDnsLabel: l10n.preferredDns,
          alternateDnsLabel: l10n.alternateDnsOptional,
          submitLabel: l10n.commonConfirm,
          onSubmit: () => _notifier.submit(
            gatewayName: _gatewayName.text,
            wifiPassword: _wifiPassword.text,
            loginPassword: _loginPassword.text,
            useStaticIp: _useStaticIp,
            staticIp: _useStaticIp ? _staticIp.text : null,
            subnetMask: _useStaticIp ? _subnetMask.text : null,
            defaultGateway: _useStaticIp ? _defaultGateway.text : null,
            preferredDns: _useStaticIp ? _preferredDns.text : null,
            alternateDns: _useStaticIp ? _alternateDns.text : null,
            apn: _useApn ? _apn.text : null,
          ),
        ),
        GatewayAddStepInitializing() => _BusyView(
          label: l10n.gatewayInitializing,
        ),
        GatewayAddStepConfirming() => _BusyView(
          label: l10n.gatewayConfirmingHint,
        ),
        GatewayAddStepDone() => _DoneView(
          label: l10n.gatewayAddDone,
          doneLabel: l10n.commonConfirm,
          onDone: () => Navigator.of(context).pop(true),
        ),
        GatewayAddStepFailure(:final error) => _FailureView(
          message: _failureText(error, l10n),
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
  final List<TTGatewayScanModel> devices;
  final ValueChanged<TTGatewayScanModel> onPick;

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
                      key: Key('gateway_scan_${s.gatewayMac}'),
                      leading: const Icon(Icons.router_outlined),
                      title: Text(
                        s.gatewayName.isEmpty ? s.gatewayMac : s.gatewayName,
                      ),
                      subtitle: Text('${s.gatewayMac}  RSSI ${s.rssi}'),
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

class _WifiListView extends StatelessWidget {
  const _WifiListView({
    required this.hint,
    required this.emptyText,
    required this.wifiList,
    required this.scanning,
    required this.onSelect,
  });

  final String hint;
  final String emptyText;
  final List<GatewayWifi> wifiList;
  final bool scanning;
  final ValueChanged<GatewayWifi> onSelect;

  @override
  Widget build(BuildContext context) {
    if (wifiList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (scanning) ...[
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(child: Text(scanning ? hint : emptyText)),
          ],
        ),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (scanning) ...[
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(child: Text(hint)),
            ],
          ),
        ),
        ...wifiList.map(
          (w) => ListTile(
            key: Key('gateway_wifi_${w.name}'),
            leading: const Icon(Icons.wifi_outlined),
            title: Text(w.name),
            trailing: w.rssi == null ? null : Text('${w.rssi}'),
            onTap: () => onSelect(w),
          ),
        ),
      ],
    );
  }
}

class _CredentialForm extends StatelessWidget {
  const _CredentialForm({
    required this.wifiName,
    required this.needsWifi,
    required this.supportsStaticIp,
    required this.needsApn,
    required this.gatewayNameController,
    required this.wifiPasswordController,
    required this.loginPasswordController,
    required this.useStaticIp,
    required this.onUseStaticIpChanged,
    required this.staticIpController,
    required this.subnetMaskController,
    required this.defaultGatewayController,
    required this.preferredDnsController,
    required this.alternateDnsController,
    required this.useApn,
    required this.onUseApnChanged,
    required this.apnController,
    required this.gatewayNameLabel,
    required this.wifiPasswordLabel,
    required this.accountPasswordLabel,
    required this.accountPasswordHelper,
    required this.useStaticIpLabel,
    required this.useApnLabel,
    required this.apnLabel,
    required this.apnHint,
    required this.staticIpLabel,
    required this.subnetMaskLabel,
    required this.defaultGatewayLabel,
    required this.preferredDnsLabel,
    required this.alternateDnsLabel,
    required this.submitLabel,
    required this.onSubmit,
  });

  final String? wifiName;
  final bool needsWifi;
  final bool supportsStaticIp;
  final bool needsApn;
  final TextEditingController gatewayNameController;
  final TextEditingController wifiPasswordController;
  final TextEditingController loginPasswordController;
  final bool useStaticIp;
  final ValueChanged<bool> onUseStaticIpChanged;
  final TextEditingController staticIpController;
  final TextEditingController subnetMaskController;
  final TextEditingController defaultGatewayController;
  final TextEditingController preferredDnsController;
  final TextEditingController alternateDnsController;
  final bool useApn;
  final ValueChanged<bool> onUseApnChanged;
  final TextEditingController apnController;
  final String gatewayNameLabel;
  final String wifiPasswordLabel;
  final String accountPasswordLabel;
  final String accountPasswordHelper;
  final String useStaticIpLabel;
  final String useApnLabel;
  final String apnLabel;
  final String apnHint;
  final String staticIpLabel;
  final String subnetMaskLabel;
  final String defaultGatewayLabel;
  final String preferredDnsLabel;
  final String alternateDnsLabel;
  final String submitLabel;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          key: const Key('gateway_name'),
          controller: gatewayNameController,
          decoration: InputDecoration(labelText: gatewayNameLabel),
        ),
        if (needsWifi) ...[
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.wifi_outlined),
            title: Text(wifiName ?? ''),
          ),
          TextField(
            key: const Key('gateway_wifi_password'),
            controller: wifiPasswordController,
            obscureText: true,
            decoration: InputDecoration(labelText: wifiPasswordLabel),
          ),
        ],
        const SizedBox(height: 12),
        TextField(
          key: const Key('gateway_login_password'),
          controller: loginPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: accountPasswordLabel,
            helperText: accountPasswordHelper,
          ),
        ),
        if (supportsStaticIp) ...[
          const SizedBox(height: 8),
          SwitchListTile(
            key: const Key('gateway_use_static_ip'),
            contentPadding: EdgeInsets.zero,
            title: Text(useStaticIpLabel),
            value: useStaticIp,
            onChanged: onUseStaticIpChanged,
          ),
          if (useStaticIp) ...[
            IpAddressField(
              key: const Key('gateway_static_ip'),
              controller: staticIpController,
              label: staticIpLabel,
            ),
            const SizedBox(height: 8),
            IpAddressField(
              key: const Key('gateway_subnet_mask'),
              controller: subnetMaskController,
              label: subnetMaskLabel,
            ),
            const SizedBox(height: 8),
            IpAddressField(
              key: const Key('gateway_default_gateway'),
              controller: defaultGatewayController,
              label: defaultGatewayLabel,
            ),
            const SizedBox(height: 8),
            IpAddressField(
              key: const Key('gateway_preferred_dns'),
              controller: preferredDnsController,
              label: preferredDnsLabel,
            ),
            const SizedBox(height: 8),
            IpAddressField(
              key: const Key('gateway_alternate_dns'),
              controller: alternateDnsController,
              label: alternateDnsLabel,
            ),
          ],
        ],
        if (needsApn) ...[
          SwitchListTile(
            key: const Key('gateway_use_apn'),
            contentPadding: EdgeInsets.zero,
            title: Text(useApnLabel),
            value: useApn,
            onChanged: onUseApnChanged,
          ),
          if (useApn)
            TextField(
              key: const Key('gateway_apn'),
              controller: apnController,
              decoration: InputDecoration(
                labelText: apnLabel,
                hintText: apnHint,
              ),
            ),
        ],
        const SizedBox(height: 16),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: gatewayNameController,
          builder: (context, value, _) => FilledButton(
            key: const Key('gateway_submit'),
            onPressed: value.text.trim().isEmpty ? null : onSubmit,
            child: Text(submitLabel),
          ),
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

class _DoneView extends StatelessWidget {
  const _DoneView({
    required this.label,
    required this.doneLabel,
    required this.onDone,
  });

  final String label;
  final String doneLabel;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline, size: 64, color: Colors.green),
          const SizedBox(height: 16),
          Text(label),
          const SizedBox(height: 16),
          FilledButton(onPressed: onDone, child: Text(doneLabel)),
        ],
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
