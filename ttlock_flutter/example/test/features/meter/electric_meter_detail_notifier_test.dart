import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_detail_notifier.dart';

class _FakeElectricMeterDomain extends ElectricMeterDomain {
  _FakeElectricMeterDomain({this.detailError, this.deleteError});

  final AppException? detailError;
  final AppException? deleteError;
  int detailCalls = 0;
  int deleteCalls = 0;

  @override
  void build() {}

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) {
    detailCalls++;
    final err = detailError;
    if (err != null) return TaskEither.left(err);
    return TaskEither.right(ElectricMeterEntity(electricMeterId: meterId));
  }

  @override
  TaskEither<AppException, Unit> setPowerOnOff(
    ElectricMeterEntity meter, {
    required bool on,
  }) => TaskEither.right(unit);

  @override
  TaskEither<AppException, Unit> rechargeMeter(
    ElectricMeterEntity meter, {
    required double amount,
    required double kwh,
  }) => TaskEither.right(unit);

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      TaskEither.right(unit);

  @override
  TaskEither<AppException, Unit> delete({
    required ElectricMeterEntity meter,
  }) {
    deleteCalls++;
    final err = deleteError;
    return err != null ? TaskEither.left(err) : TaskEither.right(unit);
  }
}

const meterId = 296;

ProviderContainer _container(_FakeElectricMeterDomain fake) {
  final c = ProviderContainer(
    overrides: [
      electricMeterDomainProvider.overrideWith(() => fake),
    ],
  );
  addTearDown(c.dispose);
  // autoDispose provider 需要有人监听才不会被回收。
  c.listen(electricMeterDetailProvider(meterId), (_, _) {});
  return c;
}

void main() {
  test('build 按 meterId 直取详情 —— 不复用列表 entity，进页面即发请求', () async {
    final fake = _FakeElectricMeterDomain();
    final c = _container(fake);
    final state = await c.read(electricMeterDetailProvider(meterId).future);
    expect(state.item.electricMeterId, meterId);
    expect(fake.detailCalls, 1);
  });

  test('provider 重建（再次进入页面）时重新请求 detail 接口', () async {
    final fake = _FakeElectricMeterDomain();
    final c = _container(fake);
    await c.read(electricMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 1);

    c.invalidate(electricMeterDetailProvider(meterId));
    await c.read(electricMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 2);
  });

  test('通断电成功后详情被重拉（invalidateSelf）', () async {
    final fake = _FakeElectricMeterDomain();
    final c = _container(fake);
    await c.read(electricMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 1);

    final ok = await c
        .read(electricMeterDetailProvider(meterId).notifier)
        .controlOnOff(on: true);
    expect(ok, isTrue);

    // invalidateSelf 的重建在下一个 turn 才发生。
    await Future<void>.delayed(Duration.zero);
    expect(fake.detailCalls, greaterThan(1));
  });

  test('删除：走 Domain.delete（纯 BLE），成功后详情被重拉', () async {
    final fake = _FakeElectricMeterDomain();
    final c = _container(fake);
    await c.read(electricMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 1);

    final ok = await c
        .read(electricMeterDetailProvider(meterId).notifier)
        .delete();
    expect(ok, isTrue);
    expect(fake.deleteCalls, 1);

    // invalidateSelf 的重建在下一个 turn 才发生。
    await Future<void>.delayed(Duration.zero);
    expect(fake.detailCalls, greaterThan(1));
  });

  test('删除失败：返回 false 并留在 state.error，供界面提示', () async {
    final fake = _FakeElectricMeterDomain(
      deleteError: AppException.unknown(message: 'ble down'),
    );
    final c = _container(fake);
    await c.read(electricMeterDetailProvider(meterId).future);

    final ok = await c
        .read(electricMeterDetailProvider(meterId).notifier)
        .delete();
    expect(ok, isFalse);
    expect(fake.deleteCalls, 1);

    final st = c.read(electricMeterDetailProvider(meterId)).value;
    expect(st?.operating, isFalse);
    expect(st?.error, isA<AppException>());
  });

  test('详情拉取失败时 build 抛出 AppException', () async {
    final fake = _FakeElectricMeterDomain(
      detailError: AppException.unknown(message: 'boom'),
    );
    final c = _container(fake);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    // 详情失败以 AsyncError 呈现，由界面映射成可读文案。
    final st = c.read(electricMeterDetailProvider(meterId));
    expect(st.hasError, isTrue);
    expect(st.error, isA<AppException>());
  });
}
