import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/grouping/hotel_lock_grouping.dart';
import 'package:ttlock_flutter_demo/features/hotel/presentation/provider/hotel_lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

/// 酒店锁列表页。
///
/// 两类锁类型（酒店锁 / 梯控 / 取电）**没有「全部」选项**：开放平台
/// `listByHotel` 的 `type` 不传即等价于 1，不存在表示全部的取值。
class HotelLockListScreen extends ConsumerStatefulWidget {
  const HotelLockListScreen({super.key});

  @override
  ConsumerState<HotelLockListScreen> createState() =>
      _HotelLockListScreenState();
}

class _HotelLockListScreenState extends ConsumerState<HotelLockListScreen> {
  static const _searchDebounce = Duration(milliseconds: 300);

  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(_searchDebounce, () {
      ref.read(hotelLockListNotifierProvider.notifier).setAlias(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(hotelLockListNotifierProvider);
    final notifier = ref.read(hotelLockListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.hotelTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(104),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownButton<int>(
                      key: const Key('hotel_lock_type_dropdown'),
                      value: notifier.selectedType,
                      underline: const SizedBox.shrink(),
                      items: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(l10n.hotelLockTypeHotel),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(l10n.hotelLockTypeLift),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(l10n.hotelLockTypePower),
                        ),
                      ],
                      onChanged: (type) {
                        if (type != null) notifier.setType(type);
                      },
                    ),
                  ],
                ),
                TextField(
                  key: const Key('hotel_lock_search'),
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: l10n.hotelSearchHint,
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getUserFriendlyMessage(
                  ExceptionUtils.extractAppException(e, st),
                  l10n,
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                key: const Key('hotel_lock_retry'),
                onPressed: notifier.refresh,
                child: Text(l10n.hotelRetry),
              ),
            ],
          ),
        ),
        data: (data) {
          // 空态是**预期结果**（普通账号本就没有酒店锁），故用说明性文案
          // 而非「加载失败/暂无数据」。
          if (data.pageState.data.isEmpty) {
            return _HotelEmptyView(
              title: l10n.hotelEmptyTitle,
              body: l10n.hotelEmptyBody,
            );
          }
          final groups = groupHotelLocks(
            data.pageState.data,
            l10n.hotelUnassigned,
          );
          return RefreshIndicator(
            onRefresh: notifier.refresh,
            child: NotificationListener<ScrollNotification>(
              onNotification: (n) {
                if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                    data.pageState.hasMore) {
                  notifier.loadMore();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: groups.length + (data.pageState.hasMore ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i >= groups.length) {
                    return const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return _HotelLockGroupSection(
                    group: groups[i],
                    hotelType: data.type,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HotelEmptyView extends StatelessWidget {
  const _HotelEmptyView({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hotel_outlined, size: 48, color: theme.disabledColor),
            const SizedBox(height: 16),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _HotelLockGroupSection extends StatelessWidget {
  const _HotelLockGroupSection({required this.group, required this.hotelType});

  final HotelLockGroup group;
  final int hotelType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(
            group.title,
            key: Key('hotel_group_${group.key}'),
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        for (final lock in group.locks)
          _HotelLockTile(lock: lock, hotelType: hotelType),
      ],
    );
  }
}

class _HotelLockTile extends ConsumerStatefulWidget {
  const _HotelLockTile({required this.lock, required this.hotelType});

  final HotelLockEntity lock;
  final int hotelType;

  @override
  ConsumerState<_HotelLockTile> createState() => _HotelLockTileState();
}

class _HotelLockTileState extends ConsumerState<_HotelLockTile> {
  /// `null` = 探测中；探测完成前不展示「不支持」，也不允许进入详情。
  bool? _supportsHotelCard;

  /// 卡片上的楼栋/楼层用**空格**连接（组标题用 `·`）——同一信息两种形状，
  /// 便于测试与用户区分「组名」和「锁自己的位置」。
  String get _location => [
    buildingKeyOf(widget.lock),
    floorKeyOf(widget.lock),
  ].where((part) => part.isNotEmpty).join(' ');

  @override
  void initState() {
    super.initState();
    _probeHotelCard();
  }

  @override
  void didUpdateWidget(covariant _HotelLockTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lock.lockId != widget.lock.lockId ||
        oldWidget.lock.lockData != widget.lock.lockData) {
      _supportsHotelCard = null;
      _probeHotelCard();
    }
  }

  Future<void> _probeHotelCard() async {
    final lockData = widget.lock.lockData;
    if (lockData.isEmpty) {
      if (mounted) setState(() => _supportsHotelCard = false);
      return;
    }
    try {
      final supported = await TTLock.lock.supportFunction(
        TTLockFunction.hotelCard,
        lockData,
      );
      if (mounted) setState(() => _supportsHotelCard = supported);
    } on Object {
      if (mounted) setState(() => _supportsHotelCard = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final location = _location;
    final lock = widget.lock;
    final supported = _supportsHotelCard == true;
    final unsupported = _supportsHotelCard == false;
    final theme = Theme.of(context);

    return ListTile(
      key: Key('hotel_lock_tile_${lock.lockId}'),
      leading: const Icon(Icons.lock_outline),
      title: Text(lock.lockAlias.isEmpty ? lock.lockName : lock.lockAlias),
      subtitle: location.isEmpty ? null : Text(location),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (lock.hasGateway)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.router_outlined, size: 18),
            ),
          Text('${lock.electricQuantity}%'),
          const SizedBox(width: 4),
          if (unsupported)
            Text(
              l10n.hotelNotSupported,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.disabledColor,
              ),
            )
          else
            const Icon(Icons.chevron_right),
        ],
      ),
      onTap: supported
          ? () => HotelLockDetailRoute(
              lockId: lock.lockId,
              $extra: lock,
              hotelType: widget.hotelType,
            ).push(context)
          : null,
    );
  }
}
