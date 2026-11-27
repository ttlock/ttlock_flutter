import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_usage_records_state.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';

part 'electric_meter_usage_records_notifier.g.dart';

/// 用电记录页：`dateType` 粒度切换（spec §6.4）。接口不分页。
@Riverpod()
class ElectricMeterUsageRecordsNotifier
    extends _$ElectricMeterUsageRecordsNotifier {
  int _meterId = 0;

  ElectricMeterDomain get _domain =>
      ref.read(electricMeterDomainProvider.notifier);

  @override
  Future<ElectricMeterUsageRecordsState> build(int meterId) async {
    _meterId = meterId;
    return ElectricMeterUsageRecordsState(
      records: await _load(meterId, MeterDateType.day),
      dateType: MeterDateType.day,
    );
  }

  Future<List<ElectricMeterUsageRecordEntity>> _load(
    int meterId,
    MeterDateType dateType,
  ) async {
    final r = await _domain
        .listRecords(
          meterId,
          dateType: dateType.value,
          dateStr: dateType.dateStr(DateTime.now()),
        )
        .run();
    return r.fold((err) => throw err, (list) => list);
  }

  /// 切换粒度重查：无页面级指示，借用全局 loading。
  Future<void> setDateType(MeterDateType dateType) async {
    final records = await withGlobalLoading(
      () => _load(_meterId, dateType),
      status: ref.read(l10nProvider).loading,
    );
    state = AsyncValue.data(
      ElectricMeterUsageRecordsState(records: records, dateType: dateType),
    );
  }

  Future<void> refresh() async {
    final dateType = state.value?.dateType ?? MeterDateType.day;
    final records = await _load(_meterId, dateType);
    state = AsyncValue.data(
      ElectricMeterUsageRecordsState(records: records, dateType: dateType),
    );
  }
}
