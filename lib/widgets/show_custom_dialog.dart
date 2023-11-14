import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, List<Widget> actions, String title,
    String description) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: actions,
    ),
  );
}
