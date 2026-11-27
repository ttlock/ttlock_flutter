import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/provider/gateway_domain.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_list_notifier.dart';

class _FakeGatewayDomain extends GatewayDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({int pageNo = 1}) {
    final data = switch (pageNo) {
      1 => [gw(1), gw(2)],
      _ => [gw(3)],
    };
    return TaskEither.right(
      PageState(data: data, currentPage: pageNo, total: 3),
    );
  }
}

GatewayEntity gw(int id) => GatewayEntity(
  gatewayId: id,
  gatewayMac: 'AA:BB:CC:DD:EE:0$id',
  gatewayName: 'GW-$id',
);

void main() {
  test('build 首页 + loadMore 聚合直至 hasMore=false', () async {
    final container = ProviderContainer(
      overrides: [gatewayDomainProvider.overrideWith(_FakeGatewayDomain.new)],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(gatewayListProvider, (_, _) {});

    final first = await container.read(gatewayListProvider.future);
    expect(first.pageState.data.length, 2);
    expect(first.pageState.hasMore, isTrue);

    await container.read(gatewayListProvider.notifier).loadMore();

    final merged = container.read(gatewayListProvider).value!;
    expect(merged.pageState.data.length, 3);
    expect(merged.pageState.currentPage, 2);
    expect(merged.pageState.hasMore, isFalse);
  });

  test('refresh 重置回第一页', () async {
    final container = ProviderContainer(
      overrides: [gatewayDomainProvider.overrideWith(_FakeGatewayDomain.new)],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(gatewayListProvider, (_, _) {});

    await container.read(gatewayListProvider.future);
    final notifier = container.read(gatewayListProvider.notifier);
    await notifier.loadMore();
    expect(container.read(gatewayListProvider).value!.pageState.data.length, 3);

    await notifier.refresh();

    final refreshed = container.read(gatewayListProvider).value!;
    expect(refreshed.pageState.data.length, 2);
    expect(refreshed.pageState.currentPage, 1);
  });
}
