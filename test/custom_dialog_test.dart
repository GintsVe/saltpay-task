import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saltpay_assignment/widgets/show_custom_dialog.dart';

void main() {
  group('Custom dialog widget tests', () {
    Widget testWidget = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () => showCustomDialog(
                  context,
                  [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('ok'),
                    )
                  ],
                  'Title',
                  'Description'),
              child: const Text('Test button'),
            );
          },
        ),
      ),
    );

    testWidgets('should show a dialog', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      await tester.tap(find.text('Test button'));
      await tester.pump();
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('ok'), findsOneWidget);
    });

    testWidgets('should close a dialog', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      await tester.tap(find.text('Test button'));
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('ok'), findsOneWidget);

      await tester.tap(find.text('ok'));
      await tester.pump();

      expect(find.text('Title'), findsNothing);
      expect(find.text('Description'), findsNothing);
      expect(find.text('ok'), findsNothing);
    });
  });
}
