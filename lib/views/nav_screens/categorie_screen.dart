import 'package:flutter/material.dart';
import 'package:shopping/widgets/categories_card.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  final Map<IconData, String> categories = {
    Icons.category: "Clothing",
    Icons.sports_basketball: "Sports",
    Icons.book: "Books",
    Icons.music_note: "Music",
    Icons.movie: "Movies",
    Icons.food_bank: "Food",
    Icons.directions_run: "Fitness",
    Icons.home: "Home",
    Icons.local_pizza: "Pizza",
    Icons.airplanemode_active: "Travel",
    Icons.brush: "Art",
    Icons.devices_other: "Electronics",
    Icons.pets: "Pets",
    Icons.event: "Events",
    Icons.shopping_cart: "Shopping",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final icon = categories.keys.elementAt(index);
          final name = categories.values.elementAt(index);
          return CategoriesCard(
            categoriesname: name,
            icon: icon,
          );
        },
      ),
    );
  }
}
