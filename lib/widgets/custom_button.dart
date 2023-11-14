import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.purple.shade900,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
