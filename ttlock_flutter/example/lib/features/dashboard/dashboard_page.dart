import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/error_display.dart';
import '../../features/lock/lock_status_provider.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../features/settings/model/saved_lock_device.dart';
import '../../features/settings/model/saved_meter_device.dart';
import 'dashboard_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _deleteLock(String mac) async {
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
    if (confirmed == true && mounted) {
      await ref.read(lockListNotifierProvider.notifier).removeDevice(mac);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataAsync = ref.watch(dashboardNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TTLock Devices'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.lock), text: 'My Locks'),
            Tab(icon: Icon(Icons.router), text: 'Gateways'),
            Tab(icon: Icon(Icons.water_drop), text: 'Meters'),
          ],
        ),
      ),
      body: dataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (data) => TabBarView(
          controller: _tabController,
          children: [
            // Tab 0: My Locks
            _LockList(
              locks: data.locks,
              onDelete: _deleteLock,
            ),
            // Tab 1: Gateways
            _GatewayList(gateways: data.gateways),
            // Tab 2: Meters (water + electric)
            _MeterList(
              waterMeters: data.waterMeters,
              electricMeters: data.electricMeters,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const ScanRoute().go(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ─── Tab 0: My Locks ───
class _LockList extends ConsumerWidget {
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
