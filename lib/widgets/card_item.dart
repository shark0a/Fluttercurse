import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Card_Item extends StatelessWidget {
  const Card_Item({
    super.key,
    required this.item_name,
    required this.item_Price,
  });
  final String item_name;
  final double item_Price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 95, 217, 207),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.run_circle),
            Text(item_name),
            Text('Price: $item_Price\$'),
          ],
        ),
      ),
    );
  }
}
