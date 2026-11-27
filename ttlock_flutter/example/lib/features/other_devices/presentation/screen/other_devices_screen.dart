import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/widget/standalone_list_content.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/widget/gateway_list_content.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/widget/electric_meter_list_content.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/widget/water_meter_list_content.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 其它设备页:用 TabBar + TabBarView 滑动展示各类型设备列表,
/// FAB 根据当前 tab 跳转到对应设备的添加入口。
class OtherDevicesScreen extends ConsumerStatefulWidget {
  const OtherDevicesScreen({super.key});

  @override
  ConsumerState<OtherDevicesScreen> createState() => _OtherDevicesScreenState();
}

class _OtherDevicesScreenState extends ConsumerState<OtherDevicesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() => setState(() {});

  void _onAddPressed() => switch (_tabController.index) {
    0 => const GatewayAddRoute().push(context),
    1 => const WaterMeterAddRoute().push(context),
    2 => const ElectricMeterAddRoute().push(context),
    _ => const StandaloneDoorSensorAddRoute().push(context),
  };

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.devices),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.gatewayTitle),
            Tab(text: l10n.waterMeterTitle),
            Tab(text: l10n.electricMeterTitle),
            Tab(text: l10n.standaloneDoorSensorTitle),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'other-devices-add',
        onPressed: _onAddPressed,
        child: const Icon(Icons.add),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          GatewayListContent(),
          WaterMeterListContent(),
          ElectricMeterListContent(),
          StandaloneDoorSensorListContent(),
        ],
      ),
    );
  }
}
