import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_list_notifier.dart';

class _FakeWaterMeterDomain extends WaterMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<WaterMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) {
    final data = switch (pageNo) {
      1 => [meter(1), meter(2)],
      _ => [meter(3)],
    };
    return TaskEither.right(
      PageState(data: data, currentPage: pageNo, total: 3),
    );
  }
}

WaterMeterEntity meter(int id) => WaterMeterEntity(
  waterMeterId: id,
  mac: 'AA:BB:CC:DD:EE:0$id',
  name: 'Meter-$id',
);

void main() {
  test('build 首页 + loadMore 聚合直至 hasMore=false', () async {
    final container = ProviderContainer(
      overrides: [
        waterMeterDomainProvider.overrideWith(_FakeWaterMeterDomain.new),
      ],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(waterMeterListProvider, (_, _) {});

    final first = await container.read(waterMeterListProvider.future);
    expect(first.pageState.data.length, 2);
    expect(first.pageState.hasMore, isTrue);

    await container.read(waterMeterListProvider.notifier).loadMore();

    final merged = container.read(waterMeterListProvider).value!;
    expect(merged.pageState.data.length, 3);
    expect(merged.pageState.currentPage, 2);
    expect(merged.pageState.hasMore, isFalse);
  });

  test('refresh 重置回第一页', () async {
    final container = ProviderContainer(
      overrides: [
        waterMeterDomainProvider.overrideWith(_FakeWaterMeterDomain.new),
      ],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(waterMeterListProvider, (_, _) {});

    await container.read(waterMeterListProvider.future);
    final notifier = container.read(waterMeterListProvider.notifier);
    await notifier.loadMore();
    expect(
      container.read(waterMeterListProvider).value!.pageState.data.length,
      3,
    );

    await notifier.refresh();

    final refreshed = container.read(waterMeterListProvider).value!;
    expect(refreshed.pageState.data.length, 2);
    expect(refreshed.pageState.currentPage, 1);
  });
}
