import 'package:flutter/material.dart';

class Categories_card extends StatelessWidget {
  const Categories_card({
    super.key,
    required this.icon,
    required this.categories_name,
  });
  final IconData icon;
  final String categories_name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.cyanAccent, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(categories_name),
          ],
        ),
      ),
    );
  }
}
