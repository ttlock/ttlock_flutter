import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_list_notifier.dart';

class _FakeElectricMeterDomain extends ElectricMeterDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
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

ElectricMeterEntity meter(int id) =>
    ElectricMeterEntity(electricMeterId: id, name: 'Meter-$id');

void main() {
  test('build 首页 + loadMore 聚合直至 hasMore=false', () async {
    final container = ProviderContainer(
      overrides: [
        electricMeterDomainProvider.overrideWith(_FakeElectricMeterDomain.new),
      ],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(electricMeterListProvider, (_, _) {});

    final first = await container.read(electricMeterListProvider.future);
    expect(first.pageState.data.length, 2);
    expect(first.pageState.hasMore, isTrue);

    await container.read(electricMeterListProvider.notifier).loadMore();

    final merged = container.read(electricMeterListProvider).value!;
    expect(merged.pageState.data.length, 3);
    expect(merged.pageState.currentPage, 2);
    expect(merged.pageState.hasMore, isFalse);
  });

  test('refresh 重置回第一页', () async {
    final container = ProviderContainer(
      overrides: [
        electricMeterDomainProvider.overrideWith(_FakeElectricMeterDomain.new),
      ],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(electricMeterListProvider, (_, _) {});

    await container.read(electricMeterListProvider.future);
    final notifier = container.read(electricMeterListProvider.notifier);
    await notifier.loadMore();
    expect(
      container.read(electricMeterListProvider).value!.pageState.data.length,
      3,
    );

    await notifier.refresh();

    final refreshed = container.read(electricMeterListProvider).value!;
    expect(refreshed.pageState.data.length, 2);
    expect(refreshed.pageState.currentPage, 1);
  });
}
