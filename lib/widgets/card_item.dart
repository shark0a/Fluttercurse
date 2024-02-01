import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.itemname,
    required this.itemprices,
  });
  final String itemname;
  final double itemprices;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 95, 217, 207),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.run_circle),
            Text(itemname),
            Text('Price: $itemprices\$'),
          ],
        ),
      ),
    );
  }
}
