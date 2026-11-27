import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_settings_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';

class _FakeElectricMeterDomain extends ElectricMeterDomain {
  _FakeElectricMeterDomain(this._meter, {this.firmware});

  final ElectricMeterEntity _meter;
  final MeterFirmwareEntity? firmware;

  final writes = <String>[];

  @override
  void build() {}

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      TaskEither.right(_meter);

  @override
  Future<bool> isCatOne(String featureValue) async => featureValue == 'fv-cat1';

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo(int meterId) =>
      firmware == null
      ? TaskEither.left(AppException.unknown(message: 'upgrade check down'))
      : TaskEither.right(firmware!);

  @override
  TaskEither<AppException, Unit> setMaxPower(
    ElectricMeterEntity meter, {
    required int maxPower,
  }) => _unit('setMaxPower', '$maxPower');

  @override
  TaskEither<AppException, Unit> setPrice(
    ElectricMeterEntity meter, {
    required double price,
  }) => _unit('setPrice', '$price');

  @override
  TaskEither<AppException, Unit> setPayMode(
    ElectricMeterEntity meter, {
    required MeterPayMode mode,
    double? price,
  }) => _unit('setPayMode', '${mode.value}:$price');

  @override
  TaskEither<AppException, Unit> clearRemainder(ElectricMeterEntity meter) =>
      _unit('clear', '');

  @override
  TaskEither<AppException, Unit> readMeter(ElectricMeterEntity meter) =>
      _unit('readMeter', '');

  TaskEither<AppException, Unit> _unit(String name, String arg) {
    writes.add('$name($arg)');
    return TaskEither.right(unit);
  }
}

const _prepaid = ElectricMeterEntity(
  electricMeterId: 9,
  payMode: MeterPayMode.prepaid,
  featureValue: 'fv-cat1',
);

const _firmware = MeterFirmwareEntity(
  needUpgrade: true,
  firmwareRevision: '1.1.28.250625',
  version: '1.1.28.250626',
);

void main() {
  ProviderContainer makeContainer(
    ElectricMeterEntity meter, {
    bool firmwareAvailable = true,
  }) {
    final c = ProviderContainer(
      overrides: [
        electricMeterDomainProvider.overrideWith(
          () => _FakeElectricMeterDomain(
            meter,
            firmware: firmwareAvailable ? _firmware : null,
          ),
        ),
      ],
    );
    addTearDown(c.dispose);
    // 模拟页面 watch：保持 autoDispose provider 在 await 间隙不被回收。
    c.listen(electricMeterSettingsProvider(9), (_, _) {});
    return c;
  }

  test('build 同时取详情、固件与 Cat.1 判定', () async {
    final container = makeContainer(_prepaid);
    final state = await container.read(electricMeterSettingsProvider(9).future);
    expect(state.item.electricMeterId, 9);
    expect(state.isCatOne, isTrue);
    expect(state.firmware?.needUpgrade, isTrue);
    expect(state.canClear, isTrue);
    expect(state.canEditPrice, isTrue);
  });

  test('计能模式：电价与清零都不可用', () async {
    final container = makeContainer(
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv-cat1'),
    );
    final state = await container.read(electricMeterSettingsProvider(9).future);
    expect(state.canClear, isFalse);
    expect(state.canEditPrice, isFalse);
  });

  test('非 Cat.1：isCatOne 为假', () async {
    final container = makeContainer(
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv-plain'),
    );
    final state = await container.read(electricMeterSettingsProvider(9).future);
    expect(state.isCatOne, isFalse);
  });

  test('固件检查失败：firmware 为 null，其余信息照常', () async {
    final container = makeContainer(_prepaid, firmwareAvailable: false);
    final state = await container.read(electricMeterSettingsProvider(9).future);
    expect(state.firmware, isNull);
    expect(state.item.electricMeterId, 9);
  });

  test('抄表成功后自身重拉', () async {
    final container = makeContainer(_prepaid);
    await container.read(electricMeterSettingsProvider(9).future);
    final ok = await container
        .read(electricMeterSettingsProvider(9).notifier)
        .readMeter();
    expect(ok, isTrue);
  });

  test('各写操作透传到对应 Domain 方法', () async {
    final container = makeContainer(_prepaid);
    final notifier = container.read(electricMeterSettingsProvider(9).notifier);
    await container.read(electricMeterSettingsProvider(9).future);

    expect(await notifier.setMaxPower(20), isTrue);
    expect(await notifier.setPrice(1.5), isTrue);
    expect(await notifier.setPayMode(MeterPayMode.energy), isTrue);
    expect(await notifier.clear(), isTrue);
    expect(await notifier.readMeter(), isTrue);

    final domain =
        container.read(electricMeterDomainProvider.notifier)
            as _FakeElectricMeterDomain;
    expect(domain.writes, [
      'setMaxPower(20)',
      'setPrice(1.5)',
      'setPayMode(0:null)',
      'clear()',
      'readMeter()',
    ]);
  });
}
