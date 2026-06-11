import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/error_display.dart';
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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            Tab(icon: Icon(Icons.lock), text: 'Locks'),
            Tab(icon: Icon(Icons.router), text: 'Gateways'),
            Tab(icon: Icon(Icons.water_drop), text: 'Water'),
            Tab(icon: Icon(Icons.bolt), text: 'Electric'),
          ],
        ),
      ),
      body: dataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (data) => TabBarView(
          controller: _tabController,
          children: [
            _DeviceList<SavedLockDevice>(
              emptyMessage: 'No locks saved. Scan to add one.',
              items: data.locks,
              icon: Icons.lock,
              title: (d) => d.name,
              mac: (d) => d.mac,
              onTap: (d) => LockRoute(d.mac).push(context),
            ),
            _DeviceList<SavedGatewayDevice>(
              emptyMessage: 'No gateways saved. Scan to add one.',
              items: data.gateways,
              icon: Icons.router,
              title: (d) => d.name,
              mac: (d) => d.mac,
              onTap: (d) => GatewayRoute(d.mac).push(context),
            ),
            _DeviceList<SavedMeterDevice>(
              emptyMessage: 'No water meters saved.',
              items: data.waterMeters,
              icon: Icons.water_drop,
              title: (d) => d.name,
              mac: (d) => d.mac,
              onTap: (d) => WaterMeterRoute(d.mac).push(context),
            ),
            _DeviceList<SavedMeterDevice>(
              emptyMessage: 'No electric meters saved.',
              items: data.electricMeters,
              icon: Icons.bolt,
              title: (d) => d.name,
              mac: (d) => d.mac,
              onTap: (d) => ElectricMeterRoute(d.mac).push(context),
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

class _DeviceList<T> extends StatelessWidget {
  final String emptyMessage;
  final List<T> items;
  final IconData icon;
  final String Function(T) title;
  final String Function(T) mac;
  final void Function(T) onTap;

  const _DeviceList({
    required this.emptyMessage,
    required this.items,
    required this.icon,
    required this.title,
    required this.mac,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            emptyMessage,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.onSurfaceSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return DeviceCard(
          title: title(item),
          mac: mac(item),
          icon: icon,
          isOnline: true,
          onTap: () => onTap(item),
        );
      },
    );
  }
}
