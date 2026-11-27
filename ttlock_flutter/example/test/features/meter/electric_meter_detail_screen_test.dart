import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_detail_screen.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

class _FakeElectricMeterDomain extends ElectricMeterDomain {
  _FakeElectricMeterDomain(this._item);

  final ElectricMeterEntity _item;

  @override
  void build() {}

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) =>
      TaskEither.right(_item);
}

Future<void> _pump(WidgetTester tester, MeterPayMode payMode) async {
  final entity = ElectricMeterEntity(
    electricMeterId: 7,
    name: '电表A',
    number: 'EM-7',
    totalKwh: '100.5',
    remainderKwh: '10.0',
    maxPower: '8.8',
    price: '1.2',
    payMode: payMode,
  );
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        electricMeterDomainProvider.overrideWith(
          () => _FakeElectricMeterDomain(entity),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ElectricMeterDetailScreen(meterId: entity.electricMeterId),
      ),
    ),
  );
  // 详情屏每次进入都请求 detail，等异步加载落地后再断言。
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('电表详情有删除入口，计能模式没有充值入口', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.energy);

    expect(find.byKey(const Key('electric_meter_detail')), findsOneWidget);
    // 删除已改为纯 BLE（SDK 通知服务器），电表同样有入口 ——
    // 原「电表不加删除入口」的红线只针对云端 delete 端点。
    expect(find.byKey(const Key('electric_meter_delete')), findsOneWidget);
    // 计能模式无剩余量可充，充值入口不显示（spec §6.1 的门控）。
    expect(find.byKey(const Key('electric_meter_recharge')), findsNothing);
    expect(find.byKey(const Key('electric_meter_rename')), findsOneWidget);
  });

  testWidgets('读数 / 单价 / 最大功率 都带标准单位（千瓦时 / 元每千瓦时 / 千瓦）', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(find.text('100.5 千瓦时'), findsOneWidget);
    expect(find.text('10.0 千瓦时'), findsOneWidget);
    expect(find.text('1.2 元/千瓦时'), findsOneWidget);
    expect(find.text('8.8 千瓦'), findsOneWidget);
  });

  testWidgets('入口区含设备设置 / 操作记录 / 用电记录（spec §6.1）', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(
      find.byKey(const Key('electric_meter_settings_entry')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_operation_records_entry')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('electric_meter_usage_records_entry')),
      findsOneWidget,
    );
    expect(find.text(l10n.meterSettings), findsOneWidget);
    expect(find.text(l10n.meterOperationRecords), findsOneWidget);
    expect(find.text(l10n.meterUsageRecordsElectric), findsOneWidget);
  });

  testWidgets('预付费模式下显示充值入口', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pump(tester, MeterPayMode.prepaid);

    expect(find.byKey(const Key('electric_meter_recharge')), findsOneWidget);
  });
}
