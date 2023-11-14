import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saltpay_assignment/widgets/custom_text_field.dart';

void main() {
  group('CustomeTextField', () {
    testWidgets('CustomeTextField is displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomeTextField(
              hintText: 'Enter your name',
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
    });
  });
}
