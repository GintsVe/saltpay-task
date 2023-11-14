import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AlbumsSearch extends StatelessWidget {
  const AlbumsSearch(
      {super.key,
      required this.controller,
      required this.isSearchActive,
      required this.setSearch,
      required this.toggleSearch});

  final bool isSearchActive;
  final TextEditingController controller;
  final Function(String) setSearch;
  final VoidCallback toggleSearch;

  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.of(context).pop();
    }

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: FloatingActionButton(
              heroTag: 'Tag1',
              onPressed: goBack,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          if (isSearchActive)
            Expanded(
              flex: 8,
              child: CustomeTextField(
                controller: controller,
                onChanged: setSearch,
                hintText: 'Enter albums name',
              ),
            ),
          const Spacer(),
          FloatingActionButton(
            heroTag: 'Tag2',
            onPressed: toggleSearch,
            child: Icon(
              isSearchActive ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
