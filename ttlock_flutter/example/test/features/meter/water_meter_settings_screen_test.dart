import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_settings_screen.dart';

class _FakeDomain extends WaterMeterDomain {
  _FakeDomain(this.meter, {this.firmware});

  final WaterMeterEntity meter;
  final MeterFirmwareEntity? firmware;

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
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
  WaterMeterEntity meter, {
  MeterFirmwareEntity? firmware,
}) async {
  await tester.binding.setSurfaceSize(const Size(800, 2000));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeDomain(meter, firmware: firmware),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const WaterMeterSettingsScreen(meterId: 7),
      ),
    ),
  );
  await tester.pump();
  await tester.pump();
}

const _firmware = MeterFirmwareEntity(
  needUpgrade: false,
  firmwareRevision: '1.1.28.250625',
  version: '1.1.28.250626',
);

void main() {
  testWidgets('预付费 + Cat.1：操作区含总用量而非最大功率', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(
        waterMeterId: 7,
        payMode: MeterPayMode.prepaid,
        featureValue: 'fv-cat1',
      ),
      firmware: _firmware,
    );
    expect(
      find.byKey(const Key('water_meter_settings_total_usage')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('water_meter_settings_price')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('water_meter_settings_pay_mode')),
      findsOneWidget,
    );
    expect(find.byKey(const Key('water_meter_settings_clear')), findsOneWidget);
    expect(find.byKey(const Key('water_meter_settings_read')), findsOneWidget);
    // 水表**没有**最大功率操作（SDK 无 setMaxPower）。
    expect(
      find.byKey(const Key('electric_meter_settings_max_power')),
      findsNothing,
    );
    expect(find.text('已是最新版本'), findsOneWidget);
  });

  // 注意：不要在同一条用例里换 featureValue 再 pump —— Riverpod 重载时保留旧值，
  // 需要跨帧才能落到新态。拆成两条用例，各自一副全新的树。
  testWidgets('Cat.1：设置页出现 4G 网络入口（spec §5.3）', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(waterMeterId: 7, featureValue: 'fv-cat1'),
      firmware: _firmware,
    );
    expect(
      find.byKey(const Key('water_meter_settings_cat_one')),
      findsOneWidget,
    );
  });

  testWidgets('非 Cat.1：设置页不出现 4G 网络入口', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(waterMeterId: 7, featureValue: 'fv-plain'),
      firmware: _firmware,
    );
    expect(find.byKey(const Key('water_meter_settings_cat_one')), findsNothing);
  });

  testWidgets('计能模式：电价与清零都不出现', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(waterMeterId: 7, featureValue: 'fv'),
      firmware: _firmware,
    );
    expect(find.byKey(const Key('water_meter_settings_price')), findsNothing);
    expect(find.byKey(const Key('water_meter_settings_clear')), findsNothing);
    expect(
      find.byKey(const Key('water_meter_settings_total_usage')),
      findsOneWidget,
    );
  });

  testWidgets('固件不可用：显示占位，页面其余部分照常', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(waterMeterId: 7, featureValue: 'fv'),
    );
    expect(find.text('固件信息暂不可用'), findsOneWidget);
    expect(find.byKey(const Key('water_meter_settings_read')), findsOneWidget);
  });

  testWidgets('设备信息逐行渲染，空值落占位符', (tester) async {
    await _pump(
      tester,
      const WaterMeterEntity(
        waterMeterId: 7,
        number: 'WM-7',
        mac: 'AA:W1',
        syncM3Date: '2024-09-06',
        featureValue: 'fv',
      ),
      firmware: _firmware,
    );
    expect(find.text('WM-7'), findsOneWidget);
    expect(find.text('AA:W1'), findsOneWidget);
    // 水表 syncM3Date 是 String，直接展示。
    expect(find.text('2024-09-06'), findsOneWidget);
    expect(find.text('—'), findsWidgets);
  });
}
