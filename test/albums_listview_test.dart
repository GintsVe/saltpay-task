import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:saltpay_assignment/models/album.dart';
import 'package:saltpay_assignment/widgets/albums_listview.dart';
import 'package:saltpay_assignment/widgets/custom_list_tile.dart';

void main() {
  group('AlbumsListView', () {
    testWidgets('displays a list of albums', (WidgetTester tester) async {
      final List<Album> albums = [
        Album(
          name: 'Album 1',
          artist: 'Artist 1',
          image: 'Image 1',
          genre: 'Genre 1',
        ),
        Album(
          name: 'Album 2',
          artist: 'Artist 2',
          image: 'Image 2',
          genre: 'Genre 2',
        ),
        Album(
          name: 'Album 3',
          artist: 'Artist 3',
          image: 'Image 3',
          genre: 'Genre 3',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AlbumsListView(albums: albums),
          ),
        ),
      );

      expect(
        find.byType(CustomListTile),
        findsNWidgets(3),
      );
    });

    testWidgets('displays an empty list', (WidgetTester tester) async {
      final List<Album> albums = [];

      await tester.pumpWidget(
        MaterialApp(
          home: AlbumsListView(albums: albums),
        ),
      );

      expect(
        find.byType(CustomListTile),
        findsNothing,
      );
    });
  });
}
