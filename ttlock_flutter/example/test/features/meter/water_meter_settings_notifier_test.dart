import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_settings_notifier.dart';

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain(this._meter, {this.firmware});

  final WaterMeterEntity _meter;
  final MeterFirmwareEntity? firmware;

  final writes = <String>[];

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      TaskEither.right(_meter);

  @override
  Future<bool> isCatOne(String featureValue) async => featureValue == 'fv-cat1';

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo(int meterId) =>
      firmware == null
      ? TaskEither.left(AppException.unknown(message: 'upgrade check down'))
      : TaskEither.right(firmware!);

  @override
  TaskEither<AppException, Unit> setTotalUsage(
    WaterMeterEntity meter, {
    required double totalM3,
  }) => _unit('setTotalUsage', '$totalM3');

  @override
  TaskEither<AppException, Unit> setPrice(
    WaterMeterEntity meter, {
    required double price,
  }) => _unit('setPrice', '$price');

  @override
  TaskEither<AppException, Unit> setPayMode(
    WaterMeterEntity meter, {
    required MeterPayMode mode,
    double? price,
  }) => _unit('setPayMode', '${mode.value}:$price');

  @override
  TaskEither<AppException, Unit> clearRemainder(WaterMeterEntity meter) =>
      _unit('clear', '');

  @override
  TaskEither<AppException, Unit> readMeter(WaterMeterEntity meter) =>
      _unit('readMeter', '');

  TaskEither<AppException, Unit> _unit(String name, String arg) {
    writes.add('$name($arg)');
    return TaskEither.right(unit);
  }
}

const _prepaid = WaterMeterEntity(
  waterMeterId: 7,
  payMode: MeterPayMode.prepaid,
  featureValue: 'fv-cat1',
);

const _firmware = MeterFirmwareEntity(
  needUpgrade: false,
  firmwareRevision: '1.1.28.250625',
  version: '1.1.28.250626',
);

void main() {
  ProviderContainer makeContainer(
    WaterMeterEntity meter, {
    bool firmwareAvailable = true,
  }) {
    final c = ProviderContainer(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeWaterMeterDomain(
            meter,
            firmware: firmwareAvailable ? _firmware : null,
          ),
        ),
      ],
    );
    addTearDown(c.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    c.listen(waterMeterSettingsProvider(7), (_, _) {});
    return c;
  }

  test('build 同时取详情、固件与 Cat.1 判定', () async {
    final container = makeContainer(_prepaid);
    final state = await container.read(waterMeterSettingsProvider(7).future);
    expect(state.item.waterMeterId, 7);
    expect(state.isCatOne, isTrue);
    expect(state.firmware?.needUpgrade, isFalse);
    expect(state.canClear, isTrue);
    expect(state.canEditPrice, isTrue);
  });

  test('计能模式：电价与清零都不可用', () async {
    final container = makeContainer(
      const WaterMeterEntity(waterMeterId: 7, featureValue: 'fv-cat1'),
    );
    final state = await container.read(waterMeterSettingsProvider(7).future);
    expect(state.canClear, isFalse);
    expect(state.canEditPrice, isFalse);
  });

  test('固件检查失败：firmware 为 null，其余信息照常', () async {
    final container = makeContainer(_prepaid, firmwareAvailable: false);
    final state = await container.read(waterMeterSettingsProvider(7).future);
    expect(state.firmware, isNull);
    expect(state.item.waterMeterId, 7);
  });

  test('各写操作透传到对应 Domain 方法', () async {
    final container = makeContainer(_prepaid);
    final notifier = container.read(waterMeterSettingsProvider(7).notifier);
    await container.read(waterMeterSettingsProvider(7).future);

    expect(await notifier.setTotalUsage(12.5), isTrue);
    expect(await notifier.setPrice(0.8), isTrue);
    expect(await notifier.setPayMode(MeterPayMode.prepaid, price: 0.8), isTrue);
    expect(await notifier.clear(), isTrue);
    expect(await notifier.readMeter(), isTrue);

    final domain =
        container.read(waterMeterDomainProvider.notifier)
            as _FakeWaterMeterDomain;
    expect(domain.writes, [
      'setTotalUsage(12.5)',
      'setPrice(0.8)',
      'setPayMode(1:0.8)',
      'clear()',
      'readMeter()',
    ]);
  });
}
