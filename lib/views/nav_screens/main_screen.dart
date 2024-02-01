import 'package:flutter/material.dart';
import 'package:task/views/login_page.dart';
import 'package:task/widgets/card_item.dart';
import 'package:task/widgets/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, double> items = {
    "T-shirt": 45.0,
    "Jeans": 60.0,
    "Sneakers": 80.0,
    "Backpack": 50.0,
    "Hat": 25.0,
    "Watch": 120.0,
    "Sunglasses": 35.0,
    "Laptop Bag": 55.0,
    "Headphones": 90.0,
    "Water Bottle": 15.0,
    "Jacket": 75.0,
    "Running Shoes": 70.0,
    "Fitness Tracker": 100.0,
    "Smartphone Stand": 20.0,
    "Travel Pillow": 30.0,
    "Hiking Boots": 85.0,
    "Bluetooth Speaker": 65.0,
    "Dress Shirt": 50.0,
    "Gaming Mouse": 40.0,
    "Desk Organizer": 25.0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Screens'),
          backgroundColor: Colors.amber,
        ),
        drawer: Drawerr(),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item_price = items.values.elementAt(index);
            final itemName = items.keys.elementAt(index);

            return Card_Item(item_price: item_price, item_name: itemName);
          },
        ));
  }
}
