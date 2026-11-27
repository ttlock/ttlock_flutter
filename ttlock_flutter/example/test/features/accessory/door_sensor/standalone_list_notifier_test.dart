import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_notifier.dart';

/// 模拟分页：第 1 页返回 20 项，第 2 页返回 5 项，total=25。
class _FakeStandaloneDoorSensorDomain extends StandaloneDoorSensorDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) {
    final data = pageNo == 1
        ? List.generate(20, (i) => ds(i + 1))
        : List.generate(5, (i) => ds(i + 21));
    return TaskEither.right(
      PageState(data: data, currentPage: pageNo, total: 25),
    );
  }
}

StandaloneDoorSensorEntity ds(int id) => StandaloneDoorSensorEntity(
  doorSensorId: id,
  mac: 'AA:BB:CC:DD:EE:0$id',
  name: 'DS-$id',
);

void main() {
  test('loadMore appends and stops at total', () async {
    final container = ProviderContainer(
      overrides: [
        standaloneDoorSensorDomainProvider.overrideWith(
          _FakeStandaloneDoorSensorDomain.new,
        ),
      ],
    );
    addTearDown(container.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    container.listen(standaloneDoorSensorListProvider, (_, _) {});

    final notifier = container.read(standaloneDoorSensorListProvider.notifier);
    final first = await container.read(standaloneDoorSensorListProvider.future);
    expect(first.pageState.data.length, 20);
    expect(first.pageState.currentPage, 1);
    expect(first.pageState.hasMore, isTrue);

    await notifier.loadMore();

    final merged = container.read(standaloneDoorSensorListProvider).value!;
    expect(merged.pageState.data.length, 25);
    expect(merged.pageState.currentPage, 2);
    expect(merged.pageState.hasMore, isFalse);
  });

  test('refresh 重置回第一页', () async {
    final container = ProviderContainer(
      overrides: [
        standaloneDoorSensorDomainProvider.overrideWith(
          _FakeStandaloneDoorSensorDomain.new,
        ),
      ],
    );
    addTearDown(container.dispose);
    container.listen(standaloneDoorSensorListProvider, (_, _) {});

    await container.read(standaloneDoorSensorListProvider.future);
    final notifier = container.read(standaloneDoorSensorListProvider.notifier);

    await notifier.loadMore();
    expect(
      container.read(standaloneDoorSensorListProvider).value!.pageState.data,
      hasLength(25),
    );

    await notifier.refresh();

    final refreshed = container.read(standaloneDoorSensorListProvider).value!;
    expect(refreshed.pageState.data.length, 20);
    expect(refreshed.pageState.currentPage, 1);
    expect(refreshed.pageState.hasMore, isTrue);
  });
}
