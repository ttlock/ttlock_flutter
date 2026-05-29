import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../providers/ttlock_providers.dart';
import 'settings_operation.dart';

class LockNetworkSettingsPage extends ConsumerStatefulWidget {
  const LockNetworkSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<LockNetworkSettingsPage> createState() =>
      _LockNetworkSettingsPageState();
}

class _LockNetworkSettingsPageState extends ConsumerState<LockNetworkSettingsPage> {
  final _ssidController = TextEditingController();
  final _wifiPasswordController = TextEditingController();
  final _serverIpController = TextEditingController();
  final _serverPortController = TextEditingController();
  final _ipAddressController = TextEditingController();
  final _subnetController = TextEditingController();
  final _routerController = TextEditingController();
  final _dnsController = TextEditingController();
  int _ipType = 0;

  @override
  void dispose() {
    _ssidController.dispose();
    _wifiPasswordController.dispose();
    _serverIpController.dispose();
    _serverPortController.dispose();
    _ipAddressController.dispose();
    _subnetController.dispose();
    _routerController.dispose();
    _dnsController.dispose();
    super.dispose();
  }

  Future<String?> _lockData() async {
    final lock = await ref.read(lockByMacProvider(widget.lockMac).future);
    return lock?.lockData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('WiFi', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: _ssidController,
            decoration: const InputDecoration(labelText: 'SSID'),
          ),
          TextField(
            controller: _wifiPasswordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          FilledButton(
            onPressed: () async {
              final data = await _lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => ref.read(lockApiProvider).configWifi(
                      _ssidController.text.trim(),
                      _wifiPasswordController.text,
                      data,
                    ),
                successMessage: 'WiFi configured',
              );
            },
            child: const Text('Configure WiFi'),
          ),
          FilledButton.tonal(
            onPressed: () async {
              final data = await _lockData();
              if (data == null) return;
              final info = await runSettingsOperation(
                context,
                action: () => ref.read(lockApiProvider).getWifiInfo(data),
              );
              if (info != null && context.mounted) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('WiFi info'),
                    content: Text(
                      'MAC: ${info.wifiMac}\nRSSI: ${info.wifiRssi}',
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
                    ],
                  ),
                );
              }
            },
            child: const Text('Read WiFi info'),
          ),
          const Divider(height: 32),
          const Text('Server', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: _serverIpController,
            decoration: const InputDecoration(labelText: 'IP'),
          ),
          TextField(
            controller: _serverPortController,
            decoration: const InputDecoration(labelText: 'Port'),
            keyboardType: TextInputType.number,
          ),
          FilledButton(
            onPressed: () async {
              final data = await _lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => ref.read(lockApiProvider).configServer(
                      _serverIpController.text.trim(),
                      _serverPortController.text.trim(),
                      data,
                    ),
                successMessage: 'Server configured',
              );
            },
            child: const Text('Configure server'),
          ),
          const Divider(height: 32),
          const Text('IP settings', style: TextStyle(fontWeight: FontWeight.bold)),
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('DHCP')),
              ButtonSegment(value: 1, label: Text('Static')),
            ],
            selected: {_ipType},
            onSelectionChanged: (s) => setState(() => _ipType = s.first),
          ),
          if (_ipType == 1) ...[
            TextField(controller: _ipAddressController, decoration: const InputDecoration(labelText: 'IP')),
            TextField(controller: _subnetController, decoration: const InputDecoration(labelText: 'Subnet')),
            TextField(controller: _routerController, decoration: const InputDecoration(labelText: 'Router')),
            TextField(controller: _dnsController, decoration: const InputDecoration(labelText: 'DNS')),
          ],
          FilledButton(
            onPressed: () async {
              final data = await _lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => ref.read(lockApiProvider).configIp(
                      TTIpSetting(
                        type: _ipType,
                        ipAddress: _ipAddressController.text.trim().isEmpty
                            ? null
                            : _ipAddressController.text.trim(),
                        subnetMask: _subnetController.text.trim().isEmpty
                            ? null
                            : _subnetController.text.trim(),
                        router: _routerController.text.trim().isEmpty
                            ? null
                            : _routerController.text.trim(),
                        preferredDns: _dnsController.text.trim().isEmpty
                            ? null
                            : _dnsController.text.trim(),
                      ),
                      data,
                    ),
                successMessage: 'IP settings applied',
              );
            },
            child: const Text('Apply IP settings'),
          ),
        ],
      ),
    );
  }
}
