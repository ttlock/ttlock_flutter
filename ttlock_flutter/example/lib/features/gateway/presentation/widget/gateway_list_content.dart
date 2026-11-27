import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_list_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// Gateway 列表内容,不含 Scaffold/AppBar/FAB。
/// 由 [GatewayListScreen] 与其它设备页 Tab 复用。
class GatewayListContent extends ConsumerStatefulWidget {
  const GatewayListContent({super.key});

  @override
  ConsumerState<GatewayListContent> createState() => _GatewayListContentState();
}

class _GatewayListContentState extends ConsumerState<GatewayListContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(gatewayListProvider);
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
          return Center(child: Text(l10n.gatewayEmpty));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(gatewayListProvider.notifier).refresh(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                  data.pageState.hasMore) {
                ref.read(gatewayListProvider.notifier).loadMore();
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
                final gateway = data.pageState.data[i];
                return _GatewayTile(
                  gateway: gateway,
                  onTap: () =>
                      GatewayDetailRoute($extra: gateway).push(context),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _GatewayTile extends ConsumerWidget {
  const _GatewayTile({required this.gateway, required this.onTap});

  final GatewayEntity gateway;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return ListTile(
      key: Key('gateway_tile_${gateway.gatewayId}'),
      leading: const Icon(Icons.router_outlined),
      title: Text(
        gateway.gatewayName.isEmpty ? gateway.gatewayMac : gateway.gatewayName,
      ),
      subtitle: Text(gateway.gatewayMac),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: gateway.isOnline
                ? Colors.green
                : Theme.of(context).disabledColor,
          ),
          const SizedBox(width: 4),
          Text(gateway.isOnline ? l10n.online : l10n.offline),
        ],
      ),
      onTap: onTap,
    );
  }
}
