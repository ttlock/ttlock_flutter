import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_usage_records_notifier.dart';

typedef _ListCall = ({int meterId, int dateType, String dateStr});

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain(this._onList);

  final TaskEither<AppException, List<WaterMeterRecordEntity>> Function(_ListCall)
  _onList;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<WaterMeterRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _onList((meterId: meterId, dateType: dateType, dateStr: dateStr));
}

void main() {
  late List<_ListCall> calls;
  late ProviderContainer container;

  void makeContainer(
    TaskEither<AppException, List<WaterMeterRecordEntity>> Function(_ListCall)
    onList,
  ) {
    calls = [];
    final c = ProviderContainer(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeWaterMeterDomain((call) {
            calls.add(call);
            return onList(call);
          }),
        ),
      ],
    );
    addTearDown(c.dispose);
    container = c;
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    c.listen(waterMeterUsageRecordsProvider(7), (_, _) {});
  }

  test('build 默认按「日」拉当前时刻，dateStr 精确到日', () async {
    makeContainer(
      (_) => TaskEither.right(
        const [WaterMeterRecordEntity(usedM3: '0.00t')],
      ),
    );
    final state = await container.read(
      waterMeterUsageRecordsProvider(7).future,
    );
    expect(state.dateType, MeterDateType.day);
    expect(state.records.single.usedM3, '0.00t');
    expect(calls.single.meterId, 7);
    expect(calls.single.dateType, 0);
    expect(calls.single.dateStr, MeterDateType.day.dateStr(DateTime.now()));
  });

  test('setDateType 用对应粒度的 dateStr 重拉', () async {
    makeContainer((_) => TaskEither.right(const []));
    final notifier = container.read(waterMeterUsageRecordsProvider(7).notifier);
    await container.read(waterMeterUsageRecordsProvider(7).future);
    await notifier.setDateType(MeterDateType.year);

    expect(calls.last.dateType, 2);
    expect(calls.last.dateStr, MeterDateType.year.dateStr(DateTime.now()));
    expect(
      container.read(waterMeterUsageRecordsProvider(7)).value?.dateType,
      MeterDateType.year,
    );
  });

  test('拉取失败时以 AsyncError 呈现', () async {
    makeContainer((_) => TaskEither.left(AppException.unknown(message: 'boom')));
    // 口径同 T6：不要用 `.future` + `throwsA`（本版 Riverpod 会自动重试，future 挂起）。
    container.read(waterMeterUsageRecordsProvider(7));
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    final st = container.read(waterMeterUsageRecordsProvider(7));
    expect(st.hasError, isTrue);
    expect(st.error, isA<AppException>());
  });
}
