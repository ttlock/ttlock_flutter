import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/widgets/wifi_picker_sheet.dart';

void main() {
  testWidgets('renders wifi options and returns selected ssid', (tester) async {
    WifiPickerResult? result;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                result = await WifiPickerSheet.show(
                  context,
                  selectedSsid: 'Office WiFi',
                  initialWifiList: const ['Office WiFi', 'Guest WiFi'],
                  loadWifiList: () async => const ['Office WiFi', 'Guest WiFi'],
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Select WiFi'), findsOneWidget);
    expect(find.text('Office WiFi'), findsOneWidget);
    expect(find.text('Guest WiFi'), findsOneWidget);

    await tester.tap(find.text('Guest WiFi'));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.selectedSsid, 'Guest WiFi');
    expect(result!.wifiList, ['Office WiFi', 'Guest WiFi']);
  });
}
