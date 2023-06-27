// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motion_tokens/motion_tokens.dart';

void main() {
  testWidgets('Default easing data', (WidgetTester tester) async {
    final testKey = GlobalKey();
    // Build a test widget that uses the extension
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(),
        home: _TestWidget(key: testKey),
      ),
    );

    // Access the easing tokens using Theme.of(context)
    final easing = Theme.of(testKey.currentContext!).easing;

    // Verify that the easing tokens are not null
    expect(easing, isNotNull);

    // Verify the values of the easing tokens
    expect(easing.emphasized, equals(Curves.easeInOutCubicEmphasized));
    expect(
        easing.emphasizedDecelerate, equals(const Cubic(0.05, 0.7, 0.1, 1.0)));
    expect(
        easing.emphasizedAccelerate, equals(const Cubic(0.3, 0.0, 0.8, 0.15)));
    expect(easing.standard, equals(const Cubic(0.2, 0.0, 0, 1.0)));
    expect(easing.standardDecelerate, equals(const Cubic(0, 0, 0, 1)));
    expect(easing.standardAccelerate, equals(const Cubic(0.3, 0, 1, 1)));
    expect(easing.linear, equals(Curves.linear));
  });

  testWidgets('Default easing with custom theme', (WidgetTester tester) async {
    final testKey = GlobalKey();
    // Build a test widget that uses the extension
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          extensions: [
            EasingTokens(emphasized: Curves.linear),
          ],
        ),
        home: _TestWidget(key: testKey),
      ),
    );

    // Access the easing tokens using Theme.of(context)
    final easing = Theme.of(testKey.currentContext!).easing;

    // Verify that the easing tokens are not null
    expect(easing, isNotNull);

    // Verify the values of the easing tokens
    expect(easing.emphasized, equals(Curves.linear));
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
