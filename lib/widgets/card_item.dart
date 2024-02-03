import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final String proudctIcon;
  const ItemCard({
    Key? key,
    required this.productName,
    required this.price,
    required this.proudctIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(2, 2)),
          ]),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$  $price',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 28,
          top: 0,
          child: Image.network(
            proudctIcon,
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
