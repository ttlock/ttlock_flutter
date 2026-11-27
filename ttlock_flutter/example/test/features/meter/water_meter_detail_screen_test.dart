import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_detail_screen.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

class _FakeWaterMeterDomain extends WaterMeterDomain {
  _FakeWaterMeterDomain(this._item);

  final WaterMeterEntity _item;

  @override
  void build() {}

  @override
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      TaskEither.right(_item);
}

Future<void> _pump(WidgetTester tester, MeterPayMode payMode) async {
  final entity = WaterMeterEntity(
    waterMeterId: 7,
    name: '水表A',
    number: 'WM-7',
    totalM3: '100.5',
    remainderM3: '10.0',
    price: '3.5',
    payMode: payMode,
  );
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        waterMeterDomainProvider.overrideWith(
          () => _FakeWaterMeterDomain(entity),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: WaterMeterDetailScreen(meterId: entity.waterMeterId),
      ),
    ),
  );
  // 详情屏每次进入都请求 detail，等异步加载落地后再断言。
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('水表详情保留删除入口；计能模式无充值入口', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.energy);

    expect(find.byKey(const Key('water_meter_detail')), findsOneWidget);
    // 删除已改为纯 BLE，水/电都有入口。
    expect(find.byKey(const Key('water_meter_delete')), findsOneWidget);
    // 计能模式无剩余量可充（spec §6.1 的门控）。
    expect(find.byKey(const Key('water_meter_recharge')), findsNothing);
    expect(find.byKey(const Key('water_meter_rename')), findsOneWidget);
  });

  testWidgets('读数与单价都带标准单位（吨 / 元每吨）', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(find.text('100.5 吨'), findsOneWidget);
    expect(find.text('10.0 吨'), findsOneWidget);
    expect(find.text('3.5 元/吨'), findsOneWidget);
  });

  testWidgets('入口区含设备设置 / 操作记录 / 用水记录（spec §6.1）', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(find.byKey(const Key('water_meter_settings_entry')), findsOneWidget);
    expect(
      find.byKey(const Key('water_meter_operation_records_entry')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('water_meter_usage_records_entry')),
      findsOneWidget,
    );
    expect(find.text(l10n.meterSettings), findsOneWidget);
    expect(find.text(l10n.meterOperationRecords), findsOneWidget);
    expect(find.text(l10n.meterUsageRecordsWater), findsOneWidget);
  });

  testWidgets('预付费模式下显示充值入口', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(find.byKey(const Key('water_meter_recharge')), findsOneWidget);
  });
}
