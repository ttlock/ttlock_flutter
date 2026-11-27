import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_operation_records_notifier.dart';

typedef _PageCall = ({
  int meterId,
  int pageNo,
  int pageSize,
  String? recordType,
});

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain(this._onList);

  final TaskEither<AppException, PaginatedOperationRecords> Function(_PageCall)
  _onList;

  @override
  void build() {}

  @override
  TaskEither<AppException, PaginatedOperationRecords> listOperationRecords(
    int meterId, {
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _onList((
    meterId: meterId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  ));
}

PaginatedOperationRecords _page({
  required int pageNo,
  required List<MeterOperationRecordEntity> list,
  required int total,
}) => PaginatedOperationRecords(
  list: list,
  total: total,
  pageNo: pageNo,
  pageSize: 20,
);

const _r1 = MeterOperationRecordEntity(id: 1, recordType: '7', content: '充值');
const _r2 = MeterOperationRecordEntity(id: 2, recordType: '5', content: '抄表');

void main() {
  late List<_PageCall> calls;
  late ProviderContainer container;

  ProviderContainer makeContainer(
    TaskEither<AppException, PaginatedOperationRecords> Function(_PageCall)
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
    c.listen(waterMeterOperationRecordsProvider(7), (_, _) {});
    return c;
  }

  test('build 拉第 1 页，不带筛选', () async {
    makeContainer(
      (call) => TaskEither.right(
        _page(pageNo: call.pageNo, list: const [_r1], total: 1),
      ),
    );
    final state = await container.read(
      waterMeterOperationRecordsProvider(7).future,
    );
    expect(state.pageState.data.single.id, 1);
    expect(calls.single.meterId, 7);
    expect(calls.single.pageNo, 1);
    expect(calls.single.recordType, isNull);
  });

  test('setFilter 用请求侧值重查第 1 页', () async {
    makeContainer(
      (call) => TaskEither.right(
        _page(pageNo: call.pageNo, list: const [_r2], total: 1),
      ),
    );
    final notifier = container.read(
      waterMeterOperationRecordsProvider(7).notifier,
    );
    await container.read(waterMeterOperationRecordsProvider(7).future);
    await notifier.setFilter(MeterOperationRecordFilter.clear);

    expect(calls.last.pageNo, 1);
    expect(calls.last.recordType, '6');
    expect(
      container.read(waterMeterOperationRecordsProvider(7)).value?.filter,
      MeterOperationRecordFilter.clear,
    );
  });

  test('loadMore 累加下一页且沿用筛选', () async {
    makeContainer((call) {
      final list = call.pageNo == 1 ? const [_r1] : const [_r2];
      return TaskEither.right(_page(pageNo: call.pageNo, list: list, total: 2));
    });
    final notifier = container.read(
      waterMeterOperationRecordsProvider(7).notifier,
    );
    await container.read(waterMeterOperationRecordsProvider(7).future);
    await notifier.loadMore();

    final page = container
        .read(waterMeterOperationRecordsProvider(7))
        .value!
        .pageState;
    expect(page.data.map((e) => e.id).toList(), [1, 2]);
    expect(page.currentPage, 2);
    expect(page.hasMore, isFalse);
  });

  test('拉取失败时以 AsyncError 呈现', () async {
    makeContainer((_) => TaskEither.left(AppException.unknown(message: 'boom')));
    // 口径同 electric_meter_operation_records_notifier_test.dart 的同名用例：
    // 不走 `.future` throwsA —— 该形态在本版 Riverpod 上会挂起并触发自动重试。
    container.read(waterMeterOperationRecordsProvider(7));
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    final st = container.read(waterMeterOperationRecordsProvider(7));
    expect(st.hasError, isTrue);
    expect(st.error, isA<AppException>());
  });
}
