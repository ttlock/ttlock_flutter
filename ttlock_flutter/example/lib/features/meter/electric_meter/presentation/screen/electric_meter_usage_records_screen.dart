import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_usage_records_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_record_tile.dart';

/// 用电记录页：按 0/1/2（日/月/年）切换粒度（spec §6.4）。
class ElectricMeterUsageRecordsScreen extends ConsumerWidget {
  const ElectricMeterUsageRecordsScreen({super.key, required this.meterId});

  final int meterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = electricMeterUsageRecordsProvider(meterId);
    final state = ref.watch(provider);

    return Scaffold(
      key: const Key('electric_meter_usage_records'),
      appBar: AppBar(title: Text(l10n.meterUsageRecordsElectric)),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                for (final t in MeterDateType.values)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ChoiceChip(
                      key: Key('electric_meter_usage_type_${t.value}'),
                      label: Text(switch (t) {
                        MeterDateType.day => l10n.meterDateTypeDay,
                        MeterDateType.month => l10n.meterDateTypeMonth,
                        MeterDateType.year => l10n.meterDateTypeYear,
                      }),
                      selected: state.value?.dateType == t,
                      onSelected: (_) =>
                          ref.read(provider.notifier).setDateType(t),
                    ),
                  ),
              ],
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
                if (data.records.isEmpty) {
                  return Center(child: Text(l10n.meterEmptyRecords));
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(provider.notifier).refresh(),
                  child: ListView.builder(
                    itemCount: data.records.length,
                    itemBuilder: (context, i) {
                      final record = data.records[i];
                      return MeterRecordTile(
                        title: record.createDate,
                        // `usedKwh` 自带单位（样例 "0.00kWh"），**不要再拼单位**。
                        trailing: record.usedKwh,
                      );
                    },
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
