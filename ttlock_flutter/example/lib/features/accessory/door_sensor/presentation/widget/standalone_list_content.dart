import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/standalone_door_sensor_args.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 独立门磁列表内容，不含 Scaffold/AppBar/FAB。
/// 由 [StandaloneDoorSensorListScreen] 与其它设备页 Tab 复用。
class StandaloneDoorSensorListContent extends ConsumerStatefulWidget {
  const StandaloneDoorSensorListContent({super.key});

  @override
  ConsumerState<StandaloneDoorSensorListContent> createState() =>
      _StandaloneDoorSensorListContentState();
}

class _StandaloneDoorSensorListContentState
    extends ConsumerState<StandaloneDoorSensorListContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(standaloneDoorSensorListProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(
        child: Text(
          getUserFriendlyMessage(
            ExceptionUtils.extractAppException(e, st),
            l10n,
          ),
        ),
      ),
      data: (data) {
        if (data.pageState.data.isEmpty) {
          return Center(child: Text(l10n.standaloneDoorSensorEmpty));
        }
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(standaloneDoorSensorListProvider.notifier).refresh(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                  data.pageState.hasMore) {
                ref.read(standaloneDoorSensorListProvider.notifier).loadMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount:
                  data.pageState.data.length + (data.pageState.hasMore ? 1 : 0),
              itemBuilder: (context, i) {
                if (i >= data.pageState.data.length) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final entity = data.pageState.data[i];
                return _StandaloneDoorSensorTile(
                  entity: entity,
                  onTap: () => StandaloneDoorSensorDetailRoute(
                    $extra: StandaloneDoorSensorDetailArgs(item: entity),
                  ).push(context),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _StandaloneDoorSensorTile extends ConsumerWidget {
  const _StandaloneDoorSensorTile({required this.entity, required this.onTap});

  final StandaloneDoorSensorEntity entity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      key: Key('standalone_door_sensor_tile_${entity.doorSensorId}'),
      leading: const Icon(Icons.sensor_door_outlined),
      title: Text(entity.name.isEmpty ? entity.mac : entity.name),
      subtitle: Text(entity.mac),
      trailing: _DoorSensorStateDot(state: entity.doorSensorState),
      onTap: onTap,
    );
  }
}

class _DoorSensorStateDot extends StatelessWidget {
  const _DoorSensorStateDot({required this.state});

  final DoorSensorState state;

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      DoorSensorState.closed => Colors.green,
      DoorSensorState.open => Colors.amber,
      DoorSensorState.unknown => Theme.of(context).disabledColor,
    };
    return Icon(Icons.circle, size: 10, color: color);
  }
}
