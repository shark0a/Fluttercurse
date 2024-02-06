import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.icon,
    required this.categoriesname,
    required this.desc,
    required this.count,
  });
  final String icon;
  final String categoriesname;
  final String desc;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.cyanAccent, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              icon,
              width: 50,
              height: 80,
            ),
            Text(categoriesname),
            Text("desc: $desc"),
            Text("itemNO:$count"),
          ],
        ),
      ),
    );
  }
}
