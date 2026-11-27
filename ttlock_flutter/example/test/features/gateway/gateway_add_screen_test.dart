import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/provider/gateway_add_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/presentation/screen/gateway_add_screen.dart';

/// Wizard Fake：静态停在凭据步骤，且不启动蓝牙扫描。
/// class 型 Notifier 的 override 必须用可构造子类（Riverpod 2 运行期注入限制）。
class _StaticCredentialNotifier extends GatewayAddNotifier {
  _StaticCredentialNotifier({
    this.gatewayType = TTGatewayType.g2,
    this.wifi = (name: 'Home', rssi: -40),
  });

  final TTGatewayType gatewayType;
  final GatewayWifi? wifi;

  @override
  Future<GatewayAddState> build() async => GatewayAddState(
    gatewayType: gatewayType,
    step: GatewayAddStep.credential(mac: 'AA:G2', wifi: wifi),
  );

  @override
  Future<void> startScan() async {}
}

void main() {
  Future<void> pumpCredentialForm(
    WidgetTester tester, {
    TTGatewayType gatewayType = TTGatewayType.g2,
    GatewayWifi? wifi = (name: 'Home', rssi: -40),
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          gatewayAddProvider.overrideWith(
            () => _StaticCredentialNotifier(
              gatewayType: gatewayType,
              wifi: wifi,
            ),
          ),
        ],
        child: const MaterialApp(home: GatewayAddScreen()),
      ),
    );
    await tester.pumpAndSettle();
  }

  FilledButton submitButton(WidgetTester tester) =>
      tester.widget<FilledButton>(find.byKey(const Key('gateway_submit')));

  testWidgets('凭据表单展示网关名称输入框（必填）', (tester) async {
    await pumpCredentialForm(tester);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(GatewayAddScreen)),
    );
    final l10n = container.read(l10nProvider);

    expect(find.byKey(const Key('gateway_name')), findsOneWidget);
    expect(find.text(l10n.gatewayNameLabel), findsOneWidget);
  });

  testWidgets('G2 凭据表单展示 Wi-Fi 密码与静态 IP，不展示 APN', (tester) async {
    await pumpCredentialForm(tester);

    expect(find.byKey(const Key('gateway_wifi_password')), findsOneWidget);
    expect(find.byKey(const Key('gateway_use_static_ip')), findsOneWidget);
    expect(find.byKey(const Key('gateway_use_apn')), findsNothing);
  });

  testWidgets('G3 凭据表单展示静态 IP，不展示 Wi-Fi / APN', (tester) async {
    await pumpCredentialForm(
      tester,
      gatewayType: TTGatewayType.g3,
      wifi: null,
    );

    expect(find.byKey(const Key('gateway_wifi_password')), findsNothing);
    expect(find.byKey(const Key('gateway_use_static_ip')), findsOneWidget);
    expect(find.byKey(const Key('gateway_use_apn')), findsNothing);
  });

  testWidgets('G4 凭据表单仅展示可选 APN，不展示 Wi-Fi / 静态 IP', (tester) async {
    await pumpCredentialForm(
      tester,
      gatewayType: TTGatewayType.g4,
      wifi: null,
    );

    expect(find.byKey(const Key('gateway_wifi_password')), findsNothing);
    expect(find.byKey(const Key('gateway_use_static_ip')), findsNothing);
    expect(find.byKey(const Key('gateway_use_apn')), findsOneWidget);
  });

  testWidgets('网关名称为空时提交按钮置灰', (tester) async {
    await pumpCredentialForm(tester);

    expect(submitButton(tester).onPressed, isNull);
  });

  testWidgets('仅输入空白字符时提交按钮仍置灰', (tester) async {
    await pumpCredentialForm(tester);

    await tester.enterText(find.byKey(const Key('gateway_name')), '   ');
    await tester.pump();

    expect(submitButton(tester).onPressed, isNull);
  });

  testWidgets('填写网关名称后提交按钮可点', (tester) async {
    await pumpCredentialForm(tester);

    await tester.enterText(find.byKey(const Key('gateway_name')), 'Front Gate');
    await tester.pump();

    expect(submitButton(tester).onPressed, isNotNull);
  });
}
