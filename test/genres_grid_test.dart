import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:saltpay_assignment/providers/top_albums_provider.dart';
import 'package:saltpay_assignment/screans/top_albums_screen.dart';
import 'package:saltpay_assignment/widgets/custom_button.dart';
import 'package:saltpay_assignment/widgets/genres_grid.dart';

void main() {
  group('GenresGrid', () {
    testWidgets(
        "Should display correct number of genres in grid and buttons with genre text",
        (tester) async {
      final genres = ["Pop", "Rock", "Jazz", "Rap"];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GenresGrid(
              genres: genres,
            ),
          ),
        ),
      );

      expect(find.byType(CustomButton), findsAtLeastNWidgets(4));
      for (var i = 0; i < genres.length; i++) {
        expect(find.text(genres[i]), findsOneWidget);
      }
    });

    testWidgets("Should navigate to TopAlbumsScreen when genre is tapped",
        (tester) async {
      final genres = ["Pop"];

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => TopAlbumsProvider())
          ],
          child: MaterialApp(
            home: GenresGrid(
              genres: genres,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CustomButton).first);
      await tester.pumpAndSettle();

      expect(find.byType(TopAlbumsScreen), findsOneWidget);
    });
  });
}
