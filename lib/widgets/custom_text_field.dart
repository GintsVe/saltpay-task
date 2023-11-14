import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 3,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 3,
          ),
        ),
      ),
      cursorColor: Colors.black,
    );
  }
}
