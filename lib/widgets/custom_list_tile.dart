import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.networkImage,
    required this.subtitle,
    required this.title,
  });

  final String title;
  final String subtitle;
  final String networkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(
            networkImage,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: child,
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(
                Icons.image,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFFC7EDE4),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFC7EDE4),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      ),
    );
  }
}
