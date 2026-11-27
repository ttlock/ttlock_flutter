import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/screen/water_meter_delete_confirm_sheet.dart';

import '../../helpers/sheet_test_harness.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

void main() {
  group('电表删除确认', () {
    testWidgets('确认 pop true；取消 pop false', (tester) async {
      final confirm = await pushSheet<bool>(
        tester,
        const ElectricMeterDeleteConfirmSheet(
          item: ElectricMeterEntity(electricMeterId: 7, number: 'EM-7'),
        ),
      );
      expect(find.text(l10n.electricMeterDeleteConfirm), findsWidgets);
      expect(find.textContaining('EM-7'), findsOneWidget);

      await tester.tap(find.byKey(const Key('electric_meter_delete_confirm')));
      await settlePop(tester);
      expect(confirm.value, isTrue);

      final cancel = await pushSheet<bool>(
        tester,
        const ElectricMeterDeleteConfirmSheet(
          item: ElectricMeterEntity(electricMeterId: 7, number: 'EM-7'),
        ),
      );
      await tester.tap(find.widgetWithText(TextButton, l10n.commonCancel));
      await settlePop(tester);
      expect(cancel.value, isFalse);
    });

    testWidgets('名称 / 表号都空时回落到 mac', (tester) async {
      await pushSheet<bool>(
        tester,
        const ElectricMeterDeleteConfirmSheet(
          item: ElectricMeterEntity(electricMeterId: 7, mac: 'BB:W1'),
        ),
      );
      expect(find.textContaining('BB:W1'), findsOneWidget);
    });
  });

  group('水表删除确认（删除已改为纯 BLE，入口与文案不变）', () {
    testWidgets('确认 pop true；取消 pop false', (tester) async {
      final confirm = await pushSheet<bool>(
        tester,
        const WaterMeterDeleteConfirmSheet(
          item: WaterMeterEntity(waterMeterId: 7, number: 'WM-7'),
        ),
      );
      expect(find.textContaining('WM-7'), findsOneWidget);

      await tester.tap(find.byKey(const Key('water_meter_delete_confirm')));
      await settlePop(tester);
      expect(confirm.value, isTrue);

      final cancel = await pushSheet<bool>(
        tester,
        const WaterMeterDeleteConfirmSheet(
          item: WaterMeterEntity(waterMeterId: 7, number: 'WM-7'),
        ),
      );
      await tester.tap(find.widgetWithText(TextButton, l10n.commonCancel));
      await settlePop(tester);
      expect(cancel.value, isFalse);
    });
  });
}
