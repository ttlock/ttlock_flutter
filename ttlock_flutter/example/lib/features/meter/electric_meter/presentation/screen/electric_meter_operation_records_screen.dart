import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/electric_meter_operation_record_label.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_operation_records_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_record_tile.dart';

/// 电表操作记录页。
///
/// 筛选 chips 用**请求侧**值域（`MeterOperationRecordFilter`），列表项文案用
/// **响应侧**值域（[electricMeterOperationRecordText]）—— 两套值不同（spec §6.4）。
class ElectricMeterOperationRecordsScreen extends ConsumerWidget {
  const ElectricMeterOperationRecordsScreen({super.key, required this.meterId});

  final int meterId;

  String _filterLabel(AppLocalizations l10n, MeterOperationRecordFilter? f) =>
      switch (f) {
        null => l10n.meterRecordTypeAll,
        MeterOperationRecordFilter.recharge => l10n.meterRecordTypeRecharge,
        MeterOperationRecordFilter.powerOff => l10n.meterRecordTypePowerOff,
        MeterOperationRecordFilter.powerOn => l10n.meterRecordTypePowerOn,
        MeterOperationRecordFilter.read => l10n.meterRecordTypeRead,
        MeterOperationRecordFilter.price => l10n.meterRecordTypePrice,
        MeterOperationRecordFilter.clear => l10n.meterRecordTypeClear,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = electricMeterOperationRecordsProvider(meterId);
    final state = ref.watch(provider);
    const filters = <MeterOperationRecordFilter?>[
      null,
      ...MeterOperationRecordFilter.values,
    ];

    return Scaffold(
      key: const Key('electric_meter_operation_records'),
      appBar: AppBar(title: Text(l10n.meterOperationRecords)),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: filters
                  .map(
                    (f) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: ChoiceChip(
                        key: Key(
                          'electric_meter_op_filter_${f?.value ?? 'all'}',
                        ),
                        label: Text(_filterLabel(l10n, f)),
                        selected: state.value?.filter == f,
                        onSelected: (_) =>
                            ref.read(provider.notifier).setFilter(f),
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
                  return Center(child: Text(l10n.meterEmptyRecords));
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
                        return _RecordRow(
                          record: data.pageState.data[i],
                          l10n: l10n,
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
}

class _RecordRow extends StatelessWidget {
  const _RecordRow({required this.record, required this.l10n});

  final MeterOperationRecordEntity record;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    // `-1` 是日期分隔行：样例里只有 date，title/content 皆空。
    if (record.isDateSeparator) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Text(record.date, style: Theme.of(context).textTheme.labelLarge),
      );
    }
    return MeterRecordTile(
      title: electricMeterOperationRecordText(l10n, record.recordType),
      subtitle: [record.title, record.content]
          .where((s) => s.isNotEmpty)
          .join('  '),
      trailing: record.date,
    );
  }
}
