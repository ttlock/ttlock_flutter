import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_cat_one_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_cat_one_state.dart';

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain({
    required this.infoResults,
    this.needsApn = false,
    this.onConfigure,
  });

  /// 每次 `catOneInfo` 调用按顺序取一个结果（最后一次重复使用）。
  final List<TaskEither<AppException, MeterCatOneInfoEntity>> infoResults;
  final bool needsApn;
  final TaskEither<AppException, Unit> Function(String? apn)? onConfigure;

  var infoCalls = 0;
  final configureCalls = <String?>[];

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      TaskEither.right(WaterMeterEntity(waterMeterId: meterId, mac: 'AA:W1'));

  @override
  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo(int meterId) {
    final r = infoResults[infoCalls.clamp(0, infoResults.length - 1)];
    infoCalls++;
    return r;
  }

  @override
  TaskEither<AppException, bool> catOneNeedsApn() =>
      TaskEither.right(needsApn);

  @override
  TaskEither<AppException, Unit> configureCatOneFromSettings(
    WaterMeterEntity meter, {
    String? apn,
  }) {
    configureCalls.add(apn);
    return onConfigure?.call(apn) ?? TaskEither.right(unit);
  }
}

const _full = MeterCatOneInfoEntity(
  rssiGrade: 2,
  catOneNodeId: 'node1',
  catOneCardNumber: '898600',
);
const _empty = MeterCatOneInfoEntity();

void main() {
  ProviderContainer makeContainer(_FakeWaterMeterDomain domain) {
    final c = ProviderContainer(
      overrides: [waterMeterDomainProvider.overrideWith(() => domain)],
    );
    addTearDown(c.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    c.listen(waterMeterCatOneProvider(7), (_, _) {});
    return c;
  }

  test('信息非空 → configured', () async {
    final c = makeContainer(
      _FakeWaterMeterDomain(infoResults: [TaskEither.right(_full)]),
    );
    final state = await c.read(waterMeterCatOneProvider(7).future);
    expect(state.step, isA<WaterMeterCatOneStepConfigured>());
  });

  test('信息字段全空 → unconfigured', () async {
    final c = makeContainer(
      _FakeWaterMeterDomain(infoResults: [TaskEither.right(_empty)]),
    );
    final state = await c.read(waterMeterCatOneProvider(7).future);
    expect(state.step, isA<WaterMeterCatOneStepUnconfigured>());
  });

  test('网络类失败 → unavailable（重试）', () async {
    final c = makeContainer(
      _FakeWaterMeterDomain(
        infoResults: [
          TaskEither.left(
            AppException.network(exception: 'timeout', message: 'timeout'),
          ),
        ],
      ),
    );
    final state = await c.read(waterMeterCatOneProvider(7).future);
    expect(state.step, isA<WaterMeterCatOneStepUnavailable>());
  });

  test('非网络类业务失败 → unconfigured（spec §6.3 判据 2）', () async {
    final c = makeContainer(
      _FakeWaterMeterDomain(
        infoResults: [
          TaskEither.left(AppException.business(code: 3001, message: '未配置')),
        ],
      ),
    );
    final state = await c.read(waterMeterCatOneProvider(7).future);
    expect(state.step, isA<WaterMeterCatOneStepUnconfigured>());
  });

  test('needsApn 透传站点判定', () async {
    final c = makeContainer(
      _FakeWaterMeterDomain(
        infoResults: [TaskEither.right(_empty)],
        needsApn: true,
      ),
    );
    final state = await c.read(waterMeterCatOneProvider(7).future);
    expect(state.needsApn, isTrue);
  });

  test('配置成功 → 重拉信息并切到 configured', () async {
    final domain = _FakeWaterMeterDomain(
      infoResults: [TaskEither.right(_empty), TaskEither.right(_full)],
    );
    final c = makeContainer(domain);
    await c.read(waterMeterCatOneProvider(7).future);
    final ok = await c
        .read(waterMeterCatOneProvider(7).notifier)
        .configure(apn: 'cmnet');

    expect(ok, isTrue);
    expect(domain.configureCalls, ['cmnet']);
    expect(
      c.read(waterMeterCatOneProvider(7)).value?.step,
      isA<WaterMeterCatOneStepConfigured>(),
    );
  });

  test('configure 失败：保留原态并记下错误', () async {
    final domain = _FakeWaterMeterDomain(
      infoResults: [TaskEither.right(_empty)],
      onConfigure: (_) =>
          TaskEither.left(AppException.unknown(message: 'ble down')),
    );
    final c = makeContainer(domain);
    await c.read(waterMeterCatOneProvider(7).future);
    final ok = await c.read(waterMeterCatOneProvider(7).notifier).configure();

    expect(ok, isFalse);
    expect(
      c.read(waterMeterCatOneProvider(7)).value?.step,
      isA<WaterMeterCatOneStepUnconfigured>(),
    );
    expect(c.read(waterMeterCatOneProvider(7)).value?.error, isNotNull);
  });
}
