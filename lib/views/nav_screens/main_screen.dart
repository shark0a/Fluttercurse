import 'package:flutter/material.dart';
import 'package:shopping/models/product_model.dart';
import 'package:shopping/service/product_services.dart';
import 'package:shopping/views/details_page.dart';
import 'package:shopping/widgets/card_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Product> productlist = [];
  bool isLoading = true;

  Future<void> getData() async {
    productlist = await ProductsService.getProductsData();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            itemCount: productlist.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: productlist[index],
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemCard(
                      productName: productlist[index].title ?? "--",
                      price: "${productlist[index].price}",
                      proudctIcon: productlist[index].thumbnail ?? ""),
                ),
              );
            },
          );
  }
}
