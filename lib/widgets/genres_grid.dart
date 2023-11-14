import 'package:flutter/material.dart';

import '../screans/top_albums_screen.dart';
import 'custom_button.dart';

class GenresGrid extends StatelessWidget {
  const GenresGrid({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    void navigateNoAlbumsScreen(String genre) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TopAlbumsScreen(genre: genre),
        ),
      );
    }

    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      children: genres
          .map(
            (genre) => CustomButton(
              child: Text(
                genre,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                navigateNoAlbumsScreen(genre);
              },
            ),
          )
          .toList(),
    );
  }
}
