import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/door_sensor_records_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/mapper/lock_record_type_label.dart';

class DoorSensorRecordsScreen extends ConsumerWidget {
  const DoorSensorRecordsScreen({super.key, required this.lockId});
  final int lockId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = doorSensorRecordsProvider(lockId);
    final state = ref.watch(provider);
    return Scaffold(
      key: const Key('door_sensor_records'),
      appBar: AppBar(title: Text(l10n.records)),
      body: state.when(
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
                  return _Tile(record: data.pageState.data[i]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile({required this.record});
  final DoorSensorRecordEntity record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final time = record.lockDate?.toLocal().toString().substring(0, 19) ?? '';
    return ListTile(
      leading: Icon(
        record.success ? Icons.check_circle_outline : Icons.error_outline,
        color: record.success ? Colors.green : Colors.red,
      ),
      title: Text(lockRecordTypeLabel(l10n, record.recordType)),
      subtitle: time.isEmpty ? null : Text(time),
    );
  }
}
