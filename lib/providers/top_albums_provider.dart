import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saltpay_assignment/widgets/show_custom_dialog.dart';

import '../models/album.dart';

class TopAlbumsProvider with ChangeNotifier {
  bool _isLoading = false;
  List<Album> _albums = [];

  List<Album> get getAlbums => _albums;

  bool get albumsLoading => _isLoading;

  List<String> getUniqueGenres() {
    List<String> allGenres = _albums.map((album) => album.genre).toList();
    return allGenres.toSet().toList();
  }

  Future<void> fetchAlbums(BuildContext context, http.Client client) async {
    _isLoading = true;

    var url =
        Uri.parse('https://itunes.apple.com/us/rss/topalbums/limit=100/json');

    List<Widget> actions = [
      ElevatedButton(
        onPressed: () {
          fetchAlbums(context, client);
          Navigator.of(context).pop();
        },
        child: const Text('Try again'),
      ),
    ];

    void showErrorDialog(String errorText) {
      showCustomDialog(context, actions, 'Error', errorText);
    }

    try {
      final response = await client.get(url);

      final List data = json.decode(response.body)['feed']['entry'];

      _albums = data.map((e) => Album.fromJson(e)).toList();

      _isLoading = false;
      notifyListeners();
    } on HandshakeException catch (error) {
      showErrorDialog(error.message);
    } on HttpException catch (error) {
      showErrorDialog(error.message);
    } catch (error) {
      showErrorDialog(error.toString());
    }
  }
}
