import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/mapper/lock_record_type_label.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_records_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class LockRecordsScreen extends ConsumerWidget {
  const LockRecordsScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  static const _filters = <({int? value, String labelKey})>[
    (value: null, labelKey: 'recordAll'),
    (value: 4, labelKey: 'recordPasscode'), // 密码
    (value: 7, labelKey: 'recordCard'), // IC 卡
    (value: 8, labelKey: 'recordFingerprint'), // 指纹
    (value: -5, labelKey: 'recordFace'), // 人脸（cloud list 过滤枚举为负数）
    (value: -4, labelKey: 'recordQr'), // 二维码（cloud list 过滤枚举为负数）
    (value: 55, labelKey: 'recordRemote'), // 遥控
    // 注意：cloud lockRecord/list 的 recordType **过滤**枚举只有 -5/-4/4/7/8/55；
    // 57（二维码）/67（人脸）只出现在类型说明表、1（蓝牙）不在过滤枚举，
    // 故筛选 chips 收敛到文档枚举；类型展示仍可用全表。
  ];

  String _filterLabel(AppLocalizations l10n, String key) => switch (key) {
    'recordPasscode' => l10n.recordPasscode,
    'recordCard' => l10n.recordCard,
    'recordFingerprint' => l10n.recordFingerprint,
    'recordFace' => l10n.recordFace,
    'recordQr' => l10n.recordQr,
    'recordRemote' => l10n.recordRemote,
    _ => l10n.recordAll,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = lockRecordsProvider(lockId);
    final state = ref.watch(provider);
    // 同步离线记录的错误通道（syncOfflineRecords 不再裸 throw）
    ref.listen(lockRecordsErrorProvider, (prev, next) {
      if (next != null && prev != next) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(next, l10n))),
        );
        ref.read(lockRecordsErrorProvider.notifier).clear();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.records),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            tooltip: l10n.clearRecords,
            onPressed: () => _confirmClear(context, ref),
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: l10n.syncOffline,
            onPressed: lock?.lockData == null || lock!.lockData.isEmpty
                ? null
                : () => ref
                      .read(provider.notifier)
                      .syncOfflineRecords(lock!.lockData),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: _filters
                  .map(
                    (f) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: ChoiceChip(
                        label: Text(_filterLabel(l10n, f.labelKey)),
                        selected: state.value?.recordTypeFilter == f.value,
                        onSelected: (_) =>
                            ref.read(provider.notifier).setFilter(f.value),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: state.when(
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
                  return Center(child: Text(l10n.noRecords));
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(provider.notifier).refresh(),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (n) {
                      if (n.metrics.pixels >= n.metrics.maxScrollExtent - 64 &&
                          data.pageState.hasMore) {
                        ref.read(provider.notifier).loadMore();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount:
                          data.pageState.data.length +
                          (data.pageState.hasMore ? 1 : 0),
                      itemBuilder: (context, i) {
                        if (i >= data.pageState.data.length) {
                          return const Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return _RecordTile(
                          record: data.pageState.data[i],
                          onDelete: () => ref
                              .read(provider.notifier)
                              .deleteRecord(data.pageState.data[i].recordId),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final confirmed = await const LockClearRecordsConfirmSheetRoute()
        .push<bool>(context);
    if (confirmed == true) {
      await ref.read(lockRecordsProvider(lockId).notifier).clearRecords();
    }
  }
}

class _RecordTile extends ConsumerWidget {
  const _RecordTile({required this.record, required this.onDelete});
  final LockRecordEntity record;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final time = record.lockDate?.toLocal().toString().substring(0, 19) ?? '';
    final type = lockRecordTypeLabel(l10n, record.recordType);
    final subtitle = [if (time.isNotEmpty) time, type].join('  ');
    return ListTile(
      leading: Icon(
        record.success ? Icons.check_circle_outline : Icons.error_outline,
        color: record.success ? Colors.green : Colors.red,
      ),
      title: Text(
        record.username.isEmpty
            ? '${l10n.recordIdLabel} ${record.recordId}'
            : record.username,
      ),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: onDelete,
      ),
    );
  }
}
