import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/widgets/async_value_view.dart';
import '../../core/widgets/device_card.dart';
import '../../features/scan/scan_config.dart';
import '../../features/lock/lock_status_provider.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../features/settings/model/saved_lock_device.dart';
import '../../features/settings/model/saved_meter_device.dart';
import '../../features/settings/model/saved_standalone_door_sensor.dart';
import 'dashboard_provider.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 4);
    final dataAsync = ref.watch(dashboardNotifierProvider);

    Future<void> deleteLock(String mac) async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Remove device?'),
          content: const Text('This will remove the lock and its local cache.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      );
      if (confirmed == true && context.mounted) {
        await ref.read(lockListNotifierProvider.notifier).removeDevice(mac);
      }
    }

    Future<void> openScanForCurrentTab() async {
      switch (tabController.index) {
        case 0:
          ScanRoute(type: DeviceType.lock.name).push(context);
        case 1:
          ScanRoute(type: DeviceType.gateway.name).push(context);
        case 2:
          final type = await showModalBottomSheet<DeviceType>(
            context: context,
            builder: (ctx) => SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.water_drop),
                    title: const Text('Water Meter'),
                    onTap: () =>
                        Navigator.pop(ctx, DeviceType.waterMeter),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bolt),
                    title: const Text('Electric Meter'),
                    onTap: () =>
                        Navigator.pop(ctx, DeviceType.electricMeter),
                  ),
                ],
              ),
            ),
          );
          if (type != null && context.mounted) {
            ScanRoute(type: type.name).push(context);
          }
        case 3:
          ScanRoute(type: DeviceType.standaloneDoorSensor.name).push(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TTLock Devices'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.lock), text: 'My Locks'),
            Tab(icon: Icon(Icons.router), text: 'Gateways'),
            Tab(icon: Icon(Icons.water_drop), text: 'Meters'),
            Tab(icon: Icon(Icons.sensors), text: 'Door Sensors'),
          ],
        ),
      ),
      body: AsyncValueView.when(
        value: dataAsync,
        onRetry: (_, __) => ref.invalidate(dashboardNotifierProvider),
        data: (data) => TabBarView(
          controller: tabController,
          children: [
            // Tab 0: My Locks
            _LockList(
              locks: data.locks,
              onDelete: deleteLock,
            ),
            // Tab 1: Gateways
            _GatewayList(gateways: data.gateways),
            // Tab 2: Meters (water + electric)
            _MeterList(
              waterMeters: data.waterMeters,
              electricMeters: data.electricMeters,
            ),
            // Tab 3: Standalone door sensors
            _StandaloneDoorSensorList(
              sensors: data.standaloneDoorSensors,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openScanForCurrentTab,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ─── Tab 0: My Locks ───
class _LockList extends HookConsumerWidget {
  final List<SavedLockDevice> locks;
  final void Function(String mac) onDelete;

  const _LockList({required this.locks, required this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (locks.isEmpty) return _emptyState('No locks yet. Tap + to scan.');

    return RefreshIndicator(
      onRefresh: () async {
        // 刷新所有锁的状态
        for (final lock in locks) {
          ref.invalidate(lockStatusProvider(lock.mac));
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: locks.length,
        itemBuilder: (_, i) {
          final lock = locks[i];
          final statusAsync = ref.watch(lockStatusProvider(lock.mac));
          final accessoryCounts = ref.watch(accessoryCountsProvider(lock.mac));

          final status = statusAsync.valueOrNull;
          final counts = accessoryCounts.valueOrNull;

          // 构建配件信息字符串
          final parts = <String>[];
          if (counts != null) {
            if (counts.doorSensors > 0) parts.add('Door:${counts.doorSensors}');
            if (counts.remoteKeys > 0) parts.add('Remote:${counts.remoteKeys}');
            if (counts.keypads > 0) parts.add('Keypad:${counts.keypads}');
          }

          return DeviceCard(
            title: lock.name,
            mac: lock.mac,
            icon: Icons.lock,
            isOnline: true,
            power: status?.power,
            switchState: status?.switchState?.name,
            accessoryInfo: parts.isNotEmpty ? parts.join('  ') : null,
            isInited: true,
            onTap: () => LockRoute(lock.mac).push(context),
            onLongPress: () => onDelete(lock.mac),
          );
        },
      ),
    );
  }
}

// ─── Tab 1: Gateways ───
class _GatewayList extends StatelessWidget {
  final List<SavedGatewayDevice> gateways;
  const _GatewayList({required this.gateways});

  @override
  Widget build(BuildContext context) {
    if (gateways.isEmpty) return _emptyState('No gateways yet. Tap + to scan.');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: gateways.length,
      itemBuilder: (_, i) {
        final gw = gateways[i];
        return DeviceCard(
          title: gw.name,
          subtitle: gw.gatewayModel.isNotEmpty ? 'Model: ${gw.gatewayModel}' : null,
          mac: gw.mac,
          icon: Icons.router,
          isOnline: true,
          isInited: true,
          onTap: () => GatewayRoute(gw.mac).push(context),
        );
      },
    );
  }
}

// ─── Tab 2: Meters ───
class _MeterList extends StatelessWidget {
  final List<SavedMeterDevice> waterMeters;
  final List<SavedMeterDevice> electricMeters;
  const _MeterList({required this.waterMeters, required this.electricMeters});

  @override
  Widget build(BuildContext context) {
    final all = [
      ...waterMeters.map((m) => _MeterItem(m, isWater: true)),
      ...electricMeters.map((m) => _MeterItem(m, isWater: false)),
    ];

    if (all.isEmpty) return _emptyState('No meters yet. Tap + to scan.');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: all.length,
      itemBuilder: (_, i) {
        final item = all[i];
        return DeviceCard(
          title: item.device.name,
          subtitle: 'ID: ${item.device.meterId}',
          mac: item.device.mac,
          icon: item.isWater ? Icons.water_drop : Icons.bolt,
          isOnline: true,
          isInited: true,
          onTap: () {
            if (item.isWater) {
              WaterMeterRoute(item.device.mac).push(context);
            } else {
              ElectricMeterRoute(item.device.mac).push(context);
            }
          },
        );
      },
    );
  }
}

class _MeterItem {
  final SavedMeterDevice device;
  final bool isWater;
  const _MeterItem(this.device, {required this.isWater});
}

// ─── Tab 3: Standalone Door Sensors ───
class _StandaloneDoorSensorList extends StatelessWidget {
  final List<SavedStandaloneDoorSensor> sensors;
  const _StandaloneDoorSensorList({required this.sensors});

  @override
  Widget build(BuildContext context) {
    if (sensors.isEmpty) {
      return _emptyState('No standalone door sensors yet. Tap + to scan.');
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: sensors.length,
      itemBuilder: (_, i) {
        final sensor = sensors[i];
        return DeviceCard(
          title: sensor.name,
          subtitle: sensor.modelNum != null ? 'Model: ${sensor.modelNum}' : null,
          mac: sensor.mac,
          icon: Icons.sensors,
          power: sensor.electricQuantity,
          isOnline: true,
          isInited: true,
          onTap: () => StandaloneDoorSensorRoute(sensor.mac).push(context),
        );
      },
    );
  }
}

Widget _emptyState(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
