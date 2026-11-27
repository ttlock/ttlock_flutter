import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_clear_confirm_dialog.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_pay_mode_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_price_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_total_usage_sheet.dart';

import '../../helpers/sheet_test_harness.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

const meter = ElectricMeterEntity(
  electricMeterId: 7,
  price: '1.5',
  payMode: MeterPayMode.prepaid,
);

typedef PayModeResult = ({MeterPayMode mode, double? price});

void main() {
  testWidgets('电价 sheet：预填当前电价，0 不提交，合法值 pop 出新电价', (tester) async {
    final popped = await pushSheet<double>(
      tester,
      const ElectricMeterPriceSheet(item: meter),
    );
    expect(find.text('1.5'), findsOneWidget);
    // 电价单位以 suffixText 呈现（元/千瓦时）。
    expect(find.text(l10n.electricMeterPriceUnit), findsOneWidget);
    expect(find.text(l10n.electricMeterPriceEdit), findsOneWidget);

    // 0 不合法（spec §9 风险 2：可以为极小值，但不能为 0）→ 不 pop。
    await tester.enterText(find.byType(TextField), '0');
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value, isNull);
    expect(find.byType(ElectricMeterPriceSheet), findsOneWidget);

    await tester.enterText(find.byType(TextField), '2.5');
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value, 2.5);
  });

  testWidgets('计费模式 sheet：预付费露出电价输入，切计能模式则收起且不输电价', (tester) async {
    final popped = await pushSheet<PayModeResult>(
      tester,
      const ElectricMeterPayModeSheet(item: meter),
    );

    // 初始为预付费 → 有电价输入。
    expect(
      find.byKey(const Key('electric_meter_pay_mode_price')),
      findsOneWidget,
    );

    await tester.tap(find.byKey(const Key('electric_meter_pay_mode_energy')));
    await settlePop(tester);
    expect(find.byKey(const Key('electric_meter_pay_mode_price')), findsNothing);

    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value?.mode, MeterPayMode.energy);
    expect(popped.value?.price, isNull);
  });

  testWidgets('计费模式 sheet：切预付费时须带 > 0 的电价才 pop', (tester) async {
    final popped = await pushSheet<PayModeResult>(
      tester,
      const ElectricMeterPayModeSheet(
        item: ElectricMeterEntity(electricMeterId: 7),
      ),
    );

    // 初始为计能模式 → 无电价输入。
    expect(find.byKey(const Key('electric_meter_pay_mode_price')), findsNothing);

    await tester.tap(find.byKey(const Key('electric_meter_pay_mode_prepaid')));
    await settlePop(tester);
    expect(
      find.byKey(const Key('electric_meter_pay_mode_price')),
      findsOneWidget,
    );

    // 电价留空 → 不 pop。
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value, isNull);

    await tester.enterText(
      find.byKey(const Key('electric_meter_pay_mode_price')),
      '0.5',
    );
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value?.mode, MeterPayMode.prepaid);
    expect(popped.value?.price, 0.5);
  });

  testWidgets('总用量 sheet：预填当前总用量，合法值 pop', (tester) async {
    final popped = await pushSheet<double>(
      tester,
      const WaterMeterTotalUsageSheet(
        item: WaterMeterEntity(waterMeterId: 7, totalM3: '12'),
      ),
    );
    expect(find.text('12'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('water_meter_total_usage_field')),
      '30',
    );
    await tester.tap(find.widgetWithText(FilledButton, l10n.commonSave));
    await settlePop(tester);
    expect(popped.value, 30);
  });

  testWidgets('清零确认 dialog：确认 pop true，取消 pop false', (tester) async {
    final confirm = await pushSheet<bool>(
      tester,
      const ElectricMeterClearConfirmDialog(),
    );
    expect(find.text(l10n.meterClearConfirmTitle), findsOneWidget);
    await tester.tap(find.byKey(const Key('electric_meter_clear_confirm')));
    await settlePop(tester);
    expect(confirm.value, isTrue);

    final cancel = await pushSheet<bool>(
      tester,
      const ElectricMeterClearConfirmDialog(),
    );
    await tester.tap(find.widgetWithText(TextButton, l10n.commonCancel));
    await settlePop(tester);
    expect(cancel.value, isFalse);
  });
}
