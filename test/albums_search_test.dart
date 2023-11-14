import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saltpay_assignment/widgets/albums_search.dart';

void main() {
  testWidgets('AlbumsSearch initial state test', (WidgetTester tester) async {
    final textEditingController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: AlbumsSearch(
          controller: textEditingController,
          isSearchActive: false,
          setSearch: (value) {},
          toggleSearch: () {},
        ),
      ),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.close), findsNothing);

    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('AlbumsSearch interaction test', (WidgetTester tester) async {
    final textEditingController = TextEditingController();
    var setSearchValue = '';
    var toggleSearchCalled = false;
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: AlbumsSearch(
          controller: textEditingController,
          isSearchActive: true,
          setSearch: (value) => setSearchValue = value,
          toggleSearch: () => toggleSearchCalled = true,
        ),
      )),
    );

    expect(find.byIcon(Icons.search), findsNothing);
    expect(find.byIcon(Icons.close), findsOneWidget);

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'test');

    expect(setSearchValue, 'test');

    await tester.tap(find.byIcon(Icons.close));

    expect(toggleSearchCalled, true);
  });
}
