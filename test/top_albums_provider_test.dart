import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:saltpay_assignment/providers/top_albums_provider.dart';

class MockClient extends Mock implements http.Client {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late TopAlbumsProvider provider;
  late MockClient client;
  late MockBuildContext mockContext;

  setUp(() {
    client = MockClient();
    provider = TopAlbumsProvider();
    mockContext = MockBuildContext();
    registerFallbackValue(Uri.parse(''));
  });

  group('fetchAlbums', () {
    test('should set isLoading to true before making the request', () async {
      when(() => client.get(any())).thenAnswer(
          (_) async => http.Response('{"feed": {"entry": []}}', 200));

      provider.fetchAlbums(mockContext, client);
      expect(provider.albumsLoading, true);
    });

    test(
        'should set isLoading to false and update albums after successful response',
        () async {
      const responseBody = {
        "feed": {
          "entry": [
            {
              "im:name": {"label": "Album 1"},
              "im:artist": {"label": "Artist 1"},
              "im:image": [
                {"label": "Image 1"}
              ],
              'category': {
                'attributes': {'label': 'Genre 1'}
              }
            },
            {
              "im:name": {"label": "Album 2"},
              "im:artist": {"label": "Artist 2"},
              "im:image": [
                {"label": "Image 2"}
              ],
              'category': {
                'attributes': {'label': 'Genre 2'}
              }
            }
          ]
        }
      };

      when(() => client.get(any())).thenAnswer(
          (_) async => http.Response(json.encode(responseBody), 200));

      await provider.fetchAlbums(mockContext, client);
      expect(provider.albumsLoading, false);
      expect(provider.getAlbums.length, 2);
      expect(provider.getAlbums[0].name, 'Album 1');
      expect(provider.getAlbums[0].artist, 'Artist 1');
      expect(provider.getAlbums[0].image, 'Image 1');
      expect(provider.getAlbums[0].genre, 'Genre 1');
      expect(provider.getAlbums[1].name, 'Album 2');
      expect(provider.getAlbums[1].artist, 'Artist 2');
      expect(provider.getAlbums[1].image, 'Image 2');
      expect(provider.getAlbums[1].genre, 'Genre 2');
    });

    testWidgets(
        'should set isLoading to false and not update albums after failed response and show dialog',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
      final BuildContext context = tester.element(find.byType(Container));

      when(() => client.get(any()))
          .thenAnswer((_) async => http.Response('Not Found', 500));

      await provider.fetchAlbums(context, client);
      await tester.pump();
      expect(provider.albumsLoading, true);
      expect(provider.getAlbums.length, 0);
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
