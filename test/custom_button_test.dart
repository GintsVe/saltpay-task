import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saltpay_assignment/widgets/custom_button.dart';

void main() {
  group('CustomButton', () {
    testWidgets('should contain child widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CustomButton(
          child: const Text('Button'),
          onTap: () {},
        ),
      ));

      final textFinder = find.text('Button');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('should trigger onTap callback', (tester) async {
      var onTapCalled = false;

      await tester.pumpWidget(MaterialApp(
        home: CustomButton(
          child: const Text('Button'),
          onTap: () {
            onTapCalled = true;
          },
        ),
      ));

      await tester.tap(find.byType(CustomButton));

      expect(onTapCalled, true);
    });
  });
}
