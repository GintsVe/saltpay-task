import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:saltpay_assignment/widgets/genres_grid.dart';

import '../providers/top_albums_provider.dart';

class GenresFilterScreen extends StatefulWidget {
  const GenresFilterScreen({super.key});

  @override
  State<GenresFilterScreen> createState() => _GenresFilterScreenState();
}

class _GenresFilterScreenState extends State<GenresFilterScreen> {
  @override
  void initState() {
    http.Client httpClient = http.Client();

    bool areAlbumsFetched =
        Provider.of<TopAlbumsProvider>(context, listen: false)
            .getAlbums
            .isEmpty;

    if (areAlbumsFetched) {
      Provider.of<TopAlbumsProvider>(context, listen: false)
          .fetchAlbums(context, httpClient);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var albumsProvider = Provider.of<TopAlbumsProvider>(context);
    List<String> genres = albumsProvider.getUniqueGenres();
    bool isLoading = albumsProvider.albumsLoading;

    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : GenresGrid(genres: genres),
      ),
    );
  }
}
