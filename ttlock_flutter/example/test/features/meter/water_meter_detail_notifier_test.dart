import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_detail_notifier.dart';

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain({this.deleteError});

  final AppException? deleteError;
  int detailCalls = 0;
  int deleteCalls = 0;
  ({double amount, double m3})? lastRecharge;

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) {
    detailCalls++;
    return TaskEither.right(
      WaterMeterEntity(waterMeterId: meterId, mac: 'AA:W1'),
    );
  }

  @override
  TaskEither<AppException, Unit> delete({required WaterMeterEntity meter}) {
    deleteCalls++;
    final err = deleteError;
    return err != null ? TaskEither.left(err) : TaskEither.right(unit);
  }

  @override
  TaskEither<AppException, Unit> rechargeMeter(
    WaterMeterEntity meter, {
    required double amount,
    required double m3,
  }) {
    lastRecharge = (amount: amount, m3: m3);
    return TaskEither.right(unit);
  }
}

const meterId = 7;

ProviderContainer _container(_FakeWaterMeterDomain fake) {
  final c = ProviderContainer(
    overrides: [waterMeterDomainProvider.overrideWith(() => fake)],
  );
  addTearDown(c.dispose);
  // autoDispose provider 需要有人监听才不会被回收。
  c.listen(waterMeterDetailProvider(meterId), (_, _) {});
  return c;
}

void main() {
  test('build 按 meterId 直取详情 —— 不复用列表 entity，进页面即发请求', () async {
    final fake = _FakeWaterMeterDomain();
    final c = _container(fake);
    final state = await c.read(waterMeterDetailProvider(meterId).future);
    expect(state.item.waterMeterId, meterId);
    expect(fake.detailCalls, 1);
  });

  test('provider 重建（再次进入页面）时重新请求 detail 接口', () async {
    final fake = _FakeWaterMeterDomain();
    final c = _container(fake);
    await c.read(waterMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 1);

    c.invalidate(waterMeterDetailProvider(meterId));
    await c.read(waterMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 2);
  });

  test('删除：走 Domain.delete（纯 BLE），成功后详情被重拉', () async {
    final fake = _FakeWaterMeterDomain();
    final c = _container(fake);
    await c.read(waterMeterDetailProvider(meterId).future);
    expect(fake.detailCalls, 1);

    final ok = await c
        .read(waterMeterDetailProvider(meterId).notifier)
        .delete();
    expect(ok, isTrue);
    expect(fake.deleteCalls, 1);

    // invalidateSelf 的重建在下一个 turn 才发生。
    await Future<void>.delayed(Duration.zero);
    expect(fake.detailCalls, greaterThan(1));
  });

  test('删除失败：返回 false 并留在 state.error，供界面提示', () async {
    final fake = _FakeWaterMeterDomain(
      deleteError: AppException.unknown(message: 'ble down'),
    );
    final c = _container(fake);
    await c.read(waterMeterDetailProvider(meterId).future);

    final ok = await c
        .read(waterMeterDetailProvider(meterId).notifier)
        .delete();
    expect(ok, isFalse);
    expect(fake.deleteCalls, 1);

    final st = c.read(waterMeterDetailProvider(meterId)).value;
    expect(st?.operating, isFalse);
    expect(st?.error, isA<AppException>());
  });

  test('充值：amount 与 m3 透传到 Domain', () async {
    final fake = _FakeWaterMeterDomain();
    final c = _container(fake);
    await c.read(waterMeterDetailProvider(meterId).future);

    final ok = await c
        .read(waterMeterDetailProvider(meterId).notifier)
        .recharge(amount: 30, m3: 15);
    expect(ok, isTrue);
    expect(fake.lastRecharge?.amount, 30);
    expect(fake.lastRecharge?.m3, 15);
  });
}
