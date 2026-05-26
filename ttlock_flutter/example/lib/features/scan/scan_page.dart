import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../core/router/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/device_type_selector.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/section_header.dart';
import 'scan_config.dart';
import 'scan_provider.dart';

class ScanPage extends ConsumerStatefulWidget {
  final ScanConfig config;

  const ScanPage({super.key, this.config = const ScanConfig()});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  @override
  void initState() {
    super.initState();
    if (widget.config.isAccessory && widget.config.deviceType != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(scanNotifierProvider(widget.config).notifier)
            .startScan();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(scanNotifierProvider(widget.config));
    final title = state.config.isAccessory
        ? 'Add ${_typeLabel(state.selectedType)}'
        : 'Scan Devices';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (state.selectedType != null)
            IconButton(
              icon: Icon(state.isScanning ? Icons.stop : Icons.play_arrow),
              onPressed: () {
                final notifier =
                    ref.read(scanNotifierProvider(widget.config).notifier);
                if (state.isScanning) {
                  notifier.stopScan();
                } else {
                  notifier.startScan();
                }
              },
            ),
        ],
      ),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, ScanState state) {
    if (state.error != null) {
      return ErrorDisplay(
        message: state.error,
        onRetry: () =>
            ref.read(scanNotifierProvider(widget.config).notifier).startScan(),
      );
    }

    return ListView(
      children: [
        if (!state.config.isAccessory) ...[
          const SectionHeader(title: 'Device Type', icon: Icons.category),
          DeviceTypeSelector(
            selected: state.selectedType,
            onSelected: (type) => ref
                .read(scanNotifierProvider(widget.config).notifier)
                .selectType(type),
          ),
        ],
        if (state.selectedType == null && !state.config.isAccessory)
          Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Text(
                'Select a device type to start scanning',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.onSurfaceSecondary,
                ),
              ),
            ),
          )
        else if (state.devices.isEmpty)
          Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    state.isScanning
                        ? Icons.bluetooth_searching
                        : Icons.bluetooth_disabled,
                    size: 64,
                    color: AppColors.onSurfaceSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.isScanning
                        ? 'Scanning...'
                        : 'Tap play to start scanning',
                    style: AppTextStyles.bodyLarge,
                  ),
                ],
              ),
            ),
          )
        else ...[
          SectionHeader(
            title: 'Results (${state.devices.length})',
            icon: Icons.devices,
          ),
          ...state.devices.map((device) {
            final canTap = !device.isInited || state.config.isAccessory;
            return Opacity(
              opacity: device.isInited && !state.config.isAccessory ? 0.45 : 1,
              child: DeviceCard(
                title: device.name,
                subtitle: _typeLabel(device.type),
                mac: device.mac,
                icon: _typeIcon(device.type),
                rssi: device.rssi,
                isInited: device.isInited,
                onTap: canTap ? () => _onDeviceTap(context, device) : null,
              ),
            );
          }),
        ],
      ],
    );
  }

  Future<void> _onDeviceTap(BuildContext context, DiscoveredDevice device) async {
    context.loaderOverlay.show();
    final result = await ref
        .read(scanNotifierProvider(widget.config).notifier)
        .initDevice(device);
    if (!context.mounted) return;
    context.loaderOverlay.hide();

    switch (result) {
      case InitFailure():
        break;
      case InitLock(:final mac):
        if (widget.config.isAccessory) {
          Navigator.pop(context);
        } else {
          LockRoute(mac).go(context);
        }
      case InitGateway(:final mac, :final needsWifi):
        GatewayRoute(mac, needsWifiConfig: needsWifi).push(context);
      case InitDoorSensor():
      case InitRemoteKey():
      case InitKeypad():
        Navigator.pop(context);
      case InitWaterMeter(:final id):
        WaterMeterRoute(id).push(context);
      case InitElectricMeter(:final id):
        ElectricMeterRoute(id).push(context);
    }
  }

}

String _typeLabel(DeviceType? type) {
  if (type == null) return '';
  switch (type) {
    case DeviceType.lock:
      return 'Lock';
    case DeviceType.gateway:
      return 'Gateway';
    case DeviceType.doorSensor:
      return 'Door Sensor';
    case DeviceType.remoteKey:
      return 'Remote Key';
    case DeviceType.keypad:
      return 'Keypad';
    case DeviceType.waterMeter:
      return 'Water Meter';
    case DeviceType.electricMeter:
      return 'Electric Meter';
  }
}

IconData _typeIcon(DeviceType type) {
  switch (type) {
    case DeviceType.lock:
      return Icons.lock;
    case DeviceType.gateway:
      return Icons.router;
    case DeviceType.doorSensor:
      return Icons.sensors;
    case DeviceType.remoteKey:
      return Icons.key;
    case DeviceType.keypad:
      return Icons.keyboard;
    case DeviceType.waterMeter:
      return Icons.water_drop;
    case DeviceType.electricMeter:
      return Icons.bolt;
  }
}
