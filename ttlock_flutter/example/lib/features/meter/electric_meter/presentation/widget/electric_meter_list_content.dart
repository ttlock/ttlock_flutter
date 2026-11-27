import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_list_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 电表列表内容,不含 Scaffold/AppBar/FAB。
/// 由 [ElectricMeterListScreen] 与其它设备页 Tab 复用。
class ElectricMeterListContent extends ConsumerStatefulWidget {
  const ElectricMeterListContent({super.key});

  @override
  ConsumerState<ElectricMeterListContent> createState() =>
      _ElectricMeterListContentState();
}

class _ElectricMeterListContentState
    extends ConsumerState<ElectricMeterListContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(electricMeterListProvider);
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
          return Center(child: Text(l10n.electricMeterEmpty));
        }
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(electricMeterListProvider.notifier).refresh(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                  data.pageState.hasMore) {
                ref.read(electricMeterListProvider.notifier).loadMore();
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
                final meter = data.pageState.data[i];
                return _ElectricMeterTile(
                  meter: meter,
                  onTap: () => ElectricMeterDetailRoute(
                    meterId: meter.electricMeterId,
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

class _ElectricMeterTile extends ConsumerWidget {
  const _ElectricMeterTile({required this.meter, required this.onTap});

  final ElectricMeterEntity meter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final name = meter.name.isEmpty ? meter.number : meter.name;
    return ListTile(
      key: Key('electric_meter_tile_${meter.electricMeterId}'),
      leading: const Icon(Icons.electric_meter_outlined),
      title: Text(name.isEmpty ? meter.number : name),
      subtitle: Text(meter.number.isEmpty ? meter.name : meter.number),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: meter.online
                ? Colors.green
                : Theme.of(context).disabledColor,
          ),
          const SizedBox(width: 4),
          Text(meter.online ? l10n.online : l10n.offline),
        ],
      ),
      onTap: onTap,
    );
  }
}
