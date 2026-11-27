import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_add_success_step.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_cat_one_view.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_info_section.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_labeled_value_tile.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/presentation/widget/meter_ops_section.dart';

Widget _host(Widget child) => MaterialApp(home: Scaffold(body: child));

MeterCatOneView _catOneView({MeterCatOneInfoEntity? info, VoidCallback? onConfigure}) =>
    MeterCatOneView(
      info: info,
      onConfigure: onConfigure ?? () {},
      label: (k) => k,
      rssiGradeLabel: (g) => 'grade:$g',
      overseaYesLabel: '是',
      overseaNoLabel: '否',
      configureLabel: '配置服务器',
      reconfigureLabel: '重新配置',
    );

void main() {
  testWidgets('MeterLabeledValueTile 空值渲染占位符', (tester) async {
    await tester.pumpWidget(
      _host(const MeterLabeledValueTile(label: '累计用量', value: '')),
    );
    expect(find.text('累计用量'), findsOneWidget);
    expect(find.text('—'), findsOneWidget);
  });

  testWidgets('MeterCatOneView 入参为 null 时显示配置按钮且不显示信息区', (tester) async {
    var configured = false;
    await tester.pumpWidget(
      _host(_catOneView(onConfigure: () => configured = true)),
    );
    expect(find.text('配置服务器'), findsOneWidget);
    expect(find.text('meterCatOneUnconfigured'), findsOneWidget);
    expect(find.text('meterCatOneNodeId'), findsNothing);
    await tester.tap(find.text('配置服务器'));
    expect(configured, isTrue);
  });

  testWidgets('MeterCatOneView 已配置时显示信息区与重新配置', (tester) async {
    await tester.pumpWidget(
      _host(
        _catOneView(
          info: const MeterCatOneInfoEntity(
            catOneNodeId: 'node1',
            catOneCardNumber: '898600',
          ),
        ),
      ),
    );
    expect(find.text('node1'), findsOneWidget);
    expect(find.text('898600'), findsOneWidget);
    expect(find.text('重新配置'), findsOneWidget);
    expect(find.text('配置服务器'), findsNothing);
  });

  testWidgets('MeterCatOneView 已配置时显示海外卡行', (tester) async {
    await tester.pumpWidget(
      _host(
        _catOneView(
          info: const MeterCatOneInfoEntity(
            rssiGrade: 3,
            catOneNodeId: 'node1',
            overseaCard: true,
          ),
        ),
      ),
    );
    expect(find.text('grade:3'), findsOneWidget);
    expect(find.text('meterCatOneOverseaCard'), findsOneWidget);
    expect(find.text('是'), findsOneWidget);
  });

  testWidgets('MeterOpsSection 只渲染传入的项，onTap 为 null 时禁用', (tester) async {
    var tapped = 0;
    await tester.pumpWidget(
      _host(
        MeterOpsSection(
          title: '操作',
          items: [
            MeterOpsItem(
              itemKey: const Key('ops_read'),
              icon: Icons.sync,
              label: '抄表',
              onTap: () => tapped++,
            ),
            const MeterOpsItem(
              itemKey: Key('ops_clear'),
              icon: Icons.cleaning_services_outlined,
              label: '清零',
              onTap: null,
            ),
          ],
        ),
      ),
    );
    expect(find.text('操作'), findsOneWidget);
    expect(find.text('抄表'), findsOneWidget);
    await tester.tap(find.byKey(const Key('ops_read')));
    expect(tapped, 1);
    // 禁用项仍在树里，但 enabled 为假（用 widget 断言，不靠点击穿透）。
    expect(find.text('清零'), findsOneWidget);
    expect(
      tester.widget<ListTile>(find.byKey(const Key('ops_clear'))).enabled,
      isFalse,
    );
  });

  testWidgets('MeterInfoSection 空值渲染占位符', (tester) async {
    await tester.pumpWidget(
      _host(
        const MeterInfoSection(
          title: '设备信息',
          rows: [
            (label: '表号', value: 'EM-7'),
            (label: 'MAC', value: ''),
          ],
        ),
      ),
    );
    expect(find.text('EM-7'), findsOneWidget);
    expect(find.text('—'), findsOneWidget);
  });

  testWidgets('MeterAddSuccessStep：非 Cat.1 无 APN 字段，名称可留空', (tester) async {
    String? gotName;
    String? gotApn;
    await tester.pumpWidget(
      _host(
        MeterAddSuccessStep(
          title: '添加成功',
          nameLabel: '名称（非必填）',
          nameHint: '',
          apnLabel: 'APN（必填）',
          apnHint: '',
          doneLabel: '完成',
          needsApn: false,
          enabled: true,
          onDone: (name, apn) {
            gotName = name;
            gotApn = apn;
          },
        ),
      ),
    );
    expect(find.byKey(const Key('meter_add_success_apn')), findsNothing);
    await tester.tap(find.byKey(const Key('meter_add_success_done')));
    expect(gotName, '');
    expect(gotApn, isNull);
  });

  testWidgets('MeterAddSuccessStep：Cat.1 海外 APN 必填', (tester) async {
    String? gotName;
    String? gotApn;
    await tester.pumpWidget(
      _host(
        MeterAddSuccessStep(
          title: '添加成功',
          nameLabel: '名称（非必填）',
          nameHint: '',
          apnLabel: 'APN（必填）',
          apnHint: '',
          doneLabel: '完成',
          needsApn: true,
          enabled: true,
          onDone: (name, apn) {
            gotName = name;
            gotApn = apn;
          },
        ),
      ),
    );
    // APN 为空 → 完成不可点。
    await tester.tap(find.byKey(const Key('meter_add_success_done')));
    expect(gotName, isNull);

    await tester.enterText(
      find.byKey(const Key('meter_add_success_name')),
      ' 电表A ',
    );
    await tester.enterText(
      find.byKey(const Key('meter_add_success_apn')),
      ' cmnet ',
    );
    await tester.pump();
    await tester.tap(find.byKey(const Key('meter_add_success_done')));
    expect(gotName, '电表A');
    expect(gotApn, 'cmnet');
  });
}
