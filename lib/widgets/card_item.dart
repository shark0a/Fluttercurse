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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
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
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
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
            top: -10,
            child: Image.network(
              "https://th.bing.com/th/id/R.8e2c571ff125b3531705198a15d3103c?rik=gzhbzBpXBa%2bxMA&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fuser-png-icon-big-image-png-2240.png&ehk=VeWsrun%2fvDy5QDv2Z6Xm8XnIMXyeaz2fhR3AgxlvxAc%3d&risl=&pid=ImgRaw&r=0",
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
