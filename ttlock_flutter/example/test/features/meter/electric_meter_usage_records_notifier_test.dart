import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_usage_records_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';

typedef _ListCall = ({int meterId, int dateType, String dateStr});

class _FakeElectricMeterDomain extends ElectricMeterDomain {
  _FakeElectricMeterDomain(this._onList);

  final TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> Function(
    _ListCall,
  )
  _onList;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _onList((meterId: meterId, dateType: dateType, dateStr: dateStr));
}

void main() {
  late List<_ListCall> calls;
  late ProviderContainer container;

  void makeContainer(
    TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> Function(
      _ListCall,
    )
    onList,
  ) {
    calls = [];
    final c = ProviderContainer(
      overrides: [
        electricMeterDomainProvider.overrideWith(
          () => _FakeElectricMeterDomain((call) {
            calls.add(call);
            return onList(call);
          }),
        ),
      ],
    );
    addTearDown(c.dispose);
    container = c;
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    c.listen(electricMeterUsageRecordsProvider(9), (_, _) {});
  }

  test('build 默认按「日」拉当前时刻，dateStr 精确到日', () async {
    makeContainer(
      (_) => TaskEither.right(
        const [ElectricMeterUsageRecordEntity(usedKwh: '0.00kWh')],
      ),
    );
    final state = await container.read(
      electricMeterUsageRecordsProvider(9).future,
    );
    expect(state.dateType, MeterDateType.day);
    expect(state.records.single.usedKwh, '0.00kWh');
    expect(calls.single.meterId, 9);
    expect(calls.single.dateType, 0);
    expect(calls.single.dateStr, MeterDateType.day.dateStr(DateTime.now()));
  });

  test('setDateType 用对应粒度的 dateStr 重拉', () async {
    makeContainer((_) => TaskEither.right(const []));
    final notifier = container.read(
      electricMeterUsageRecordsProvider(9).notifier,
    );
    await container.read(electricMeterUsageRecordsProvider(9).future);
    await notifier.setDateType(MeterDateType.month);

    expect(calls.last.dateType, 1);
    expect(calls.last.dateStr, MeterDateType.month.dateStr(DateTime.now()));
    expect(
      container.read(electricMeterUsageRecordsProvider(9)).value?.dateType,
      MeterDateType.month,
    );
  });

  test('拉取失败时以 AsyncError 呈现', () async {
    makeContainer((_) => TaskEither.left(AppException.unknown(message: 'boom')));
    // 口径同 T6：不要用 `.future` + `throwsA`（本版 Riverpod 会自动重试，future 挂起）。
    container.read(electricMeterUsageRecordsProvider(9));
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    final st = container.read(electricMeterUsageRecordsProvider(9));
    expect(st.hasError, isTrue);
    expect(st.error, isA<AppException>());
  });
}
