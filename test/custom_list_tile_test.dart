import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saltpay_assignment/widgets/custom_list_tile.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('CustomListTile should display title, subtitle and networkImage',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomListTile(
                title: 'title',
                subtitle: 'subtitle',
                networkImage: 'image.jpg'),
          ),
        ),
      ),
    );

    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('subtitle'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
