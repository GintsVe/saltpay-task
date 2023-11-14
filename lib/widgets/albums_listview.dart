import 'package:flutter/material.dart';
import 'package:saltpay_assignment/models/album.dart';

import 'custom_list_tile.dart';

class AlbumsListView extends StatelessWidget {
  const AlbumsListView({
    super.key,
    required this.albums,
  });

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      clipBehavior: Clip.none,
      itemBuilder: (context, index) => CustomListTile(
        networkImage: albums[index].image,
        subtitle: albums[index].artist,
        title: albums[index].name,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: albums.length,
    );
  }
}
