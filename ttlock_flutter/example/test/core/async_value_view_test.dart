import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/widgets/async_value_view.dart';

void main() {
  testWidgets('loading shows progress indicator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: AsyncValueView.loading())),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('error shows message and retry button', (tester) async {
    var retried = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AsyncValueView.error(
            message: 'boom',
            onRetry: () => retried = true,
          ),
        ),
      ),
    );
    expect(find.text('boom'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    expect(retried, isTrue);
  });
}
