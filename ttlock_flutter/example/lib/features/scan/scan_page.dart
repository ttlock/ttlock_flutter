import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/router/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/device_type_selector.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/section_header.dart';
import 'scan_config.dart';
import 'scan_provider.dart';

class ScanPage extends HookConsumerWidget {
  final ScanConfig config;

  const ScanPage({super.key, this.config = const ScanConfig()});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (config.deviceType != null) {
          ref.read(scanNotifierProvider(config).notifier).startScan();
        }
      });
      return null;
    }, [config]);

    final state = ref.watch(scanNotifierProvider(config));
    final title = state.selectedType != null
        ? (state.config.isAccessory
            ? 'Add ${_typeLabel(state.selectedType)}'
            : 'Scan ${_typeLabel(state.selectedType)}')
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
                    ref.read(scanNotifierProvider(config).notifier);
                if (state.isScanning) {
                  notifier.stopScan();
                } else {
                  notifier.startScan();
                }
              },
            ),
        ],
      ),
      body: _buildBody(context, ref, config, state),
    );
  }
}

Widget _buildBody(
  BuildContext context,
  WidgetRef ref,
  ScanConfig config,
  ScanState state,
) {
  if (state.error != null) {
    return ErrorDisplay(
      message: state.error,
      onRetry: () =>
          ref.read(scanNotifierProvider(config).notifier).startScan(),
    );
  }

  return ListView(
    children: [
      if (state.config.deviceType == null) ...[
        const SectionHeader(title: 'Device Type', icon: Icons.category),
        DeviceTypeSelector(
          selected: state.selectedType,
          onSelected: (type) => ref
              .read(scanNotifierProvider(config).notifier)
              .selectType(type),
        ),
      ],
      if (state.selectedType == null)
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
                      : 'No devices found',
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
              onTap: canTap
                  ? () => _onDeviceTap(context, ref, config, device)
                  : null,
            ),
          );
        }),
      ],
    ],
  );
}

Future<void> _onDeviceTap(
  BuildContext context,
  WidgetRef ref,
  ScanConfig config,
  DiscoveredDevice device,
) async {
  if (device.type == DeviceType.gateway) {
    ref.read(scanNotifierProvider(config).notifier).stopScan();
    final gatewayType = device.gatewayType ?? TTGatewayType.g2;
    GatewayInitRoute(
      device.mac,
      name: device.name,
      gatewayType: gatewayType,
      needsWifiConfig: gatewayNeedsWifi(gatewayType),
    ).push(context);
    return;
  }

  context.loaderOverlay.show();
  final result = await ref
      .read(scanNotifierProvider(config).notifier)
      .initDevice(device);
  if (!context.mounted) return;
  context.loaderOverlay.hide();

  switch (result) {
    case InitFailure():
      break;
    case InitLock(:final mac):
      LockRoute(mac).push(context);
    case InitDoorSensor(:final mac):
      _goToDetailAfterInit(context, config, () {
        DoorSensorInfoRoute(mac).push(context);
      });
    case InitStandaloneDoorSensor(:final mac):
      StandaloneDoorSensorRoute(mac).push(context);
    case InitRemoteKey(:final mac):
      _goToDetailAfterInit(context, config, () {
        RemoteKeyInfoRoute(mac).push(context);
      });
    case InitKeypad(:final mac):
      _goToDetailAfterInit(context, config, () {
        KeypadInfoRoute(mac).push(context);
      });
    case InitWaterMeter(:final id):
      WaterMeterRoute(id).push(context);
    case InitElectricMeter(:final id):
      ElectricMeterRoute(id).push(context);
  }
}

void _goToDetailAfterInit(
  BuildContext context,
  ScanConfig config,
  VoidCallback goDetail,
) {
  if (config.isAccessory) {
    Navigator.pop(context);
    if (context.mounted) goDetail();
  } else {
    goDetail();
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
    case DeviceType.standaloneDoorSensor:
      return 'Standalone Door Sensor';
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
    case DeviceType.standaloneDoorSensor:
      return Icons.sensors_outlined;
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
