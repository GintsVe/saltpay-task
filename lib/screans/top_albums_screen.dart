import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saltpay_assignment/widgets/albums_search.dart';

import '../models/album.dart';
import '../providers/top_albums_provider.dart';
import '../widgets/albums_listview.dart';

class TopAlbumsScreen extends StatefulWidget {
  const TopAlbumsScreen({
    super.key,
    required this.genre,
  });

  final String genre;

  @override
  State<TopAlbumsScreen> createState() => _TopAlbumsScreenState();
}

class _TopAlbumsScreenState extends State<TopAlbumsScreen> {
  String _search = '';
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  void _setSearch(String value) {
    _search = value;
    setState(() {});
  }

  void _toggleSearch() {
    _isSearchActive = !_isSearchActive;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Album> albums = Provider.of<TopAlbumsProvider>(context)
        .getAlbums
        .where(
          (album) => album.genre == widget.genre,
        )
        .where(
          (album) => album.name.toLowerCase().contains(_search.toLowerCase()),
        )
        .toList();

    return Scaffold(
      floatingActionButton: AlbumsSearch(
        controller: _searchController,
        isSearchActive: _isSearchActive,
        setSearch: _setSearch,
        toggleSearch: _toggleSearch,
      ),
      body: SafeArea(
        child: AlbumsListView(albums: albums),
      ),
    );
  }
}
