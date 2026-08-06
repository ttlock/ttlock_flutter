import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/config/server_endpoint_config.dart';
import '../../../core/storage/config_provider.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/widgets/server_endpoint_fields.dart';
import 'settings_operation.dart';

class LockNetworkSettingsPage extends HookConsumerWidget {
  const LockNetworkSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ssidController = useTextEditingController();
    final wifiPasswordController = useTextEditingController();
    final serverIpController = useTextEditingController();
    final serverPortController = useTextEditingController();
    final ipAddressController = useTextEditingController();
    final subnetController = useTextEditingController();
    final routerController = useTextEditingController();
    final dnsController = useTextEditingController();
    final ipType = useState(0);

    final config = ref.watch(configNotifierProvider).valueOrNull;

    useEffect(() {
      if (config == null) return null;
      final endpoint = config.defaultServerEndpoint(DeviceServerKind.wifiLock);
      if (serverIpController.text.isEmpty) {
        serverIpController.text = endpoint.address;
      }
      if (serverPortController.text.isEmpty) {
        serverPortController.text = endpoint.port;
      }
      return null;
    }, [config?.uid, config?.serverRegion, config?.serverIp, config?.serverPort]);

    Future<String?> lockData() async {
      final lock = await ref.read(lockByMacProvider(lockMac).future);
      return lock?.lockData;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Network')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('WiFi', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: ssidController,
            decoration: const InputDecoration(labelText: 'SSID'),
          ),
          TextField(
            controller: wifiPasswordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          FilledButton(
            onPressed: () async {
              final data = await lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => TTLock.lock.configWifi(
                      ssidController.text.trim(),
                      wifiPasswordController.text,
                      lockMac,
                      data,
                    ),
                successMessage: 'WiFi configured',
              );
            },
            child: const Text('Configure WiFi'),
          ),
          FilledButton.tonal(
            onPressed: () async {
              final data = await lockData();
              if (data == null) return;
              final info = await runSettingsOperation(
                context,
                action: () => TTLock.lock.getWifiInfo(data),
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
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Read WiFi info'),
          ),
          const Divider(height: 32),
          const Text('Server', style: TextStyle(fontWeight: FontWeight.bold)),
          if (config != null)
            ServerEndpointFields(
              config: config,
              deviceKind: DeviceServerKind.wifiLock,
              ipController: serverIpController,
              portController: serverPortController,
            )
          else ...[
            TextField(
              controller: serverIpController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: serverPortController,
              decoration: const InputDecoration(labelText: 'Port'),
              keyboardType: TextInputType.number,
            ),
          ],
          FilledButton(
            onPressed: () async {
              final data = await lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => TTLock.lock.configServer(
                      serverIpController.text.trim(),
                      serverPortController.text.trim(),
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
            selected: {ipType.value},
            onSelectionChanged: (s) => ipType.value = s.first,
          ),
          if (ipType.value == 1) ...[
            TextField(
              controller: ipAddressController,
              decoration: const InputDecoration(labelText: 'IP'),
            ),
            TextField(
              controller: subnetController,
              decoration: const InputDecoration(labelText: 'Subnet'),
            ),
            TextField(
              controller: routerController,
              decoration: const InputDecoration(labelText: 'Router'),
            ),
            TextField(
              controller: dnsController,
              decoration: const InputDecoration(labelText: 'DNS'),
            ),
          ],
          FilledButton(
            onPressed: () async {
              final data = await lockData();
              if (data == null) return;
              await runSettingsOperation(
                context,
                action: () => TTLock.lock.configIp(
                      TTIpSetting(
                        type: ipType.value,
                        ipAddress: ipAddressController.text.trim().isEmpty
                            ? null
                            : ipAddressController.text.trim(),
                        subnetMask: subnetController.text.trim().isEmpty
                            ? null
                            : subnetController.text.trim(),
                        router: routerController.text.trim().isEmpty
                            ? null
                            : routerController.text.trim(),
                        preferredDns: dnsController.text.trim().isEmpty
                            ? null
                            : dnsController.text.trim(),
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
