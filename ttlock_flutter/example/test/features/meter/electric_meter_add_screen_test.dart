import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_add_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/screen/electric_meter_add_screen.dart';

final l10n = lookupAppLocalizations(const Locale('zh'));

final _scan = TTMeterScanModel(
  name: 'EM-1',
  mac: 'BB:W1',
  rssi: -50,
  isInited: false,
  type: 1,
);

class _FakeAddNotifier extends ElectricMeterAddNotifier {
  _FakeAddNotifier(this.initial);

  final ElectricMeterAddStep initial;
  MeterPayMode? beginPayMode;
  double? beginPrice;

  @override
  Future<ElectricMeterAddState> build() async =>
      ElectricMeterAddState(step: initial);

  @override
  Future<void> beginAdd({
    required MeterPayMode payMode,
    required double price,
  }) async {
    beginPayMode = payMode;
    beginPrice = price;
  }
}

Future<_FakeAddNotifier> _pump(
  WidgetTester tester, {
  ElectricMeterAddStep? step,
}) async {
  final notifier = _FakeAddNotifier(step ?? const ElectricMeterAddStep.form());
  await tester.pumpWidget(
    ProviderScope(
      overrides: [electricMeterAddProvider.overrideWith(() => notifier)],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ElectricMeterAddScreen(),
      ),
    ),
  );
  await tester.pump();
  await tester.pump();
  return notifier;
}

void main() {
  testWidgets('计能模式：表单只有计费模式，无名称输入、无单价输入框', (tester) async {
    await _pump(tester);

    expect(find.byKey(const Key('electric_meter_pay_mode')), findsOneWidget);
    expect(find.byKey(const Key('electric_meter_submit')), findsOneWidget);
    // 名称输入已从表单移除（改到成功页非必填补录）。
    // 计能模式没有单价概念，表单也不显示单价框。
    expect(find.byKey(const Key('electric_meter_name')), findsNothing);
    expect(find.byKey(const Key('electric_meter_price')), findsNothing);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('计能模式提交：带 energy，单价归一化为 0', (tester) async {
    final notifier = await _pump(tester);

    await tester.tap(find.byKey(const Key('electric_meter_submit')));
    await tester.pump();
    expect(notifier.beginPayMode, MeterPayMode.energy);
    // 计能模式不要求单价，屏幕侧传 0。
    expect(notifier.beginPrice, 0);
  });

  testWidgets('切到预付费：露出单价输入框；留空或 0 则「下一步」禁用', (tester) async {
    final notifier = await _pump(tester);

    // 计能模式下没有单价框。
    expect(find.byKey(const Key('electric_meter_price')), findsNothing);

    await tester.tap(find.byKey(const Key('electric_meter_pay_mode')));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.electricMeterPayModePrepaid).last);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('electric_meter_price')), findsOneWidget);

    // 单价留空 → 提交按钮禁用，点不动。
    await tester.tap(find.byKey(const Key('electric_meter_submit')));
    await tester.pump();
    expect(notifier.beginPayMode, isNull);

    // 单价为 0 同样禁用（价格不能为 0）。
    await tester.enterText(find.byKey(const Key('electric_meter_price')), '0');
    await tester.pump();
    await tester.tap(find.byKey(const Key('electric_meter_submit')));
    await tester.pump();
    expect(notifier.beginPayMode, isNull);
  });

  testWidgets('预付费填了合法单价 → beginAdd 带上 prepaid 与该单价', (tester) async {
    final notifier = await _pump(tester);

    await tester.tap(find.byKey(const Key('electric_meter_pay_mode')));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.electricMeterPayModePrepaid).last);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('electric_meter_price')), '1.5');
    await tester.pump();

    await tester.tap(find.byKey(const Key('electric_meter_submit')));
    await tester.pump();
    expect(notifier.beginPayMode, MeterPayMode.prepaid);
    expect(notifier.beginPrice, 1.5);
  });

  testWidgets('success 步渲染共享成功页；非 Cat.1 无 APN 字段', (tester) async {
    await _pump(
      tester,
      step: ElectricMeterAddStep.success(
        scan: _scan,
        meterId: 9,
        isCatOne: false,
        needsApn: false,
      ),
    );

    expect(find.byKey(const Key('meter_add_success_name')), findsOneWidget);
    expect(find.byKey(const Key('meter_add_success_done')), findsOneWidget);
    // APN 字段只在 Cat.1 海外出现（needsApn）。
    expect(find.byKey(const Key('meter_add_success_apn')), findsNothing);
  });

  testWidgets('success 步 + needsApn 时露出必填 APN 字段', (tester) async {
    await _pump(
      tester,
      step: ElectricMeterAddStep.success(
        scan: _scan,
        meterId: 9,
        isCatOne: true,
        needsApn: true,
      ),
    );
    expect(find.byKey(const Key('meter_add_success_apn')), findsOneWidget);
  });

  testWidgets('done 且 catOneFailed 时展示去 4G 页重试的提示', (tester) async {
    await _pump(
      tester,
      step: const ElectricMeterAddStep.done(meterId: 9, catOneFailed: true),
    );
    expect(find.text(l10n.meterAddSuccessCatOneHint), findsOneWidget);
  });

  testWidgets('done 未失败时不展示提示', (tester) async {
    await _pump(tester, step: const ElectricMeterAddStep.done(meterId: 9));
    expect(find.text(l10n.meterAddSuccessCatOneHint), findsNothing);
  });
}
