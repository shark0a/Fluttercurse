import 'package:flutter/material.dart';
import 'package:shopping/models/cart_model.dart';
import 'package:shopping/service/cart_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> cartproduct = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    cartproduct = await CartServices.getCartData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page '),
        backgroundColor: Colors.amber,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
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
                                  cartproduct[index].title,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '\price of one pice ${cartproduct[index].price}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        Text(
                                            'quantity :${cartproduct[index].quantity} '),
                                        Text(
                                            'total price  :${cartproduct[index].total}')
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 28,
                        top: -20,
                        child: Image.network(
                          cartproduct[index].thumbnail,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
