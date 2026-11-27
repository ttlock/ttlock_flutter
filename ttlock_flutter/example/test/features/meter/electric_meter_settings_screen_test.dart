import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_settings_screen.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';

class _FakeDomain extends ElectricMeterDomain {
  _FakeDomain(this.meter, {this.firmware});

  final ElectricMeterEntity meter;
  final MeterFirmwareEntity? firmware;

  @override
  void build() {}

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      TaskEither.right(meter);

  @override
  Future<bool> isCatOne(String featureValue) async => featureValue == 'fv-cat1';

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo(int meterId) =>
      firmware == null
      ? TaskEither.left(AppException.unknown(message: 'down'))
      : TaskEither.right(firmware!);
}

Future<void> _pump(
  WidgetTester tester,
  ElectricMeterEntity meter, {
  MeterFirmwareEntity? firmware,
}) async {
  await tester.binding.setSurfaceSize(const Size(800, 2000));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        electricMeterDomainProvider.overrideWith(
          () => _FakeDomain(meter, firmware: firmware),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ElectricMeterSettingsScreen(meterId: 9),
      ),
    ),
  );
  await tester.pump();
  await tester.pump();
}

const _upgradableFirmware = MeterFirmwareEntity(
  needUpgrade: true,
  firmwareRevision: '1.1.28.250625',
  version: '1.1.28.250626',
);

void main() {
  testWidgets('预付费：操作区含最大功率 / 电价 / 计费模式 / 清零 / 抄表', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(
        electricMeterId: 9,
        payMode: MeterPayMode.prepaid,
        featureValue: 'fv-cat1',
      ),
      firmware: _upgradableFirmware,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_max_power')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_price')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_pay_mode')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_clear')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_read')),
      findsOneWidget,
    );
    // 固件区展示当前/最新/是否需要升级。
    expect(find.text('1.1.28.250625'), findsOneWidget);
    expect(find.text('1.1.28.250626'), findsOneWidget);
    expect(find.text('有新版本可升级'), findsOneWidget);
  });

  // 注意：不要在同一条用例里换 featureValue 再 pump —— Riverpod 重载时保留旧值，
  // 需要跨帧才能落到新态。拆成两条用例，各自一副全新的树。
  testWidgets('Cat.1：设置页出现 4G 网络入口（spec §5.3）', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv-cat1'),
      firmware: _upgradableFirmware,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_cat_one')),
      findsOneWidget,
    );
  });

  testWidgets('非 Cat.1：设置页不出现 4G 网络入口', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv-plain'),
      firmware: _upgradableFirmware,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_cat_one')),
      findsNothing,
    );
  });

  testWidgets('计能模式：电价与清零都不出现', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv'),
      firmware: _upgradableFirmware,
    );
    expect(find.byKey(const Key('electric_meter_settings_price')), findsNothing);
    expect(find.byKey(const Key('electric_meter_settings_clear')), findsNothing);
    expect(
      find.byKey(const Key('electric_meter_settings_max_power')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_settings_pay_mode')),
      findsOneWidget,
    );
  });

  testWidgets('固件不可用：显示占位，页面其余部分照常', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(electricMeterId: 9, featureValue: 'fv'),
    );
    expect(find.text('固件信息暂不可用'), findsOneWidget);
    expect(
      find.byKey(const Key('electric_meter_settings_read')),
      findsOneWidget,
    );
  });

  testWidgets('设备信息逐行渲染，空值落占位符', (tester) async {
    await _pump(
      tester,
      const ElectricMeterEntity(
        electricMeterId: 9,
        number: 'EM-9',
        mac: 'BB:W1',
        modelNum: 'SN774-V01',
        featureValue: 'fv',
      ),
      firmware: _upgradableFirmware,
    );
    expect(find.text('EM-9'), findsOneWidget);
    expect(find.text('BB:W1'), findsOneWidget);
    expect(find.text('SN774-V01'), findsOneWidget);
    // 硬件版本等未填字段 → 占位符。
    expect(find.text('—'), findsWidgets);
  });
}
