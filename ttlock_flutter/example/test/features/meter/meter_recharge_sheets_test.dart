import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_recharge_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_recharge_sheet.dart';

import '../../helpers/sheet_test_harness.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

const electric = ElectricMeterEntity(
  electricMeterId: 7,
  payMode: MeterPayMode.prepaid,
  price: '1.5',
);

const water = WaterMeterEntity(
  waterMeterId: 7,
  payMode: MeterPayMode.prepaid,
  price: '2',
);

void main() {
  group('电表充值', () {
    testWidgets('数量自动算：金额 ÷ 单价，只读展示且无数量输入框', (tester) async {
      final popped = await pushSheet<ElectricMeterRechargeResult>(
        tester,
        const ElectricMeterRechargeSheet(item: electric),
      );

      // 只剩金额一个输入框；数量输入框已移除。
      expect(find.byType(TextField), findsOneWidget);
      expect(
        find.byKey(const Key('electric_meter_recharge_kwh')),
        findsNothing,
      );
      // 只读展示行用「充值电量」作标签。
      expect(find.text(l10n.electricMeterRechargeKwh), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('electric_meter_recharge_amount')),
        '30',
      );
      await settlePop(tester);
      // 30 ÷ 1.5 = 20.00 —— 展示值与发出的值一致，且带标准单位（千瓦时）。
      expect(find.text('20.00 千瓦时'), findsOneWidget);

      await tester.tap(find.byKey(const Key('electric_meter_recharge_submit')));
      await settlePop(tester);
      expect(popped.value?.amount, 30);
      expect(popped.value?.kwh, 20);
    });

    testWidgets('金额非法（空 / 0 / 负数）不 pop', (tester) async {
      final popped = await pushSheet<ElectricMeterRechargeResult>(
        tester,
        const ElectricMeterRechargeSheet(item: electric),
      );
      for (final bad in ['', '0', '-5', 'abc']) {
        await tester.enterText(
          find.byKey(const Key('electric_meter_recharge_amount')),
          bad,
        );
        await settlePop(tester);
        await tester.tap(
          find.byKey(const Key('electric_meter_recharge_submit')),
        );
        await settlePop(tester);
        expect(popped.value, isNull, reason: 'amount=$bad 不该发车');
      }
    });

    // 不要在一条用例里换 item 再 pumpSheet —— 上一张 sheet 仍压在栈上，
    // 根路由变 offstage，finders 默认跳过。拆成两条。
    testWidgets('单价为空：数量显示占位，且不 pop', (tester) async {
      final popped = await pushSheet<ElectricMeterRechargeResult>(
        tester,
        const ElectricMeterRechargeSheet(
          item: ElectricMeterEntity(electricMeterId: 7),
        ),
      );
      await tester.enterText(
        find.byKey(const Key('electric_meter_recharge_amount')),
        '30',
      );
      await settlePop(tester);
      expect(
        tester
            .widget<Text>(
              find.byKey(const Key('electric_meter_recharge_kwh_value')),
            )
            .data,
        '—',
      );

      await tester.tap(find.byKey(const Key('electric_meter_recharge_submit')));
      await settlePop(tester);
      expect(popped.value, isNull);
    });

    testWidgets('单价为 0：数量显示占位，且不 pop', (tester) async {
      final popped = await pushSheet<ElectricMeterRechargeResult>(
        tester,
        const ElectricMeterRechargeSheet(
          item: ElectricMeterEntity(electricMeterId: 7, price: '0'),
        ),
      );
      await tester.enterText(
        find.byKey(const Key('electric_meter_recharge_amount')),
        '30',
      );
      await settlePop(tester);
      expect(
        tester
            .widget<Text>(
              find.byKey(const Key('electric_meter_recharge_kwh_value')),
            )
            .data,
        '—',
      );

      await tester.tap(find.byKey(const Key('electric_meter_recharge_submit')));
      await settlePop(tester);
      expect(popped.value, isNull);
    });
  });

  group('水表充值', () {
    testWidgets('数量自动算：金额 ÷ 单价，水量标准单位为吨', (tester) async {
      final popped = await pushSheet<WaterMeterRechargeResult>(
        tester,
        const WaterMeterRechargeSheet(item: water),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byKey(const Key('water_meter_recharge_m3')), findsNothing);
      expect(find.text(l10n.waterMeterRechargeM3), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('water_meter_recharge_amount')),
        '30',
      );
      await settlePop(tester);
      // 30 ÷ 2 = 15.00，水量标准单位为吨。
      expect(find.text('15.00 吨'), findsOneWidget);

      await tester.tap(find.byKey(const Key('water_meter_recharge_submit')));
      await settlePop(tester);
      expect(popped.value?.amount, 30);
      expect(popped.value?.m3, 15);
    });

    testWidgets('金额非法不 pop', (tester) async {
      final popped = await pushSheet<WaterMeterRechargeResult>(
        tester,
        const WaterMeterRechargeSheet(item: water),
      );
      await tester.enterText(
        find.byKey(const Key('water_meter_recharge_amount')),
        '0',
      );
      await settlePop(tester);
      await tester.tap(find.byKey(const Key('water_meter_recharge_submit')));
      await settlePop(tester);
      expect(popped.value, isNull);
    });
  });
}
